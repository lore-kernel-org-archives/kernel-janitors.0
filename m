Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012B812B93
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 07:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709535894; cv=none; b=hDxwBjSjB9KwPQX5zaoY7FXmlGAWL47M6rk014D73fwwkuAyCBrTDYmc93jyoYViSz8yiG6OWWaJO8hy77B1IIMY0yM0kY89vYzQa/8zLXVeFrEetm88Qpeau8muOMHTpKO1OQwOQVLOM0vYj/rFxZxs9nhClc5VLxNL0AZjOt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709535894; c=relaxed/simple;
	bh=fOzF9T+7+v6nbIr6JpI2D3fB/kcAd613CX/CdSkUuJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGbFkzZgQWiGsmgiO9TlJ7foBgiHACSERLmAD0L6l7aDVu7xMgYDBTkqeh2zZ1It6M6uEdrJzBYLnQHNebFlSSt8+tJOrT+d7pKTBFXR8bNU9Ehk4UqPNl5VUU/J7LmkItCrRO1lMpdJslMn6G3WFgiDv6NGP1xazAEmxHrh1e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QqgxkHIn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QqgxkHIn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33d2b354c72so3133916f8f.1
        for <kernel-janitors@vger.kernel.org>; Sun, 03 Mar 2024 23:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709535891; x=1710140691; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RTu2QOOVQbOweB1LGR/BRbdQUT3nXvJVjgo89rA8a4=;
        b=QqgxkHInV4+gl4HHNp17XXNyik/Bcn8YA+vnUVHB2DLacIH2Gwt2E8Oe5Q4zouwm6+
         C5WexYBrTa6PQ/E49dwt2JzHQ7n90zKCsshi0WG6JhiMtvF53EYTLYAaBK0PXlYbjrr5
         haP3oJNHMlFC0HeQAVchgCmV+pTL2HAYvVCYmOAw9egIPE7bZg4yCY1hANdokMsbpZPn
         d9+BsM0pxdwB/Q58Fj9UT7YOUjyL1fStrbeLEpYVs64XEgGzRcmRASN+aPnzfAGBU4tg
         0wr6yj6TjGQ54DWlDFcw2Dl5IOgpidxYzUPqq195CVNevcL0riPNHmF8BR+qzSLBnN6V
         TXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709535891; x=1710140691;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RTu2QOOVQbOweB1LGR/BRbdQUT3nXvJVjgo89rA8a4=;
        b=gt2OwIparn+xhTicN+8dYrREcSz+YMT/gbsogwH3MpVPHoIEj7Jlk3aW7kTPy4xteu
         dI1tjLx3SN+rbEfQY4jLzK4gb79EszSyCjQK/Ks0MTyVr9rs77UerUmMtYUAnyIAtRuY
         sNT1RxnKWvnv7OXPq0Wyl08JoFHWY2xbYAlylR82eQerQrMcFNhAOy8InTNspCSMoFL2
         PTzFIdRSiHZnj6iK7aDx1RHBJpI7aMfKCqhsLoni/Y5HVLwZWbm5zFsGrhd7OfyMHMz+
         bwMvLvRjwjdPvRNuTT62rUcWlswQx6ZxzBLtfRqY+dsD5l7yyvi7qI5VZw0KTQF4GqHO
         Z4eA==
X-Forwarded-Encrypted: i=1; AJvYcCXHiY5HrLl/e+uyeyew3pd4KE5lGNz0DSRsLAiHngtCbla+G5WPrjt7bsJ03cJfOU7V3msrhU/kadh6diIgL2Srw05JLr4xrJNYvYRrFYhf
X-Gm-Message-State: AOJu0Yy/PFOFjD8VhmzwJKz+tPViN0CT70Lee7oif+67NzkLefrjvdSN
	P6VBsfeqhXBMIMRdErty0ulOUPqpZc5sNEsWNl6ru/HtfRYecs2EcxpFSSbfP6Q=
X-Google-Smtp-Source: AGHT+IFc4xUICRVVStYlfPV57gzFOOaMSvfieW4xk8n3smggrfWI5KpXmkdHe/qcd3sZ3tLX4YTRXQ==
X-Received: by 2002:adf:9c8b:0:b0:33d:47d6:c159 with SMTP id d11-20020adf9c8b000000b0033d47d6c159mr5733432wre.12.1709535891433;
        Sun, 03 Mar 2024 23:04:51 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r18-20020adfca92000000b0033dcc0d1399sm11375456wrh.25.2024.03.03.23.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 23:04:51 -0800 (PST)
Date: Mon, 4 Mar 2024 10:04:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: greybus: fix get_channel_from_mode() failure path
Message-ID: <379c0cb4-39e0-4293-8a18-c7b1298e5420@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The get_channel_from_mode() function is supposed to return the channel
which matches the mode.  But it has a bug where if it doesn't find a
matching channel then it returns the last channel.  It should return
NULL instead.

Also remove an unnecessary NULL check on "channel".

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/greybus/light.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index d62f97249aca..a5c2fe963866 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
 static struct gb_channel *get_channel_from_mode(struct gb_light *light,
 						u32 mode)
 {
-	struct gb_channel *channel = NULL;
+	struct gb_channel *channel;
 	int i;
 
 	for (i = 0; i < light->channels_count; i++) {
 		channel = &light->channels[i];
-		if (channel && channel->mode == mode)
-			break;
+		if (channel->mode == mode)
+			return channel;
 	}
-	return channel;
+	return NULL;
 }
 
 static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
-- 
2.43.0

