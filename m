From: Davidlohr Bueso <dave@gnu.org>
Date: Fri, 14 Aug 2009 21:06:09 +0000
Subject: [PATCH] hfc_sx: Remove unnecessary cast
Message-Id: <20090814210609.GA4024@fencepost.gnu.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Do not need to cast kmalloc, and make the code around it a bit easier to read. Something needed for all the file actually, as the style is not very standard.

Thanks.

Signed-off-by: Davidlohr Bueso <dave@gnu.org>

---
 drivers/isdn/hisax/hfc_sx.c |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/isdn/hisax/hfc_sx.c b/drivers/isdn/hisax/hfc_sx.c
index d92e8d6..172bf19 100644
--- a/drivers/isdn/hisax/hfc_sx.c
+++ b/drivers/isdn/hisax/hfc_sx.c
@@ -1480,12 +1480,16 @@ setup_hfcsx(struct IsdnCard *card)
                  release_region(cs->hw.hfcsx.base, 2);
                  return(0);
                }  
-               if (!(cs->hw.hfcsx.extra = (void *)
-                     kmalloc(sizeof(struct hfcsx_extra), GFP_ATOMIC))) {
-                 release_region(cs->hw.hfcsx.base, 2);
-                 printk(KERN_WARNING "HFC-SX: unable to allocate memory\n");
-                 return(0);
+
+               cs->hw.hfcsx.extra = kmalloc(sizeof(struct hfcsx_extra),
+                                       GFP_ATOMIC);
+
+               if (!cs->hw.hfcsx.extra) {
+                       release_region(cs->hw.hfcsx.base, 2);
+                       printk(KERN_WARNING "HFC-SX: unable to allocate memory\n");
+                       return 0;
                }
+
                printk(KERN_INFO "HFC-S%c chip detected at base 0x%x IRQ %d HZ %d\n",
                        tmp[0], (u_int) cs->hw.hfcsx.base, cs->irq, HZ);
                cs->hw.hfcsx.int_m2 = 0;        /* disable alle interrupts */
