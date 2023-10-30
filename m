Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A58D29E
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VdKt3ZPQ"
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE778A65
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 03:12:36 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id xPG3qqyAE4QsMxPG3qncw9; Mon, 30 Oct 2023 11:12:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698660754;
	bh=UlJi3Q2/4KzrolD0gZ6MzxC5lWsP/eLAiQtg1TLakIM=;
	h=From:To:Cc:Subject:Date;
	b=VdKt3ZPQ1msygyxneY6z561IdGpQL3CanQWxiVuLcgvAXqqX7L+HgUv4v3nXyd47H
	 bUJrFPoICjbtY336Qp6+Q/Wq1Xds9VRAguAGS9Ozf7BDFO951zA9TZFyI9q5tR6du/
	 HtIf6tW3upFeDjQb70hvaaEWgi56YBGd1J6S9oDYUstT6KtSVM1BMMpta2awG2dZQH
	 ckan5wUNSIKdJX+2PBRYriv1DR4zv7gXrkYfmCYirOGyBupsWyEr9VI+zxptSySldk
	 FDIqpGsL4eHKch/IJNLcwvfWIVZnDWqkUnAB6KM5Nk42+3sQ5VAmMy/0zVlT6oLP1H
	 3s4F5bO+iCZ7Q==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 30 Oct 2023 11:12:34 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Tero Kristo <t-kristo@ti.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] firmware: ti_sci: Fix an off-by-one in ti_sci_debugfs_create()
Date: Mon, 30 Oct 2023 11:12:26 +0100
Message-Id: <7158db0a4d7b19855ddd542ec61b666973aad8dc.1698660720.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ending NULL is not taken into account by strncat(), so switch to
snprintf() to correctly build 'debug_name'.

Using snprintf() also makes the code more readable.

Fixes: aa276781a64a ("firmware: Add basic support for TI System Control Interface (TI-SCI) protocol")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2:
   - use snprintf() to simplify code   [Dan Carpenter]

v1: https://lore.kernel.org/all/880aeea52f3bdde5e3e8843bbedb7fd068a58be2.1698565938.git.christophe.jaillet@wanadoo.fr/
---
 drivers/firmware/ti_sci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 7041befc756a..8b9a2556de16 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -164,7 +164,7 @@ static int ti_sci_debugfs_create(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct resource *res;
-	char debug_name[50] = "ti_sci_debug@";
+	char debug_name[50];
 
 	/* Debug region is optional */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
@@ -181,10 +181,10 @@ static int ti_sci_debugfs_create(struct platform_device *pdev,
 	/* Setup NULL termination */
 	info->debug_buffer[info->debug_region_size] = 0;
 
-	info->d = debugfs_create_file(strncat(debug_name, dev_name(dev),
-					      sizeof(debug_name) -
-					      sizeof("ti_sci_debug@")),
-				      0444, NULL, info, &ti_sci_debug_fops);
+	snprintf(debug_name, sizeof(debug_name), "ti_sci_debug@%s",
+		 dev_name(dev));
+	info->d = debugfs_create_file(debug_name, 0444, NULL, info,
+				      &ti_sci_debug_fops);
 	if (IS_ERR(info->d))
 		return PTR_ERR(info->d);
 
-- 
2.34.1

