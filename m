Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C02227BA5
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603726; cv=none; b=o8h3WX8JflV/HGLH0k225r5sgxYMvM0klWDWDumVDbG0X50CmS99lGGroD5/Xp4FZQXeYIAVqXv9d8RrvK0typkcAHi+LiSP5CU/N+U+iHIjgd8ccm1xwbslRwEhLU3Y5xXViUVAKzUPlETAJM07BJfDLMn2fxg4uXpF7mfJKtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603726; c=relaxed/simple;
	bh=ThNQa8FfIWCfCjBqxfnY7Y6HddW97gUTMSNhwoQo/9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cHIGovU101HJLo1nl3zAkOolXFNE8a4nsLDHQNr+0B6htPDpxO5tUDw4P7YuYzsfX4d7zxknkpg2NlfuzT6mQnpeXxIRtOoDn4Uq1m7EORmCjeEMilghsJD/iUVAQtcK76esQJIGmb8lguF3w00woJJjHMr7QijzJKBvKNe2bLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QCwiqut4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCwiqut4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso23270545e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 03:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603722; x=1742208522; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4FBTBE+KNOkM+Qcs2aGG4D+zzTC9l6YOpjrjTql9Ko=;
        b=QCwiqut4grrDAhnmpyyWOGtoPFSLlO6LwON7v336QIUYd6H34bIxpWF1qu4Cj5u6Gu
         D4exXJWcPTqAN/BTxUscdwV4Tm6W162STr8QWJGPyWznqJXEMllOCwgQ8Q1XegGwhWXQ
         Kqf0pjumGWzC6WkyHEgyvIlWbXhHLrN0zUfSBYSvuUOHtumBcwWb2kDmez9mYMwadwze
         j7Cpr8cnrCvJj4ZbGQ5G1/KnnSwSP+pgnJvTbnW6SRYt3RNzppGwxwXkOudvDzqChLZI
         uAKKBdNTbqIiIpvT3FPBiuKdJh7ETxQ+G2J3OR1wWDvb+m6WQuisczeh/lYtUjtw3zs7
         /zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603722; x=1742208522;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4FBTBE+KNOkM+Qcs2aGG4D+zzTC9l6YOpjrjTql9Ko=;
        b=vBWMp3Jel+dw+MyZIrzlyGS13UfTcsI2p7NPcaP32GQtIP45ddFgCh8j8GoBIgRbL0
         VEEeRzqIQma56j/H5FFIOFweQVddd0tTlKqgnBhqSBSpWZSPY+pwd/0nCvJ/g58afbBa
         QC1W7FOVXfDYOs0lT7lBL9DiSNRWiaKSQ54h4DDZHSuCOWw9b0xPysrVe0PjbC9+XVNN
         ZBY8s6U0iY2CxwJim1UdbdJ4V0RtuQONw9IARKgjRCgq8dcn6pToGQaRoDdtbRKRRTEa
         K3BihnBZ4liOkSoBG6SKzrjHNrIarM64Ily8xveVdAuTpTgG8FNRh80gkSB4KM2B+10d
         8s1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqETITZi90fdXik6LW43z/pNPm70C58ndQqatGOhhxQJeCjGBPdHjFDfDvfQFgZ5iH5H4Jlm/fV6XXjKuS4pM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYdmHsUj3/kDOxtZGvz6OVnCAHL5GscoEHwzho504qD+Mb61m
	iVlpdUKNn8x4XaSIJ6yvhcjTeY/IPTzlvx7Mxc/mOmCUmRqVXBgFBUetXsPy3Gw=
X-Gm-Gg: ASbGnctBAra1ZJmYUEZ/hke0R/Ze8uAKNyw99hikKUYI2ldRjWVfazZXULQsq92LEQS
	BeS2Z6haSFG+fvOzLuqaTri1DjWDNRvquwUY8UXY9UZugrkk8honciZg8jcVygiCggJYtPJGyA8
	8vxzSW+7SZW71EMheMnuvQMEATWemp5sBGbiOGnL99KR1JpbiiR0eztLb0KEPJ/TeYLLKP5eneh
	qdOG0dx2aUTWMsK2deEDUOQOOdFcH3/cBk61Sr9KOc5zRRrfJOU9w0wC6gNx7HlJnOdQ9n3KWrX
	rXLi1S9209y8h0DEurBcPRqn3Qzy66pR5dhqeDB8N0cT5kUtdA==
X-Google-Smtp-Source: AGHT+IETFwDZNdnH20Q7Y3z4UlrnseZbh1WDkk70tSsdvhJaGXXT+NyRi65tIbPyOgQrBEERRB/G5Q==
X-Received: by 2002:a05:600c:510d:b0:43b:c0fa:f9bc with SMTP id 5b1f17b1804b1-43c601d93e7mr74449995e9.12.1741603722155;
        Mon, 10 Mar 2025 03:48:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ce3f573f6sm57354855e9.0.2025.03.10.03.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:48:41 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:48:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: bcm281xx: Add missing assignment in
 bcm21664_pinctrl_lock_all()
Message-ID: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The next line checks if this regmap_write() failed, but it doesn't
work because the assignment was accidentally left out.  Add the
assignment.

Fixes: 60d69769c851 ("pinctrl: bcm281xx: Add support for BCM21664 pinmux")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index 7c8f8bd7da12..9ea20fde3a24 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1498,8 +1498,8 @@ static int bcm21664_pinctrl_lock_all(struct bcm281xx_pinctrl_data *pdata)
 				rc);
 			return rc;
 		}
-		regmap_write(pdata->regmap, BCM21664_ACCESS_LOCK_OFFSET(i),
-			     0xffffffff);
+		rc = regmap_write(pdata->regmap, BCM21664_ACCESS_LOCK_OFFSET(i),
+				  0xffffffff);
 		if (rc) {
 			dev_err(pdata->dev, "Failed to write access lock: %d\n",
 				rc);
-- 
2.47.2

