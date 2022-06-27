.PHONY: publish clean

default: publish clean

syntaxes/klipper-config.tmLanguage.json: upstream/fluidd-core_fluidd/src/monaco/language/klipper-config.tmLanguage.json
	cp $< $@

package: syntaxes/klipper-config.tmLanguage.json
	vsce package

publish: package
	vsce publish patch

clean:
	rm *.vsix
