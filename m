Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3425253B59
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764351927; cv=none; b=n05DAlswY0TPj3pMm7ljeoC4R8DF6nwG72RCQcLx1ZSRLf91lYSDjiHMnxN4JhuECWc4WIYPvyJOUCRiM52NzuLKOE0AE0ux9SZ0TQ7SIXsOOfLgawPHwUy72NbFdt4a4eKtbfTxNBhiVkIUAuxLxavF84w/jdTasa7c46hh4Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764351927; c=relaxed/simple;
	bh=cinn32iWphnWN8tkX8ucGWRbObOOYK553n/IUZDTZQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hYD+j5NeKD77eNOjFYWi/b7YibkXGhE9lkyGIUZH3R5d+9Hcv0k/yG1Ud6atSzzyva8dXX9LoscGzHb5dQZqpRWpT6AXvavfVsefuDGhJUuIWDygHTpZdfKbsHqEPEEWnGj3611OlPZCWoNUg19gWqX/Bxtti7jjKuqxqdKgt24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JN36sN/0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JN36sN/0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477770019e4so16827845e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764351924; x=1764956724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lSM32csH2X23xXw6xgAstXFSe1ZcOlrmsYctqKwHp88=;
        b=JN36sN/0Albrxkp0J67v9tgCcxOMaw2kpFRHYBYnxeGTFE9Jq2zXdIW11uL21T7DkQ
         A2xe+GWHeCkx3NUPqfUcdlrC1ixAyE7ENOPGnzVBVRCdHSgS3OVba9wn4kuXeFxMyRCq
         it4lX5BBYT0fd975Lo56Uu9L8fmLFWtHDqG4wRZaLY4rK6WAxyDOL8O4GJi44AahhvIr
         wV9IwAX0XDMH9bETHnKHh+m73Nhcatr2p+H9oa+kWl2gpZ767bV0/JHCStaqhtCsy1nX
         ahJ7H4B28RJtbsvMgIhd/3dqR4jB5OUhY6cvp3JiDT0PvvEeFPNmae9AaZsUy0zDJfz+
         5g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764351924; x=1764956724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSM32csH2X23xXw6xgAstXFSe1ZcOlrmsYctqKwHp88=;
        b=AOV6rpwITXpy/SC2mOE8jDP1+1nmvACjQslzPBkjoiJs9D13A/3tmNfWt/6U9v74Vt
         hmt5i4DDm3FXroYcX5Esz8T/7HM4/BPgfVWGHLd51rKcofhHTel2vM79wFsjnipYpEAc
         NZsRJy+jsJI8d1emr2/dqXf+JpCsx6UBoOG8v9jkiJu+oW+e3tYrpCuEldkCMHVnG7C9
         bEU76kQwWezZKsyyAq9wYzhuGZ558XkKJXscZPIVLIjqwVe8uyLRue8xlcu/YvIbTrfw
         Omhft0IMFFkdqIoB76AyDFFdDxnrQU5Mjr4vd7XoNr+Ewpv5buLZAd2aZdePrmmazl2a
         9U5Q==
X-Gm-Message-State: AOJu0YxFO4ZCEgsjZ+GQfCkZymo9PH+K105AS6rXf0ByxXUvTk/W+GGp
	CrwrGE0LAWLYdDo9tmMK6LnPMNvUt8CQiH4VwYXGxFhBtzA8Rvk+v187
X-Gm-Gg: ASbGncuTxXJqKOJVFWbRpop+NyB5CTwneZxbYZZZHY1aosLQA84pB24Cfl56C8lR5BS
	RYcT06yUjsnTMaLkT1wh5YwQcqYpHFrFJu/LUnuL6FmYU+xyzk7jXUjD2H3yZVuBjziV4YuxkQS
	lXEuGDrCYyGqpgB0nYUWDAbhOD6dt38RaBEUDYeFK9/oVy+KgjXAYoVRld3Hr9eia66zosS8lTP
	JGYlD3oOzLFxzAElkk0niASowFCu8u/q0w7F9/jnL3cFH/A1cDSIaAf2Bw+PCAgZgCxOj5T4Dyl
	mDacqYIXHpv/CU1T3LrpGY1/Caljq2PznIcSnxKbNcFgkGlZra9zFv+OElsBETTIyE3M3Gn7K+p
	W5jB6hJiGyKY8ux8nUcssdFeIGzU/UqAYBFo0UCe7HT4z8OGECExCZzsX8NugRkt87I54gQpi3b
	EHGaBwr8Z6WAgUvb8DwRmw
X-Google-Smtp-Source: AGHT+IGr8jf1cEOxcEb6EeKeJchwsXTCgWnn9x2mUsKIoWiq9E4Ha2G7avXXtjB+xtyEdcahgOM1nA==
X-Received: by 2002:a05:600c:46d2:b0:477:54cd:2030 with SMTP id 5b1f17b1804b1-47904b1afcemr162142095e9.21.1764351924189;
        Fri, 28 Nov 2025 09:45:24 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5c3c8csm13452898f8f.2.2025.11.28.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 09:45:23 -0800 (PST)
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
Date: Fri, 28 Nov 2025 17:44:30 +0000
Message-ID: <20251128174430.318838-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are a handful of spelling mistakes in various warning messages.
Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index 29bb735da4cb..1422533e59c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -120,7 +120,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring0 addr\n");
+			 "failed retrieving NPU wlan rx ring0 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND0].regs->desc_base);
@@ -129,7 +129,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rx ring1 addr\n");
+			 "failed retrieving NPU wlan rx ring1 addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_BAND1].regs->desc_base);
@@ -138,7 +138,7 @@ static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 			       &val, GFP_KERNEL);
 	if (err) {
 		dev_warn(dev->mt76.dev,
-			 "failed retriving NPU wlan rxdmad_c ring addr\n");
+			 "failed retrieving NPU wlan rxdmad_c ring addr\n");
 		return err;
 	}
 	writel(val, &dev->mt76.q_rx[MT_RXQ_RRO_RXDMAD_C].regs->desc_base);
@@ -159,7 +159,7 @@ static int mt7996_npu_txd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 				       &val, GFP_KERNEL);
 		if (err) {
 			dev_warn(dev->mt76.dev,
-				 "failed retriving NPU wlan tx ring addr\n");
+				 "failed retrieving NPU wlan tx ring addr\n");
 			return err;
 		}
 		writel(val, &dev->mt76.phys[i]->q_tx[0]->regs->desc_base);
-- 
2.51.0

