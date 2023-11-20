Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 08290A7;
	Mon, 20 Nov 2023 01:11:27 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 74CA062960874;
	Mon, 20 Nov 2023 17:11:25 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: vincent.sunplus@gmail.com,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: sunplus: return negative error code in sp_usb_phy_probe
Date: Mon, 20 Nov 2023 17:10:47 +0800
Message-Id: <20231120091046.163781-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_phy_create() return negative error code, 'ret' should be
'PTR_ERR(phy)' rather than '-PTR_ERR(phy)'.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 0efe74ac9c6a..637a5fbae6d9 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -275,7 +275,7 @@ static int sp_usb_phy_probe(struct platform_device *pdev)
 
 	phy = devm_phy_create(&pdev->dev, NULL, &sp_uphy_ops);
 	if (IS_ERR(phy)) {
-		ret = -PTR_ERR(phy);
+		ret = PTR_ERR(phy);
 		return ret;
 	}
 
-- 
2.30.2

