From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Nov 2017 13:39:32 +0000
Subject: [PATCH] atm: lanai: use %p to format kernel addresses instead of %x
Message-Id: <20171127133932.11207-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't use %x and casting to print out a kernel address, instead use %p
and remove the casting.  Cleans up smatch warnings:

drivers/atm/lanai.c:1589 service_buffer_allocate() warn: argument 2 to
%08lX specifier is cast from pointer
drivers/atm/lanai.c:2221 lanai_dev_open() warn: argument 4 to %lx
specifier is cast from pointer

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/lanai.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
index 6664aa50789e..5f8e009b2da1 100644
--- a/drivers/atm/lanai.c
+++ b/drivers/atm/lanai.c
@@ -1586,8 +1586,8 @@ static int service_buffer_allocate(struct lanai_dev *lanai)
 	    lanai->pci);
 	if (unlikely(lanai->service.start = NULL))
 		return -ENOMEM;
-	DPRINTK("allocated service buffer at 0x%08lX, size %zu(%d)\n",
-	    (unsigned long) lanai->service.start,
+	DPRINTK("allocated service buffer at %p, size %zu(%d)\n",
+	    lanai->service.start,
 	    lanai_buf_size(&lanai->service),
 	    lanai_buf_size_cardorder(&lanai->service));
 	/* Clear ServWrite register to be safe */
@@ -2218,9 +2218,9 @@ static int lanai_dev_open(struct atm_dev *atmdev)
 #endif
 	memcpy(atmdev->esi, eeprom_mac(lanai), ESI_LEN);
 	lanai_timed_poll_start(lanai);
-	printk(KERN_NOTICE DEV_LABEL "(itf %d): rev.%d, base=0x%lx, irq=%u "
+	printk(KERN_NOTICE DEV_LABEL "(itf %d): rev.%d, base=%p, irq=%u "
 		"(%pMF)\n", lanai->number, (int) lanai->pci->revision,
-		(unsigned long) lanai->base, lanai->pci->irq, atmdev->esi);
+		lanai->base, lanai->pci->irq, atmdev->esi);
 	printk(KERN_NOTICE DEV_LABEL "(itf %d): LANAI%s, serialno=%u(0x%X), "
 	    "board_rev=%d\n", lanai->number,
 	    lanai->type=lanai2 ? "2" : "HB", (unsigned int) lanai->serialno,
-- 
2.14.1

