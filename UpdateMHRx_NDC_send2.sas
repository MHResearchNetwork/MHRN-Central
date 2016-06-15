
libname vdw '[]';
proc contents data=vdw.everndc;
run;
proc contents data=vdw.unifiedndc;
run;
libname out '[output directory]';
libname worklib '[work directory]';

%let oldNDCfile =worklib.mhrn_ndc2011;
%let newNDCfile =worklib.mhrn_ndc2012;

data genericsearch;
	set vdw.unifiedndc;
	if upcase(generic) IN:('AMITRIPTYLINE', 'AMOXAPINE', 'BUPROPION','CITALOPRAM', 'CHLORDIAZEPOXIDE/A', 'CLOMIPRAMINE',
		'DESIPRAMINE','DESVENLAFAXINE', 'DOXEPIN','DULOXETINE','ESCITALOPRAM','FLUOXETINE','FLUVOXAMINE', 
		'IMIPRAMINE', 'ISOCARBOXAZID','MAPROTILINE', 'MIRTAZAPINE','NEFAZODONE','NORTRIPTYLINE', 'NOMIFENSINE', 
		'PAROXETINE', 'PERPHENAZINE', 'PHENELZINE','PROTRIPTYLINE', 'SELEGILINE', 'SERTRALINE', 'TRANYLCYPROMINE', 
		'TRAZODONE', 'TRIMIPRAMINE', 'VENLAFAXINE', 'VILAZODONE')
	or upcase(brand)  IN:('AMITRIPTYLINE', 'AMOXAPINE', 'BUPROPION','CITALOPRAM', 'CHLORDIAZEPOXIDE/A', 'CLOMIPRAMINE',
		'DESIPRAMINE','DESVENLAFAXINE', 'DOXEPIN','DULOXETINE','ESCITALOPRAM','FLUOXETINE','FLUVOXAMINE', 
		'IMIPRAMINE', 'ISOCARBOXAZID','MAPROTILINE', 'MIRTAZAPINE','NEFAZODONE','NORTRIPTYLINE', 'NOMIFENSINE', 
		'PAROXETINE', 'PERPHENAZINE', 'PHENELZINE','PROTRIPTYLINE','SELEGILINE', 'SERTRALINE', 'TRANYLCYPROMINE', 
		'TRAZODONE', 'TRIMIPRAMINE', 'VENLAFAXINE', 'VIIBRYD')
	or upcase(generic) IN:('ALPRAZOLAM', 'AMPHET', 'D-AMPHET', 'DEXTROAMPHET', 'METHAMPHET', 'ARIPIPRAZOLE', 
		'ARMODAFINIL','ASENAPINE','ATOMOXETINE', 'BUSPIRONE', 'CARBAMAZEPINE', 'CHLORDIAZEPOXIDE', 
		'CHLORPROMAZINE','CHLORPROTHIXENE', 'CLONAZEPAM', 'CLONIDINE', 'CLORAZEPATE','CLOZAPINE',
		'DEXMETHYLPHENIDATE', 'DEXTROAMPHETAMINE', 'DIAZEPAM', 'DIVALPROEX', 'ESTAZOLAM', 'ESZOPICLONE',
		 'ETHCHLORVYNOL', 'FLUPHENAZINE', 'FLURAZEPAM', 'GABAPENTIN', 'GUANFACINE', 'HALAZEPAM',
		 'HALOPERIDOL', 'HYDROXYZINE', 'ILOPERIDONE', 'LAMOTRIGINE', 'LISDEXAMFETAMINE', 'LITHIUM',
		'LORAZEPAM', 'LOXAPINE', 'MEPROBAMATE', 'MESORIDAZINE', 'METHYLPHENIDATE', 'MODAFINIL', 'MOLINDONE',
		'OLANZAPINE', 'OXAZEPAM', 'OXCARBAZEPINE', 'PALIPERIDONE', 'PERPHENAZINE', 'PIMOZIDE',
		'PRAZEPAM', 'PREGABALINE', 'PROCHLORPERAZINE', 'PROMAZINE', 'QUAZEPAM', 'QUETIAPINE', 'RAMELTEON', 
		'RISPERIDONE','TEMAZEPAM', 'THIORIDAZINE', 'THIOTHIXENE', 'TIAGABINE', 'TOPIRAMATE', 'TRIAZOLAM',
		'TRIFLUOPERAZINE', 'VALPRO', 'ZALEPLON', 'ZIPRASIDONE', 'ZOLPIDEM', 'ZONISAMIDE')
	or upcase(brand) IN:('ALPRAZOLAM', 'AMPHET', 'D-AMPHET', 'DEXTROAMPHET', 'METHAMPHET', 'ARIPIPRAZOLE', 
		'ARMODAFINIL','ASENAPINE', 'ATOMOXETINE', 'BUSPIRONE', 'CARBAMAZEPINE', 'CHLORDIAZEPOXIDE', 
		'CHLORPROMAZINE', 'CHLORPROTHIXENE', 'CLONAZEPAM', 'CLONIDINE', 'CLORAZEPATE','CLOZAPINE',
		'DEXMETHYLPHENIDATE', 'DEXTROAMPHETAMINE', 'DIAZEPAM', 'DIVALPROEX', 'ESTAZOLAM', 'ESZOPICLONE',
		 'ETHCHLORVYNOL', 'FLUPHENAZINE', 'FLURAZEPAM', 'GABAPENTIN', 'GUANFACINE', 'HALAZEPAM',
		 'HALOPERIDOL', 'HYDROXYZINE', 'ILOPERIDONE', 'LAMOTRIGINE', 'LISDEXAMFETAMINE', 'LITHIUM',
		'LORAZEPAM', 'LOXAPINE', 'MEPROBAMATE', 'MESORIDAZINE', 'METHYLPHENIDATE', 'MODAFINIL', 'MOLINDONE',
		'OLANZAPINE', 'OXAZEPAM', 'OXCARBAZEPINE', 'PALIPERIDONE', 'PERPHENAZINE', 'PIMOZIDE',
		'PRAZEPAM', 'PREGABALINE', 'PROCHLORPERAZINE', 'PROMAZINE', 'QUAZEPAM', 'QUETIAPINE', 'RAMELTEON', 
		'RISPERIDONE','TEMAZEPAM', 'THIORIDAZINE', 'THIOTHIXENE', 'TIAGABINE', 'TOPIRAMATE', 'TRIAZOLAM',
		'TRIFLUOPERAZINE', 'VALPRO', 'ZALEPLON', 'ZIPRASIDONE', 'ZOLPIDEM', 'ZONISAMIDE')
	;
run;
data brandsearch;
	set vdw.unifiedndc;
	if lowcase(generic) IN: ('amitril', 'anafranil', 'aplenzin', 'appbutamone', 'asendin', 'aventyl',
		'budeprion', 'buproban', 'celexa', 'cymbalta', 'desyrel', 'duo-vil',
		'effexor', 'elavil', 'eldepryl', 'endep', 'etrafon', 'forfivo', 'gaboxetine', 'janimine', 
		'lexapro', 'limbitrol', 'ludiomil', 'luvox', 'marplan', 'merital', 'nardil', 'norpramin', 
		'oleptro', 'pamelor', 'paxil', 'pertofrane', 'pexeva', 'pristiq', 'prozac', 'remeron', 'rapiflux',
		'sarafem', 'selfemra', 'sentroxatine', 'serzone', 'sinequan', 'surmontil', 'symbyax', 'silenor', 
		'tofranil', 'trazamine', 'trialodine', 'triavil', 'viibryd', 'vivactil', 'wellbutrin', 'zoloft', 'zyban')
	OR lowcase(brand) IN: ('amitril', 'anafranil', 'aplenzin', 'appbutamone', 'asendin', 'aventyl',
		'budeprion', 'buproban', 'celexa', 'cymbalta', 'desyrel', 'duo-vil',
		'effexor', 'elavil', 'eldepryl', 'endep', 'etrafon', 'forfivo', 'gaboxetine', 'janimine', 
		'lexapro', 'limbitrol', 'ludiomil', 'luvox', 'marplan', 'merital', 'nardil', 'norpramin', 
		'oleptro', 'pamelor', 'paxil', 'pertofrane', 'pexeva', 'pristiq', 'prozac', 'remeron', 'rapiflux',
		'sarafem', 'selfemra', 'sentroxatine', 'serzone', 'sinequan', 'surmontil', 'symbyax', 'silenor', 
		'tofranil', 'trazamine', 'trialodine', 'triavil', 'viibryd', 'vivactil', 'wellbutrin', 'zoloft', 'zyban')
	OR  lowcase(generic) IN:('ritalin', 'concerta', 'methylin', 'metadate', 'dexedrine', 'dextrostat','focalin', 'adderall', 'vyvanase',
		'ativan', 'cdp', 'ceberclon', 'centrax', 'clonopin',  'dalmane', 
		'dizac', 'doral', 'gabazolamine', 'halcion', 'klonopin', 'libritabs', 'librium', 'lipoxide', 
		'mitran', 'niravam', 'poxi', 'paxipam', 'restoril', 'serax', 'strazepam', 'tranxene', 
		 'valium', 'valrelease', 'xanax')
	OR  lowcase(BRAND) IN:('ritalin', 'concerta', 'methylin', 'metadate', 'dexedrine', 'dextrostat','focalin', 'adderall', 'vyvanase',
		'ativan', 'cdp', 'ceberclon', 'centrax', 'clonopin',  'dalmane',  
		'dizac', 'doral', 'gabazolamine', 'halcion', 'klonopin', 'libritabs', 'librium', 'lipoxide', 
		'mitran', 'niravam', 'poxi', 'paxipam', 'restoril', 'serax', 'strazepam', 'tranxene', 
	    'valium', 'valrelease', 'xanax')
	or  lowcase(generic) IN: ('strattera', 'provigil', 'catapres', 'tenex', 'nuvigil', 
		'lithobid', 'eskalith', 'lithonate', 'lithotabs',
		'depakote', 'tegretol', 'carbatrol', 'lamictal', 'trileptal', 'neurontin', 'topamax', 'gabatril', 'zonegran',
		'abilify', 'saphris', 'clozaril', 'fanapt', 'zyprexa', 'invega', 'seroquel', 'risperdal', 'geodon',
		'thorazine', 'taracten', 'fluanxol', 'prolixin', 'haldol', 'loxitane', 'serentil', 'moban', 'navane', 
		'trilafon', 'orap', 'compazine', 'sparine', 'mellaril', 'navane', 'stelazine',
		'ambien', 'lunesta', 'sonata', 'rozerem', 'buspar', 'atarax', 'miltown', 'equanil', 'lyrica')
	or  lowcase(BRAND) IN: ('strattera', 'provigil', 'catapres', 'tenex', 'nuvigil', 
		'lithobid', 'eskalith', 'lithonate', 'lithotabs',
		'depakote', 'tegretol', 'carbatrol', 'lamictal', 'trileptal', 'neurontin', 'topamax', 'gabatril', 'zonegran',
		'abilify', 'saphris', 'clozaril', 'fanapt', 'zyprexa', 'invega', 'seroquel', 'risperdal', 'geodon',
		'thorazine', 'taracten', 'fluanxol', 'prolixin', 'haldol', 'loxitane', 'serentil', 'moban', 'navane', 
		'trilafon', 'orap', 'compazine', 'sparine', 'mellaril', 'navane', 'stelazine',
		'ambien', 'lunesta', 'sonata', 'rozerem', 'buspar', 'atarax', 'miltown', 'equanil', 'lyrica')
;
run;
data out.allMHdrugs;
	set genericsearch brandsearch;
	if fdb_route ne 'ORAL' then delete;
	if rxn_dose_form in: ('Injectable', 'Prefilled', 'Rectal', 'Topical', 'Transdermal') then delete;
	if generic in: ('HOMEOPATHIC') THEN DELETE;
run;
proc contents data=out.allMHdrugs;
run;

proc sql;
	create table newndc as
	select *
	from out.allMHdrugs
	where ndc not in (select ndc from &oldndcfile)
	;
quit;
proc freq data=newndc;
	tables generic rxn_dose_form fdb_route;
run;

data out.newndc_clean;
	set newndc;
	length active_ingred $25.;
	active_ingred = scan(Generic,1,' ');
/*	 if generic in:('THEOPHYLLINE') then delete; */
	/*asthma drug incombo with anti-anxiety;*/
run;
proc freq data=out.newndc_clean;
	tables active_ingred;
run;

/*
#  Variable          Type  Len  Informat  Label

2  active_ingred     Char  105            Active Ingredient(s)
4  brand             Char  105            FDB BRAND NAME, EDW TRADE NAME
5  category          Char   25            Primary classification of drug use for MHRN purposes
7  fdb_ndc_presence  Num     3            Presence of NDC in latest FDB file [1=yes, 0=no]
3  generic           Char  105            Preferred Generic Name (truncated at 100 characters)
1  ndc               Char   13  $11.      National Drug Code
6  rxn_ndc_presence  Num     3            Presence of NDC in latest rxnorm extract [1=yes, 0=no
*/
