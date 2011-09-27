From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Sep 2011 07:07:21 +0000
Subject: [patch] xen: double lock typo
Message-Id: <20110927070721.GA7351@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
Cc: kernel-janitors@vger.kernel.org, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

We called mutex_lock() twice instead of unlocking.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/xen-pciback/vpci.c b/drivers/xen/xen-pciback/vpci.c
index 01222d7..46d140b 100644
--- a/drivers/xen/xen-pciback/vpci.c
+++ b/drivers/xen/xen-pciback/vpci.c
@@ -238,7 +238,7 @@ static int __xen_pcibk_get_pcifront_dev(struct pci_dev *pcidev,
 			}
 		}
 	}
-	mutex_lock(&vpci_dev->lock);
+	mutex_unlock(&vpci_dev->lock);
 	return found;
 }
 
