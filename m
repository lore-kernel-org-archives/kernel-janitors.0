Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B84118C00D
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Sep 2024 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725910270; cv=none; b=m9ZqMRKXqZrAxc4syye9N+lNmQDLAE+ntjTcnqsDk7y0aYlbFFTT4IkrE7dLCx9SIWZdkhm2nd4Wi7yAjulolkQqJ9re/ra5MEF0QPbt70PZWi0TkvBFOnfrjYbO2kQRc1hEVO4wRr5iKk5he7z/J0uqVEtyr8ohfz1COj9v+k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725910270; c=relaxed/simple;
	bh=1QL1CKNNveStwudW9s95TeycLNIw95+S1ITVaXHJm24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EU0qen3Q1DRWRtfuGUxTVwux+k8RQ+Odr2BC2R+rzoeWS0x56hMWDzaK9d0U3GBeyTB0uA+S+c8R9N01I5j8Dov0fOQdHxA+Td7weqCZgFcqdOowbM5vmELZnx3o2Qbj6sq4O6zBw8GMX2Tvxni/9wiYUsdc26im4G5JJmOGnAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Dero/V+N; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Dero/V+N"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id nk6BsbkpIZ40ank6Bsl9Br; Mon, 09 Sep 2024 21:31:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725910260;
	bh=iXQbrMHrxHSsX1BIEgauoIbcXr4RNqpN6V0TKtKeNgY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Dero/V+Nn56UiP8TXbdhd2Mid3Y4q9TTnyWnO47DHpqp2h8oLcIo4K8/qh74cD1Hr
	 z6VtB/H2fsu2D9d9LkkccSKuOYFUJMGAYeMdUvU+lsypRrcyS3jDemg5l6V+zQ1cwN
	 /wm4kruDwyt1L6wTgAWR2qYKkjKQp6vj66YXvTPng0SZJKYRLscCpQ6ApeLi+T7w/X
	 EDpFfV4JNav8Cbc3hiDmUB3JhhBEW2pu75YGIpiQcsGkOB2Bwc3XIhWVhugW/uiGDk
	 b6Lzs8Cp9LrgATwiLfVpvyU2xz0Ii9hvPeCGRd7thi+FrVsvaU1PDSbQgJwjRsUvqJ
	 t2YPrYk5kf8aQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 09 Sep 2024 21:31:00 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: markuss.broks@gmail.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] regulator: sm5703: Remove because it is unused and fails to build
Date: Mon,  9 Sep 2024 21:30:51 +0200
Message-ID: <0f5da91a05e7343d290c88e3c583b674cf6219ac.1725910247.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This file does not compile because <linux/mfd/sm5703.h> is missing.
In KConfig, it depends on MFD_SM5703.

Both MFD_SM5703 and the missing include rely on another patch that never
got merged. The last iteration related to this patch is [1].

So remove this dead-code and undo commit e8858ba89ca3 ("regulator:
sm5703-regulator: Add regulators support for SM5703 MFD")

[1]: https://lore.kernel.org/lkml/20220423085319.483524-5-markuss.broks@gmail.com/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Apparently, discussion to include the needed other patch ended 2 years ago.

Could this be useful for something else with the other driver, at least
<linux/mfd/sm5703.h> should be merged and Kconfig modified.

So not sure if removing is the best way to go, but at least, in the
current state, it is unusable.


Note: spotted while looking for opportunities to constify some struct
regulator_desc.
---
 drivers/regulator/Kconfig            |   7 --
 drivers/regulator/Makefile           |   1 -
 drivers/regulator/sm5703-regulator.c | 170 ---------------------------
 3 files changed, 178 deletions(-)
 delete mode 100644 drivers/regulator/sm5703-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 4b411a09c1a6..39297f7d8177 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1373,13 +1373,6 @@ config REGULATOR_SLG51000
 	  The SLG51000 is seven compact and customizable low dropout
 	  regulators.
 
-config REGULATOR_SM5703
-	tristate "Silicon Mitus SM5703 regulators"
-	depends on MFD_SM5703
-	help
-	  This driver provides support for voltage regulators of SM5703
-	  multi-function device.
-
 config REGULATOR_STM32_BOOSTER
 	tristate "STMicroelectronics STM32 BOOSTER"
 	depends on ARCH_STM32 || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index a61fa42b13c4..3d5a803dce8a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -160,7 +160,6 @@ obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
 obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_SLG51000) += slg51000-regulator.o
-obj-$(CONFIG_REGULATOR_SM5703) += sm5703-regulator.o
 obj-$(CONFIG_REGULATOR_STM32_BOOSTER) += stm32-booster.o
 obj-$(CONFIG_REGULATOR_STM32_VREFBUF) += stm32-vrefbuf.o
 obj-$(CONFIG_REGULATOR_STM32_PWR) += stm32-pwr.o
diff --git a/drivers/regulator/sm5703-regulator.c b/drivers/regulator/sm5703-regulator.c
deleted file mode 100644
index 702461cf075e..000000000000
--- a/drivers/regulator/sm5703-regulator.c
+++ /dev/null
@@ -1,170 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-#include <linux/mfd/sm5703.h>
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-#include <linux/regulator/driver.h>
-#include <linux/regulator/of_regulator.h>
-
-enum sm5703_regulators {
-	SM5703_BUCK,
-	SM5703_LDO1,
-	SM5703_LDO2,
-	SM5703_LDO3,
-	SM5703_USBLDO1,
-	SM5703_USBLDO2,
-	SM5703_VBUS,
-	SM5703_MAX_REGULATORS,
-};
-
-static const int sm5703_ldo_voltagemap[] = {
-	1500000, 1800000, 2600000, 2800000, 3000000, 3300000,
-};
-
-static const int sm5703_buck_voltagemap[] = {
-	1000000, 1000000, 1000000, 1000000,
-	1000000, 1000000, 1000000, 1000000,
-	1000000, 1000000, 1000000, 1100000,
-	1200000, 1300000, 1400000, 1500000,
-	1600000, 1700000, 1800000, 1900000,
-	2000000, 2100000, 2200000, 2300000,
-	2400000, 2500000, 2600000, 2700000,
-	2800000, 2900000, 3000000, 3000000,
-};
-
-#define SM5703USBLDO(_name, _id)					\
-	[SM5703_USBLDO ## _id] = {					\
-		.name = _name,						\
-		.of_match = _name,					\
-		.regulators_node = "regulators",			\
-		.type = REGULATOR_VOLTAGE,				\
-		.id = SM5703_USBLDO ## _id,				\
-		.ops = &sm5703_regulator_ops_fixed,			\
-		.n_voltages = 1,					\
-		.fixed_uV = SM5703_USBLDO_MICROVOLT,			\
-		.enable_reg = SM5703_REG_USBLDO12,			\
-		.enable_mask = SM5703_REG_EN_USBLDO ##_id,		\
-		.owner			= THIS_MODULE,			\
-	}
-
-#define SM5703VBUS(_name)						\
-	[SM5703_VBUS] = {						\
-		.name = _name,						\
-		.of_match = _name,					\
-		.regulators_node = "regulators",			\
-		.type = REGULATOR_VOLTAGE,				\
-		.id = SM5703_VBUS,					\
-		.ops = &sm5703_regulator_ops_fixed,			\
-		.n_voltages = 1,					\
-		.fixed_uV = SM5703_VBUS_MICROVOLT,			\
-		.enable_reg = SM5703_REG_CNTL,				\
-		.enable_mask = SM5703_OPERATION_MODE_MASK,		\
-		.enable_val = SM5703_OPERATION_MODE_USB_OTG_MODE,	\
-		.disable_val = SM5703_OPERATION_MODE_CHARGING_ON,	\
-		.owner			= THIS_MODULE,			\
-	}
-
-#define SM5703BUCK(_name)						\
-	[SM5703_BUCK] = {						\
-		.name = _name,						\
-		.of_match = _name,					\
-		.regulators_node = "regulators",			\
-		.type = REGULATOR_VOLTAGE,				\
-		.id = SM5703_BUCK,					\
-		.ops = &sm5703_regulator_ops,				\
-		.n_voltages = ARRAY_SIZE(sm5703_buck_voltagemap),	\
-		.volt_table = sm5703_buck_voltagemap,			\
-		.vsel_reg = SM5703_REG_BUCK,				\
-		.vsel_mask = SM5703_BUCK_VOLT_MASK,			\
-		.enable_reg = SM5703_REG_BUCK,				\
-		.enable_mask = SM5703_REG_EN_BUCK,			\
-		.owner			= THIS_MODULE,			\
-	}
-
-#define SM5703LDO(_name, _id)						\
-	[SM5703_LDO ## _id] = {						\
-		.name = _name,						\
-		.of_match = _name,					\
-		.regulators_node = "regulators",			\
-		.type = REGULATOR_VOLTAGE,				\
-		.id = SM5703_LDO ## _id,				\
-		.ops = &sm5703_regulator_ops,				\
-		.n_voltages = ARRAY_SIZE(sm5703_ldo_voltagemap),	\
-		.volt_table = sm5703_ldo_voltagemap,			\
-		.vsel_reg = SM5703_REG_LDO ##_id,			\
-		.vsel_mask = SM5703_LDO_VOLT_MASK,			\
-		.enable_reg = SM5703_REG_LDO ##_id,			\
-		.enable_mask = SM5703_LDO_EN,				\
-		.owner			= THIS_MODULE,			\
-	}
-
-static const struct regulator_ops sm5703_regulator_ops = {
-	.enable			= regulator_enable_regmap,
-	.disable		= regulator_disable_regmap,
-	.is_enabled		= regulator_is_enabled_regmap,
-	.list_voltage		= regulator_list_voltage_table,
-	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
-	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
-};
-
-static const struct regulator_ops sm5703_regulator_ops_fixed = {
-	.enable			= regulator_enable_regmap,
-	.disable		= regulator_disable_regmap,
-	.is_enabled		= regulator_is_enabled_regmap,
-};
-
-static struct regulator_desc sm5703_regulators_desc[SM5703_MAX_REGULATORS] = {
-	SM5703BUCK("buck"),
-	SM5703LDO("ldo1", 1),
-	SM5703LDO("ldo2", 2),
-	SM5703LDO("ldo3", 3),
-	SM5703USBLDO("usbldo1", 1),
-	SM5703USBLDO("usbldo2", 2),
-	SM5703VBUS("vbus"),
-};
-
-static int sm5703_regulator_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct regulator_config config = { NULL, };
-	struct regulator_dev *rdev;
-	struct sm5703_dev *sm5703 = dev_get_drvdata(pdev->dev.parent);
-	int i;
-
-	config.dev = dev->parent;
-	config.regmap = sm5703->regmap;
-
-	for (i = 0; i < SM5703_MAX_REGULATORS; i++) {
-		rdev = devm_regulator_register(dev,
-					       &sm5703_regulators_desc[i],
-					       &config);
-		if (IS_ERR(rdev))
-			return dev_err_probe(dev, PTR_ERR(rdev),
-					     "Failed to register a regulator\n");
-	}
-
-	return 0;
-}
-
-static const struct platform_device_id sm5703_regulator_id[] = {
-	{ "sm5703-regulator", 0 },
-	{}
-};
-MODULE_DEVICE_TABLE(platform, sm5703_regulator_id);
-
-static struct platform_driver sm5703_regulator_driver = {
-	.driver = {
-		.name = "sm5703-regulator",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.probe	= sm5703_regulator_probe,
-	.id_table	= sm5703_regulator_id,
-};
-
-module_platform_driver(sm5703_regulator_driver);
-
-MODULE_DESCRIPTION("Silicon Mitus SM5703 LDO/Buck/USB regulator driver");
-MODULE_AUTHOR("Markuss Broks <markuss.broks@gmail.com>");
-MODULE_LICENSE("GPL");
-- 
2.46.0

