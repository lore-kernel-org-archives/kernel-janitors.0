From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Sep 2019 10:07:22 +0000
Subject: Applied "regulator: lp8788-ldo: make array en_mask static const, makes object smaller" to the regula
Message-Id: <20190909100722.B5A28D02D1F@fitzroy.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190906130632.6709-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Milo Kim <milo.kim@ti.com>

The patch

   regulator: lp8788-ldo: make array en_mask static const, makes object smaller

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 6cbe29c92311ea6ef67a7eac2bc089357412973b Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 6 Sep 2019 14:06:32 +0100
Subject: [PATCH] regulator: lp8788-ldo: make array en_mask static const, makes
 object smaller

Don't populate the array en_mask on the stack but instead make it
static const. Makes the object code smaller by 87 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  12967	   3408	      0	  16375	   3ff7	drivers/regulator/lp8788-ldo.o

After:
   text	   data	    bss	    dec	    hex	filename
  12816	   3472	      0	  16288	   3fa0	drivers/regulator/lp8788-ldo.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20190906130632.6709-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/lp8788-ldo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/lp8788-ldo.c b/drivers/regulator/lp8788-ldo.c
index 1b00f3638996..00e9bb92c326 100644
--- a/drivers/regulator/lp8788-ldo.c
+++ b/drivers/regulator/lp8788-ldo.c
@@ -464,7 +464,7 @@ static int lp8788_config_ldo_enable_mode(struct platform_device *pdev,
 {
 	struct lp8788 *lp = ldo->lp;
 	enum lp8788_ext_ldo_en_id enable_id;
-	u8 en_mask[] = {
+	static const u8 en_mask[] = {
 		[EN_ALDO1]   = LP8788_EN_SEL_ALDO1_M,
 		[EN_ALDO234] = LP8788_EN_SEL_ALDO234_M,
 		[EN_ALDO5]   = LP8788_EN_SEL_ALDO5_M,
-- 
2.20.1
