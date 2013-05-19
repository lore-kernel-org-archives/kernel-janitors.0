From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 19 May 2013 18:36:36 +0000
Subject: [patch] isdn/kcapi: fix a small underflow
Message-Id: <20130519183636.GA25275@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

In get_capi_ctr_by_nr() and get_capi_appl_by_nr() the parameter comes
from skb->data.  The current code can underflow to one space before the
start of the array.

The sanity check isn't needed in __get_capi_appl_by_nr() but I changed
it to match the others.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/isdn/capi/kcapi.c b/drivers/isdn/capi/kcapi.c
index 9b1b274..c123709 100644
--- a/drivers/isdn/capi/kcapi.c
+++ b/drivers/isdn/capi/kcapi.c
@@ -93,7 +93,7 @@ capi_ctr_put(struct capi_ctr *ctr)
 
 static inline struct capi_ctr *get_capi_ctr_by_nr(u16 contr)
 {
-	if (contr - 1 >= CAPI_MAXCONTR)
+	if (contr < 1 || contr - 1 >= CAPI_MAXCONTR)
 		return NULL;
 
 	return capi_controller[contr - 1];
@@ -103,7 +103,7 @@ static inline struct capi20_appl *__get_capi_appl_by_nr(u16 applid)
 {
 	lockdep_assert_held(&capi_controller_lock);
 
-	if (applid - 1 >= CAPI_MAXAPPL)
+	if (applid < 1 || applid - 1 >= CAPI_MAXAPPL)
 		return NULL;
 
 	return capi_applications[applid - 1];
@@ -111,7 +111,7 @@ static inline struct capi20_appl *__get_capi_appl_by_nr(u16 applid)
 
 static inline struct capi20_appl *get_capi_appl_by_nr(u16 applid)
 {
-	if (applid - 1 >= CAPI_MAXAPPL)
+	if (applid < 1 || applid - 1 >= CAPI_MAXAPPL)
 		return NULL;
 
 	return rcu_dereference(capi_applications[applid - 1]);
