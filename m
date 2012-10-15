From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 02:20:26 +0000
Subject: [mips:upstream 10/22] arch/mips/kernel/proc.c:75:3: warning: too many arguments for format
Message-Id: <20121015022026.GD7203@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015015300.GE31881@yliu-dev.sh.intel.com>
In-Reply-To: <20121015015300.GE31881@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Steven,

FYI, there are new compile warnings show up in

tree:   git://git.linux-mips.org/pub/scm/ralf/upstream-linus.git upstream
head:   35bafbee4b4732a2820bbd0ef141c8192ff29731
commit: ee80f7c73dc1b1f0ba9f82079c9bd1c0d1aedef8 [10/22] MIPS: Add detection of DSP ASE Revision 2.
config: mips-allyesconfig # make ARCH=mips 

All warnings:

arch/mips/kernel/proc.c: In function 'show_cpuinfo':
arch/mips/kernel/proc.c:75:3: warning: too many arguments for format [-Wformat-extra-args]

vim +75 arch/mips/kernel/proc.c

e027802e Ralf Baechle   2005-08-16  67  	seq_printf(m, "ASEs implemented\t:%s%s%s%s%s%s\n",
4194318c Ralf Baechle   2005-05-05  68  		      cpu_has_mips16 ? " mips16" : "",
4194318c Ralf Baechle   2005-05-05  69  		      cpu_has_mdmx ? " mdmx" : "",
4194318c Ralf Baechle   2005-05-05  70  		      cpu_has_mips3d ? " mips3d" : "",
e027802e Ralf Baechle   2005-08-16  71  		      cpu_has_smartmips ? " smartmips" : "",
e027802e Ralf Baechle   2005-08-16  72  		      cpu_has_dsp ? " dsp" : "",
ee80f7c7 Steven J. Hill 2012-08-03  73  		      cpu_has_dsp2 ? " dsp2" : "",
e027802e Ralf Baechle   2005-08-16  74  		      cpu_has_mipsmt ? " mt" : ""
e027802e Ralf Baechle   2005-08-16 @75  		);

The code at line 75 was first introduced by commit:
e027802 Display presence of SmartMIPS, DSP and MT ASEs in /proc/cpuinfo.


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
