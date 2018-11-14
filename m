From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 14 Nov 2018 01:57:03 +0000
Subject: [PATCH -next] misc: mic/scif: fix copy-paste error in scif_create_remote_lookup
Message-Id: <1542160623-29011-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>, "Liu, Yi L" <yi.l.liu@intel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

gcc '-Wunused-but-set-variable' warning:

drivers/misc/mic/scif/scif_rma.c: In function 'scif_create_remote_lookup':
drivers/misc/mic/scif/scif_rma.c:373:25: warning:
 variable 'vmalloc_num_pages' set but not used [-Wunused-but-set-variable]

'vmalloc_num_pages' should be used to determine if the address is 
within the vmalloc range.

Fixes: ba612aa8b487 ("misc: mic: SCIF memory registration and unregistration")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/misc/mic/scif/scif_rma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mic/scif/scif_rma.c b/drivers/misc/mic/scif/scif_rma.c
index b441f6b..749321e 100644
--- a/drivers/misc/mic/scif/scif_rma.c
+++ b/drivers/misc/mic/scif/scif_rma.c
@@ -416,7 +416,7 @@ static int scif_create_remote_lookup(struct scif_dev *remote_dev,
 		if (err)
 			goto error_window;
 		err = scif_map_page(&window->num_pages_lookup.lookup[j],
-				    vmalloc_dma_phys ?
+				    vmalloc_num_pages ?
 				    vmalloc_to_page(&window->num_pages[i]) :
 				    virt_to_page(&window->num_pages[i]),
 				    remote_dev);
