From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 09 Mar 2013 19:23:36 +0000
Subject: build regressions 2013-03-09
Message-Id: <513b8c38.4wgx0R9lR/HG+JFB%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-s3c24xx/irq-s3c2412.c:38:22: fatal error: plat/irq.h: No such file or directory
arch/arm/mach-s3c24xx/irq-s3c2440.c:39:22: fatal error: plat/irq.h: No such file or directory
arch/arm/mach-s3c24xx/irq-s3c244x.c:39:22: fatal error: plat/irq.h: No such file or directory
arch/x86/kernel/cpu/perf_event_intel.c:167:3060: error: expected '}' before ';' token
security/integrity/ima/ima.h:170:1: error: expected identifier or '(' before '{' token
security/integrity/ima/ima.h:170:1: error: expected identifier or '(' before '{' token
security/integrity/ima/ima_dir.c:201:2: error: too few arguments to function 'ima_appraise_measurement'
itrace.c:(.text+0xaf306): undefined reference to `dump_write'
(.text+0xaf83f): undefined reference to `dump_write'
(.text+0xaf881): undefined reference to `dump_write'
(.text+0xaf8d2): undefined reference to `dump_write'

[warnings]
security/integrity/ima/ima.h:163:19: warning: 'ima_appraise_measurement' used but never defined [enabled by default]
fs/btrfs/disk-io.c:392:1: warning: 'btrfs_check_super_csum' uses dynamic stack allocation [enabled by default]
drivers/media/i2c/s5c73m3/s5c73m3-core.c:359:2: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]

[sparse]
fs/btrfs/disk-io.c:370:29: sparse: bad constant expression
arch/x86/kernel/cpu/perf_event_intel.c:167:44: sparse: Expected } at end of initializer
arch/x86/kernel/cpu/perf_event_intel.c:167:44: sparse: got ;
arch/x86/kernel/cpu/perf_event_intel.c:169:9: sparse: Expected ; at the end of type declaration

[smatch]
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-01597-g74c761e"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00068-g64f66d2"' too small (25 vs 32)
drivers/net/team/team.c:1760 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00229-g3e6f7ba"' too small (25 vs 32)
drivers/net/team/team.c:1760 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00338-gee6cf53"' too small (25 vs 32)
drivers/net/team/team.c:1771 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00251-ga511c7c"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00006-g38ff3ad"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00245-g67a865a"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00029-g5ca12c2"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00262-g0aefda3"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-01576-gafb92f3"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00027-g04844e5"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00267-ge618f2e"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00214-g83a44ac"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00121-g643fe8e"' too small (25 vs 32)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
