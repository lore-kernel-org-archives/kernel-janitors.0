From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 15:52:58 +0000
Subject: [arm-soc:next/drivers 26/30] drivers/i2c/busses/i2c-tegra.c:622:2: warning: initialization discards
Message-Id: <20120919155258.GA31506@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Laxman,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git next/drivers
head:   25696b4b3541d5f7641b61e6abfda765426834b8
commit: 6ad068ed63100f1bb2f65340e2de9b8727526ef8 [26/30] i2c: tegra: I2_M_NOSTART functionality not supported in Tegra20
config: arm-tegra_defconfig

All error/warnings:

drivers/i2c/busses/i2c-tegra.c:622:2: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
drivers/i2c/busses/i2c-tegra.c:623:2: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
drivers/i2c/busses/i2c-tegra.c:624:2: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]

vim +622 drivers/i2c/busses/i2c-tegra.c
   612		.has_continue_xfer_support = false,
   613	};
   614	
   615	static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
   616		.has_continue_xfer_support = true,
   617	};
   618	
   619	#if defined(CONFIG_OF)
   620	/* Match table for of_platform binding */
   621	static const struct of_device_id tegra_i2c_of_match[] __devinitconst = {
 > 622		{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
   623		{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
   624		{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
   625		{},
   626	};
   627	MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
   628	#endif
   629	
   630	static int __devinit tegra_i2c_probe(struct platform_device *pdev)
   631	{
   632		struct tegra_i2c_dev *i2c_dev;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
