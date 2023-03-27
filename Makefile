CURRENT_VERSION = $(shell jq -r .version package.json)
.PHONY: default
default: publish clean

syntaxes/klipper-config.tmLanguage.json: upstream/fluidd-core_fluidd/src/monaco/language/klipper-config.tmLanguage.json
	cp $< $@

.PHONY: package
package: klipper-config-syntax-$(CURRENT_VERSION).vsix

klipper-config-syntax-$(CURRENT_VERSION).vsix: syntaxes/klipper-config.tmLanguage.json
	yarn vsce:package

.PHONY: publish
publish: package
	yarn vsce:publish

.PHONY: clean
clean:
	rm *.vsix
