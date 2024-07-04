Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282541AEFFF
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Jul 2024 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106408; cv=none; b=alYBJ2FQc4OJ/MeQhAwTry4hG7Cx3qu5R7PoGtsJVnru+vc5soWyEfdQiX4XeozoD8f0ZdTMtQrhqT6zv+yx1OCA/og9aiKSYl18SCZpu2weaGWDpmRJljMd1Q0UyYNX3dV/KsZ4G/S84+xWMXnWnPD7hwpPI9VsBowflyfFVK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106408; c=relaxed/simple;
	bh=LRBnNjsH1CyBlK27vH4HjxzagefLojGK6jhHT2bCEms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IceWCq/3gnhTYi4wIMcHoB1Q/kB2OkGps6SjuD7ZzomomhlKfC2KyBiL9ea5uU1R6ZA1be9a3E6SILea7ttlIoPdwzpsTd/q6CIgupuTeP6MyMKdeMABLMpgmn3cNuWfj1PzqBJg528W9X5zyKu/PwIvEUJK3JezwR03RgVqQ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EBoYolrH; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBoYolrH"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d850109679so433938b6e.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jul 2024 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720106406; x=1720711206; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3dDOkW0PAFspV1Nsbjh2zbZUyCnV1dEkHmg1HqSY2cw=;
        b=EBoYolrHK3eXkZb2Sao25jmck/Pl/7AVO4kE5vMnRJWfsRHW6YdVW/k07p2yCICN2i
         vYiZjs1W9mL1xR9titcWzYBHRhioXIAP4qsEPe8Y4sAhTRTcgk97ENSwMZwuruRi7Dj5
         lV3kXswDzJA9eZsEWHsZPfn8oA09zpuQjEGRwCcf67QVIxu3P+hbeJ6i/psQXBMHWsql
         lFPnO2i4dJsNgT7pijHNXyqCCICJw3OhXFTpb5XZvHY5R9VWnXdvHy/SHyagVncHThXl
         mRPnDJEK29sn6b4CXoze0hIiyyMYqG4jDb8Xvfg9Pc1MrsthYOhKosj3N12lGaQCXme9
         DD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106406; x=1720711206;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dDOkW0PAFspV1Nsbjh2zbZUyCnV1dEkHmg1HqSY2cw=;
        b=O91sjCO+aed2VuPeivh1Yj/mT5/zGB6XyrnW623JFNaO5ZCtt7WDKWFFjdp4ov0LRb
         kBKarV5x46p3iCyE3nXwxmacU9OHlc/OiID48d5xIdLqzvMeq3m9a2fZttOEfdJnP7Kg
         mow7YnLbHv4gR0Ik+49GoyyRwaCOETBUjJjcnltUoxmyKfxU5Q92nV1AHhMxRuTAkSZ9
         uUU32g1Tuy8NgFLLWnK2WMGg3NZYFLFys2iNkka70ni1mleJlTuFjLs2D4xzFWLBu2SX
         bPQKYCvGgGSk5kmKfmJ4n66B286dYf9sked9NTa/Vgk0CaM833p/oOX2HY4L6O3tb2YJ
         tA6g==
X-Forwarded-Encrypted: i=1; AJvYcCW9I8OKEQD96yynguCsjkrgqyOBeFxPvFROu6jLm4OmO4j/oDviZnvyHNvY3tGFAmqBNWadVcmaPigJx7UyKEujnj3xPyfMJWE7MfsNDEdk
X-Gm-Message-State: AOJu0YxSSvsV22vIipB775CHmQMWfz2W1pbwLhDwXAh0biCJm8i+4JDM
	t4DCaCyqBH8rEh9lpEY7scc34yWHbRnXZ/5f92kcNkkMETyvecBtap7kYkgtQAtfozs2jFwHgoZ
	u
X-Google-Smtp-Source: AGHT+IHHk3pE4TLFr7KRVvJS5XlXRIKfpvIedOe6u7433gzwuERp8u/tr3qO5KeYVUGyta7Gx3L7RQ==
X-Received: by 2002:a05:6808:1404:b0:3d6:2bab:16ca with SMTP id 5614622812f47-3d915b0c6b5mr771492b6e.13.1720106406264;
        Thu, 04 Jul 2024 08:20:06 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:96a0:e6e9:112e:f4c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62fb41f77sm2484567b6e.51.2024.07.04.08.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:20:05 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:20:03 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Sebastian Reichel <sre@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] power: supply: cros_charge-control: Fix signedness bug in
 charge_behaviour_store()
Message-ID: <ZoWKEs4mCqeLyTOB@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The C standard is vague about the signedness of enums, but in this case
here, they are treated as unsigned so the error handling does not work.
Use an int type to fix this.

Fixes: c6ed48ef5259 ("power: supply: add ChromeOS EC based charge control driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/power/supply/cros_charge-control.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/cros_charge-control.c b/drivers/power/supply/cros_charge-control.c
index 73d7f2dc0fa3..3183a13eefd0 100644
--- a/drivers/power/supply/cros_charge-control.c
+++ b/drivers/power/supply/cros_charge-control.c
@@ -204,14 +204,13 @@ static ssize_t charge_behaviour_store(struct device *dev, struct device_attribut
 {
 	struct cros_chctl_priv *priv = cros_chctl_attr_to_priv(&attr->attr,
 							       CROS_CHCTL_ATTR_CHARGE_BEHAVIOUR);
-	enum power_supply_charge_behaviour behaviour;
 	int ret;
 
-	behaviour = power_supply_charge_behaviour_parse(EC_CHARGE_CONTROL_BEHAVIOURS, buf);
-	if (behaviour < 0)
-		return behaviour;
+	ret = power_supply_charge_behaviour_parse(EC_CHARGE_CONTROL_BEHAVIOURS, buf);
+	if (ret < 0)
+		return ret;
 
-	priv->current_behaviour = behaviour;
+	priv->current_behaviour = ret;
 
 	ret = cros_chctl_configure_ec(priv);
 	if (ret < 0)
-- 
2.43.0

