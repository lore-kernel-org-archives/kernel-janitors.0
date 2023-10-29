Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D653A4
	for <kernel-janitors@vger.kernel.org>; Sun, 29 Oct 2023 07:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="pEE4unCD"
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BA56C9
	for <kernel-janitors@vger.kernel.org>; Sun, 29 Oct 2023 00:52:44 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id x0b8qrtw4dj4Ix0b8qBkib; Sun, 29 Oct 2023 08:52:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698565962;
	bh=aXnsQa8QKoNJcBcPyfHeo4PkQFM1z9XmPc+yVIVeH5U=;
	h=From:To:Cc:Subject:Date;
	b=pEE4unCD2vcRQHf6N/wDjcR80QbYtMJB0BhuTadKRK5e3Nhj+qg8zMuASpCgZffCO
	 VYsJ57zIZHUllW57CbwKPQCaZgp9MdGj1QTNlkEaNiZ4/rzxbzOqd6tslpy4e+4A5u
	 eL9RXrf3wi+j9KRzRGpzjM1VdXDjgulTMuu5lmYWdZWtVNFWFZKjfNNnO3V4b55ekB
	 zMWn0xlyi7ArvB7PHppRk/epfxjzWP0Do2zgCVe43O3JYtFz9MBnO51jWirKi9uKnQ
	 q9FkWGCfqtddSFV384CGKeKjKvmeZ9Ai6ENJzQSZZ3AQg3ptI8tS0pqJHu67U4+gku
	 R6+T3xztTd2gg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Oct 2023 08:52:42 +0100
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
Subject: [PATCH] firmware: ti_sci: Fix an off-by-one in ti_sci_debugfs_create()
Date: Sun, 29 Oct 2023 08:52:36 +0100
Message-Id: <880aeea52f3bdde5e3e8843bbedb7fd068a58be2.1698565938.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ending NULL is not taken into account by strncat(), so switch to
strlcat() to correctly compute the size of the available memory when
building 'debug_name'.

Because of the difference in the return type between strncat() and
strlcat(), some code shuffling is needed.

Fixes: aa276781a64a ("firmware: Add basic support for TI System Control Interface (TI-SCI) protocol")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/firmware/ti_sci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 7041befc756a..1036c6b0f3eb 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -181,10 +181,9 @@ static int ti_sci_debugfs_create(struct platform_device *pdev,
 	/* Setup NULL termination */
 	info->debug_buffer[info->debug_region_size] = 0;
 
-	info->d = debugfs_create_file(strncat(debug_name, dev_name(dev),
-					      sizeof(debug_name) -
-					      sizeof("ti_sci_debug@")),
-				      0444, NULL, info, &ti_sci_debug_fops);
+	strlcat(debug_name, dev_name(dev), sizeof(debug_name));
+	info->d = debugfs_create_file(debug_name, 0444, NULL, info,
+				      &ti_sci_debug_fops);
 	if (IS_ERR(info->d))
 		return PTR_ERR(info->d);
 
-- 
2.34.1

