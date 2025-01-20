Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1440019DF4D
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jan 2025 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737366425; cv=none; b=hPN+HdzvoVSOoJItKVtBzHsRvD/zWvjzrxd76zFCFVIAgpeyEJllGOFWlSDoPWC9ftSDeJAaDTzDe9Y1E2O5FZ3RIOqnrYTRxLcaPKJfVc3rB7sLEfE2ohuSRcafr/p/iKiUx/1R0+JdqSKLUcjq1tBkKyrvG8MeSYe/M9cD75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737366425; c=relaxed/simple;
	bh=CLtH6u90O+N7mDiNWKKTvhQAJx7W2UlPQbyMWSmfrks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=miB0ltNi+e6DhLpxSuH6AITrTqfTT6DTCyTFfQfRFNL7w9SJXJCXXzNcdwmIX7XxaoSImWFhaQjR3/0e5YtlnGpD0S+3dR51wIFJNkuxKTnuFWYm+7TqmTqDV1oYls94qkoyXnZTNuaBLCNX4mDe685PrOFIjjHh2nPW6xHsqHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vj+7Pt//; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vj+7Pt//"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38634c35129so3576657f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Jan 2025 01:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737366422; x=1737971222; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VM6sOkfE8iqC95N0AKyRjkMPid32wJ87nN4QCxrUuqo=;
        b=Vj+7Pt//YpE+KQ+Lotti2s+qxJrq1UCy5MJJE5uWS+uMWfI8m3+6MQFjQ69NOfn4B0
         dE7xluF2BumlkbvdrDn7+jQx+TgJ/2HjqyLrnbd+eKza9YE19sEWugxN87R2O5Yt32mC
         UFGw4IhwhNB8V4OcE7Ghzc1yfw8XfOZVrbO+v/sfGA4KWCNlWa7RWUEc5P8xFuh6TGv4
         T7nGFraeYOcBF25iF53O7fbLtzsins72xHMZm725iflIknKUfzjYHqs7vjzUMId6saZ6
         uyVPM+A5bC8ORXdA1WxAXj5ls6GguCsdzbESF0hKiZMItXRWGvLnORQbJpwBMT5rMzLq
         5FRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737366422; x=1737971222;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VM6sOkfE8iqC95N0AKyRjkMPid32wJ87nN4QCxrUuqo=;
        b=r6eKtRaHGAvfTLxQXG8q2TRD6i4VgSS9Tw7w5YAQr3T4Z/h2wpaMXsc1pw4mgxHMZK
         /xtTnPx8McVq2E6HEynxtIQsQAbiD9OvFNJ32/Sb9kyXGHlW9PXGKerJoGDrhlfu6H4A
         5FZD2Hjf0uHQw9oy9Oy3ZbDGPEi00mO4whU8fJz3pQt+C+LsCsgtnRTVpaz96hOoZ6BL
         kxsbEzg1yebKu2jTtajJHQnTykBh2clwSPsy1kpHtfG02AP4YY740Ihvxm4tyiSjJMt5
         FnPRMZwGKzDpzuXzJjD43VK4Tdy6ZPJjJVQZ/tt3zOU+uzKDV8dpOfnmgPSn1obdtRFz
         lE5A==
X-Forwarded-Encrypted: i=1; AJvYcCW0c8tSrjUgC9xIiK6lFYojGOj1aWYtsbRZGQuWbcGR0Qg92gZeWiAeYdFPr5yEjFT5IOTOkbhwwuKZfTxBOlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXwFSqH+JxkwmSt7odp8f5RYVsCO9/aVr0GNDEu3Y3SCgEVis
	MBJWt9QRD+GLICy0Tav55Roj8tRKolS05mlmECgMJal3WatigAZzWx7Ei1CASyA=
X-Gm-Gg: ASbGnctr7Zc99etb03zL7mRTovkx9Cpd4lynr8Z0B0X8sp1mEg7xDwQLDHvAlSNMU9X
	03JQxoMxpjsaTFZbDEd6Ft5G6EcB0TlyX+7NGJ5RaFFmi6G9TOGanRQiT+JrAM+cVGk3cVOiqKT
	IbvCRtgldaUFNe2PP0YJxHJz7lu241EbyW4wagt7ED8Tzz6Vg+ZzY4zbhcQpTEY1WNM9OzaQZXI
	sIw0maEXiuEirHQNqVZprutb1toCyZ2wihYimoexL3MqywIAEGOcXFdW6c8PlNjcUTiMj/Vpuc=
X-Google-Smtp-Source: AGHT+IGPG329V2074yOYSMY1ziObuL2UZ+m5lYehxxQsiJfOBHTxj4D3R6O9lmeqMjiIW6U9yiBaRw==
X-Received: by 2002:adf:9bca:0:b0:386:3356:f3ac with SMTP id ffacd0b85a97d-38bf57937a7mr7522401f8f.26.1737366422340;
        Mon, 20 Jan 2025 01:47:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32758dbsm10018595f8f.64.2025.01.20.01.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:47:01 -0800 (PST)
Date: Mon, 20 Jan 2025 12:46:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mt76: mt7925: fix error checking in
 mt7925_mcu_uni_rx/tx_ba()
Message-ID: <063aafdf-3234-42ac-a4ea-3ff98e2835b6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ret" variable in mt7925_mcu_uni_[rx/tx]_ba() needs to be signed for
the if (ret < 0) condition to be true.

Also the mt7925_mcu_sta_ba() function returns positive values on success.
The code currently returns whatever non-negative value was returned on
the last iteration.  It would be better to return zero on success.  This
function is called from mt7925_ampdu_action() which does not check the
return value so the return value doesn't affect runtime.  However, it
still makes sense to return zero even though nothing is affected in the
current code.

Fixes: eb2a9a12c609 ("wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 15815ad84713..b3a00964e802 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -617,7 +617,8 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
 	struct mt792x_bss_conf *mconf;
 	unsigned long usable_links = ieee80211_vif_usable_links(vif);
 	struct mt76_wcid *wcid;
-	u8 link_id, ret;
+	u8 link_id;
+	int ret;
 
 	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		mconf = mt792x_vif_to_link(mvif, link_id);
@@ -630,10 +631,10 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
 		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
 					enable, true);
 		if (ret < 0)
-			break;
+			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
@@ -647,7 +648,8 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
 	struct mt792x_bss_conf *mconf;
 	unsigned long usable_links = ieee80211_vif_usable_links(vif);
 	struct mt76_wcid *wcid;
-	u8 link_id, ret;
+	u8 link_id;
+	int ret;
 
 	for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		mconf = mt792x_vif_to_link(mvif, link_id);
@@ -657,10 +659,10 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
 		ret = mt7925_mcu_sta_ba(&dev->mt76, &mconf->mt76, wcid, params,
 					enable, false);
 		if (ret < 0)
-			break;
+			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
-- 
2.45.2

