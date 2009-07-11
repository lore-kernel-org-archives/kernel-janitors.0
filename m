From: Julia Lawall <julia@diku.dk>
Date: Sat, 11 Jul 2009 07:51:14 +0000
Subject: [PATCH 5/5] staging/otus: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0907110950510.29592@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/otus/wwrap.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -u -p a/drivers/staging/otus/wwrap.c b/drivers/staging/otus/wwrap.c
--- a/drivers/staging/otus/wwrap.c
+++ b/drivers/staging/otus/wwrap.c
@@ -1016,12 +1016,13 @@ void kevent(struct work_struct *work)
 {
     struct usbdrv_private *macp                 container_of(work, struct usbdrv_private, kevent);
-    zdev_t *dev = macp->device;
+    zdev_t *dev;
 
     if (macp = NULL)
     {
         return;
     }
+    dev = macp->device;
 
     if (test_and_set_bit(0, (void *)&smp_kevent_Lock))
     {
