From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2015 16:22:58 +0000
Subject: [PATCH] ti-st: Use a signed return type for st_ll_sleep_state()
Message-Id: <56758462.1020902@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2015 17:15:34 +0100

The return type "unsigned long" was used by the st_ll_sleep_state()
function despite of the aspect that it will eventually return a negative
error code.
Improve this implementation detail by deletion of the type modifier then.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ti-st/st_ll.c   | 2 +-
 include/linux/ti_wilink_st.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/ti-st/st_ll.c b/drivers/misc/ti-st/st_ll.c
index 93b4d67..dacf071 100644
--- a/drivers/misc/ti-st/st_ll.c
+++ b/drivers/misc/ti-st/st_ll.c
@@ -128,7 +128,7 @@ unsigned long st_ll_getstate(struct st_data_s *ll)
 }
 
 /* called from ST Core, when a PM related packet arrives */
-unsigned long st_ll_sleep_state(struct st_data_s *st_data,
+long st_ll_sleep_state(struct st_data_s *st_data,
 	unsigned char cmd)
 {
 	switch (cmd) {
diff --git a/include/linux/ti_wilink_st.h b/include/linux/ti_wilink_st.h
index 0a0d568..9604352 100644
--- a/include/linux/ti_wilink_st.h
+++ b/include/linux/ti_wilink_st.h
@@ -391,7 +391,7 @@ void st_ll_disable(struct st_data_s *);
  * of the chip.
  */
 unsigned long st_ll_getstate(struct st_data_s *);
-unsigned long st_ll_sleep_state(struct st_data_s *, unsigned char);
+long st_ll_sleep_state(struct st_data_s *, unsigned char);
 void st_ll_wakeup(struct st_data_s *);
 
 /*
-- 
2.6.3

