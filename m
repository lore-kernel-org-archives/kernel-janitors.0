From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 11 Aug 2017 06:57:36 +0000
Subject: [PATCH 1/2] regmap: constify regmap_bus structures
Message-Id: <1502434657-16701-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502434657-16701-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502434657-16701-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org

These regmap_bus structures are only passed as the second argument to
__devm_regmap_init or __regmap_init, both of which are const, so the
regmap_bus structures can be const too.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/base/regmap/regmap-spi.c  |    2 +-
 drivers/base/regmap/regmap-spmi.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap-spi.c b/drivers/base/regmap/regmap-spi.c
index edd9a83..c7150dd 100644
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
index 4a36e41..0bfb8ed 100644
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

