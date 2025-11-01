Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3299153BE9
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Nov 2025 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003625; cv=none; b=Mh/bwQRlHBBrjGfRZVJQztR4YCK+9qyocTLgtAmHWXQWiiXwhcGZPlIuvte2mXruOV7QRASDn59TPQ3Sg7uZMG4gabHNl90I5WOs7ecdBrFkwCWoIu7U6SGL24GxqR/ZcJZtctY4StfA7L9zPfFlBRcA+nyHaemWg8aU/sdohOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003625; c=relaxed/simple;
	bh=fWlbNlumtIJU8NMitW6PzV9ymTkF7fleZ1mZ6E3kFuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASSgo8r2ZhFq/m8VInR/qgLiyaFKeD2riqzgdoU34ewuCNLZ0cYAsPNRz2fMYi8F0BvPBS2MSvMkseKloOuLGyMbRRZP4d4DAoiJD94Q6pEqfTdTeDdfHolVOTJ0+Mpvh0TjdZ688Abg3U7Fm2JKA0i/5M0uGTpqQQyMPT6y6/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OeCsWzVg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OeCsWzVg"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so24816165e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Nov 2025 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003622; x=1762608422; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOljo+7M94iVLGqaAQA2njY3cBe7lZLjBtaF9D6zVHs=;
        b=OeCsWzVgfF+NDc5oR5yv2J0nyxO4AmTT+iqw5khA2+MbYRLxaB23hGLl2yc0/ybhT3
         Gk/Acjse9gghXVJaYe/Sim0lMguEsFapQAzbN2zLEdbwnsDMefzY/AW3iWaxcrOAfnoX
         LxY5klura+q5jUy8PL8igtFv0MXs6TKLhQirJa7s8UnjG2x/ToU9i33q2FFssnvHoDYx
         QpnSxoeRG98mS4qT2K6lgr6Ic9tC31NtDS5V20WWWbfGZJ6/bmEhQVYZZ5ldz1oS00jK
         s/mgceMlPwuoRr3zr76XQ+OVM/wYlf1uHDAEnj8vkMEkMzjdM6O7qkhz2TYsAEVSpEe3
         pIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003622; x=1762608422;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOljo+7M94iVLGqaAQA2njY3cBe7lZLjBtaF9D6zVHs=;
        b=jXSwZK0yMBA+GLUMWaGJUkTjsder76It6QHhUAbrrdB9YYYdU0P0VkWXHS2bSZ2fQm
         kPs9EWQZFNWx/M/+2j4i+RzzO8INKbAOxi7QAy/8UINh4467sIs1HZUIfDcSD0Ot4+uZ
         /t5+fMplVpb+3md7T2Q9uPjc2hgwhZ7wjAsZsASKSxquPUWkgXR6ERGwpk42AS3NOH0v
         VBHFazkpGtEO2qNDrKSdEC4hk5R5Higxd16M0ErD9L7jZn5w78tH3UpSSCzhfNl3BD8K
         eHMzwvRSblI25J2Ah2kT6xd9C+KkeOSizgY9DoBFesbjBxumD1Aso2oKwCaB9YPiW748
         3MOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqqP4kR/YKxyoW+TbXrY9n8mJGTW8BwAc8v0of+UJxiYA8jQY7fkYlwdeiAVmyl4WdnfxksT94YNJoX7nbmEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJvUGqokz/RzMLIpe1Dj2ESMvR6jcBprxH2/DHLdpF3eOCq1O
	qryJALuNH8BoIutACDCD/60DDYoNgLil1jyBTRY3CMkv2ppFaiJ4rxPxxPGYFwytX69/5dNf1zT
	DUQQl
X-Gm-Gg: ASbGncvEhRhb+NNeC5Foq088IKFqx3x5icmj94X/W5X1z+mDi8GJXI3sakhI1nJoaMd
	NI77r9YoMI3zS2MAZ9IALuBIEfmMjDeW0mJDyZeR9AaIErhpiaeyvuBOPt+/2c9x5ZVzc/JFKiq
	tEcwY8gZJtNJnnT8gzJzR5P0t2r6ABvIUu9Ae+KQr/LN2Y9uoCPzuI3ZnPuD2mIKCLrhRKiEPLV
	QqP9L3GD5UY239WALVdLfmOgrT5fZysQ5HMw6lhFEMebn59oHdmrxUlVfEiPwmWKDGDuYb9tQX4
	QCkouDhKv8naVW4zNzwxZ3W3Vab9IUp53IPPK3Z3kSZz5wT6Da9rocN2Lyjg5NvAjY4ssBUra4o
	h79Z+HYf5tYDVkFBHbgWD8RD60+NdiFyI/0x/u7wsrcbEOslrsNpr2f181ztBLHQAPRT4MM8cBI
	g2bkgMs1usVR9+/y6g
X-Google-Smtp-Source: AGHT+IE4cFFbUyFklIu8Ul5MgDjUxTX821uY1/uQ0hddPoJ9GnQf41D7nTZg/rZeH9y2qNDX2ivo+A==
X-Received: by 2002:a05:600c:3f92:b0:46e:4921:9443 with SMTP id 5b1f17b1804b1-477308ddbe0mr65219995e9.37.1762003622105;
        Sat, 01 Nov 2025 06:27:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47732c2e725sm36882335e9.2.2025.11.01.06.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:27:01 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:26:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] regulator: Small cleanup in of_get_regulation_constraints()
Message-ID: <aQYKoiivuec3m0Jj@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Just pass "init_data" instead the address of it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/regulator/of_regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 32e88cada47a..33463926a2a6 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -79,10 +79,10 @@ static void of_get_regulator_prot_limits(struct device_node *np,
 
 static int of_get_regulation_constraints(struct device *dev,
 					struct device_node *np,
-					struct regulator_init_data **init_data,
+					struct regulator_init_data *init_data,
 					const struct regulator_desc *desc)
 {
-	struct regulation_constraints *constraints = &(*init_data)->constraints;
+	struct regulation_constraints *constraints = &init_data->constraints;
 	struct regulator_state *suspend_state;
 	struct device_node *suspend_np;
 	unsigned int mode;
@@ -359,7 +359,7 @@ struct regulator_init_data *of_get_regulator_init_data(struct device *dev,
 	if (!init_data)
 		return NULL; /* Out of memory? */
 
-	if (of_get_regulation_constraints(dev, node, &init_data, desc))
+	if (of_get_regulation_constraints(dev, node, init_data, desc))
 		return NULL;
 
 	return init_data;
-- 
2.51.0

