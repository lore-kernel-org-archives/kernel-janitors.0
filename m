Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C51D9A49
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567747; cv=none; b=pOJKd2RKIriURiAYfWGsiZw+9Dal9UGLWDMX7vnl3XuXh6sI8KMfMm35GgXOSx3wuvKasgaLuaNzFVJRGbi1zqqRk9ObLlE+wSl9eAt/ZXkbzF2TsLzDQX/4ZVbKFez3BEe16cd/4ZRCxByI4AkIVEifs7VPbsFtOdVq5M5RDyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567747; c=relaxed/simple;
	bh=unOxx1FBF35f82m52qxSk7k7s5uAwciJ4IP8upP94sU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nt4YdFj6ylFDlGtbgt25CbwApQdlJJjE49BBXe0Onx5lCJhdD0Y34qwf95pz+j0Ry7jo1Pxol5adjsRgIu1zhnXGEXl4DJ4gd5BXLDJktBIy0SbCR1EYgtSkfdAD+jpD6SnYRVkaRQYLAmVMMJv9DeTJb6llejLhzXH2q6N8orc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yRwH971U; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRwH971U"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39133f709f5so1121371f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567743; x=1743172543; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReU01VkkdQwGejdvSqZN3T6tHm1DJDLTnc3Lm0Bnfgg=;
        b=yRwH971Uj/aI2r211Naevx8knD2GRJvk1ZMlqlmq4RJrnEG5J0ZmcT2AN5ZTxWxzfB
         9mZajiJVgxgS4FhHnQg/VM9E14qwFLtWNjRWuM0T5x6PftQgzjNE8vEdPvgL23QZ2Bif
         RN+mmLkTdwQ7h9vlS5SUF18H+rWTxrSd8iCyKF0yPFK1j6UASVmLsRzoFIguSZBxLdBu
         mrLZMJ7vVvefvJtc77P7idyWYHjAC7FnrPIqeJ+YhsBtprw/0I/ut7+rioSb+dS6hV1g
         QMq27HndM1vw01XJEIstNt8xA3csvpt0kPF67kXrDdrF6hbDwTE2pKz8gfLDd0eeKoN5
         BLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567743; x=1743172543;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReU01VkkdQwGejdvSqZN3T6tHm1DJDLTnc3Lm0Bnfgg=;
        b=hok3i87HdZhZ/YRBuAjqXrYnX9EqYLoX/lkRVfitIb1sy6bSmK0apiO+7mYiyvnGg5
         cYPQcU0JYzAl5YeQL0SWThp8IQN+Xx6128CAdyeuC78y0tWXTLmMtn+JUYLaEy0kQ2rw
         q7ol0MSEQ5+4IWMk9WFrij9L/fRCTcJ0klGTT0WdIAIXCetob7HgUYHyDKOhBDjiuNGT
         FB6vyKBPOwqpuqe0URVVfWwbuJcHN+atScxde6MvfVeMIH8TW/jWqjuWNBTa0BCtOOTB
         rcwSxGqu+s96oy3iXm7mzhtV0Tp9EywE0BrI0uewsn1vjFgcjsuikvVFf+inxk8heGl8
         h9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSMOP9o3dwU4zLyJy9YLZE80FdnO2pS7uQCaNFrGQtErtYCAZ4gEYPhEhb0vPkiLA1HtBt4Z8JwNsibTHe+88=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv52Kdk+WcOq6Bv36oWUzwXQ8XDMKUrbkN+BNS98xVGDzalwgk
	c+UqP8QhC0AODRc3MAVb5uRj7LrAEdSfAINFBXCwL8AQT50to2HI47gFGKR1nLM=
X-Gm-Gg: ASbGncvhnYOJeohezEVK9DjJasvd9XJTK250diQGleaVVI65PFV6lUlBhw44B75E1C9
	WbaFVmzXAAWk3/IZ871zf/E+9XjZYrCv00gEM2SjANMVTz1C5uRfHN8Av9cEVUYmfB8DydafOhz
	ToIGiJG8ipHd1SSzWv2ior7QODC20e6LmQ+5AkkdTEEyZ7Ul+21uB2Tgh4+wf5utezxcVyZ/w8c
	1oZvox+90s/qMNFlDsshK5SIy7aKEPrPGjKfzcKXhPXDYILxuTrghAMquz5bLL5AjoX1fQVTUI2
	1q9WvrKSc+npC0nStHZ98xINdxMFx4D8sa5OV5zTvgTJLitubw==
X-Google-Smtp-Source: AGHT+IGhlqCe2mLQ6QE1+jNsut/3HpyriKLoQPJNlU/O0xCCy9UTKeLE9FjCB0uErwEBPN5BJ/Tizg==
X-Received: by 2002:a5d:5f8c:0:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-3997f8ee934mr2979865f8f.2.1742567742643;
        Fri, 21 Mar 2025 07:35:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9957aasm2571305f8f.10.2025.03.21.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:42 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Hao Zhang <hao.zhang@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mt76: mt7925: Fix logical vs bitwise typo
Message-ID: <d323a443-4e81-4064-8563-b62274b53ef4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was supposed to be & instead of &&.

Fixes: f0317215b367 ("wifi: mt76: mt7925: add EHT control support based on the CLC data")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 63cb08f4d87c..79639be0d29a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -89,7 +89,7 @@ void mt7925_regd_be_ctrl(struct mt792x_dev *dev, u8 *alpha2)
 		}
 
 		/* Check the last one */
-		if (rule->flag && BIT(0))
+		if (rule->flag & BIT(0))
 			break;
 
 		pos += sizeof(*rule);
-- 
2.47.2

