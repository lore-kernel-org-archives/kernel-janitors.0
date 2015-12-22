From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 13:45:20 +0000
Subject: [PATCH v2] ti-st: Use a signed return type for st_ll_sleep_state()
Message-Id: <567953F0.7000802@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56758462.1020902@users.sourceforge.net>
 <20151219201511.GQ5284@mwanda>
In-Reply-To: <20151219201511.GQ5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 14:40:47 +0100

The return type "unsigned long" was used by the st_ll_sleep_state()
function even though it will eventually return a negative error code.
Improve this implementation detail by using the type "int" instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ti-st/st_ll.c   | 2 +-
 include/linux/ti_wilink_st.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/ti-st/st_ll.c b/drivers/misc/ti-st/st_ll.c
index 93b4d67..788d436 100644
--- a/drivers/misc/ti-st/st_ll.c
+++ b/drivers/misc/ti-st/st_ll.c
@@ -128,7 +128,7 @@ unsigned long st_ll_getstate(struct st_data_s *ll)
 }
 
 /* called from ST Core, when a PM related packet arrives */
-unsigned long st_ll_sleep_state(struct st_data_s *st_data,
+int st_ll_sleep_state(struct st_data_s *st_data,
 	unsigned char cmd)
 {
 	switch (cmd) {
diff --git a/include/linux/ti_wilink_st.h b/include/linux/ti_wilink_st.h
index 0a0d568..4205eb2 100644
--- a/include/linux/ti_wilink_st.h
+++ b/include/linux/ti_wilink_st.h
@@ -391,7 +391,7 @@ void st_ll_disable(struct st_data_s *);
  * of the chip.
  */
 unsigned long st_ll_getstate(struct st_data_s *);
-unsigned long st_ll_sleep_state(struct st_data_s *, unsigned char);
+int st_ll_sleep_state(struct st_data_s *, unsigned char);
 void st_ll_wakeup(struct st_data_s *);
 
 /*
-- 
2.6.3

