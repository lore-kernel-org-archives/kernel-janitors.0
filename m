From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 23 Sep 2013 21:26:53 +0000
Subject: build regressions 2013-09-23
Message-Id: <5240b21d.IZ5Ez6oXcidgmwmW%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/acpi/platform/aclinux.h:83:44: error: '#' is not followed by a macro parameter
include/acpi/acpixf.h:194:1: error: 'b' undeclared here (not in a function)
include/linux/timex.h:80:2: error: implicit declaration of function 'read_current_timer' [-Werror=implicit-function-declaration]
include/acpi/acpixf.h:130: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:138: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:145: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:151: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:156: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:164: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:172: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:178: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:184: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:190: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:194: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:195: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:196: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:197: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:203: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:206: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:213: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:215: error: 'no_instrument_function' attribute applies only to functions
include/acpi/acpixf.h:796:1: error: expected ',' or ';' before '{' token
include/acpi/acpixf.h:802:1: error: expected ',' or ';' before '{' token
include/acpi/acpixf.h:809:1: error: expected ',' or ';' before '{' token
include/acpi/acpixf.h:815:1: error: expected ',' or ';' before '{' token
include/acpi/acpixf.h:821:1: error: expected ',' or ';' before '{' token
include/acpi/acpixf.h:827:1: error: expected ',' or ';' before '{' token
ERROR: "nouveau_switcheroo_optimus_dsm" undefined!
arch/ia64/kernel/acpi.c:64:5: error: conflicting types for 'acpi_rsdt_forced'
net/batman-adv/soft-interface.c:461:18: error: 'struct batadv_softif_vlan' has no member named 'ap_isolation'
net/batman-adv/translation-table.c:2206:29: error: expected ';' before ')' token
net/batman-adv/translation-table.c:2206:29: error: expected statement before ')' token

[warnings]
include/acpi/acpixf.h:130:1: warning: variable 'acpi_gbl_enable_interpreter_slack' declared 'inline' [enabled by default]
include/acpi/acpixf.h:138:1: warning: variable 'acpi_gbl_all_methods_serialized' declared 'inline' [enabled by default]
include/acpi/acpixf.h:145:1: warning: variable 'acpi_gbl_create_osi_method' declared 'inline' [enabled by default]
include/acpi/acpixf.h:151:1: warning: variable 'acpi_gbl_use_default_register_widths' declared 'inline' [enabled by default]
include/acpi/acpixf.h:156:1: warning: variable 'acpi_gbl_enable_aml_debug_object' declared 'inline' [enabled by default]
include/acpi/acpixf.h:164:1: warning: variable 'acpi_gbl_copy_dsdt_locally' declared 'inline' [enabled by default]
include/acpi/acpixf.h:172:1: warning: variable 'acpi_gbl_truncate_io_addresses' declared 'inline' [enabled by default]
include/acpi/acpixf.h:178:1: warning: variable 'acpi_gbl_disable_auto_repair' declared 'inline' [enabled by default]
include/acpi/acpixf.h:184:1: warning: variable 'acpi_gbl_disable_ssdt_table_load' declared 'inline' [enabled by default]
include/acpi/acpixf.h:190:1: warning: variable 'acpi_gbl_osi_data' declared 'inline' [enabled by default]
include/acpi/acpixf.h:194:1: warning: variable 'acpi_current_gpe_count' declared 'inline' [enabled by default]
include/acpi/acpixf.h:195:1: warning: variable 'acpi_gbl_trace_flags' declared 'inline' [enabled by default]
include/acpi/acpixf.h:196:1: warning: variable 'acpi_gbl_trace_method_name' declared 'inline' [enabled by default]
include/acpi/acpixf.h:197:1: warning: variable 'acpi_gbl_system_awake_and_running' declared 'inline' [enabled by default]
include/acpi/acpixf.h:203:1: warning: variable 'acpi_dbg_level' declared 'inline' [enabled by default]
include/acpi/acpixf.h:206:1: warning: variable 'acpi_dbg_layer' declared 'inline' [enabled by default]
include/acpi/acpixf.h:213:1: warning: variable 'acpi_gbl_reduced_hardware' declared 'inline' [enabled by default]
include/acpi/acpixf.h:215:1: warning: variable 'acpi_rsdt_forced' declared 'inline' [enabled by default]
include/acpi/acpixf.h:130: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:138: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:145: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:151: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:156: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:164: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:172: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:178: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:184: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:190: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:194: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:195: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:196: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:197: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:203: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:206: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:213: warning: 'always_inline' attribute ignored
include/acpi/acpixf.h:215: warning: 'always_inline' attribute ignored
WARNING: drivers/built-in.o(.init.text+0x4172): Section mismatch in reference from the function acpi_bus_init() to the function .exit.text:acpi_terminate()
mm/huge_memory.c:1946:1: warning: no return statement in function returning non-void [-Wreturn-type]
net/batman-adv/translation-table.c:2205:49: warning: left-hand operand of comma expression has no effect [-Wunused-value]
net/batman-adv/translation-table.c:2206:21: warning: left-hand operand of comma expression has no effect [-Wunused-value]
net/batman-adv/translation-table.c:2205:6: warning: statement with no effect [-Wunused-value]

[sparse]
mm/memory.c:2661:9: sparse: context imbalance in 'do_wp_page_shared' - unexpected unlock
mm/memory.c:2721:12: sparse: context imbalance in 'do_wp_page' - wrong count at exit

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
