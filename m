From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 23:33:48 +0000
Subject: [mfd:for-next 47/76] drivers/mfd/max8907.c:179:16: sparse: symbol 'max8907_pm_off' was not declared.
Message-Id: <20120919233348.GD5607@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="HlL+5n6rz5pIUxbD"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-2.6.git for-next
head:   144c94c99ad2f20ff37ca77147a10da7718895ad
commit: 9582fdcb6fcf1b596a83b161a2ea886272d2a62f [47/76] mfd: max8907: Add power off control

All sparse warnings:

+ drivers/mfd/max8907.c:179:16: sparse: symbol 'max8907_pm_off' was not declared. Should it be static?

vim +179 drivers/mfd/max8907.c
   169	
   170	static const struct regmap_irq_chip max8907_rtc_irq_chip = {
   171		.name = "max8907 rtc",
   172		.status_base = MAX8907_REG_RTC_IRQ,
   173		.mask_base = MAX8907_REG_RTC_IRQ_MASK,
   174		.num_regs = 1,
   175		.irqs = max8907_rtc_irqs,
   176		.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
   177	};
   178	
 > 179	struct max8907 *max8907_pm_off;
   180	static void max8907_power_off(void)
   181	{
   182		regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
   183				MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
   184	}
   185	
   186	static __devinit int max8907_i2c_probe(struct i2c_client *i2c,
   187					       const struct i2c_device_id *id)
   188	{
   189		struct max8907 *max8907;

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

--HlL+5n6rz5pIUxbD
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-9582fdc.diff"

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 2303641..17f2593 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -176,7 +176,7 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-struct max8907 *max8907_pm_off;
+static struct max8907 *max8907_pm_off;
 static void max8907_power_off(void)
 {
 	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,

--HlL+5n6rz5pIUxbD--
