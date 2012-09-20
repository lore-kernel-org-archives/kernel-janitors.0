From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Thu, 20 Sep 2012 01:47:59 +0000
Subject: [PATCH] include/linux: Fix spelling of "usage" in comment.
Message-Id: <1348105682-25196-2-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

A comment misspells "usage"; fix that.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 include/linux/kexec.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 37c5f726..96f30bd 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -34,7 +34,7 @@
 #ifndef __KERNEL__
 /*
  * This structure is used to hold the arguments that are used when
- * loading  kernel binaries.
+ * loading kernel binaries.
  */
 struct kexec_segment {
 	const void *buf;
@@ -45,7 +45,7 @@ struct kexec_segment {
 
 /* Load a new kernel image as described by the kexec_segment array
  * consisting of passed number of segments at the entry-point address.
- * The flags allow different useage types.
+ * The flags allow different usage types.
  */
 extern int kexec_load(void *, size_t, struct kexec_segment *,
 		unsigned long int);
-- 
1.7.7.3

