From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 18 Aug 2019 15:06:09 +0000
Subject: [PATCH] staging: rtl8712: Improve naming of include hearder guards
Message-Id: <20190818150609.3376-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Choose a better name for the include hearder guard used in rtl871x_io.h.
'_IO_H_' is to generic and does not match the comment after the #endif.
Use '_RTL871X_IO_H_' instead.

Also make the comments in the #endif /* XXX */ match the name used in
#ifndef.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
__RTL871X_RF_H_ could have been turned into _RTL871X_RF_H_ (one leading
'_' removed) but there does not seem to be a clear logic in the way the
header guards are named in this directory. So leave it as-is in order to
limit the diff.
---
 drivers/staging/rtl8712/rtl871x_io.h | 7 +++----
 drivers/staging/rtl8712/rtl871x_rf.h | 3 +--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_io.h b/drivers/staging/rtl8712/rtl871x_io.h
index 28941423b7ed..c20dd5a6bbd1 100644
--- a/drivers/staging/rtl8712/rtl871x_io.h
+++ b/drivers/staging/rtl8712/rtl871x_io.h
@@ -11,8 +11,8 @@
  * Larry Finger <Larry.Finger@lwfinger.net>
  *
  ******************************************************************************/
-#ifndef _IO_H_
-#define _IO_H_
+#ifndef _RTL871X_IO_H_
+#define _RTL871X_IO_H_
 
 #include "osdep_service.h"
 #include "osdep_intf.h"
@@ -234,5 +234,4 @@ void r8712_write_port(struct _adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 uint r8712_alloc_io_queue(struct _adapter *adapter);
 void r8712_free_io_queue(struct _adapter *adapter);
 
-#endif	/*_RTL8711_IO_H_*/
-
+#endif	/*_RTL871X_IO_H_*/
diff --git a/drivers/staging/rtl8712/rtl871x_rf.h b/drivers/staging/rtl8712/rtl871x_rf.h
index cc54453cd424..7d98921a48fa 100644
--- a/drivers/staging/rtl8712/rtl871x_rf.h
+++ b/drivers/staging/rtl8712/rtl871x_rf.h
@@ -52,5 +52,4 @@ enum {
 	RTL8712_RFC_2T2R = 0x22
 };
 
-#endif /*_RTL8711_RF_H_*/
-
+#endif /*__RTL871X_RF_H_*/
-- 
2.20.1
