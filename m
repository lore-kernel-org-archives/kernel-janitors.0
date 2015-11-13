From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 13 Nov 2015 10:31:28 +0000
Subject: [PATCH] dmaengine: ioatdma: constify dcs_ops structures
Message-Id: <1447410688-7213-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org

The dca_ops structure is never modified, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/dca/dca-core.c |    3 ++-
 drivers/dma/ioat/dca.c |    2 +-
 include/linux/dca.h    |    5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dca/dca-core.c b/drivers/dca/dca-core.c
index 819dfda..7afbb28 100644
--- a/drivers/dca/dca-core.c
+++ b/drivers/dca/dca-core.c
@@ -321,7 +321,8 @@ EXPORT_SYMBOL_GPL(dca_get_tag);
  * @ops - pointer to struct of dca operation function pointers
  * @priv_size - size of extra mem to be added for provider's needs
  */
-struct dca_provider *alloc_dca_provider(struct dca_ops *ops, int priv_size)
+struct dca_provider *alloc_dca_provider(const struct dca_ops *ops,
+					int priv_size)
 {
 	struct dca_provider *dca;
 	int alloc_size;
diff --git a/include/linux/dca.h b/include/linux/dca.h
index d27a7a0..ad956c2 100644
--- a/include/linux/dca.h
+++ b/include/linux/dca.h
@@ -34,7 +34,7 @@ void dca_unregister_notify(struct notifier_block *nb);
 
 struct dca_provider {
 	struct list_head	node;
-	struct dca_ops		*ops;
+	const struct dca_ops	*ops;
 	struct device 		*cd;
 	int			 id;
 };
@@ -53,7 +53,8 @@ struct dca_ops {
 	int	(*dev_managed)      (struct dca_provider *, struct device *);
 };
 
-struct dca_provider *alloc_dca_provider(struct dca_ops *ops, int priv_size);
+struct dca_provider *alloc_dca_provider(const struct dca_ops *ops,
+					int priv_size);
 void free_dca_provider(struct dca_provider *dca);
 int register_dca_provider(struct dca_provider *dca, struct device *dev);
 void unregister_dca_provider(struct dca_provider *dca, struct device *dev);
diff --git a/drivers/dma/ioat/dca.c b/drivers/dma/ioat/dca.c
index 2cb7c30..0b9b6b0 100644
--- a/drivers/dma/ioat/dca.c
+++ b/drivers/dma/ioat/dca.c
@@ -224,7 +224,7 @@ static u8 ioat_dca_get_tag(struct dca_provider *dca,
 	return tag;
 }
 
-static struct dca_ops ioat_dca_ops = {
+static const struct dca_ops ioat_dca_ops = {
 	.add_requester		= ioat_dca_add_requester,
 	.remove_requester	= ioat_dca_remove_requester,
 	.get_tag		= ioat_dca_get_tag,

