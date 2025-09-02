Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD0F235C01
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 06:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794947; cv=none; b=Otf05EIMpEQbtGo5NUW7jnW9L9qE4+oaVHXztKhtjDDbgJhptQdRtHglMjZZ05uXeJjOomAMFBZ9EbIjDsiv3Tam1XsfoV5OT1EM/4/b6GCkv/tc4xtlBpbkM59Zr27XCWLaesbL9Uf4AlLn3Ke28xIgcLEi5aFonI/1JsHf4ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794947; c=relaxed/simple;
	bh=3XCFeTo1QooiKS5/4iHk0SqtVwnWNCRnwlawWc24QQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m78RIQ9l9XES0u8XV98pY9NuB+2OvsbCmn5Y0bnc92aceLRjh5eEyvqZOrOa7D5wDar+Yx02cSLFNLElYkMFcl/+aaodTJlCUSNFUBvKGrkq/T8SZJUshGp4D7BAV/1ChW22mpx3KaSSQS16AwChehBRlb9TI4QKkLISGwYz1KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gc7zpXVE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gc7zpXVE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b7722ea37so17114555e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Sep 2025 23:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756794944; x=1757399744; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6dRSOg31Mko9p5tril5Cb2sG6ftwSr6FMGcLX9f2c8=;
        b=Gc7zpXVEVtLLoVJUiV6wMcHJDRyj6wshqVg4MlFC2FCXwMIgMkyACyne9BeCRVSlzp
         sNIuOR2VZ3tIxIbfCh/x2tt9hz4gdRLAV6RQxm6tF0wJV59hw/MZXBB3yXrqyUVbzhPk
         D9eWg+g8LTioo+taKOSd3i3fyY26KU/fhoOur5qR74HmZK2mBtSl+nAhamHFHk+S//xt
         Ly6aoBax4gfCzbmhvoPX7tAF4JFtKiZVtuAxPhgI8GZUMhhNE11ZdMbF9yhPcbvUKPNb
         joZ9QojDniH4ji1LpXEBk021nJopHVMFDBB/OZaJjBpcte5LoQicQ8lKCmNB4tAqg/Mx
         CLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794944; x=1757399744;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6dRSOg31Mko9p5tril5Cb2sG6ftwSr6FMGcLX9f2c8=;
        b=Ba9PWVsCv4dG4+oeIhzTzMUjyl7YDti7O0bzixvVvBY75bVilc3iS2hoHYUKdnTQTq
         bfekm0p8Y2102DoiAJWNExLafJiWt06+lpDlYwEnq/5n9G1/kzI4zxy30kGQneVBSvsA
         Cm3Egr+iTn1cT1YEG4T3A/OIRtwlSb2aEZfUiIh/ud8Ed9luaWHXhXdeH0+h21qxZ/0x
         8njFTjzlp/HCb6sZm9UGg5zFbN0V4Omqf2rlg7BN45BgxzFvinr47gVge/n8HlNmBqRt
         KbuSCodMUz8BPq+FGlkZCKNDUoSYDIwD1e6pb9BpanfxsawJGTx12h27uc40Q5hCdoI1
         iDvg==
X-Forwarded-Encrypted: i=1; AJvYcCVGycy3o7anlLRllrrnlg4PSY3lp8qdnwqabjE/ai3FzXAbVLVwR2MQhiG2fhkwgl0z9VtwOgip5r2u9XgzlX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytkgZtNzK8OJKTMU/npAzrLogW5g74B43TPFQZjpMl3lh0qjjO
	lptXbonJ6MVejNcIrTxrCVKHsjQJoUTqBxsLKqWd6HR4czUuJjvmds/9nURhdPBDX10=
X-Gm-Gg: ASbGncs/Ji4ceJQ1Lu8FNmHpi92f3BkGB7aWVNq2jUYS6xnmkxn0RmMZdWR6zSsMYwh
	bT2EBwg35iAZ9e8TFIcF7HgQJhjwiTbg7ZM764mObd81PnI+K/fMsPXquG8KTcmMbU/TlBAutl7
	d9W4xEbPiwUPf9yoyo8WS35fz0xxd0UJFO+cy+AXkH71106CDbZ21ePosTWbvkSiRBksTG7DCbN
	Pwx61iAWj5vmaRSLCGR5AnVjCopJr4T6rrM/hpt4abXjWwgsGE5ERquOV3T+2kVJ8iUnA9qwS6o
	Mv4iBTrnqKn3p3Hi+d7390t4u971B2wcXxY6WOAcQvL0HZZWRgUHloyzNno09WPSE+gWemlGcEj
	S0D9gfxPfTDQv/A+Fj06WsHNi5Rg=
X-Google-Smtp-Source: AGHT+IEnfjMtfmIxXQ+PI1ax+u6+bozcWFK3bQPZnYJtBudvpfl6k6o2nsV602G8vQ758YC6q09N3Q==
X-Received: by 2002:a05:600c:a30c:b0:459:e002:8b1e with SMTP id 5b1f17b1804b1-45b8c05a036mr43636325e9.13.1756794943784;
        Mon, 01 Sep 2025 23:35:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b87abc740sm117736355e9.7.2025.09.01.23.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:35:43 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:35:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Gourav Samaiya <gsamaiya@nvidia.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/acr/ga102: fix NULL vs IS_ERR() check in
 ga102_acr_wpr_parse()
Message-ID: <aLaQO-dpTsHJ-oH9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The nvkm_acr_lsfw_add() function never returns NULL, it returns error
pointers.  Update the check to match.

Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
index c7d38609bb7e..aae96a94acee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
@@ -218,11 +218,13 @@ static int
 ga102_acr_wpr_parse(struct nvkm_acr *acr)
 {
 	const struct wpr_header_v2 *hdr = (void *)acr->wpr_fw->data;
+	struct nvkm_acr_lsfw *lsfw;
 
 	while (hdr->wpr.falcon_id != WPR_HEADER_V1_FALCON_ID_INVALID) {
 		wpr_header_v2_dump(&acr->subdev, hdr);
-		if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->wpr.falcon_id))
-			return -ENOMEM;
+		lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->wpr.falcon_id);
+		if (IS_ERR(lsfw))
+			return PTR_ERR(lsfw);
 	}
 
 	return 0;
-- 
2.47.2

