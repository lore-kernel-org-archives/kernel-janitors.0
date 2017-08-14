From: Mark Brown <broonie@kernel.org>
Date: Mon, 14 Aug 2017 16:45:05 +0000
Subject: Applied "regmap: constify regmap_bus structures" to the regmap tree
Message-Id: <E1dhIUD-0005eO-8h@finisterre>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1502434657-16701-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Mark Brown <broonie@kernel.org>Mark Brown <broonie@kernel.org>, bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regmap: constify regmap_bus structures

has been applied to the regmap tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git 

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

From 9c2e5cb38da2202c6591efec631562116761521f Mon Sep 17 00:00:00 2001
From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 11 Aug 2017 08:57:36 +0200
Subject: [PATCH] regmap: constify regmap_bus structures

These regmap_bus structures are only passed as the second argument to
__devm_regmap_init or __regmap_init, both of which are const, so the
regmap_bus structures can be const too.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regmap-spi.c  | 2 +-
 drivers/base/regmap/regmap-spmi.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap-spi.c b/drivers/base/regmap/regmap-spi.c
index edd9a839d004..c7150dd264d5 100644
--- a/drivers/base/regmap/regmap-spi.c
+++ b/drivers/base/regmap/regmap-spi.c
@@ -102,7 +102,7 @@ static int regmap_spi_read(void *context,
 	return spi_write_then_read(spi, reg, reg_size, val, val_size);
 }
 
-static struct regmap_bus regmap_spi = {
+static const struct regmap_bus regmap_spi = {
 	.write = regmap_spi_write,
 	.gather_write = regmap_spi_gather_write,
 	.async_write = regmap_spi_async_write,
diff --git a/drivers/base/regmap/regmap-spmi.c b/drivers/base/regmap/regmap-spmi.c
index 4a36e415e938..0bfb8ed244d5 100644
--- a/drivers/base/regmap/regmap-spmi.c
+++ b/drivers/base/regmap/regmap-spmi.c
@@ -83,7 +83,7 @@ static int regmap_spmi_base_write(void *context, const void *data,
 					     count - 1);
 }
 
-static struct regmap_bus regmap_spmi_base = {
+static const struct regmap_bus regmap_spmi_base = {
 	.read				= regmap_spmi_base_read,
 	.write				= regmap_spmi_base_write,
 	.gather_write			= regmap_spmi_base_gather_write,
@@ -203,7 +203,7 @@ static int regmap_spmi_ext_write(void *context, const void *data,
 					    count - 2);
 }
 
-static struct regmap_bus regmap_spmi_ext = {
+static const struct regmap_bus regmap_spmi_ext = {
 	.read				= regmap_spmi_ext_read,
 	.write				= regmap_spmi_ext_write,
 	.gather_write			= regmap_spmi_ext_gather_write,
-- 
2.13.2

