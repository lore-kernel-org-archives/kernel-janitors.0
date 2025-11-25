Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262311F12E0
	for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078765; cv=none; b=O5KKzQYUouo2S/ykOjsCBIZLFCcLV/G65yAYr2sHmHeFkmJliruOoNClZ/Klf9eXCsQGBToiQgkyoHPEy+fm8sPjZ5VtrlT/D+pgPfpCnXpHKwmfDlBb3LJtHUSLI/PwQPzIkEXSR62Iuy+ZCaH6QwM+8257OY1Km+rW2laKAXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078765; c=relaxed/simple;
	bh=PWG/Ju6ueJtMaWTjfTOLqzyc0mzBregmNN09z6jpqv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhTgEZiIN/86zDhLZfvgnw9vNE0WFsanOy9MJQ4iN9sZWtmK43Wo5XO/l52PUQLFHVZoW+6gEmYV+9VVYB7LHL8kvk3zyKFXSCxWsdnQH7jlTrGaUgooHSx6tR10EKUOyXJH6dWsEiVIV45MCQHeoRhWzEDoQC+Xq4iSnjqrzEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qxTG8X6N; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qxTG8X6N"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so39551575e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 05:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764078762; x=1764683562; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qoiP6TwSt3WsRHm0Qt9S7E0jYs8oQ+YtHQFRGroW9I=;
        b=qxTG8X6N4itZt/cru7Xm5SIT5h2d+Jd+5GyQApAGw84EwFRAO9FI2aNS0zkliNe9vd
         dtu5soYGz6/qirWGnRf8ENoy0sXvI5DPrfGoOp4ddUS3HItaQwemgia81MowU982Ib+h
         F7V77mcPTeGlREfxK2iRGBV5QVhRWedVTV814xrIfoOpecxQh6yij0yTJwVT7XlanzAt
         7wqHT5NlZSr/hR4g0KVJiors2NokShfYFxIBtg0mizi7EG2xagTuUp8f0lFRspteuIrH
         MbEItjBb4qavqfcdp0Zr5Irg5ScJtgMxqP5zlTc3b0Aq4Ew81QMQDDNPaNGYiwkatGMf
         BoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078762; x=1764683562;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qoiP6TwSt3WsRHm0Qt9S7E0jYs8oQ+YtHQFRGroW9I=;
        b=mmFxjXMNNOJxsoBNFX6EMmR6lZ04iRQ0W3DQeNmXyS4Ih9zQQlXWb4QmvnqBgFyADC
         FBWKKsZjqv9nKKa+vHSYNdduarEGr2AeUOok5hETQqT7DEF1cjmdXJcwevnYnlwYVcCM
         L2GPszlKJ3Bc36Wjh002aFQqtcLxmyDpkqy8QZ/cLqGfveaS60kQn8Sm4p9nBG99e22y
         ZsvDE8EDsN8upCwt7dnK0nHe87hVvVUPdtqlbFVRb6rTpz1g7REioRK7gKW2PIg6FjJk
         jsoHitsQZm9N1x4AwpZq54OFso132RFzxLOUkLvGh63xiiL2HGNDszNt8sDmiDdR5uxh
         2+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVJnxYYXXHnVuOBTH4atK8Fmjwvo161EKu57rLT22x3zrYjABnAmG3aQZKq7fc5ErVMhtxx2J+mJtj9h7hXRes=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9wnU14CodLPJ75oX84MPV00iv7cIIJ6vvNCqTVyMSeIv/mO0
	PUpw4Y3ZJdqJ4CDNyaA/lPpyZBbbZlu6+M/VmMw0XrxnxjTJRntBiYlle43bCWNErLY=
X-Gm-Gg: ASbGncv1xnUIFyZ8d7XQvBpQyp+3PwalBDgXaTh0SNa66PGNLf/uNRWNQKEHUSP/g+p
	2Gh7eXz1UFCxuJEbbQkjTvGkk91rPzvqX25yjabFbpxWZuv2XRhkg55hNYY7PBcbNcc++tjWasB
	iW1mt4VitMG+ECbi14jGLjOz8+3j+MmquBspaa3ulzWtjAw+zg1aP+/9iP6o8gZ7E4VvqgoCeh4
	jyxYYn1gm4V41bsaQcFHtTYJLSSW/KpRihAQ2CNYJpJj/bDbiDGd3eDdfjSRmbC6DdQ8300xztI
	dXUtHoKftFhVc0oYCca5tWrBA2G3xP63SqS9PIW9MNpUH132Vh8hxoZo+DocPrmzxR3L50svnMz
	m8FR/wpKJTOcaftQacPHQinIfcnKcN2g7gVsVZ/NMJ2oVSS0rNipCX+FWozRxMmJF6kT0SxFPhp
	lA9kLlaC5RAdaFjS/Y
X-Google-Smtp-Source: AGHT+IExMFPzaEj2t7R/V1HwC9wLFLjVdHnT+Jc3arjZhnTf+cI6vhU+qt5I6EYqSjZLnH2q9pLpiw==
X-Received: by 2002:a05:600c:3545:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-47904ac3ca4mr24955445e9.1.1764078762464;
        Tue, 25 Nov 2025 05:52:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf1f365fsm254495315e9.8.2025.11.25.05.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:52:41 -0800 (PST)
Date: Tue, 25 Nov 2025 16:52:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/mediatek: Fix platform_get_irq() error checking
Message-ID: <aSW0p5sqnJVJsqDO@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The platform_get_irq() function returns negative error codes on failure
and positive non-zero IRQ numbers on success.  It never returns NULL. Fix
the error checking to look for negatives, and change "hdmi->irq" from
unsigned int to just int.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index e78eb0876f16..bd7f8c56ec9c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -303,7 +303,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	hdmi->irq = platform_get_irq(pdev, 0);
-	if (!hdmi->irq)
+	if (hdmi->irq < 0)
 		return hdmi->irq;
 
 	hdmi->regs = device_node_to_regmap(dev->of_node);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index de5e064585f8..7a644bbf5843 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -168,7 +168,7 @@ struct mtk_hdmi {
 	bool audio_enable;
 	bool powered;
 	bool enabled;
-	unsigned int irq;
+	int irq;
 	enum hdmi_hpd_state hpd;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
-- 
2.51.0

