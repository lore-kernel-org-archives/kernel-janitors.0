From: Dan Carpenter <error27@gmail.com>
Date: Sat, 21 Aug 2010 19:24:59 +0000
Subject: [patch] ath5k: re-order one of the frees on unwind
Message-Id: <20100821192459.GG6674@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: Nick Kossifidis <mickflemm@gmail.com>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, Bob Copeland <me@bobcopeland.com>, "John W. Linville" <linville@tuxdriver.com>, Bruno Randolf <br1@einfach.org>, linux-wireless@vger.kernel.org, ath5k-devel@lists.ath5k.org, kernel-janitors@vger.kernel.org

There was a small misordering here.  In the original code, if we were to
go to err_free_ah then it wouldn't free the irq.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/ath/ath5k/base.c b/drivers/net/wireless/ath/ath5k/base.c
index 373dcfe..2447507 100644
--- a/drivers/net/wireless/ath/ath5k/base.c
+++ b/drivers/net/wireless/ath/ath5k/base.c
@@ -700,10 +700,10 @@ ath5k_pci_probe(struct pci_dev *pdev,
 	return 0;
 err_ah:
 	ath5k_hw_detach(sc->ah);
-err_irq:
-	free_irq(pdev->irq, sc);
 err_free_ah:
 	kfree(sc->ah);
+err_irq:
+	free_irq(pdev->irq, sc);
 err_free:
 	ieee80211_free_hw(hw);
 err_map:
