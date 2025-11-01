Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27652C0279
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Nov 2025 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003534; cv=none; b=W4WUKZL+yg2sBDiFKjvmxRRwWKnrqVzua+fUsp7C3P/R15Dwh0ZShN21qDFYaccWGG/CBznRESs1g42NaASI+KuViXe+pf7zUC4CexneKenJoHZH8m1W6wYUsCpQpM4DzrS7GfwZ4oUn9MnaUzkeHUw9Yz0pL8Cz4HGHzupJfnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003534; c=relaxed/simple;
	bh=Z98SLm/EfpTZZ+75oYqs1vAnViW8qDAEJMAoaxRjcMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sp1hoyijEIxnur5HBhejSF+f0qtNap2yzjzniCBtTsrnBtXMlAPtJ81RENjZOaUhWYzfNjmYF2ekQYDpus/oPIIdnBETX1nntMMduhYVKumwO5j3y10jF6UOoKIJjnBBW5GsBT4RNO12WaQhPK2ltLgTMTZQuQHfLPDZ6g5XU/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SdtaO3jk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SdtaO3jk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so18539195e9.2
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Nov 2025 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003531; x=1762608331; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9gbS+9LrLe7y4J6JOoi0YS3Bk4wJ8cYhZR5dEyxBSU=;
        b=SdtaO3jksgTLqU+mS3qclYS5VWLHEev1z9DX2gw+YhZLE+lYolFpb210a5XBvsUhOS
         rDc8D46VdPJtVb0QB9oP10HOGB170XfZvhDbqd1ul/hrq7JhGQAIY+GrqRM79XtGSV11
         21RmS0OrKQWNnlX0XL/CVqiHhOG0+KQQotDA2FniWnm89DCi9Np+pJ+NCgsVAGGe7RKK
         lgcrCz91r6nGf7KySwGW5SSHOynTR2jZ4uEQ2MjjhTJoUdjnDwX2wlwx2ugpUPn3/l/v
         pllDQvO9kO075YipdWvZAb/nTR4b66nXsKvyB8wqLj3AGFXrUC0DlWucXQeNBlLiJZ+F
         RymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003531; x=1762608331;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9gbS+9LrLe7y4J6JOoi0YS3Bk4wJ8cYhZR5dEyxBSU=;
        b=Nur/7eAouT2K4W8ThfzC3d8/LHBee9nCzDUi6uGxE3G4S/7Qn7z1kA63Y3b/MzTKjG
         5k7LRqqUE3oTz6cNZXmpUnnkqDghaXydQD5SNYoqcgXbpAPY8/oZsb/U6r50PZ58H3oi
         8jUOHRvBnV9B5zGMFukbf5NjPE6J70n96TF3J2S5TOrzCA7Kp7ma3tfsKPRN+Gw9Cq60
         ZDUfFujj6NrnjMmloiQp0aiDnYiXPujHCBhuki3oOfmZJq2/H/I6TMLVE6HX1JfvQU4f
         MfMBA59AK3m7k3otiQynuhRt5Hzey0V4vuD/DbBM5tMyVJ3tQndhTHiQN8RRFfOPnHMw
         ZQrw==
X-Forwarded-Encrypted: i=1; AJvYcCVnW6K1VV4EnrL9MHLwjaLnYwyxL/f9Y0rpycsYEXtlbEtpazUEyKWLrugIVpTWhYRFOX0BRImsWCs4lc/ESYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZojA9oEwqTgPSmzj3QAUHZYZ3tkFUdAoYpDHybfzlPzUTEO0
	/SFGBoBU8f0i79WakAJ/TPk3vTwJWR/aMv/Fwq8WTRkgtpIy2iSkXEQtuF8jpj72DVQ=
X-Gm-Gg: ASbGncsxN5Aa6qVrGabGyasWeXsoQK8T9RwShyQ2GuVhtMPs/l8z93Fq4PsbpBr+8yV
	KDP1S+VzOmwlwN4Ap36KFrQF8BpxnTwBu5ClxCu4E5qNFt7TALh5Sbm0h7AeC2B0HpRQqDLZful
	LxHYTswGYSELbVq4EvN56r/WgJWMX8xEK5ZtBXh20xwlvZKqq6bgCJAeb0VbSDX8a/43++KERuS
	kKYZSIAIcs/eFuJf7vbIzExjKei1N0DvhJ5InlW7bGKt8WsOOzoxS6OV4JGEmMz/QeB/KHnkCh/
	wjoI+zudPDW16NOkm3phWiOKSm1l8mUAiygxFc29BL13OxoVv+o8cnbbkYynUmJ6zdT7fIPduVb
	O/mmEU/3J72v/F7tdlC0beYH9UCQPSy4flo9dpiv/WfC7CNvBVYO7Gj/XzPbRmCHr5HsVtc1m1k
	TX7LhK1A==
X-Google-Smtp-Source: AGHT+IHfkE8YJK+hEniklXFT4GhX0FQkyrWL8TAH+8xEiRGBmRw2WAmAAnJ/Iz+FCPOhsKJuLyo9JQ==
X-Received: by 2002:a05:600c:1e19:b0:46e:711c:efeb with SMTP id 5b1f17b1804b1-477308aa8acmr60161545e9.25.1762003531066;
        Sat, 01 Nov 2025 06:25:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c48de65sm47854815e9.1.2025.11.01.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:25:30 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:25:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: imx_sc_key - Fix memory corruption on unload
Message-ID: <aQYKR75r2VMFJutT@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This is supposed to be "priv" but we accidentally pass "&priv" which is
an address in the stack and so it will lead to memory corruption when
the imx_sc_key_action() function is called.  Remove the &.

Fixes: 768062fd1284 ("Input: imx_sc_key - use devm_add_action_or_reset() to handle all cleanups")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/input/keyboard/imx_sc_key.c | 2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
index d18839f1f4f6..b620cd310cdb 100644
--- a/drivers/input/keyboard/imx_sc_key.c
+++ b/drivers/input/keyboard/imx_sc_key.c
@@ -158,7 +158,7 @@ static int imx_sc_key_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, &priv);
+	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, priv);
 	if (error)
 		return error;
 
-- 
2.51.0

