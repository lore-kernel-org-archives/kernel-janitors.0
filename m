From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Thu, 22 May 2014 20:21:30 +0000
Subject: [PATCH] e1000: Use time_after() for time comparison
Message-Id: <1400790090-13404-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: jeffrey.t.kirsher@intel.com
Cc: jesse.brandeburg@intel.com, bruce.w.allan@intel.com, e1000-devel@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>

To be future-proof and for better readability the time comparisons are modi=
fied
to use time_after() instead of plain, error-prone math.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 drivers/net/ethernet/intel/e1000/e1000_ethtool.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_ethtool.c b/drivers/net=
/ethernet/intel/e1000/e1000_ethtool.c
index 73a8aee..1cbf281 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_ethtool.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_ethtool.c
@@ -1460,7 +1460,8 @@ static int e1000_run_loopback_test(struct e1000_adapt=
er *adapter)
 			 * enough time to complete the receives, if it's
 			 * exceeded, break and error off
 			 */
-		} while (good_cnt < 64 && jiffies < (time + 20));
+		} while (good_cnt < 64 && time_after(time + 20, jiffies));
+
 		if (good_cnt !=3D 64) {
 			ret_val =3D 13; /* ret_val is the same as mis-compare */
 			break;
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
