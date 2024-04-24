Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624BD15A4A4
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713959015; cv=none; b=qJdEju3+DAo2x7IFIN7Wd0uAlbADDjPGbcDQFETRXK51AZe7wHYYEBRkzFwk5E3x3R6LU+dKSuelFTTOzLM07IC7wETgbQ+lUIMiplreHyvsFFNliOhFO2U2FCzMY56Cbbzm9B9KLlj6u/UUU32SVRuNDbBBuF4e1GQyQc8qCFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713959015; c=relaxed/simple;
	bh=3lahgNJKWCq8KC5g+5ZgzQuCAxnQjDYOSrfMMIwSLEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9a46MXvTwVSdFa4aycNBeIh96mOgbkpWnDFRnZRlZctn1E2q1ZfZYimKUwD9Do/0+Gp89F/wBdbhDit07zZdOqS8MK4qOGVdWzMT738o9aWIyxfeI9zQIGGSZcTKaGAmAFDx8LKiZ6cNZ55RoEsrqYEDAT201QVCuxbYn2POmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9ciplj1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9ciplj1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-346359c8785so5605209f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 04:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713959013; x=1714563813; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=enk6u0NWo+HjAlsfAsaG/0BOtgb+vI9MCBxWfkbUG6A=;
        b=S9ciplj1WmOukhP37Hp8Wrm578H09XEQ6GyoP0T+kl/4SRcQpWO088i6qjB1hmz/oT
         4AEF7pmKVJBvWIyhmU8JAv37zT9qb9EpIp7s61fjkBK2yUzDb6KFstt8/T25WCm5u259
         XZxNUZwiJoB1Nq7z8PhqP8IxswDY5wW/2wUoOrGuW4DzhgPna4i5SYPdAHgBDbsTSqQE
         4ojj7oNpcPy6fR/r5ZVHL652uyuwFpo5hwoMOblezGfLdd/fYR+HHxb9K4NAlD+wU5dh
         qU5bttUk2Is5HTDlLz07+vYDfp+y6ChV3VGLKB/zUnQPirlFd3De1BfzGbAlpDKnaduH
         jUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713959013; x=1714563813;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enk6u0NWo+HjAlsfAsaG/0BOtgb+vI9MCBxWfkbUG6A=;
        b=o3jZRd3LGYZv6Uq0RvBTV0hB4CxErQLhTMYuorg5sdB78EE7lY2fY2DRDFjhUYNsAU
         ukc/WZJdSI7F5+WuFSM2gZg8k7q5b7sk1ns4qx1T6S/Cl8iZwxwEJGlDt3H7+5kxV6+C
         KvoPyxZvjSvMiYqFbTWPG7734wuUnNqpGFFVfym6/10cAuaFDAfNCWzrg3Q3XTZmvd/7
         ZWHj+nNc/fbwClpbF54Nklbc5hX9vsn3biYM2ydS2qA3CJ3m8RM9KZ7EIfQ2FvMxNPbV
         2RhQFEr8+fWFWHHVmd60HafkbrvnP52Wmwt7YM3agmwNlGVrX50v0OTfivPTqk1wQibx
         IxNw==
X-Forwarded-Encrypted: i=1; AJvYcCU6biHdJHfpyUCMn6IG76nzmFzyV4yKaFYKoki30lqKftTc0o494d72ZU6idQn48hP82yK/fJnjcGptpkxtnpOtPbbQFsIJRSdwVI00ci14
X-Gm-Message-State: AOJu0YyRzFMeuc0qBEOtmGmdFIz61uOG5Q5QQQ7KbwPSvGmqXxIZmOx6
	Mee/g9gq8x47q/Jy6Q0ZRQZyGiPLva0V9NMJiSbc5bT/UkOLyWH2VoG1nNWEB1c=
X-Google-Smtp-Source: AGHT+IF5vUsuDt3b5kATjhz13YwMUbFsgUZ7ijQ1OWYZHfaNiPIFT/g4J+dEvQgjMaMZVRjTozCIKQ==
X-Received: by 2002:adf:ef43:0:b0:343:4b39:9dbc with SMTP id c3-20020adfef43000000b003434b399dbcmr1447812wrp.42.1713959012474;
        Wed, 24 Apr 2024 04:43:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c1d9000b0041b0d4e1c27sm1442161wms.42.2024.04.24.04.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:43:32 -0700 (PDT)
Date: Wed, 24 Apr 2024 14:43:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vc04_services: Delete unnecessary NULL check
Message-ID: <526ec2ff-6277-4d5d-b2d9-63b087a97c7c@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "state" pointer points to an offset in the middle of the "mgmt"
struct so it can't possibly be NULL.  And also we dereferenced it on the
line before.  So this NULL check is pointless.  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c    | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 9fe35864936c..3c63347d2d08 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -1170,11 +1170,6 @@ static int vchiq_open(struct inode *inode, struct file *file)
 
 	dev_dbg(state->dev, "arm: vchiq open\n");
 
-	if (!state) {
-		dev_err(state->dev, "arm: vchiq has no connection to VideoCore\n");
-		return -ENOTCONN;
-	}
-
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance)
 		return -ENOMEM;
-- 
2.43.0

