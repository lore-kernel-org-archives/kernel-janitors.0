From: Dan Carpenter <error27@gmail.com>
Date: Wed, 17 Nov 2010 05:10:32 +0000
Subject: [patch] dca: missing unlock in unregister_dca_providers()
Message-Id: <20101117051032.GC31724@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maciej Sosnowski <maciej.sosnowski@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We return here with the lock held and IRQs disabled by mistake.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/dca/dca-core.c b/drivers/dca/dca-core.c
index b98c676..b4c95be 100644
--- a/drivers/dca/dca-core.c
+++ b/drivers/dca/dca-core.c
@@ -110,8 +110,10 @@ static void unregister_dca_providers(void)
 
 	/* at this point only one domain in the list is expected */
 	domain = list_first_entry(&dca_domains, struct dca_domain, node);
-	if (!domain)
+	if (!domain) {
+		spin_unlock_irqrestore(&dca_lock, flags);
 		return;
+	}
 
 	list_for_each_entry_safe(dca, _dca, &domain->dca_providers, node) {
 		list_del(&dca->node);
