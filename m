From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 10 Mar 2013 16:20:37 +0000
Subject: build regressions 2013-03-10
Message-Id: <513cb2d5.sUHZhps1Dc7GhQn5%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.head.text+0x63): undefined reference to `x86_acpi_override_find'
kernel/fork.c:1811:5: error: 'If' undeclared (first use in this function)
kernel/fork.c:1811:8: error: expected ';' before 'unsharing'
kernel/time/clocksource.c:283:11: error: too few arguments to function 'clocksource_cyc2ns'
kernel/time/clocksource.c:286:11: error: too few arguments to function 'clocksource_cyc2ns'
kernel/time/clocksource.c:543:6: error: too few arguments to function 'clocksource_cyc2ns'
kernel/time/timekeeping.c:189:2: error: too few arguments to function 'clocksource_cyc2ns'
kernel/time/timekeeping.c:279:2: error: too few arguments to function 'clocksource_cyc2ns'

[warnings]
kernel/time/clocksource.c:652:15: warning: return type defaults to 'int' [-Wreturn-type]
kernel/time/clocksource.c:674:11: warning: unused variable 'max' [-Wunused-variable]
kernel/time/clocksource.c:658:1: warning: control reaches end of non-void function [-Wreturn-type]

[sparse]
fs/namespace.c:1312:2: sparse: FIXME mnt_ns_loop should be called when propogating mounts....
fs/namespace.c:1313:2: sparse: FIXME mnt_ns_loop should be called when unsharing mount namespaces...
kernel/fork.c:1811:15: sparse: Expected ; at end of statement
kernel/fork.c:1811:15: sparse: got unsharing
kernel/fork.c:1811:12: sparse: undefined identifier 'If'

[smatch]
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00100-gf15bbc02"' too small (26 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00263-g8343bce1"' too small (26 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00283-g5ad57f6"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-wl-67873-gefc09f9"' too small (28 vs 32)
drivers/net/team/team.c:1771 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00177-g4f3ed92"' too small (25 vs 32)
drivers/net/team/team.c:1758 team_ethtool_get_drvinfo() error: strlcpy() '"3.9.0-rc1-00283-g8468f14"' too small (25 vs 32)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
