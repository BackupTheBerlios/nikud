TEXMFDIR = $(HOME)/texmf
#TEXMFDIR = /usr/share/texmf
TEXFONTSDIR = $(TEXMFDIR)/fonts
DVIPSBASEDIR = $(TEXMFDIR)/dvips/base
TMP_FILE = temp.map
CULMUS_ENC_FILE = myculmus.enc
CULMUS_DVIPS_MAP_FILE = culmus.map
LOCAL_BABEL_DIR = $(TEXMFDIR)/tex/hebrew
SAMPLES_DIR = $(TEXMFDIR)/doc/latex/nikud/samples
AFM_TEMP_FILE = temp.afm
CULMUS_DIR = culmus-0.90
TEST_DIR = tests

RM = rm -fr
CP = cp -f
MKDIR = mkdir -p

all: 	frank.vf frankb.vf frankbi.vf franki.vf \
	miriamb.vf miriambi.vf miriam.vf miriami.vf \
	nachlielib.vf nachlielibi.vf nachlieli.vf nachlielii.vf \
	elliniab.vf elliniabi.vf ellinia.vf elliniai.vf \
	ktavyadbi.vf ktavyadi.vf

clean:
	$(RM) *.vf *.tfm *.vpl *.map *~ 
	$(RM) $(TMP_FILE) $(AFM_TEMP_FILE) *.t3 *.ps 
	$(RM) $(TEST_DIR)/*.ps babel/*~
	make -C samples/long clean
	make -C samples/short clean
	make -C samples/song clean

uninstall:
	$(RM) "$(TEXFONTSDIR)/tfm/hebrew/"
	$(RM) "$(TEXFONTSDIR)/vf/hebrew/"
	$(RM) "$(DVIPSBASEDIR)/$(CULMUS_ENC_FILE)"
	$(RM) "$(DVIPSBASEDIR)/$(CULMUS_DVIPS_MAP_FILE)"
	$(RM) "$(TEXFONTSDIR)/afm/hebrew/"
	$(RM) "$(TEXFONTSDIR)/type1/hebrew/"
	$(RM) $(LOCAL_BABEL_DIR)
	$(RM) "$(TEXMFDIR)/bibtex/bst/chicagoi.bst"
	$(RM) "$(TEXMFDIR)/bibtex/bst/chicagoiheb.bst"
	$(RM) "$(TEXMFDIR)/tex/biblio"
	$(RM) "$(TEXMFDIR)/tex/latex/tools/variorefh.sty"
	$(RM) "$(TEXMFDIR)/doc/latex/nikud"
	mktexlsr


install:
	$(MKDIR) "$(TEXFONTSDIR)/tfm/hebrew/"
	$(CP) *.tfm "$(TEXFONTSDIR)/tfm/hebrew/"
	$(MKDIR) "$(TEXFONTSDIR)/vf/hebrew/"
	$(CP) *.vf "$(TEXFONTSDIR)/vf/hebrew/"
	$(MKDIR) "$(DVIPSBASEDIR)/"
	$(CP) $(CULMUS_ENC_FILE) "$(DVIPSBASEDIR)/"
	$(CP) $(CULMUS_DVIPS_MAP_FILE) "$(DVIPSBASEDIR)/"
	$(MKDIR) "$(TEXFONTSDIR)/afm/hebrew/"
	$(CP) $(CULMUS_DIR)/*.afm "$(TEXFONTSDIR)/afm/hebrew/"
	$(MKDIR) "$(TEXFONTSDIR)/type1/hebrew/"
	$(CP) $(CULMUS_DIR)/*.pfa "$(TEXFONTSDIR)/type1/hebrew/"
	$(CP) *.t3 "$(TEXFONTSDIR)/type1/hebrew/"
	$(MKDIR) $(LOCAL_BABEL_DIR)
	$(CP) babel/*fd babel/*def babel/*.sty $(LOCAL_BABEL_DIR)
	$(CP) -r bibtex_stuff/bibtex $(TEXMFDIR)
	$(MKDIR) $(TEXMFDIR)/tex/biblio
	$(CP) -r bibtex_stuff/biblio/*.sty "$(TEXMFDIR)/tex/biblio"
	$(MKDIR) "$(TEXMFDIR)/tex/latex/tools"
	$(CP) -r tools/*.sty "$(TEXMFDIR)/tex/latex/tools"
	$(MKDIR) "$(SAMPLES_DIR)"
	$(CP) -r samples/* "$(SAMPLES_DIR)"
	mktexlsr


frank.vf: $(CULMUS_DIR)/FrankRuehl-Medium.afm $(CULMUS_ENC_FILE) FrankRuehl-Medium.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/FrankRuehl-Medium.afm -s FrankRuehl-Medium.special -o FrankRuehl-Medium-Menukad.t3
	./CreateTest.pl FrankRuehl-Medium > $(TEST_DIR)/Test-FrankRuehl-Medium-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/FrankRuehl-Medium.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v frank -T $(CULMUS_ENC_FILE) rfrank > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf frank.vpl frank.vf frank.tfm

frankb.vf: $(CULMUS_DIR)/FrankRuehl-Bold.afm $(CULMUS_ENC_FILE) FrankRuehl-Bold.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/FrankRuehl-Bold.afm -s FrankRuehl-Bold.special -o FrankRuehl-Bold-Menukad.t3
	./CreateTest.pl FrankRuehl-Bold > $(TEST_DIR)/Test-FrankRuehl-Bold-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/FrankRuehl-Bold.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v frankb -T $(CULMUS_ENC_FILE) rfrankb > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf frankb.vpl frankb.vf frankb.tfm

frankbi.vf: $(CULMUS_DIR)/FrankRuehl-BoldOblique.afm $(CULMUS_ENC_FILE) FrankRuehl-BoldOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/FrankRuehl-BoldOblique.afm -s FrankRuehl-BoldOblique.special -o FrankRuehl-BoldOblique-Menukad.t3
	./CreateTest.pl FrankRuehl-BoldOblique > $(TEST_DIR)/Test-FrankRuehl-BoldOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/FrankRuehl-BoldOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v frankbi -T $(CULMUS_ENC_FILE) rfrankbi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf frankbi.vpl frankbi.vf frankbi.tfm

franki.vf: $(CULMUS_DIR)/FrankRuehl-MediumOblique.afm $(CULMUS_ENC_FILE) FrankRuehl-MediumOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/FrankRuehl-MediumOblique.afm -s FrankRuehl-MediumOblique.special -o FrankRuehl-MediumOblique-Menukad.t3
	./CreateTest.pl FrankRuehl-MediumOblique > $(TEST_DIR)/Test-FrankRuehl-MediumOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/FrankRuehl-MediumOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v franki -T $(CULMUS_ENC_FILE) rfranki > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf franki.vpl franki.vf franki.tfm

miriamb.vf: $(CULMUS_DIR)/MiriamMono-Bold.afm $(CULMUS_ENC_FILE) MiriamMono-Bold.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/MiriamMono-Bold.afm -s MiriamMono-Bold.special -o MiriamMono-Bold-Menukad.t3
	./CreateTest.pl MiriamMono-Bold > $(TEST_DIR)/Test-MiriamMono-Bold-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/MiriamMono-Bold.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v miriamb -T $(CULMUS_ENC_FILE) rmiriamb > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf miriamb.vpl miriamb.vf miriamb.tfm

miriambi.vf: $(CULMUS_DIR)/MiriamMono-BoldOblique.afm $(CULMUS_ENC_FILE) MiriamMono-BoldOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/MiriamMono-BoldOblique.afm -s MiriamMono-BoldOblique.special -o MiriamMono-BoldOblique-Menukad.t3
	./CreateTest.pl MiriamMono-BoldOblique > $(TEST_DIR)/Test-MiriamMono-BoldOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/MiriamMono-BoldOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v miriambi -T $(CULMUS_ENC_FILE) rmiriambi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf miriambi.vpl miriambi.vf miriambi.tfm

miriam.vf: $(CULMUS_DIR)/MiriamMono-Book.afm $(CULMUS_ENC_FILE) MiriamMono-Book.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/MiriamMono-Book.afm -s MiriamMono-Book.special -o MiriamMono-Book-Menukad.t3
	./CreateTest.pl MiriamMono-Book > $(TEST_DIR)/Test-MiriamMono-Book-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/MiriamMono-Book.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v miriam -T $(CULMUS_ENC_FILE) rmiriam > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf miriam.vpl miriam.vf miriam.tfm

miriami.vf: $(CULMUS_DIR)/MiriamMono-BookOblique.afm $(CULMUS_ENC_FILE) MiriamMono-BookOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/MiriamMono-BookOblique.afm -s MiriamMono-BookOblique.special -o MiriamMono-BookOblique-Menukad.t3
	./CreateTest.pl MiriamMono-BookOblique > $(TEST_DIR)/Test-MiriamMono-BookOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/MiriamMono-BookOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v miriami -T $(CULMUS_ENC_FILE) rmiriami > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf miriami.vpl miriami.vf miriami.tfm

nachlielib.vf: $(CULMUS_DIR)/Nachlieli-Bold.afm $(CULMUS_ENC_FILE) Nachlieli-Bold.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/Nachlieli-Bold.afm -s Nachlieli-Bold.special -o Nachlieli-Bold-Menukad.t3
	./CreateTest.pl Nachlieli-Bold > $(TEST_DIR)/Test-Nachlieli-Bold-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/Nachlieli-Bold.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v nachlielib -T $(CULMUS_ENC_FILE) rnachlielib > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf nachlielib.vpl nachlielib.vf nachlielib.tfm

nachlielibi.vf: $(CULMUS_DIR)/Nachlieli-BoldOblique.afm $(CULMUS_ENC_FILE) Nachlieli-BoldOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/Nachlieli-BoldOblique.afm -s Nachlieli-BoldOblique.special -o Nachlieli-BoldOblique-Menukad.t3
	./CreateTest.pl Nachlieli-BoldOblique > $(TEST_DIR)/Test-Nachlieli-BoldOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/Nachlieli-BoldOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v nachlielibi -T $(CULMUS_ENC_FILE) rnachlielibi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf nachlielibi.vpl nachlielibi.vf nachlielibi.tfm

nachlieli.vf: $(CULMUS_DIR)/Nachlieli-Light.afm $(CULMUS_ENC_FILE) Nachlieli-Light.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/Nachlieli-Light.afm -s Nachlieli-Light.special -o Nachlieli-Light-Menukad.t3
	./CreateTest.pl Nachlieli-Light > $(TEST_DIR)/Test-Nachlieli-Light-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/Nachlieli-Light.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v nachlieli -T $(CULMUS_ENC_FILE) rnachlieli > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf nachlieli.vpl nachlieli.vf nachlieli.tfm

nachlielii.vf: $(CULMUS_DIR)/Nachlieli-LightOblique.afm $(CULMUS_ENC_FILE) Nachlieli-LightOblique.special
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/Nachlieli-LightOblique.afm -s Nachlieli-LightOblique.special -o Nachlieli-LightOblique-Menukad.t3
	./CreateTest.pl Nachlieli-LightOblique > $(TEST_DIR)/Test-Nachlieli-LightOblique-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/Nachlieli-LightOblique.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v nachlielii -T $(CULMUS_ENC_FILE) rnachlielii > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf nachlielii.vpl nachlielii.vf nachlielii.tfm

elliniab.vf: $(CULMUS_DIR)/Ellinia-Bold.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/Ellinia-Bold.afm -o Ellinia-Bold-Menukad.t3
	./CreateTest.pl Ellinia-Bold > $(TEST_DIR)/Test-Ellinia-Bold-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/Ellinia-Bold.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v elliniab -T $(CULMUS_ENC_FILE) relliniab > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf elliniab.vpl elliniab.vf elliniab.tfm

elliniabi.vf: $(CULMUS_DIR)/Ellinia-BoldItalic.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/Ellinia-BoldItalic.afm  -o Ellinia-BoldItalic-Menukad.t3
	./CreateTest.pl Ellinia-BoldItalic > $(TEST_DIR)/Test-Ellinia-BoldItalic-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/Ellinia-BoldItalic.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v elliniabi -T $(CULMUS_ENC_FILE) relliniabi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf elliniabi.vpl elliniabi.vf elliniabi.tfm

ellinia.vf: $(CULMUS_DIR)/Ellinia-Light.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/Ellinia-Light.afm  -o Ellinia-Light-Menukad.t3
	./CreateTest.pl Ellinia-Light > $(TEST_DIR)/Test-Ellinia-Light-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/Ellinia-Light.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v ellinia -T $(CULMUS_ENC_FILE) rellinia > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf ellinia.vpl ellinia.vf ellinia.tfm

elliniai.vf: $(CULMUS_DIR)/Ellinia-LightItalic.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/Ellinia-LightItalic.afm  -o Ellinia-LightItalic-Menukad.t3
	./CreateTest.pl Ellinia-LightItalic > $(TEST_DIR)/Test-Ellinia-LightItalic-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/Ellinia-LightItalic.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v elliniai -T $(CULMUS_ENC_FILE) relliniai > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf elliniai.vpl elliniai.vf elliniai.tfm

ktavyadbi.vf: $(CULMUS_DIR)/KtavYad-BoldItalic.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/KtavYad-BoldItalic.afm  -o KtavYad-BoldItalic-Menukad.t3
	./CreateTest.pl KtavYad-BoldItalic > $(TEST_DIR)/Test-KtavYad-BoldItalic-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/KtavYad-BoldItalic.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v ktavyadbi -T $(CULMUS_ENC_FILE) rktavyadbi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf ktavyadbi.vpl ktavyadbi.vf ktavyadbi.tfm

ktavyadi.vf: $(CULMUS_DIR)/KtavYad-MediumItalic.afm $(CULMUS_ENC_FILE)
	./culmusafm2t3menukad.pl $(CULMUS_DIR)/KtavYad-MediumItalic.afm  -o KtavYad-MediumItalic-Menukad.t3
	./CreateTest.pl KtavYad-MediumItalic > $(TEST_DIR)/Test-KtavYad-MediumItalic-Menukad.ps
	./zero_nikud_width.pl $(CULMUS_DIR)/KtavYad-MediumItalic.afm $(AFM_TEMP_FILE)
	afm2tfm $(AFM_TEMP_FILE) -v ktavyadi -T $(CULMUS_ENC_FILE) rktavyadi > $(TMP_FILE)
	./append_to_mapfile.pl $(TMP_FILE) $(CULMUS_DVIPS_MAP_FILE)
	vptovf ktavyadi.vpl ktavyadi.vf ktavyadi.tfm
