From: Julia Lawall <julia@diku.dk>
Date: Tue, 09 Mar 2010 21:14:11 +0000
Subject: [PATCH 2/5] drivers/net: drop redundant memset
Message-Id: <Pine.LNX.4.64.1003092213500.4974@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramkrishna Vepa <ram.vepa@neterion.com>, Rastapur Santosh <santosh.rastapur@neterion.com>, Sivakumar Subramani <sivakumar.subramani@neterion.com>, Sreenivasa Honnur <sreenivasa.honnur@neterion.com>, Anil Murthy <anil.murthy@neterion.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The region set by the call to memset is immediately overwritten by the
subsequent call to memcpy.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2,e3,e4;
@@

- memset(e1,e2,e3);
  memcpy(e1,e4,e3);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/s2io.c                  |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/net/s2io.c b/drivers/net/s2io.c
index df70657..2eb7f8a 100644
--- a/drivers/net/s2io.c
+++ b/drivers/net/s2io.c
@@ -5819,10 +5819,8 @@ static void s2io_vpd_read(struct s2io_nic *nic)
 		}
 	}
 
-	if ((!fail) && (vpd_data[1] < VPD_STRING_LEN)) {
-		memset(nic->product_name, 0, vpd_data[1]);
+	if ((!fail) && (vpd_data[1] < VPD_STRING_LEN))
 		memcpy(nic->product_name, &vpd_data[3], vpd_data[1]);
-	}
 	kfree(vpd_data);
 	swstats->mem_freed += 256;
 }
