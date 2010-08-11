From: Dan Carpenter <error27@gmail.com>
Date: Wed, 11 Aug 2010 22:37:40 +0000
Subject: [patch] cciss: handle allocation failure
Message-Id: <20100811223740.GD645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If kmalloc() fails then cleanup and return failure (-1).

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
index 31064df..937a7c5 100644
--- a/drivers/block/cciss.c
+++ b/drivers/block/cciss.c
@@ -4712,6 +4712,9 @@ static int __devinit cciss_init_one(struct pci_dev *pdev,
 	h->scatter_list = kmalloc(h->max_commands *
 						sizeof(struct scatterlist *),
 						GFP_KERNEL);
+	if (!h->scatter_list)
+		goto clean4;
+
 	for (k = 0; k < h->nr_cmds; k++) {
 		h->scatter_list[k] = kmalloc(sizeof(struct scatterlist) *
 							h->maxsgentries,
