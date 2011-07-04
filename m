From: Julia Lawall <julia@diku.dk>
Date: Mon, 04 Jul 2011 14:11:44 +0000
Subject: [PATCH 4/5] drivers/parport/parport_gsc.c: add missing kfree
Message-Id: <1309788705-22278-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

ops was allocated previously in this function, so it should be freed before
leaving the function, as done in other nearby error-handling code.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier x;
@@

kfree(x)

@@
identifier r.x;
expression E1!=0,E2,E3,E4;
statement S;
@@

(
if (<+...x...+>) S
|
if (...) { ... when != kfree(x)
               when != if (...) { ... kfree(x); ... }
               when != x = E3
* return E1;
}
... when != x = E2
if (...) { ... when != x = E4
 kfree(x); ... return ...; }
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/parport/parport_gsc.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index 5d6de38..352f961 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -271,6 +271,7 @@ struct parport *__devinit parport_gsc_probe_port (unsigned long base,
 	if (!parport_SPP_supported (p)) {
 		/* No port. */
 		kfree (priv);
+		kfree(ops);
 		return NULL;
 	}
 	parport_PS2_supported (p);

