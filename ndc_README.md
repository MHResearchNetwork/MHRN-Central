# Read me for Medication (NDC) lists: Which file do you want?

 * For a human-readable summary of included drugs choose GenericDrugNames_[YEAR].xls.  It's in MHRN-Central (use the blue links above left.)
 * For a SAS dataset, choose mhrn_dx
ALWAYS review Category and Active_ingredient (cleaned version of generic name) to make sure this list is appropriate for your use.

 

* Injectable antipsychotics organized as a separate class - these now come from HEDIS SAA Medication List Value Sets
* Note: injectables other than antipsychotics are included in their regular class. (e.g. benzodiazepines and anticonvulsants.)  Refer to variables Route and Dosage_form if you want to exclude these. However, these are unlikely to appear in outpatient pharmacy records.
* Subclass variable added, populated for antidepressants only
* Beware of NDCs with obsolete_date is in the past
* COMBO category includes drugs that are combinations of two ingredients categorized separately in this data set (e.g. an antidepressant/antipsychotic combination)




