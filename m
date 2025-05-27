Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08801E2307
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 05:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325346; cv=none; b=OqXAyDZExX9XIsOfBop8zZrNoNgu83WuGpbjtYZ0nRQ6DdYDqXNk625/gRiTfwnJ/vPwNx1PqdKePVMamRgon5veMCunXipk48MsKZqS67l8mxQhvK9r7L3tEQ+tONh6yiwfCqEmgEERbkZdKezPun437wv5uvA+MmZMUS974s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325346; c=relaxed/simple;
	bh=xLVy8X8HnHvYCsIOMkpIYqzz4Og+J+/aGg17JBINL/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OInDf/jc4UNDg7StT9X/iHiF3m0b467lldOzBk0y7AfTX7gcrn/rzPrJBW6Bmi96gHLskdgXMmoLoHC0ZHwJ1rF2pE4968LOG5NT5q8IHUjj04B7yY5s2CwlSDTpPXSi0IJuZ8x8ah3ASYQ6Ak4Pu6cJp8NM55owFaqZrTUs9j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ref2N4pB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ref2N4pB"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad545e74f60so388419266b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 26 May 2025 22:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325342; x=1748930142; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b95ydlmvcuSBT0t2+Bg2nsz8TCc7xZGDZD7y4UeqVe8=;
        b=ref2N4pB4CB6osMPiMaWpw5mgU8Ymoy+df1hJJmenzwfaOcNz23D4OYrhojyr/U2HF
         QXb7gw6z+90GduDJeCBAtvYHW2D5P7DYc/TVDpyZbvFafYAZ2RC1c9SKL/n7Wvo4LlIn
         lrxQ6bdDOiPijky43/RBCwLmqSSaZjSMQrgWaA1UrDM+6k0AWCXBuikUGj0OILsutzbM
         flZ8s/y0oBrXni+RXIsBTHT0AKvlDOz5WFLDK7WEUlZvYZo+c9B+ocWIUEyKOkhUVYqZ
         ILXyJnEwXW3zWTI/uzt6qgcFtnTR7AStGAAgvwiic1PR0gTy0Hd0H2MBGHUbzVV8hlrU
         xTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325342; x=1748930142;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b95ydlmvcuSBT0t2+Bg2nsz8TCc7xZGDZD7y4UeqVe8=;
        b=TzxfG/kHls8SCi+ysv0ZU2jRFpccnPFyMkhrwLWTy02hyAY9La6WIjCA1jH2YCtBNs
         5LadRHnFuc00NlGrfSHvWzXvQY4OwswLgQteWYRuMt2+LCTXjkNeujdOTdF+jf2asEl+
         gNOlK/Ge9hViHDNYNj4TFEt8UGVljzhdUFBGEDARdkJIJXPr7li1xu2fWBV6zFkL5taQ
         AuOglOBTViRXIhkvqgpXIj8gyPiSV2yxpXgoYsrUnz9OMfSa2tU+9hjeNok7DSt5MegO
         f357/ZC4xGk0RAQtae3az84iz880fh8lVBV84Bboel3P8T8LtRw8JtdNbdfZrp7NVuRN
         6mLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI98w+aktezWnOiheuftRTIIGWdZwkkqFIrrKyjo640HLUHmzNVaDhJOTDLXbiN/ZgaVSak8pV96yLwKLPbeI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Qp9s8cBxC68QIHFNUnB3aeDSSXeniiwE/ANlfXEgViQa1zyD
	jjnq3jKTRYbrwfEyM16qkSCD+q8pl4liJMXqgFyqtiO4v/GzlOAtKIbbimZi2SYPSgs=
X-Gm-Gg: ASbGnculHXt0ltfd/iNfZK7IuJy47ZDHPQhXiSzObHAqM2m74G3sX0W4ejlSN3+dhd3
	zPdD0eahWP2FKlPbJx5LKHtLLvLHd7FXocq4ohtAX28sqtU2yNHSIA/OppH9UGYmci4p2FcfpP+
	4KRXVB3R8j9l9pLiBoiPCjWC1aGMTGSOWOCSmCqMzBjEH28w5e2jrU33wSDWAoVd2hsKLEu+kx+
	hNNlCu3wyDIsnO/Sg75Pnhz2OLfzTXMi79fgZDBuDF5HN5UcSks87li9YK0jy1CXhkamPTNiSKs
	ebJpzKNY4G2dP+FWDygS2jUDkBT4BPIWNNX0MdpXmkWiKSTvq6/xrfon53+549zAz1aJ1LN1yic
	=
X-Google-Smtp-Source: AGHT+IHqcQBdt4pdotySeS2C++hBmaCY98bm7d0B72bKSBSdU4rDUN6+enuY0scFyUJE6OpWFCvJpg==
X-Received: by 2002:a17:907:f818:b0:ad4:d32e:b571 with SMTP id a640c23a62f3a-ad85b1bf8d5mr961844066b.24.1748325342055;
        Mon, 26 May 2025 22:55:42 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d06e098sm1818489666b.59.2025.05.26.22.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:55:41 -0700 (PDT)
Date: Tue, 27 May 2025 08:55:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mt76: mt7925: fix off by one in
 mt7925_mcu_hw_scan()
Message-ID: <aDVT2tPhG_8T0Qla@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ssid->ssids[] and sreq->ssids[] arrays have MT7925_RNR_SCAN_MAX_BSSIDS
elements so this >= needs to be > to prevent an out of bounds access.

Fixes: 8284815ca161 ("wifi: mt76: mt7925: add RNR scan support for 6GHz")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Please review this one carefully.  I'm less sure about the second chunk.
Also maybe we should just delete this condition or check sreq->n_ssids
instead?

 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b8542be0d945..16f3cc58a192 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2866,7 +2866,7 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	for (i = 0; i < sreq->n_ssids; i++) {
 		if (!sreq->ssids[i].ssid_len)
 			continue;
-		if (i > MT7925_RNR_SCAN_MAX_BSSIDS)
+		if (i >= MT7925_RNR_SCAN_MAX_BSSIDS)
 			break;
 
 		ssid->ssids[i].ssid_len = cpu_to_le32(sreq->ssids[i].ssid_len);
@@ -2883,7 +2883,7 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		mt76_connac_mcu_build_rnr_scan_param(mdev, sreq);
 
 		for (j = 0; j < mdev->rnr.bssid_num; j++) {
-			if (j > MT7925_RNR_SCAN_MAX_BSSIDS)
+			if (j >= MT7925_RNR_SCAN_MAX_BSSIDS)
 				break;
 
 			tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_BSSID,
-- 
2.47.2

