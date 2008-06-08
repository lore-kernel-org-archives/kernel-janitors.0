From: Julia Lawall <julia@diku.dk>
Date: Sun, 08 Jun 2008 12:56:56 +0000
Subject: [PATCH 1/2] drivers/s390/char/tape_3590.c: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0806081456260.10294@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

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

diff -u -p a/drivers/s390/char/tape_3590.c b/drivers/s390/char/tape_3590.c
--- a/drivers/s390/char/tape_3590.c
+++ b/drivers/s390/char/tape_3590.c
@@ -1598,7 +1598,7 @@ tape_3590_setup_device(struct tape_devic
 	rc = tape_3590_read_dev_chars(device, rdc_data);
 	if (rc) {
 		DBF_LH(3, "Read device characteristics failed!\n");
-		goto fail_kmalloc;
+		goto fail_rdc_data;
 	}
 	rc = tape_std_assign(device);
 	if (rc)
