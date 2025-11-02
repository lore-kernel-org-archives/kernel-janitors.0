Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E9E26E6F2
	for <kernel-janitors@vger.kernel.org>; Sun,  2 Nov 2025 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762084769; cv=none; b=ILIIgaAJS8ikdnlTx8sq3VObxNItAPSdayn599umcw9yr0ix17w6LOTuEVn+O7gRyPx6sVon28avfJ4FHRtGGD3LDxNkWMRWGaHpnUE1qavpba+UtrABXc3LyRzZPAsSHiONqjBaySp5cGaPrMJ7Zx14P6zOZR8p8l6G5QzAJ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762084769; c=relaxed/simple;
	bh=hpeBzxEihKqcYDLSraTGoETkRiM4IsrmvQC8etRPW5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IcSKGZplfMAvzhIhuyIIHtpVo9EFDt0yaqXtsqnpic/Wp4FgX4JttUuCEBMjjCfaUoxrgdyCbv00NhV5WFTLEjnNEg9n+0+T2zvYIVRszFQz1Ki3n8zAtYhbm7zedEYLruL0DV9SgewBpJ5pposUm53cEES5PdNregzJZM0Buv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T/C/C8dR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T/C/C8dR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so1891745f8f.3
        for <kernel-janitors@vger.kernel.org>; Sun, 02 Nov 2025 03:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762084766; x=1762689566; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OnVbBOQKvp7iEa1IOf5Rt2UqmUysOa/t2FpZVE9J3gU=;
        b=T/C/C8dRW4W6oExi8DR7HFmE1aiP7WzZrToSTaPs/GBSZ9w5YPMs06yg4KzDW0lhij
         NZ2AhS0b2/O9puqFNPireXA60TrFzeXkfxdeya7W6MYZW0C5pS0Frbmzt4czUFY4jvRN
         G/6Yq0hJLd2adyk0AgbSFu8kUQ8sOqJMIIZPXWiTMHgmxQD4OBwjiLrAUIOJ2LVWD6PQ
         PrGvgf+H9sg6u+fKYAlNZceIqZCeBqqWD+9EE9y6KMVuSWLff3/6+3z5iGKXekzu6ihl
         p+ZXonpcjXPAZg+xPk3PEwcLnD7if0ZVaV7YpNxzzlOFgV8szorU5tA3ztfZnDIUgU5b
         Rpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762084766; x=1762689566;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OnVbBOQKvp7iEa1IOf5Rt2UqmUysOa/t2FpZVE9J3gU=;
        b=rYqDo4WgXAUwrBa61twnGqTW5/9iQfraHDdpgsHxVWLBhmQLojjzcj8sAK6ahja/tp
         Y0xw+GzdHFnUWM9yfxirFuqpnVd+GXBpDaVZJttUGaGiPd/peMQuc3b5KjzsrxcH6mhk
         IMM7GV8QAdQztfuIm9XpANVgy5P4MZUMAnokOSFhPJc/WwwSrVgJVl9F+62onuLr0Kcl
         gZCt/RnzPgTF1gCMI6xp7hMdKnbOxh7AP8ZjNGkK1JH6Vy+ZO5FrGQCDbxu4VFJAbb63
         +OX/vxhEONnnn1TCRmf1ooRCazmmfhfMDcR6l8ViprhKrlY74/u2BBomT6prahpDEW3A
         gtLA==
X-Forwarded-Encrypted: i=1; AJvYcCWbjUW/Z1w3jMCvzhOMf+R7Id2ZC0dIqutYdnryIgJCtHqfySo+3MKBRblol7PI/WSe4/pJqWZ7pnZbBOZgF1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5+K10DjrU4SKEFGBAmyXGL/eBOmx5eiz41akt/qwJImp7zcRl
	AiPby4Qm50IKlY8Ph1PqFYae1XWAABgUKiBDR80CTDc9SdH8WIG8JMWHPUWyNXsf7VE=
X-Gm-Gg: ASbGncsWPsCJfT8D8CFSVEPQrqVegPfkmjZBdJqZHvRJPZSo7okpdjJxvta2qUz7c9W
	NjPfPjvaukejx8ydaBJCCoT7wP4VgVSlP+dbtWRecSpC7UspEwrUQ7jKDFTvIIzOTxbKYu+hybR
	T95+K4NCufQCNWoj7AkBe8p0YLQXjIHgmVeqaxuUkdopJJB0GoPanCYMdhtey1BnmeA4sQiqEKH
	bb9RkLLcHs4Z6CjcOVR7mmYVry9tzW1mIiMJGjGqRrYmPn/rKw3R1KWJjREweK6BhBMs0xVUZwm
	3DPgln+/8K73n50BMeYD6nguQTNB8givp5bcFjZr+sY/Ecots48pdU3WodwCWmuI6SKZaSMu5l7
	qf1PWM+FaI43lzB9QH5QFrASa9W0LYeu7+D+yeuMpdMTAIQlPYmskkeqjBC8/4qC/IyUDTAvFga
	G/KRgYhbRG1PA0+9V7
X-Google-Smtp-Source: AGHT+IFXAmD1Ur8kjRz+0QpWqdWQSLUUmNESuCE++DroKu7wDH1qhIW0Z9BCyFRWINAFWXSCUv0Xwg==
X-Received: by 2002:a05:6000:4382:b0:429:bd09:e7b6 with SMTP id ffacd0b85a97d-429bd67245dmr8378115f8f.10.1762084766143;
        Sun, 02 Nov 2025 03:59:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c1406a45sm13910629f8f.47.2025.11.02.03.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 03:59:25 -0800 (PST)
Date: Sun, 2 Nov 2025 14:59:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>, linaro-s32@linaro.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: [PATCH v2] mfd: syscon: return -EPROBE_DEFER if the syscon is not
 found
Message-ID: <aQdHmrchkmOr34r3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These days we can register syscons with of_syscon_register_regmap() so
when we can't find the syscon that probably means it hasn't been
registered yet.  Return -EPROBE_DEFER so the driver will try probing
again.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v2: In v1, I added a property to the syscon yaml file, but those changes
    were not welcomed or required.  The "syscon" compatible means "have
    Linux create a regmap for me" and my property meant the opposite
    so it was kind of pointless.  So don't do that.

    Link to v1.
    https://lore.kernel.org/all/cover.1761753288.git.dan.carpenter@linaro.org/

 drivers/mfd/syscon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index ae71a2710bed..e5d5def594f6 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -183,7 +183,7 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
 		if (create_regmap)
 			syscon = of_syscon_register(np, check_res);
 		else
-			syscon = ERR_PTR(-EINVAL);
+			syscon = ERR_PTR(-EPROBE_DEFER);
 	}
 	mutex_unlock(&syscon_list_lock);
 
-- 
2.51.0

