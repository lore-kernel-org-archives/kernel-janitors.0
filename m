Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99417A2F8
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 05:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324661; cv=none; b=CAxTOCWZaTfi4b7+uv7ct6rbhs0a+wnQIU+P4dxuO16dTdW6GVHSo0Fzn/Ta4ijW0G/5WQt6w0gBc8Ei/a2rxUkagn9CYjqQ0A7Mp3jkOVfdSCuAUGnE56ENQNeKojZci55kmw0lNhR8MgTkAOlX9FC5QDO4cLDeUxKZZHfsKyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324661; c=relaxed/simple;
	bh=kyCBYxH7qeEldqqPRBTiasx1ddRJHWTby1mXwGA30Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+A8ivo2KeBvf6dtxzvuOuczAr98SfyYo36qAVLqElMRI2vBufxJWviYzYydO2ywiamnQh8ANym1bh0qtyMWkzOgU/JsinIIY513hHLwHLOpve+no/fXpJh+Kk1/AZSybIouUZPTSxPBW9mLecd1zuVRvI/moNoauoAMsjiHoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FRJdog+i; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FRJdog+i"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so468901666b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 May 2025 22:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748324658; x=1748929458; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eUL8lDW22vLb7RElzsLP3i8M2Oe2Xcske9JV5C/6kUQ=;
        b=FRJdog+i5C9rTNFQQRXx1XIPcPhMCarQH045+DXvxAW54Kux5KP8mfk/0JyGrtMkBO
         9/bZmw+FlznDOpdOCCFmp4HuWZ+B9NDtg5FkA/hV4F9gR3sZt5PTI7PlPhKU4Y9aEnfx
         ZJTk/YURVKQ1rrd4/QU4pMwZ9ztNTQEs4BEQGbT11bUo1xS/qod57XCxAG6WwOOR06uM
         nzHrbbXvYeGAkAcJtrgYN1cILl40RuPYuD6JTZPnMYOZzT76KAXCJjnA/6xL9LAWFfip
         SfoeJ+VAJMy0DQAqd/yT7l4k+aJhnuqmHiCuLEANOVdxnB4P834CRLNtXubawAWBEgEo
         bshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748324658; x=1748929458;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUL8lDW22vLb7RElzsLP3i8M2Oe2Xcske9JV5C/6kUQ=;
        b=kYDlXEjGsQHFC0WfAlFG2PHi0UduuOhTW495rzBdxWwN18o5NW0p8/OjYVSzc6uPAH
         ZnxTjMXLiTJyuhaAyLIS9hv0WXUUfb1XhpvWq2ReEAEuBGYE6NQ0IhCvRTtab/PPCnfb
         6npwXMGW3gp599aWpdKo6GILGkQyT46HhHZ1Y8NUqC0aQ/i0gvzr5Hy+p77u5sn9zBLs
         OmjPZBS11wH9rsh0uA+Ij2sPYpd61YxUmbAh/RZZaGRFpkx+8354FogsvYFC1GWe1PU9
         eLoZYrqk4uCduLU1dbnr2cTjs1JQ9KG8zdpS/4GbzjSd2SgYbcVfltYPo6IziX9ycw0P
         x5yg==
X-Forwarded-Encrypted: i=1; AJvYcCX4N79OqnJYbwF+0gt5j0D9moKXKi13zdNNuGp2oxIBKWhDWlGQMtCF5Jmu7laB7EXHmceuGCn9MPaVj4cMrU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM3hhwaWidEyIT81ZS455Gl6Z3rS4kFsFiZMTJcQ9v43SKdwID
	3YfBKXh98R+HmjOZoshi/3H3mFyXSFn/mT1ox9+1hlJijL+ZhUy+kfaLLsiDMIGxDlI=
X-Gm-Gg: ASbGncsJF0yEgfHWbzDEUzyKzG8PY40OWu+9yB3TaosF8znIs/lcjPA6mLAn2Fh4Jlo
	S+QzUH5TX4/92X0d1g1tWTnfQ1UPvQwgCANWwQy2e3g8iq0txchrdnCvOEdwy0yn/1K0BdlAqze
	ct8WcTp1m3nnbgHUzdhC/MRgzqIXWjmKWocfpiEwy2xXZVKw4Jp4S9EFc14DSHlAfDVB4vuj7EW
	W51iAqq9EYPprjPu7xrpeZBl2DWF2Ad7+mAkzQoVIWiIjcTl2swYC6ICcOx/l3BboX+LxqLdt5c
	ywnP/Ep1x9enoJxcej4Hy6bn7uEfRTguxDpM4iCUMidw5PDf8+IGHwLxfGsw5DIdYex6RcqKYWS
	Q+tcHKAe7ag==
X-Google-Smtp-Source: AGHT+IE46/UjJ5dKUXhWdkEtnSF7wnOr5rN4gbE3tyVKEXYOZCsNu8RVbstqI21IkhEz384O/W1Jhw==
X-Received: by 2002:a17:907:7207:b0:ad8:9428:6a32 with SMTP id a640c23a62f3a-ad894286ce1mr15686366b.26.1748324658434;
        Mon, 26 May 2025 22:44:18 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad88d0556a4sm62772266b.34.2025.05.26.22.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:44:18 -0700 (PDT)
Date: Tue, 27 May 2025 08:44:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] regulator: max20086: Fix refcount leak in
 max20086_parse_regulators_dt()
Message-ID: <aDVRLqgJWMxYU03G@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a missing call to of_node_put() if devm_kcalloc() fails.
Fix this by changing the code to use cleanup.h magic to drop the
refcount.

Fixes: 6b0cd72757c6 ("regulator: max20086: fix invalid memory access")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/regulator/max20086-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
index b4fe76e33ff2..fcdd2d0317a5 100644
--- a/drivers/regulator/max20086-regulator.c
+++ b/drivers/regulator/max20086-regulator.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2022 Laurent Pinchart <laurent.pinchart@idesonboard.com>
 // Copyright (C) 2018 Avnet, Inc.
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -133,11 +134,11 @@ static int max20086_regulators_register(struct max20086 *chip)
 static int max20086_parse_regulators_dt(struct max20086 *chip, bool *boot_on)
 {
 	struct of_regulator_match *matches;
-	struct device_node *node;
 	unsigned int i;
 	int ret;
 
-	node = of_get_child_by_name(chip->dev->of_node, "regulators");
+	struct device_node *node __free(device_node) =
+		of_get_child_by_name(chip->dev->of_node, "regulators");
 	if (!node) {
 		dev_err(chip->dev, "regulators node not found\n");
 		return -ENODEV;
@@ -153,7 +154,6 @@ static int max20086_parse_regulators_dt(struct max20086 *chip, bool *boot_on)
 
 	ret = of_regulator_match(chip->dev, node, matches,
 				 chip->info->num_outputs);
-	of_node_put(node);
 	if (ret < 0) {
 		dev_err(chip->dev, "Failed to match regulators\n");
 		return -EINVAL;
-- 
2.47.2
