
if [ "$1" = "-h" ]; then
	echo """
$0 will extract the content of an UltraLibrarian download into symbol/ footprints/ and STEP/ of the currwnt working directory.

$0 ul_my_component_.zip ul_my_other_component.zip
""";
	exit 0;
fi

for f in $@; do
	echo $f
	component_name="$(echo "$f" | cut -d '.' -f1 | cut -c4-)"
	unzip -j "$f" '*_sym' -d symbols/
	# Rename mangled names_from symbols
	mv symbols/2023-*.kicad_sym "symbols/$component_name.kicad_sym"
	unzip -j "$f" '*_mod' -d footprints/
	unzip -j "$f" '*.step' -d STEP/
done
