From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Mon, 02 Sep 2013 11:56:19 +0000
Subject: [PATCH] Staging: android: Remove extern from function prototypes in .h files
Message-Id: <1378122979-15071-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

checkpatch.pl complains that extern prototypes should be avoided in .h files

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
 drivers/staging/android/timed_output.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/android/timed_output.h b/drivers/staging/android/timed_output.h
index ec907ab..905c7cc 100644
--- a/drivers/staging/android/timed_output.h
+++ b/drivers/staging/android/timed_output.h
@@ -31,7 +31,7 @@ struct timed_output_dev {
 	int		state;
 };
 
-extern int timed_output_dev_register(struct timed_output_dev *dev);
-extern void timed_output_dev_unregister(struct timed_output_dev *dev);
+int timed_output_dev_register(struct timed_output_dev *dev);
+void timed_output_dev_unregister(struct timed_output_dev *dev);
 
 #endif
-- 
1.7.1

