From: Julia Lawall <julia@diku.dk>
Date: Tue, 28 Jul 2009 15:56:00 +0000
Subject: [PATCH 8/9] drivers/mmc: correct error-handling code
Message-Id: <Pine.LNX.4.64.0907281755340.28189@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: avorontsov@ru.mvista.com, linuxppc-dev@ozlabs.org, sdhci-devel@lists.ossman.eu, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

sdhci_alloc_host returns an ERR_PTR value in an error case instead of NULL.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@match exists@
expression x, E;
statement S1, S2;
@@

x = sdhci_alloc_host(...)
... when != x = E
(
*  if (x = NULL || ...) S1 else S2
|
*  if (x = NULL && ...) S1 else S2
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mmc/host/sdhci-of.c         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of.c b/drivers/mmc/host/sdhci-of.c
index d79fa55..fb00bc5 100644
--- a/drivers/mmc/host/sdhci-of.c
+++ b/drivers/mmc/host/sdhci-of.c
@@ -226,7 +226,7 @@ static int __devinit sdhci_of_probe(struct of_device *ofdev,
 		return -ENODEV;
 
 	host = sdhci_alloc_host(&ofdev->dev, sizeof(*of_host));
-	if (!host)
+	if (IS_ERR(host))
 		return -ENOMEM;
 
 	of_host = sdhci_priv(host);
