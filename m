Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DBC1A3BAF
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Sep 2024 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725998147; cv=none; b=M6JXr/2ZSxosPOdY4aYVm5ojD3iLgeM7rG27Sn0UDG3RCt+rv+dzabIuqilgQ/A/l/ULX3V2bdqfi7C/MBVcMNceRuRt5nk253Pizx7hVViSaSfn2tGX2JUKt8ULyElmPe+R/BxhwmVv/85nl/mwiOglXDH1Oal5bNgSwSRX/AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725998147; c=relaxed/simple;
	bh=SQHIuWB8On75QUniwMi3d1+7+u2v2YJclqur56rL6T4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KCldh1KVrPCLOadI5mGzRX6kaUZY50Lk8P9+mgNQg9hrPQW8/NN9iUvSQA0bvaYt1fna6VofEGtwavCnk5XO9iWduuWjyDr1N9Wm0O3kaXIc/fANMBBBjdA2SWGOK00zGAfcb4FmsjU8khMYJWM6gwCtHna2kZEi3TweoykLrJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zb7Ejeyp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zb7Ejeyp"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374b5f27cf2so3534518f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Sep 2024 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725998143; x=1726602943; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CQFJR5ldJg+nMN/ogmBfSjMRxaDfVrcsotYh01hJBg=;
        b=Zb7EjeyppXDcAK8U5kNI84fgK+WEG2zaPkOipGegQK6pSL3J0wS4F4qO2i2I86K04I
         K0gOWximOSqDkBPf1Nm3EEPYQ0M8HUgQkdkuig4d+muBsAYy8Owsw7ch0QI6CpuxQhsy
         X6pISqGJdxGMBBsXPof+kNz0AMiSnxnso49OjbgI3kVfgTaiapKxijChgOZAtZr7c84v
         ccsCW8PljBU7U4/IzhW7yVkxamTrUejtOf4apq7YxhgNr9uIdaNBtR/E9Gg235X3Khv2
         ShY9Ev0NAU6CFPhO41/vP0oVpEa5u/DhViIqSI5++mq0zM+X5HKY0Yd/wxUUvH9Bv1cY
         RsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725998143; x=1726602943;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CQFJR5ldJg+nMN/ogmBfSjMRxaDfVrcsotYh01hJBg=;
        b=IfNTqVvxWXn59fDrGDzdFm2+zM2jYZDj1QbI0b6lqhWRrGt1ot0B7BkHMRqEvC4sf0
         3zR0AkZgRl7dEJACvZ5hjfyq4RXlxY0AKNixwWarVB/osFCSzNR4K+D/L/bV10mLngCk
         rsWAZnmYBDmYza5bUbpJEr6By9/boZlduLncZB5HIdKC7iTx1Dj1+xjLI1lBY/LYZ2je
         cSQRnI+ng5weXvEJmTik9gnX4js6nmBV9fsh3M4OJbzvxtGMotAf/dQFvgOTHGyAri9g
         WEZESoPSbYF4LzqO5GDVTyXDowyloXJwfqOY2eqr7aVfidqvcdV/Ppj3RldthPo04APe
         7Nng==
X-Forwarded-Encrypted: i=1; AJvYcCUqfXJO8E2qRodB3IDnDNWTSURNUxs3d0jVxpeVPK6T/LxrLUwTQvMJNe1qdbxqnEtdmPOSDM+jZm2SjNMo2Bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyVDC+Wbjf1Ptmb/F49RE+Rl7twETvY6y3kf1xsQ6fvFP7Lsng
	FFf9D0ziI4izi3+EyYvssLCZcRlF2VbG3vHAJSxx3B8r+tSGnj64jDOT9sZxwr8=
X-Google-Smtp-Source: AGHT+IHfa7an1E1e45tkw7rHMrJLHbG0XUJoGGSMzFbF9+pV358YwqYsahM2BcKviwirPqbq4V+EQg==
X-Received: by 2002:adf:f64f:0:b0:374:c977:363 with SMTP id ffacd0b85a97d-3789268f0a6mr6925506f8f.24.1725998143221;
        Tue, 10 Sep 2024 12:55:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de262sm9687135f8f.112.2024.09.10.12.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 12:55:42 -0700 (PDT)
Date: Tue, 10 Sep 2024 22:55:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: qcom: camss: Fix potential crash in cleanup in
 camss_configure_pd()
Message-ID: <7883f30a-0646-440c-95d5-937062ce10b6@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function calls dev_pm_domain_detach(camss->genpd, true) in the
cleanup path.  But calling detach is only necessary if the attach
succeeded.  If it didn't succeed then "camss->genpd" is either an error
pointer or NULL and it leads to a crash.

Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain specifics into vfe.c")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1923615f0eea..f4531e7341d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2130,10 +2130,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->res->pd_name) {
 		camss->genpd = dev_pm_domain_attach_by_name(camss->dev,
 							    camss->res->pd_name);
-		if (IS_ERR(camss->genpd)) {
-			ret = PTR_ERR(camss->genpd);
-			goto fail_pm;
-		}
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 	}
 
 	if (!camss->genpd) {
@@ -2141,13 +2141,10 @@ static int camss_configure_pd(struct camss *camss)
 		 */
 		camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
 							  camss->genpd_num - 1);
-	}
-	if (IS_ERR_OR_NULL(camss->genpd)) {
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 		if (!camss->genpd)
-			ret = -ENODEV;
-		else
-			ret = PTR_ERR(camss->genpd);
-		goto fail_pm;
+			return -ENODEV;
 	}
 	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
 					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
-- 
2.43.0

