# Read me for Medication (NDC) lists: Which file do you want?

 * For a human-readable summary of included drugs choose GenericDrugNames_[YEAR].xls.  It's in MHRN-Central (use the blue links above left.)
 * For a SAS dataset, choose mhrn3_ndc[year].zip.  You probably want the most recent year, but last year's is included here.  Older files can be found in MHRN-Archive (Blue link at top left of page.)
 * ALWAYS review Category and Active_ingredient (cleaned version of generic name) to make sure this list is appropriate for your use.

 
# Notes
* Injectable antipsychotics organized as a separate class - these now come from HEDIS SAA Medication List Value Sets
* Injectables other than antipsychotics are included in their regular class. (e.g. benzodiazepines and anticonvulsants.)  Refer to variables Route and Dosage_form if you want to exclude these. However, these are unlikely to appear in outpatient pharmacy records.
* Subclass variable added, populated for antidepressants only
* COMBO category includes drugs that are combinations of two ingredients categorized separately in this data set (e.g. an antidepressant/antipsychotic combination)
* NDCs can be re-used for different drugs.  This is a 0.1% problem, insignificant for big data projects.  For more sensitive situations, refer to the ndc_reused_flag and where it = 1, use only in the interval defined by the startdt and enddt.  Past NDCs for MH drugs that have been re-used have been removed, as it seems dangerous to include a code that currently means something else.




