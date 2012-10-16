From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Oct 2012 17:25:18 +0000
Subject: [vexpress:vexpress-v3.7-rc1 6/8] reset.c:(.init.text+0xec): undefined reference to `vexpress_clk_of_
Message-Id: <20121016172518.GD11813@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Pawel,

FYI, kernel build failed on

tree:   git://git.linaro.org/people/pawelmoll/linux.git vexpress-v3.7-rc1
head:   1a84f27233a708e39e50d023e58b7ba14bf52171
commit: 205f209bfadc4099c0296a4d93dd561e05bdd2e4 [6/8] ARM: vexpress: Start using new Versatile Express infrastructure
config: arm-prima2_defconfig # make ARCH=arm prima2_defconfig

All error/warnings:

arch/arm/mach-vexpress/built-in.o: In function `v2m_dt_timer_init':
reset.c:(.init.text+0xec): undefined reference to `vexpress_clk_of_init'
arch/arm/mach-vexpress/built-in.o: In function `v2m_timer_init':
reset.c:(.init.text+0x188): undefined reference to `vexpress_clk_init'
--
warning: (ARCH_VEXPRESS && ARCH_INTEGRATOR && ARCH_REALVIEW) selects COMMON_CLK_VERSATILE which has unmet direct dependencies (COMMON_CLK && (ARCH_INTEGRATOR || ARCH_REALVIEW))
warning: (ARCH_VEXPRESS && ARCH_INTEGRATOR && ARCH_REALVIEW) selects COMMON_CLK_VERSATILE which has unmet direct dependencies (COMMON_CLK && (ARCH_INTEGRATOR || ARCH_REALVIEW))

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
