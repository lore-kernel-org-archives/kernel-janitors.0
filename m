From: Emil Goode <emilgoode@gmail.com>
Date: Mon, 23 Apr 2012 22:36:29 +0000
Subject: [PATCH v2] staging: android: binder: fix sparse warnings
Message-Id: <1335220589-1580-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix sparse warnings by adding __user annotation to stucts.

This patch fixes the the following sparse warnings:

drivers/staging/android/binder.c:1343:76: warning:
	incorrect type in argument 2 (different address spaces)
	drivers/staging/android/binder.c:1343:76:
	expected void [noderef] <asn:1>*ptr
	drivers/staging/android/binder.c:1343:76: got void *binder
drivers/staging/android/binder.c:1567:57: warning:
	incorrect type in argument 2 (different address spaces)
	drivers/staging/android/binder.c:1567:57:
	expected void const [noderef] <asn:1>*from
	drivers/staging/android/binder.c:1567:57:
	got void const *buffer
drivers/staging/android/binder.c:1573:46: warning:
	incorrect type in argument 2 (different address spaces)
	drivers/staging/android/binder.c:1573:46:
	expected void const [noderef] <asn:1>*from
	drivers/staging/android/binder.c:1573:46:
	got void const *offsets
drivers/staging/android/binder.c:1603:76: warning:
	incorrect type in argument 2 (different address spaces)
	drivers/staging/android/binder.c:1603:76:
	expected void [noderef] <asn:1>*ptr
	drivers/staging/android/binder.c:1603:76: got void *binder
drivers/staging/android/binder.c:1605:64: warning:
	incorrect type in argument 2 (different address spaces)
	drivers/staging/android/binder.c:1605:64:
	expected void [noderef] <asn:1>*ptr
	drivers/staging/android/binder.c:1605:64: got void *binder
drivers/staging/android/binder.c:1605:76: warning:
	incorrect type in argument 3 (different address spaces)
	drivers/staging/android/binder.c:1605:76:
	expected void [noderef] <asn:1>*cookie
	drivers/staging/android/binder.c:1605:76: got void *cookie
drivers/staging/android/binder.c:1613:40: error: 
	incompatible types in comparison

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
v2: Added __user annotation to structs instead of always casting.

 drivers/staging/android/binder.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/android/binder.h b/drivers/staging/android/binder.h
index 6602474..2f7d195 100644
--- a/drivers/staging/android/binder.h
+++ b/drivers/staging/android/binder.h
@@ -53,12 +53,12 @@ struct flat_binder_object {
 
 	/* 8 bytes of data. */
 	union {
-		void		*binder;	/* local object */
+		void __user	*binder;	/* local object */
 		signed long	handle;		/* remote object */
 	};
 
 	/* extra data associated with local object */
-	void			*cookie;
+	void __user		*cookie;
 };
 
 /*
@@ -139,9 +139,9 @@ struct binder_transaction_data {
 	union {
 		struct {
 			/* transaction data */
-			const void	*buffer;
+			const void __user	*buffer;
 			/* offsets from buffer to flat_binder_object structs */
-			const void	*offsets;
+			const void __user	*offsets;
 		} ptr;
 		uint8_t	buf[8];
 	} data;
-- 
1.7.10

