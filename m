From: Peter Rosin <peda@axentia.se>
Date: Tue, 14 Mar 2017 16:49:58 +0000
Subject: [PATCH] mux: core: fix error handling in devm_mux_chip_alloc
Message-Id: <1489510198-10414-1-git-send-email-peda@axentia.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8a1d806c-1626-0558-855b-02d7396baae4@axentia.se>
In-Reply-To: <8a1d806c-1626-0558-855b-02d7396baae4@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The error handling is mixed up. mux_chip_alloc() doesn't return an error
pointer (just NULL on failure), so check for NULL instead of using IS_ERR.
devm_mux_chip_alloc is documented to return NULL on failure, so fix that
as well.

All users of devm_mux_chip_alloc() are coded according to documentation.

Fixes: a11c524a6b90 ("mux: minimal mux subsystem and gpio-based mux controller")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/mux/mux-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mux/mux-core.c b/drivers/mux/mux-core.c
index 900b88526f97..66a8bccfc3d7 100644
--- a/drivers/mux/mux-core.c
+++ b/drivers/mux/mux-core.c
@@ -166,12 +166,12 @@ struct mux_chip *devm_mux_chip_alloc(struct device *dev,
 
 	ptr = devres_alloc(devm_mux_chip_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	mux_chip = mux_chip_alloc(dev, controllers, sizeof_priv);
-	if (IS_ERR(mux_chip)) {
+	if (!mux_chip) {
 		devres_free(ptr);
-		return mux_chip;
+		return NULL;
 	}
 
 	*ptr = mux_chip;
-- 
2.1.4

