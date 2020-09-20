From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 11:26:26 +0000
Subject: [PATCH 14/14] PCI/P2PDMA: drop double zeroing
Message-Id: <1600601186-7420-15-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: kernel-janitors@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

sg_init_table zeroes its first argument, so the allocation of that argument
doesn't have to.

the semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
@@

x - kzalloc
+ kmalloc
 (...)
...
sg_init_table(x,...)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/pci/p2pdma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -762,7 +762,7 @@ struct scatterlist *pci_p2pmem_alloc_sgl
 	struct scatterlist *sg;
 	void *addr;
 
-	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
+	sg = kmalloc(sizeof(*sg), GFP_KERNEL);
 	if (!sg)
 		return NULL;
 
