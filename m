From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Apr 2017 08:35:25 +0000
Subject: [PATCH] switchtec: checking for NULL instead of IS_ERR()
Message-Id: <20170412083525.GF3250@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>
Cc: Stephen Bates <stephen.bates@microsemi.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

stuser_create() uses error pointers, it never returns NULL.

Fixes: 74004262f329 ("MicroSemi Switchtec management interface driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
index fcde98161d9a..cc6e085008fb 100644
--- a/drivers/pci/switch/switchtec.c
+++ b/drivers/pci/switch/switchtec.c
@@ -608,7 +608,7 @@ static int switchtec_dev_open(struct inode *inode, struct file *filp)
 	stdev = container_of(inode->i_cdev, struct switchtec_dev, cdev);
 
 	stuser = stuser_create(stdev);
-	if (!stuser)
+	if (IS_ERR(stuser))
 		return PTR_ERR(stuser);
 
 	filp->private_data = stuser;
