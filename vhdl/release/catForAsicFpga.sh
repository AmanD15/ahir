rm -f ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/GlobalConstants.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/Types.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/Utilities.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/Subprograms.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/BaseComponents.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/Components.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/FloatOperatorPackage.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/OperatorPackage.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/mem_component_pack.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/mem_function_pack.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/memory_subsystem_package.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/merge_functions.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/functionLibraryComponents.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/ApIntComponents.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/mem_ASIC_components.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/packagesV2/MemcutsPackage.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/memory_subsystem/common/*.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/memory_subsystem/base_bank_asic/*.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/memory_subsystem/base_bank_asic/for_fpga_impl_of_asic_rtl/*.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/memory_subsystem/strictly_ordered/*.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/memory_subsystem/unordered/*.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/control-path/*.vhdl >> ahirForAsicFpga.vhdl
cat ../ahir/operatorsV2/base/*.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/operatorsV2/ieee754/*.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/operatorsV2/experimental/*.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/operatorsV2/glue/*.vhd* >> ahirForAsicFpga.vhdl
cat ../ahir/operatorsV2/level_core/*.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/operatorsV2/functionLibrary/*.vhd >> ahirForAsicFpga.vhdl
cat ../ahir/operatorsV2/ap_int/*.vhd >> ahirForAsicFpga.vhdl
cat ../aHiR_ieee_proposed/trimmed/math_utility_pkg.vhd >> aHiR_ieee_proposed.vhdl
cat ../aHiR_ieee_proposed/trimmed/fixed_float_types_c.vhdl >> aHiR_ieee_proposed.vhdl
cat ../aHiR_ieee_proposed/trimmed/fixed_pkg_c.vhd >> aHiR_ieee_proposed.vhdl
cat ../aHiR_ieee_proposed/trimmed/float_pkg_c.vhd >> aHiR_ieee_proposed.vhdl
