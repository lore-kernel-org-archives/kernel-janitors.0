From: Julia Lawall <julia@diku.dk>
Date: Wed, 29 Dec 2010 14:01:03 +0000
Subject: [PATCH] drivers/atm/atmtcp.c: add missing atm_dev_put
Message-Id: <Pine.LNX.4.64.1012291500310.8559@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <chas@cmf.nrl.navy.mil>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The earlier call to atm_dev_lookup increases the reference count of dev,
so decrease it on the way out.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x, E;
constant C;
@@

x = atm_dev_lookup(...);
... when != false x != NULL
    when != true x = NULL
    when != \(E = x\|x = E\)
    when != atm_dev_put(dev);
*return -C;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/atm/atmtcp.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/atm/atmtcp.c b/drivers/atm/atmtcp.c
index 2b464b6..0b06250 100644
--- a/drivers/atm/atmtcp.c
+++ b/drivers/atm/atmtcp.c
@@ -392,7 +392,10 @@ static int atmtcp_attach(struct atm_vcc *vcc,int itf)
 			atm_dev_put(dev);
 			return -EMEDIUMTYPE;
 		}
-		if (PRIV(dev)->vcc) return -EBUSY;
+		if (PRIV(dev)->vcc) {
+			atm_dev_put(dev);
+			return -EBUSY;
+		}
 	}
 	else {
 		int error;
