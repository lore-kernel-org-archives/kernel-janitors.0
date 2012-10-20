From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 20 Oct 2012 10:16:08 +0000
Subject: [pinctrl:nomadik-multiplatform 16/16] warning: (UX500_SOC_COMMON) selects PINCTRL_NOMADIK which has
Message-Id: <508279e8.AyIVdXT4CrO8R6ZG%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Linus,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git nomadik-multiplatform
head:   2e88a0fdda1be5962b7e548ab487686daa5d9754
commit: 2e88a0fdda1be5962b7e548ab487686daa5d9754 [16/16] ARM: ux500: convert to multiplatorm
config: arm-allnoconfig # make ARCH=arm 

All warnings:

warning: (UX500_SOC_COMMON) selects PINCTRL_NOMADIK which has unmet direct dependencies (PINCTRL && (ARCH_U8500 || ARCH_NOMADIK))
warning: (UX500_SOC_COMMON && MACH_NOMADIK_8815NHK) selects CLKSRC_NOMADIK_MTU which has unmet direct dependencies (ARCH_NOMADIK || ARCH_U8500)
warning: (UX500_SOC_COMMON && ARCH_TEGRA_3x_SOC) selects ARM_ERRATA_754322 which has unmet direct dependencies (CPU_V7)
warning: (UX500_SOC_COMMON) selects PINCTRL_NOMADIK which has unmet direct dependencies (PINCTRL && (ARCH_U8500 || ARCH_NOMADIK))
warning: (UX500_SOC_COMMON && MACH_NOMADIK_8815NHK) selects CLKSRC_NOMADIK_MTU which has unmet direct dependencies (ARCH_NOMADIK || ARCH_U8500)
warning: (UX500_SOC_COMMON && ARCH_TEGRA_3x_SOC) selects ARM_ERRATA_754322 which has unmet direct dependencies (CPU_V7)
--
warning: (UX500_SOC_COMMON) selects PINCTRL_NOMADIK which has unmet direct dependencies (PINCTRL && (ARCH_U8500 || ARCH_NOMADIK))
warning: (UX500_SOC_COMMON && MACH_NOMADIK_8815NHK) selects CLKSRC_NOMADIK_MTU which has unmet direct dependencies (ARCH_NOMADIK || ARCH_U8500)
warning: (UX500_SOC_COMMON && ARCH_TEGRA_3x_SOC) selects ARM_ERRATA_754322 which has unmet direct dependencies (CPU_V7)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
