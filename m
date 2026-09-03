Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C144E56E1
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Sep 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450252; cv=none; b=FTMCsxBFndcU4mZTmn2Iw6vJR+bdE1Yp6EYPDDMrmFDtEdsGVzn4juDwNW232wfw2C3VzEOzNORo2EjJIDqhEPEPcNoJxLVERJqqYLArBz7SuNckOiQTbIB+BXfwmk5z802wUu0YYsF07KocNDV664q22WokwQnuo7J+QwfGWDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450252; c=relaxed/simple;
	bh=V6nah0thlCYDVKr67EXMA19FoQoM8eKaKF4GgRzztzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E1d9Yn49Ivts0wLY6OEguYFUBNwZH0UxnqH9yv93q8VNgRZ5tPGo2Rc36/P8hqsiz7MfuEjGxdlKotu8mzY5TMyFzpagRklp3WYnWHA9R+jSw2Rh6pJ2D5ErYb6vSjnCkjyBMfx5yv/tdvGgtCEZ4yPoegEbKtWDOqL76d7bUKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs3fQS80; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs3fQS80"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso18863095e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Sep 2026 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788450249; x=1789055049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mry3nYNEPrZxqkxatWuTZFq3w4sR1ZqgrHlSjI3OqFs=;
        b=bs3fQS80VrhImXtKDaFPWd8i82XKcQ0TpcKVII4a3qkpVr0kwAtGBmc44xUef9fFvJ
         v9511dsT2ZeQ8GDIoLPY97iKV1R2vxGsc+XftGI68TwRN/joKHhXI5vYcxmduaN3By1v
         w6o3ykQ1+juLJX1eyPE8lGbUU2R32GmKkgrfqFIePRAswmZ5D5Q4tw+Y+0uZo2jLNE+3
         2p3Erd+ZESl+Q7Hu/VzEvDrhe68Ov9ywpKVl5XV2nv4xi+debjjAPWwjTvonx417KjKF
         6gNxDRexIXgSzgztlDewzhpgCkw0BRKF/PPP7Rsn1tni68VK9mBpBXEaSDwdcZgOPhXP
         5hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450249; x=1789055049;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mry3nYNEPrZxqkxatWuTZFq3w4sR1ZqgrHlSjI3OqFs=;
        b=qZ3qiGcLsVrSbN3Szxg3Vok1eIpx6/eu0nMYqFD2KiN64DIt4Xq/Qfjd+OEFYwYw3D
         mjDowg+n5kidtRaxtumh1FwTbB7kLvEXvL9Yacheo//DWwybQjJr0WR6T44uV5lZ7gOC
         OHABmnJKzoKnSQ86PrpqO9yRsMWPXMaMWLSOau+tc+k7zfIMReLbtt0Wte6oyX7BUmJ3
         CnFQv/AwK4XNH8HXQLEnR9vmJeZ5eguBmmAvwPKUj6pjCl/SxOslbIMDhDCR6oXqWmzu
         UO+GcY9f7F+Nk5OmuzTIybJjThYRDWR/m9/vnHDk+fDRUA4XNndR3qNLIzxJYe/l3Cj3
         1fBw==
X-Gm-Message-State: AFuF++kuE/joUXa6qjnAVBxhPU/mAD8cxg435sTONo13vmA9PsqaZWws
	FeNTV4D+rkjl7RhbgHRjzS7yY1gdpLfeLWH+FJlCn1Vqdct/dCZK96MU
X-Gm-Gg: AYBFou0KnEAF2QH6KdPQSQ8U75FbbpW0TGIi5OiuMy9Tajgwa0WtnND47cDh6Wcc+ch
	cs+ECU3S/yS5Y0qbN+UJuxvblavX5uu+Ci8lm6yz0tjOqptal4tkQh6+LtdAQJa/3obEBZmO7JR
	H/1854EqgemB2adY5u4vhboCWd+dogh4jPOLYflApR5A6wxeZIcSTQYJ31K53Y4vEpPEK2Hs3EV
	P99K8gR+ACcyI9D9PQblu3EQ3JiKHOEwWJyhWkJbPg3pkGKlGbEEGb2cZ+fI2SYSCsrYeV4jZwl
	R8jZSa+BL9lhNqHe+rplmpn+4OAFmiDf2AfF7vTBdPN+gQLWvD8qrUItUGhapSBpqg67oJkpkrM
	DT0yZlKVUFeyUZXOSptUmRfVdLeOwL2Hv17lP2zq3d/8gC/aO4A3WkFquHAEPRsQ8yDyFJt5QbJ
	VzPGHebCIbklrRsovsGg1bq3R393dAiPfA+AqsemIoBjy2/BodM7LGE4LaOhU=
X-Received: by 2002:a05:600c:6c4a:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49cf5baafc7mr14910805e9.6.1788450248541;
        Thu, 03 Sep 2026 08:44:08 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47b9817sm121063135e9.1.2026.09.03.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:44:07 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: mt7996: Fix spelling mistake "retriving" -> "retrieving"
Date: Thu,  3 Sep 2026 16:42:04 +0100
Message-ID: <20260903154204.20872-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are multiple spelling mistakes in dev_warn messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index b8006b8729a1..3fb9f39c2f61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -283,7 +283,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring0 addr\n");
+			 "failed retrieving NPU wlan rx ring0 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND0].regs->desc_base);
@@ -292,7 +292,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring2 addr\n");
+			 "failed retrieving NPU wlan rx ring2 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND2].regs->desc_base);
@@ -302,7 +302,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND0].regs->desc_base);
@@ -311,7 +311,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND1].regs->desc_base);
@@ -320,7 +320,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan msdu pg ring addr\n");
+			 "failed retrieving NPU wlan msdu pg ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_MSDU_PAGE_BAND2].regs->desc_base);
@@ -330,7 +330,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan ind_cmd ring addr\n");
+			 "failed retrieving NPU wlan ind_cmd ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_IND].regs->desc_base);
-- 
2.55.0

