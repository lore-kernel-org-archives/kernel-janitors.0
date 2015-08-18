From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Aug 2015 09:20:29 +0000
Subject: [patch] scsi: aic94xx: set an error code on failure
Message-Id: <20150818092029.GD3965@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@odin.com>
Cc: Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>, Mike Christie <michaelc@cs.wisc.edu>, Dan Williams <dan.j.williams@intel.com>, Venkatesh Srinivas <venkateshs@google.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently did some cleanup here and now the static checkers notice
that there is a missing error code when ioremap() fails.  Let's set it
to -ENOMEM.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/aic94xx/aic94xx_init.c b/drivers/scsi/aic94xx/aic94xx_init.c
index 140cb8e..f6c336b 100644
--- a/drivers/scsi/aic94xx/aic94xx_init.c
+++ b/drivers/scsi/aic94xx/aic94xx_init.c
@@ -104,6 +104,7 @@ static int asd_map_memio(struct asd_ha_struct *asd_ha)
 		if (!io_handle->addr) {
 			asd_printk("couldn't map MBAR%d of %s\n", i=0?0:1,
 				   pci_name(asd_ha->pcidev));
+			err = -ENOMEM;
 			goto Err_unreq;
 		}
 	}
