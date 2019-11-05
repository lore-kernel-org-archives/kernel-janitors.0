From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Nov 2019 15:03:59 +0000
Subject: [PATCH][next][V2] crypto: allwinner: fix some spelling mistakes
Message-Id: <20191105150359.61379-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corentin Labbe <clabbe.montjoie@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in dev_warn and dev_err messages. Fix these.
Change "recommandation" to "recommendation" and "tryed" to "tried".

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Fix "tryed"

---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 4 ++--
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 8e4eddbcc814..73a7649f915d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -469,7 +469,7 @@ static int sun8i_ce_get_clks(struct sun8i_ce_dev *ce)
 		}
 		if (ce->variant->ce_clks[i].max_freq > 0 &&
 		    cr > ce->variant->ce_clks[i].max_freq)
-			dev_warn(ce->dev, "Frequency for %s (%lu hz) is higher than datasheet's recommandation (%lu hz)",
+			dev_warn(ce->dev, "Frequency for %s (%lu hz) is higher than datasheet's recommendation (%lu hz)",
 				 ce->variant->ce_clks[i].name, cr,
 				 ce->variant->ce_clks[i].max_freq);
 	}
@@ -513,7 +513,7 @@ static int sun8i_ce_register_algs(struct sun8i_ce_dev *ce)
 			break;
 		default:
 			ce_algs[i].ce = NULL;
-			dev_err(ce->dev, "ERROR: tryed to register an unknown algo\n");
+			dev_err(ce->dev, "ERROR: tried to register an unknown algo\n");
 		}
 	}
 	return 0;
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
index e58407ac256b..b90c2e6c1393 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
@@ -446,7 +446,7 @@ static int sun8i_ss_register_algs(struct sun8i_ss_dev *ss)
 			break;
 		default:
 			ss_algs[i].ss = NULL;
-			dev_err(ss->dev, "ERROR: tryed to register an unknown algo\n");
+			dev_err(ss->dev, "ERROR: tried to register an unknown algo\n");
 		}
 	}
 	return 0;
@@ -502,7 +502,7 @@ static int sun8i_ss_get_clks(struct sun8i_ss_dev *ss)
 		}
 		if (ss->variant->ss_clks[i].max_freq > 0 &&
 		    cr > ss->variant->ss_clks[i].max_freq)
-			dev_warn(ss->dev, "Frequency for %s (%lu hz) is higher than datasheet's recommandation (%lu hz)",
+			dev_warn(ss->dev, "Frequency for %s (%lu hz) is higher than datasheet's recommendation (%lu hz)",
 				 ss->variant->ss_clks[i].name, cr,
 				 ss->variant->ss_clks[i].max_freq);
 	}
-- 
2.20.1
