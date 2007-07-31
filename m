From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:42:09 +0000
Subject: [PATCH 25] drivers/usb/misc/ftdi-elan.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311942.10127.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, tony.olech@elandigitalsystems.com, linux-usb-devel@lists.sourceforge.net

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/usb/misc/ftdi-elan.c | 121253 -> 121196 (-57 bytes)
 drivers/usb/misc/ftdi-elan.o | 209425 -> 209265 (-160 bytes)

 drivers/usb/misc/ftdi-elan.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/usb/misc/ftdi-elan.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/usb/misc/ftdi-elan.c	2007-07-31 14:47:59.000000000 +0200
@@ -2777,12 +2777,14 @@ static int ftdi_elan_probe(struct usb_in
         size_t buffer_size;
         int i;
         int retval = -ENOMEM;
-        struct usb_ftdi *ftdi = kmalloc(sizeof(struct usb_ftdi), GFP_KERNEL);
-        if (ftdi = NULL) {
+        struct usb_ftdi *ftdi;
+
+	ftdi = kzalloc(sizeof(struct usb_ftdi), GFP_KERNEL);
+	if (!ftdi) {
                 printk(KERN_ERR "Out of memory\n");
                 return -ENOMEM;
         }
-        memset(ftdi, 0x00, sizeof(struct usb_ftdi));
+
         mutex_lock(&ftdi_module_lock);
         list_add_tail(&ftdi->ftdi_list, &ftdi_static_list);
         ftdi->sequence_num = ++ftdi_instances;
