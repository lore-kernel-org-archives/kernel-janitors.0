From: Julia Lawall <julia@diku.dk>
Date: Sat, 11 Jul 2009 08:32:23 +0000
Subject: [PATCH 5/5, revised] staging/otus: Drop an unnecessary NULL test
Message-Id: <Pine.LNX.4.64.0907111031480.29592@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jirislaby@gmail.com, gregkh@suse.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Apparently, the NULL test is not necessary at this point.

The semantic patch that finds this problem is as follows:
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
 drivers/staging/otus/wwrap.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/otus/wwrap.c b/drivers/staging/otus/wwrap.c
index 4db8f6e..855ff41 100644
--- a/drivers/staging/otus/wwrap.c
+++ b/drivers/staging/otus/wwrap.c
@@ -1018,11 +1018,6 @@ void kevent(struct work_struct *work)
                container_of(work, struct usbdrv_private, kevent);
     zdev_t *dev = macp->device;
 
-    if (macp = NULL)
-    {
-        return;
-    }
-
     if (test_and_set_bit(0, (void *)&smp_kevent_Lock))
     {
         //schedule_work(&macp->kevent);
