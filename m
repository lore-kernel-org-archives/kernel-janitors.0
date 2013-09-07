From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 07 Sep 2013 17:43:33 +0000
Subject: build regressions 2013-09-07
Message-Id: <522b65c5.AkNe+0bNlMgu+bpN%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/regulator/palmas-regulator.c:46:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_SMPS12' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:61:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_SMPS3' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:69:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_SMPS45' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:85:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_SMPS6' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:92:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_SMPS7' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:100:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_SMPS8' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:107:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_SMPS9' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:113:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_SMPS10' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:126:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDO1' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:133:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDO2' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:140:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDO3' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:147:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDO4' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:154:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDO5' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:161:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDO6' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:168:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDO7' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:175:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDO8' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:182:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDO9' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:189:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDOLN' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:196:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_LDOUSB' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:201:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_REGEN1' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:206:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_REGEN2' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:211:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_REGEN3' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:216:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_SYSEN1' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:221:15: error: 'PALMAS_EXTERNAL_REQSTR_ID_SYSEN2' undeclared here (not in a function)
drivers/regulator/palmas-regulator.c:583:2: error: implicit declaration of function 'palmas_ext_control_req_config' [-Werror=implicit-function-declaration]
drivers/regulator/palmas-regulator.c:864:15: error: 'PALMAS_EXT_CONTROL_NSLEEP' undeclared (first use in this function)
drivers/regulator/palmas-regulator.c:868:17: error: 'PALMAS_EXT_CONTROL_ENABLE1' undeclared (first use in this function)
drivers/regulator/palmas-regulator.c:871:17: error: 'PALMAS_EXT_CONTROL_ENABLE2' undeclared (first use in this function)

[warnings]
drivers/staging/lustre/lustre/llite/lproc_llite.c:1069:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__kernel_suseconds_t' [-Wformat]
drivers/staging/lustre/lustre/llite/lproc_llite.c:1133:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__kernel_suseconds_t' [-Wformat]
drivers/staging/lustre/lustre/llite/lproc_llite.c:1299:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__kernel_suseconds_t' [-Wformat]
drivers/staging/lustre/lustre/obdclass/lprocfs_status.c:1070:5: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type '__kernel_suseconds_t' [-Wformat]
drivers/staging/lustre/lustre/osc/lproc_osc.c:575:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__kernel_suseconds_t' [-Wformat]
drivers/staging/lustre/lustre/osc/lproc_osc.c:687:6: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__kernel_suseconds_t' [-Wformat]
drivers/staging/dgnc/dgnc_tty.c:526:2: warning: format '%ld' expects argument of type 'long int', but argument 4 has type '__kernel_suseconds_t' [-Wformat]
drivers/staging/dgap/dgap_tty.c:576:2: warning: format '%ld' expects argument of type 'long int', but argument 4 has type '__kernel_suseconds_t' [-Wformat]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:922:4: warning: overflow in implicit constant conversion [-Woverflow]
drivers/regulator/palmas-regulator.c:864:13: warning: assignment makes integer from pointer without a cast [enabled by default]
drivers/regulator/palmas-regulator.c:868:15: warning: assignment makes integer from pointer without a cast [enabled by default]
drivers/regulator/palmas-regulator.c:871:15: warning: assignment makes integer from pointer without a cast [enabled by default]
drivers/regulator/palmas-regulator.c:874:15: warning: assignment makes integer from pointer without a cast [enabled by default]

[sparse]
drivers/scsi/ufs/ufshcd.c:2542:5: sparse: too many warnings
drivers/scsi/ufs/ufshcd.c:1484:5: sparse: symbol 'ufshcd_uic_change_pwr_mode' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
