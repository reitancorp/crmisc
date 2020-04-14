#' @description  Convenience function for tidy SCAAR data formatting
#' @title Tidy SCAAR data
#' @param x a data frame with data from the SCAAR data base. The original variable names should not be altered.
#' @return A tibble containing tidy SCAAR data.
#' @export
tidy_scaar <- function(x) {
warning('Function not ready to function')
}

#' @description  Convenience function for tidy RIKS-HIA data formatting
#' @title Tidy RIKS-HIA data
#' @param x a data frame with data from the RIKS-HIA data base. The original variable names should not be altered.
#' @return A tibble containing tidy RIKS-HIA data.
#' @export
#tidy_rikshia <- function(rhia) {
names(rhia) <- stringr::str_to_lower(names(rhia)) %>% # Lowercase all varnames
  str_remove_all("d_") %>%
  str_remove_all("kom_") %>%
  str_remove_all("par_") %>%
  str_replace('irhia', "id_rhia")

rhia %>%
  rename(age = age_hia,
         sex = gender) %>%
  mutate(sex = ifelse(sex == 1, 'male', 'female'),
         male = ifelse(sex == 'male', T, F),
         acute_cad = case_when(diagrupp == 1 ~ 1,
                               diagrupp == 2 ~ 1,
                               TRUE ~ 0))


#}

  # create mortality endpoint vars
  mutate(survdead = case_when(!is.na(dodsdatn) ~ 1,
                              TRUE ~ 0),
         survdead = ifelse(survdead != 1, 0, survdead),
         survtime = ifelse(survdead == 1,
                           dodsdatn - admission_date,
                           as.Date('2018-05-20') - admission_date)
  ) %>%

  # Exclude patients with established disease (where we do not know when they debuted)
  filter(kom_cabg != 1,
         kom_hinfarkt != 1,
         kom_pci != 1) %>%
  # count rows 3
  mutate(nrow3 = max(row_number())) %>%
  # add var fynd_30 and fill NA with 9, creade T/F var
  left_join(fynd_30, by = 'id_rhia') %>%
  mutate(fynd_30 = ifelse(is.na(fynd_30), 9, fynd_30),
         fynd_30_pos = case_when(fynd_30 == 1 ~ F,
                                 fynd_30 == 9 ~ NA,
                                 TRUE ~ T)) %>%
  # create var sign_cad and then filter on it
  # first diagnoses of sign cad
  mutate(sign_cad = case_when(infarcttype == 1 ~ 1,
                              infarcttype == 2 ~ 1,
                              plannedpci == 1 ~ 1,
                              plannedcabg == 1 ~ 1,
                              d_repertreatment == 1 ~ 1,
                              d_repertreatment == 2 ~ 1,
                              d_repertreatment == 3 ~ 1,
                              d_diagrupp == 1 ~ 1,
                              d_diagrupp == 2 ~ 1,
                              d_diagrupp == 3 ~ 1,
                              d_ihs == 1 ~ 1,
                              d_ami == 1 ~ 1)) %>%
  # then remove those with neg angio, but keep those with pos angio within 30 days
  mutate(sign_cad = ifelse(is.na(sign_cad), 0, sign_cad),
         sign_cad_2 = case_when(sign_cad == 1 & fynd_30_pos == FALSE ~ 0,
                                sign_cad == 0 & fynd_30_pos == TRUE ~ 1,
                                is.na(fynd_30_pos) ~ sign_cad,
                                TRUE ~ sign_cad)) %>% #select(sign_cad, sign_cad_2, fynd_30, fynd_30_pos)
  # keep those with significant CAD
  filter(sign_cad_2 == 1) %>%
  # count rows 4
  mutate(nrow4 = max(row_number())) %>%
  # Select first entries only
  group_by(idnr) %>%
  arrange(admission_date) %>%
  filter(row_number() == 1) %>%
  ungroup() %>%
  # count rows 5
  mutate(nrow5 = max(row_number())) %>%
  # Add variable acute_cad
  mutate(acute_cad = case_when(d_diagrupp == 1 ~ 1,
                               d_diagrupp == 2 ~ 1,
                               TRUE ~ 0))
