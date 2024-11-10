all: clean-get gen

clean:
	flutter clean

get:
	flutter pub get
	flutter gen-l10n

k:
	make clean
	make get

clean-get:
	make clean
	make get
	

gen:
	flutter gen-l10n
	flutter pub run build_runner build --delete-conflicting-outputs

remove-gen:
	find . -type f \( -name "*.freezed.dart" -o -name "*.g.dart" -o -name "*.gr.dart" -o -name "*.config.dart" -o -name "*.gen.dart" \) -exec rm -f {} +
