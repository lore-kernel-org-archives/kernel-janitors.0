From: Dan Carpenter <error27@gmail.com>
Date: Sat, 20 Nov 2010 18:10:16 +0000
Subject: [patch v2] dca: remove unneeded NULL check
Message-Id: <20101120181008.GB1522@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101117051032.GC31724@bicker>
 <20101119145937.60c5f688.akpm@linux-foundation.org>
In-Reply-To: <20101119145937.60c5f688.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Maciej Sosnowski <maciej.sosnowski@intel.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The return here doesn't release the locks or re-enable IRQs.  But as
Andrew Morton points out, domain is never NULL.  list_first_entry() 
essentially never returns NULL and also we already verified that the
list is not empty. 

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/dca/dca-core.c b/drivers/dca/dca-core.c
index b98c676..c461eda 100644
--- a/drivers/dca/dca-core.c
+++ b/drivers/dca/dca-core.c
@@ -110,8 +110,6 @@ static void unregister_dca_providers(void)
 
 	/* at this point only one domain in the list is expected */
 	domain = list_first_entry(&dca_domains, struct dca_domain, node);
-	if (!domain)
-		return;
 
 	list_for_each_entry_safe(dca, _dca, &domain->dca_providers, node) {
 		list_del(&dca->node);
