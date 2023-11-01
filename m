Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245365680
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="iO35WINf"
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F18DB
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 02:39:43 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id y7hOqJVASdj4Iy7hOqNV22; Wed, 01 Nov 2023 10:39:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698831582;
	bh=Agd+7JRg0SYMOgT8/FQFavX9NvEOiLdyeBNbj4j9/Wk=;
	h=From:To:Cc:Subject:Date;
	b=iO35WINfQ9dNQH3zjqcQwXjwqASluxQOhG4v2UpWNHVAR8x8S3E/KocaHeDrAYdrx
	 LltCP6l+BqS+2/90Hwt8df7OzjTZEJThWtn+l2oQntfg4JsdeczILqergFVROElnP8
	 1up+F3NbCSaPfNwgeNoGz12/kkaElTwLyMqX85SAa0Air+3bVVqmnAkbG2nXwUrBVT
	 Q+J+dfmWuDU2hoOAIkKtcBT2TYDhw2W5Fg12+Vz2yw9aZznYernLvrnoL52uCqfati
	 Zr2fKFjH4qNWxMZB+A0tbK+XLMIRt1+d2ez3Esd8Z6PbRpW+KBBDO5/4LdlH85geCU
	 sFOF8fvhCb6XQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 01 Nov 2023 10:39:42 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] HSI: omap_ssi: Remove usage of the deprecated ida_simple_xx() API
Date: Wed,  1 Nov 2023 10:39:39 +0100
Message-Id: <d72106fc9de28ef8db2ed653febe366d141362a4.1698831563.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hsi/controllers/omap_ssi_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hsi/controllers/omap_ssi_core.c b/drivers/hsi/controllers/omap_ssi_core.c
index 4c1a00f9929e..6802efb4d6cd 100644
--- a/drivers/hsi/controllers/omap_ssi_core.c
+++ b/drivers/hsi/controllers/omap_ssi_core.c
@@ -355,7 +355,7 @@ static int ssi_add_controller(struct hsi_controller *ssi,
 	if (!omap_ssi)
 		return -ENOMEM;
 
-	err = ida_simple_get(&platform_omap_ssi_ida, 0, 0, GFP_KERNEL);
+	err = ida_alloc(&platform_omap_ssi_ida, GFP_KERNEL);
 	if (err < 0)
 		return err;
 	ssi->id = err;
@@ -417,7 +417,7 @@ static int ssi_add_controller(struct hsi_controller *ssi,
 	return 0;
 
 out_err:
-	ida_simple_remove(&platform_omap_ssi_ida, ssi->id);
+	ida_free(&platform_omap_ssi_ida, ssi->id);
 	return err;
 }
 
@@ -451,7 +451,7 @@ static void ssi_remove_controller(struct hsi_controller *ssi)
 	tasklet_kill(&omap_ssi->gdd_tasklet);
 	hsi_unregister_controller(ssi);
 	clk_notifier_unregister(omap_ssi->fck, &omap_ssi->fck_nb);
-	ida_simple_remove(&platform_omap_ssi_ida, id);
+	ida_free(&platform_omap_ssi_ida, id);
 }
 
 static inline int ssi_of_get_available_ports_count(const struct device_node *np)
-- 
2.34.1

