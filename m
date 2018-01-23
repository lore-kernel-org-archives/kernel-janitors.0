From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 23 Jan 2018 02:09:13 +0000
Subject: [PATCH -next] mmc: mmci: fix error return code in mmci_probe()
Message-Id: <1516673353-170330-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Patrice Chotard <patrice.chotard@st.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: f9bb304ce855 ("mmc: mmci: Add support for setting pad type via pinctrl")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mmc/host/mmci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 6246eaa..70b0df8 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -1646,6 +1646,7 @@ static int mmci_probe(struct amba_device *dev,
 		host->pinctrl = devm_pinctrl_get(&dev->dev);
 		if (IS_ERR(host->pinctrl)) {
 			dev_err(&dev->dev, "failed to get pinctrl");
+			ret = PTR_ERR(host->pinctrl);
 			goto host_free;
 		}
 
@@ -1653,6 +1654,7 @@ static int mmci_probe(struct amba_device *dev,
 							  PINCTRL_STATE_DEFAULT);
 		if (IS_ERR(host->pins_default)) {
 			dev_err(mmc_dev(mmc), "Can't select default pins\n");
+			ret = PTR_ERR(host->pins_default);
 			goto host_free;
 		}
 
@@ -1660,6 +1662,7 @@ static int mmci_probe(struct amba_device *dev,
 							    MMCI_PINCTRL_STATE_OPENDRAIN);
 		if (IS_ERR(host->pins_opendrain)) {
 			dev_err(mmc_dev(mmc), "Can't select opendrain pins\n");
+			ret = PTR_ERR(host->pins_opendrain);
 			goto host_free;
 		}
 	}

