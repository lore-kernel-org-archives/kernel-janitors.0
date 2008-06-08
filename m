From: Julia Lawall <julia@diku.dk>
Date: Sun, 08 Jun 2008 12:58:17 +0000
Subject: [PATCH 2/2] drivers/isdn/sc/ioctl.c: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0806081456570.10294@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kkeil@suse.de, isdn4linux@listserv.isdn4linux.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

spid has been allocated in this function and so should be freed before 
leaving it, as in the other error handling cases.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

@r exists@
expression E,E1;
statement S;
position p1,p2,p3;
@@

E =@p1 \(kmalloc\|kcalloc\|kzalloc\)(...)
... when != E = E1
if (E = NULL || ...) S
... when != E = E1
if@p2 (...) {
 ... when != kfree(E)
 }
... when != E = E1
kfree@p3(E);

@forall@
position r.p2;
expression r.E;
int E1 != 0;
@@

* if@p2 (...) {
 ... when != kfree(E)
     when strict
return E1; }

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/drivers/isdn/sc/ioctl.c b/drivers/isdn/sc/ioctl.c
--- a/drivers/isdn/sc/ioctl.c
+++ b/drivers/isdn/sc/ioctl.c
@@ -226,6 +226,7 @@ int sc_ioctl(int card, scs_ioctl *data)
 		 */
 		if (copy_from_user(spid, data->dataptr, SCIOC_SPIDSIZE)) {
 			kfree(rcvmsg);
+			kfree(spid);
 			return -EFAULT;
 		}
 
