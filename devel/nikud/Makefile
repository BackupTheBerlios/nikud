DESTDIR = $(HOME)/texmf
MKTEXLSR = mktexlsr
TEXMFDIR = $(DESTDIR)
#TEXMFDIR = /usr/share/texmf
TEXFONTSDIR = $(TEXMFDIR)/fonts
DVIPSBASEDIR = $(TEXMFDIR)/dvips/base
TMP_FILE = temp.map
CULMUS_ENC_FILE = myculmus.enc
CULMUS_ENC_FILE_WITH_DASHES = myculmus_with_dashes.enc
CULMUS_DVIPS_MAP_FILE = culmus.map
LOCAL_BABEL_DIR = $(TEXMFDIR)/tex/hebrew
SAMPLES_DIR = $(TEXMFDIR)/doc/latex/nikud/samples
AFM_TEMP_FILE = temp.afm
CULMUS_DIR = culmus-0.100
TEST_DIR = tests

RM = rm -fr
CP = cp -f
MKDIR = mkdir -p

all: 	frankClmNkd.vf frankClmNkdb.vf frankClmNkdbi.vf frankClmNkdi.vf \
	miriamClmNkdb.vf miriamClmNkdbi.vf miriamClmNkd.vf miriamClmNkdi.vf \
	nachlieliClmNkdb.vf nachlieliClmNkdbi.vf nachlieliClmNkd.vf nachlieliClmNkdi.vf \
	elliniaClmNkdb.vf elliniaClmNkdbi.vf elliniaClmNkd.vf elliniaClmNkdi.vf \
	yehudaClmNkdb.vf yehudaClmNkd.vf

clean:
	$(RM) *.vf *.tfm *.vpl *.map *~ 
	$(RM) $(TMP_FILE) $(AFM_TEMP_FILE) *.t3 *.ps 
	$(RM) $(TEST_DIR)/*.ps babel/*~
	make -C samples/long clean
	make -C samples/short clean
	make -C samples/poem clean

uninstall:
	$(RM) "$(TEXFONTSDIR)/tfm/hebrew/culmus/nikud/"
	$(RM) "$(TEXFONTSDIR)/vf/hebrew/culmus/nikud/"
	$(RM) "$(DVIPSBASEDIR)/$(CULMUS_ENC_FILE)"
	$(RM) "$(DVIPSBASEDIR)/$(CULMUS_ENC_FILE_WITH_DASHES)"
	$(RM) "$(DVIPSBASEDIR)/$(CULMUS_DVIPS_MAP_FILE)"
	$(RM) "$(TEXFONTSDIR)/afm/hebrew/culmus/nikud/"
	$(RM) "$(TEXFONTSDIR)/type1/hebrew/culmus/nikud/"
	$(RM) $(LOCAL_BABEL_DIR)
	$(RM) "$(TEXMFDIR)/bibtex/bst/chicagoi.bst"
	$(RM) "$(TEXMFDIR)/bibtex/bst/chicagoiheb.bst"
	$(RM) "$(TEXMFDIR)/tex/biblio"
	$(RM) "$(TEXMFDIR)/tex/latex/tools/variorefh.sty"
	$(RM) "$(TEXMFDIR)/doc/latex/nikud"
	$(MKTEXLSR)


install:
	$(MKDIR) "$(TEXFONTSDIR)/tfm/hebrew/culmus/nikud/"
	$(CP) *.tfm "$(TEXFONTSDIR)/tfm/hebrew/culmus/nikud/"
	$(MKDIR) "$(TEXFONTSDIR)/vf/hebrew/culmus/nikud/"
	$(CP) *.vf "$(TEXFONTSDIR)/vf/hebrew/culmus/nikud/"
	$(MKDIR) "$(DVIPSBASEDIR)/"
	$(CP) $(CULMUS_ENC_FILE) "$(DVIPSBASEDIR)/"
	$(CP) $(CULMUS_ENC_FILE_WITH_DASHES) "$(DVIPSBASEDIR)/"
	$(CP) $(CULMUS_DVIPS_MAP_FILE) "$(DVIPSBASEDIR)/"
	$(MKDIR) "$(TEXFONTSDIR)/afm/hebrew/culmus/nikud/"
	$(CP) $(CULMUS_DIR)/*.afm "$(TEXFONTSDIR)/afm/hebrew/culmus/nikud/"
	$(MKDIR) "$(TEXFONTSDIR)/type1/hebrew/culmus/nikud/"
	$(CP) $(CULMUS_DIR)/*.pfa "$(TEXFONTSDIR)/type1/hebrew/culmus/nikud/"
	$(CP) *.t3 "$(TEXFONTSDIR)/type1/hebrew/culmus/nikud/"
	$(MKDIR) $(LOCAL_BABEL_DIR)
	$(CP) babel/*fd babel/*def babel/*.sty $(LOCAL_BABEL_DIR)
	$(CP) -r bibtex_stuff/bibtex $(TEXMFDIR)
	$(MKDIR) $(TEXMFDIR)/tex/biblio
	$(CP) -r bibtex_stuff/biblio/*.sty "$(TEXMFDIR)/tex/biblio"
	$(MKDIR) "$(TEXMFDIR)/tex/latex/tools"
	$(CP) -r tools/*.sty "$(TEXMFDIR)/tex/latex/tools"
	$(MKDIR) "$(SAMPLES_DIR)"
	$(CP) -r samples/* "$(SAMPLES_DIR)"
	$(MKTEXLSR)


frankClmNkd.vf: $(CULMUS_DIR)/FrankRuehlCLM-Medium.afm $(CULMUS_ENC_FILE_WITH_DASHES) FrankRuehlCLM-Medium.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/FrankRuehlCLM-Medium.afm -s FrankRuehlCLM-Medium.special -o FrankRuehlCLM-Medium-Menukad.t3
	./CreateTest.pl FrankRuehlCLM-Medium > $(TEST_DIR)/Test-FrankRuehlCLM-Medium-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/FrankRuehlCLM-Medium.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v frankClmNkd -T $(CULMUS_ENC_FILE_WITH_DASHES) rfrankClmNkd > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf frankClmNkd.vpl frankClmNkd.vf frankClmNkd.tfm

frankClmNkdb.vf: $(CULMUS_DIR)/FrankRuehlCLM-Bold.afm $(CULMUS_ENC_FILE_WITH_DASHES) FrankRuehlCLM-Bold.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/FrankRuehlCLM-Bold.afm -s FrankRuehlCLM-Bold.special -o FrankRuehlCLM-Bold-Menukad.t3
	./CreateTest.pl FrankRuehlCLM-Bold > $(TEST_DIR)/Test-FrankRuehlCLM-Bold-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/FrankRuehlCLM-Bold.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v frankClmNkdb -T $(CULMUS_ENC_FILE_WITH_DASHES) rfrankClmNkdb > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf frankClmNkdb.vpl frankClmNkdb.vf frankClmNkdb.tfm

frankClmNkdbi.vf: $(CULMUS_DIR)/FrankRuehlCLM-BoldOblique.afm $(CULMUS_ENC_FILE_WITH_DASHES) FrankRuehlCLM-BoldOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/FrankRuehlCLM-BoldOblique.afm -s FrankRuehlCLM-BoldOblique.special -o FrankRuehlCLM-BoldOblique-Menukad.t3
	./CreateTest.pl FrankRuehlCLM-BoldOblique > $(TEST_DIR)/Test-FrankRuehlCLM-BoldOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/FrankRuehlCLM-BoldOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v frankClmNkdbi -T $(CULMUS_ENC_FILE_WITH_DASHES) rfrankClmNkdbi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf frankClmNkdbi.vpl frankClmNkdbi.vf frankClmNkdbi.tfm

frankClmNkdi.vf: $(CULMUS_DIR)/FrankRuehlCLM-MediumOblique.afm $(CULMUS_ENC_FILE_WITH_DASHES) FrankRuehlCLM-MediumOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/FrankRuehlCLM-MediumOblique.afm -s FrankRuehlCLM-MediumOblique.special -o FrankRuehlCLM-MediumOblique-Menukad.t3
	./CreateTest.pl FrankRuehlCLM-MediumOblique > $(TEST_DIR)/Test-FrankRuehlCLM-MediumOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/FrankRuehlCLM-MediumOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v frankClmNkdi -T $(CULMUS_ENC_FILE_WITH_DASHES) rfrankClmNkdi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf frankClmNkdi.vpl frankClmNkdi.vf frankClmNkdi.tfm

miriamClmNkdb.vf: $(CULMUS_DIR)/MiriamMonoCLM-Bold.afm $(CULMUS_ENC_FILE) MiriamMonoCLM-Bold.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/MiriamMonoCLM-Bold.afm -s MiriamMonoCLM-Bold.special -o MiriamMonoCLM-Bold-Menukad.t3
	./CreateTest.pl MiriamMonoCLM-Bold > $(TEST_DIR)/Test-MiriamMonoCLM-Bold-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/MiriamMonoCLM-Bold.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v miriamClmNkdb -T $(CULMUS_ENC_FILE) rmiriamClmNkdb > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf miriamClmNkdb.vpl miriamClmNkdb.vf miriamClmNkdb.tfm

miriamClmNkdbi.vf: $(CULMUS_DIR)/MiriamMonoCLM-BoldOblique.afm $(CULMUS_ENC_FILE) MiriamMonoCLM-BoldOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/MiriamMonoCLM-BoldOblique.afm -s MiriamMonoCLM-BoldOblique.special -o MiriamMonoCLM-BoldOblique-Menukad.t3
	./CreateTest.pl MiriamMonoCLM-BoldOblique > $(TEST_DIR)/Test-MiriamMonoCLM-BoldOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/MiriamMonoCLM-BoldOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v miriamClmNkdbi -T $(CULMUS_ENC_FILE) rmiriamClmNkdbi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf miriamClmNkdbi.vpl miriamClmNkdbi.vf miriamClmNkdbi.tfm

miriamClmNkd.vf: $(CULMUS_DIR)/MiriamMonoCLM-Book.afm $(CULMUS_ENC_FILE) MiriamMonoCLM-Book.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/MiriamMonoCLM-Book.afm -s MiriamMonoCLM-Book.special -o MiriamMonoCLM-Book-Menukad.t3
	./CreateTest.pl MiriamMonoCLM-Book > $(TEST_DIR)/Test-MiriamMonoCLM-Book-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/MiriamMonoCLM-Book.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v miriamClmNkd -T $(CULMUS_ENC_FILE) rmiriamClmNkd > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf miriamClmNkd.vpl miriamClmNkd.vf miriamClmNkd.tfm

miriamClmNkdi.vf: $(CULMUS_DIR)/MiriamMonoCLM-BookOblique.afm $(CULMUS_ENC_FILE) MiriamMonoCLM-BookOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/MiriamMonoCLM-BookOblique.afm -s MiriamMonoCLM-BookOblique.special -o MiriamMonoCLM-BookOblique-Menukad.t3
	./CreateTest.pl MiriamMonoCLM-BookOblique > $(TEST_DIR)/Test-MiriamMonoCLM-BookOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/MiriamMonoCLM-BookOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v miriamClmNkdi -T $(CULMUS_ENC_FILE) rmiriamClmNkdi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf miriamClmNkdi.vpl miriamClmNkdi.vf miriamClmNkdi.tfm

nachlieliClmNkdb.vf: $(CULMUS_DIR)/NachlieliCLM-Bold.afm $(CULMUS_ENC_FILE_WITH_DASHES) NachlieliCLM-Bold.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/NachlieliCLM-Bold.afm -s NachlieliCLM-Bold.special -o NachlieliCLM-Bold-Menukad.t3
	./CreateTest.pl NachlieliCLM-Bold > $(TEST_DIR)/Test-NachlieliCLM-Bold-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/NachlieliCLM-Bold.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v nachlieliClmNkdb -T $(CULMUS_ENC_FILE_WITH_DASHES) rnachlieliClmNkdb > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf nachlieliClmNkdb.vpl nachlieliClmNkdb.vf nachlieliClmNkdb.tfm

nachlieliClmNkdbi.vf: $(CULMUS_DIR)/NachlieliCLM-BoldOblique.afm $(CULMUS_ENC_FILE_WITH_DASHES) NachlieliCLM-BoldOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/NachlieliCLM-BoldOblique.afm -s NachlieliCLM-BoldOblique.special -o NachlieliCLM-BoldOblique-Menukad.t3
	./CreateTest.pl NachlieliCLM-BoldOblique > $(TEST_DIR)/Test-NachlieliCLM-BoldOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/NachlieliCLM-BoldOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v nachlieliClmNkdbi -T $(CULMUS_ENC_FILE_WITH_DASHES) rnachlieliClmNkdbi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf nachlieliClmNkdbi.vpl nachlieliClmNkdbi.vf nachlieliClmNkdbi.tfm

nachlieliClmNkd.vf: $(CULMUS_DIR)/NachlieliCLM-Light.afm $(CULMUS_ENC_FILE_WITH_DASHES) NachlieliCLM-Light.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/NachlieliCLM-Light.afm -s NachlieliCLM-Light.special -o NachlieliCLM-Light-Menukad.t3
	./CreateTest.pl NachlieliCLM-Light > $(TEST_DIR)/Test-NachlieliCLM-Light-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/NachlieliCLM-Light.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v nachlieliClmNkd -T $(CULMUS_ENC_FILE_WITH_DASHES) rnachlieliClmNkd > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf nachlieliClmNkd.vpl nachlieliClmNkd.vf nachlieliClmNkd.tfm

nachlieliClmNkdi.vf: $(CULMUS_DIR)/NachlieliCLM-LightOblique.afm $(CULMUS_ENC_FILE_WITH_DASHES) NachlieliCLM-LightOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/NachlieliCLM-LightOblique.afm -s NachlieliCLM-LightOblique.special -o NachlieliCLM-LightOblique-Menukad.t3
	./CreateTest.pl NachlieliCLM-LightOblique > $(TEST_DIR)/Test-NachlieliCLM-LightOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/NachlieliCLM-LightOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v nachlieliClmNkdi -T $(CULMUS_ENC_FILE_WITH_DASHES) rnachlieliClmNkdi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf nachlieliClmNkdi.vpl nachlieliClmNkdi.vf nachlieliClmNkdi.tfm

elliniaClmNkdb.vf: $(CULMUS_DIR)/ElliniaCLM-Bold.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/ElliniaCLM-Bold.afm -o ElliniaCLM-Bold-Menukad.t3
	./CreateTest.pl ElliniaCLM-Bold > $(TEST_DIR)/Test-ElliniaCLM-Bold-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/ElliniaCLM-Bold.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v elliniaClmNkdb -T $(CULMUS_ENC_FILE) relliniaClmNkdb > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf elliniaClmNkdb.vpl elliniaClmNkdb.vf elliniaClmNkdb.tfm

elliniaClmNkdbi.vf: $(CULMUS_DIR)/ElliniaCLM-BoldItalic.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/ElliniaCLM-BoldItalic.afm  -o ElliniaCLM-BoldItalic-Menukad.t3
	./CreateTest.pl ElliniaCLM-BoldItalic > $(TEST_DIR)/Test-ElliniaCLM-BoldItalic-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/ElliniaCLM-BoldItalic.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v elliniaClmNkdbi -T $(CULMUS_ENC_FILE) relliniaClmNkdbi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf elliniaClmNkdbi.vpl elliniaClmNkdbi.vf elliniaClmNkdbi.tfm

elliniaClmNkd.vf: $(CULMUS_DIR)/ElliniaCLM-Light.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/ElliniaCLM-Light.afm  -o ElliniaCLM-Light-Menukad.t3
	./CreateTest.pl ElliniaCLM-Light > $(TEST_DIR)/Test-ElliniaCLM-Light-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/ElliniaCLM-Light.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v elliniaClmNkd -T $(CULMUS_ENC_FILE) relliniaClmNkd > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf elliniaClmNkd.vpl elliniaClmNkd.vf elliniaClmNkd.tfm

elliniaClmNkdi.vf: $(CULMUS_DIR)/ElliniaCLM-LightItalic.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/ElliniaCLM-LightItalic.afm  -o ElliniaCLM-LightItalic-Menukad.t3
	./CreateTest.pl ElliniaCLM-LightItalic > $(TEST_DIR)/Test-ElliniaCLM-LightItalic-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/ElliniaCLM-LightItalic.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v elliniaClmNkdi -T $(CULMUS_ENC_FILE) relliniaClmNkdi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf elliniaClmNkdi.vpl elliniaClmNkdi.vf elliniaClmNkdi.tfm

yehudaClmNkdb.vf: $(CULMUS_DIR)/YehudaCLM-Bold.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/YehudaCLM-Bold.afm  -o YehudaCLM-Bold-Menukad.t3
	./CreateTest.pl YehudaCLM-Bold > $(TEST_DIR)/Test-YehudaCLM-Bold-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/YehudaCLM-Bold.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v yehudaClmNkdb -T $(CULMUS_ENC_FILE) ryehudaClmNkdb > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf yehudaClmNkdb.vpl yehudaClmNkdb.vf yehudaClmNkdb.tfm

yehudaClmNkd.vf: $(CULMUS_DIR)/YehudaCLM-Light.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/YehudaCLM-Light.afm  -o YehudaCLM-Light-Menukad.t3
	./CreateTest.pl YehudaCLM-Light > $(TEST_DIR)/Test-YehudaCLM-Light-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/YehudaCLM-Light.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v yehudaClmNkd -T $(CULMUS_ENC_FILE) ryehudaClmNkd > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf yehudaClmNkd.vpl yehudaClmNkd.vf yehudaClmNkd.tfm
