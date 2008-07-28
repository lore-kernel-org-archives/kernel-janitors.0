From: Julia Lawall <julia@diku.dk>
Date: Mon, 28 Jul 2008 14:10:09 +0000
Subject: [PATCH] drivers/isdn/capi/kcapi.c: Adjust error handling code
Message-Id: <Pine.LNX.4.64.0807281609190.15369@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kkeil@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

After calling capi_ctr_get, error handling code should call
capi_ctr_put.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r@
expression x,E;
statement S;
position p1,p2,p3;
@@

(
if ((x = capi_ctr_get@p1(...)) = NULL || ...) S
|
x = capi_ctr_get@p1(...)
... when != x
if (x = NULL || ...) S
)
<...
if@p3 (...) { ... when != capi_ctr_put(x)
                  when != if (x) { ... capi_ctr_put(x); ...}
    return@p2 ...;
}
...>
(
return x;
|
return 0;
|
x = E
|
E = x
|
capi_ctr_put(x)
)

@exists@
position r.p1,r.p2,r.p3;
expression x;
int ret != 0;
statement S;
@@

* x = capi_ctr_get@p1(...)
  <...
* if@p3 (...)
  S
  ...>
* return@p2 \(NULL\|ret\);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/isdn/capi/kcapi.c     |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/isdn/capi/kcapi.c b/drivers/isdn/capi/kcapi.c
index 75726ea..5360c4f 100644
--- a/drivers/isdn/capi/kcapi.c
+++ b/drivers/isdn/capi/kcapi.c
@@ -828,15 +828,18 @@ static int old_capi_manufacturer(unsigned int cmd, void __user *data)
 			return -ESRCH;
 		if (card->load_firmware = NULL) {
 			printk(KERN_DEBUG "kcapi: load: no load function\n");
+			capi_ctr_put(card);
 			return -ESRCH;
 		}
 
 		if (ldef.t4file.len <= 0) {
 			printk(KERN_DEBUG "kcapi: load: invalid parameter: length of t4file is %d ?\n", ldef.t4file.len);
+			capi_ctr_put(card);
 			return -EINVAL;
 		}
 		if (ldef.t4file.data = NULL) {
 			printk(KERN_DEBUG "kcapi: load: invalid parameter: dataptr is 0\n");
+			capi_ctr_put(card);
 			return -EINVAL;
 		}
 
@@ -849,6 +852,7 @@ static int old_capi_manufacturer(unsigned int cmd, void __user *data)
 
 		if (card->cardstate != CARD_DETECTED) {
 			printk(KERN_INFO "kcapi: load: contr=%d not in detect state\n", ldef.contr);
+			capi_ctr_put(card);
 			return -EBUSY;
 		}
 		card->cardstate = CARD_LOADING;
