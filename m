From: "Denver Gingerich" <denver@ossguy.com>
Date: Thu, 10 May 2007 01:26:16 +0000
Subject: [KJ] [PATCH] fix compiler warning in fixed.c
Message-Id: <6defe8840705091826j4395f090rc62aa2200f020536@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Correct the following compiler warning (and warnings resulting from
the correction):
warning: 'fixed_mdio_register_device' defined but not used

Signed-off-by: Denver Gingerich <denver@ossguy.com>

---

--- linux-2.6.21/drivers/net/phy/fixed.c.000	2007-05-09 18:56:33.000000000 -0400
+++ linux-2.6.21/drivers/net/phy/fixed.c	2007-05-09 21:07:35.000000000 -0400
@@ -89,6 +89,7 @@ EXPORT_SYMBOL(fixed_mdio_set_link_update
 /*-----------------------------------------------------------------------------
  *  This is used for updating internal mii regs from the status
  *-----------------------------------------------------------------------------*/
+#if defined(CONFIG_FIXED_MII_100_FDX) || defined(CONFIG_FIXED_MII_10_FDX)
 static int fixed_mdio_update_regs(struct fixed_info *fixed)
 {
 	u16 *regs = fixed->regs;
@@ -165,6 +166,7 @@ static int fixed_mii_reset(struct mii_bu
 	/*nothing here - no way/need to reset it*/
 	return 0;
 }
+#endif

 static int fixed_config_aneg(struct phy_device *phydev)
 {
@@ -194,6 +196,7 @@ static struct phy_driver fixed_mdio_driv
  * number is used to create multiple fixed PHYs, so that several devices can
  * utilize them simultaneously.
  *-----------------------------------------------------------------------------*/
+#if defined(CONFIG_FIXED_MII_100_FDX) || defined(CONFIG_FIXED_MII_10_FDX)
 static int fixed_mdio_register_device(int number, int speed, int duplex)
 {
 	struct mii_bus *new_bus;
@@ -301,6 +304,7 @@ device_create_fail:

 	return err;
 }
+#endif


 MODULE_DESCRIPTION("Fixed PHY device & driver for PAL");
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
