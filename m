Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B1F604CE
	for <kernel-janitors@vger.kernel.org>; Tue, 13 Feb 2024 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847511; cv=none; b=MdnuEV3yaCNApvqP4aMlVPq7U8EP1Cr2tCmqm897YGvtUjUPji3wb/++ktoAtRS+jTNFZ/T3JfhuPzfKbJc/H3nqXQT2HI6JFjZGsldi9Vmljz5j90hBdWOiQhJRf3mE/KG/2ivvGPvVjV4MlsbXzTPV3yq49EKNklv77PNUh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847511; c=relaxed/simple;
	bh=DRenCHOzrAHmNtT+PvrsMVMW+9QGYX42vbTeK9y9TM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HfFave5YY738AzSItDskeTCqgcyh2aNu6r5rzgU48zd6ZEjQuQKxIj/QfASDy+S3u63RewCqTGCZgbam+EhUnj/u+BdwxmnbmxqtfQ+wZKtfPRqvuH5hQ+rO0x+d0cdI352Jj/h0AoUMogTTbaRAz9/CQDDC/ss/yH/c6qjGv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VD0rR1f1; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VD0rR1f1"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d0d7985dfdso64552891fa.2
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Feb 2024 10:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707847507; x=1708452307; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e70wXDD4s58i4pPQoq+fOfAGn7fmyRVc02WAzyBJDv8=;
        b=VD0rR1f1iqPok6dfdNePNbElqeGSyX0nJLGOw94OojWj0yetijyckIMKTL5E4b/Fbp
         4dK9Sj05R5v+Gs+Xm651I6OaPOxaciHo18QofYH13dbeLn7EJaeqyssYmnN6xf6461cX
         hA2aPZMQpMDQCL2lEfHk0c0s3gB5gwY3ArLiXE0hogB65uch7ZpHPwnej/trVnK/iYV8
         aPsdclHkG6LvhPBPTNwjf34VkbwFIXgO2ZXsOKK8QRnFKE7LfC2Qj/K5an5vDm1Yg4dq
         10f61ocuaJLulCsfabESr1SSropLRkpYaLm55j8H6FW2N7txyMj2S4BWYDX2BQGVs4/R
         lA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707847507; x=1708452307;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e70wXDD4s58i4pPQoq+fOfAGn7fmyRVc02WAzyBJDv8=;
        b=CmwkFYiXUcdi64f2o79pTn124pJdQeXjprEU+vI+PQBEUMjjaB1MPpOXT3o2kIwvtw
         Iajzi2ma3pDECqEbCgtRPhlVMrhGcBtiSNhlkYMN0jaNDQ6C3xELWSUl+fSyBgF/WJ/3
         lSf34G6DgMoug0M62IV3kzvWV17lQgk+C+MwvrxOBrfed75ofI7vTdqmGZDSZBQxTc+e
         Xi1CDEVRgKruqoQDaXPy+HZbIJ9izwjf0nh1A/gTVdQspAwYiFLbuKnbzwzApsarCjAh
         f6hAqfYcVx0VkV2oqfBV+NFO0r2gicB5oM/uN73+gQCrhrSHAMDlL3xBpqzFI466YD54
         XpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbiByPHgrYLpcrsDdy2rKLeTeDjAI2qjjj1vxSMdsP3KTmAaS1zrpU22S4zEHOKCOEM4D2cZj18X5gT9uwLLXiKr22/ZkMNmkv/AzwjFda
X-Gm-Message-State: AOJu0Yz5FUHEPmAtqxhZ8qfNNT0WPVmGwtTerdwVEAh6DszGGJ+APtRN
	PfeHVECofKXsDqKIqVItFjMX2du9kEoiSSU4BJDNUdGU+lF4i57LWLl1N6SZhQ4=
X-Google-Smtp-Source: AGHT+IHmkNgIi7TzfvE847XBZ2OZM5yDgs1O1Gu/TDGtB1RJErk5/dezneWdy7eJGVqq6KcPWyHDug==
X-Received: by 2002:a2e:2e09:0:b0:2d1:ca1:760b with SMTP id u9-20020a2e2e09000000b002d10ca1760bmr297273lju.30.1707847507407;
        Tue, 13 Feb 2024 10:05:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZ54WrawIOvlpxGz8yZKRDQ4SqXq+ERsBBvUjJjAj9qIo+bWEyrtNeTqIAiLi9LXVheQhFRx9UR6ajW92PZ+CvHLgnewa2EHey+1qbM5k6vFOqj97RVJ+DGojyFT8KwZtvgHrqGU9IPR4yGbV7GBdYJt2IULruG++q1lypc0xAkiG2Oh/ePKKJ6k0cZhn9x5CzoFHWTvZDrU1iQBLyUrF4Eb7KG6vjhkTVbsR4+YZjkeZz2Lk1kUd8QLhJoDAtCk1qKUv+RisDC2l7/yiHlPLnJhOUrqkDMCPA7waGTcg8DdN1tNI0rceLgid50LvlR+6BNKq+VGapvGwAv7CEq41MUsQZ3gqHFeawGmBtfuvghXbxoeYSC1mp06StN5ZL5lVqWurMvYL/OHtrq7O7wOQIedPShPXsBh5kTf/q8wxfD4HTEIlEbjP4G70TvEm8D8Qz+gCu+8umWLo3TMvAem9GcDkf6HfHjRUFvRx7pMOG0uBBd1d6DBNRXpTN9PIikhzbFmHUOIGYLC1v2rqRSMUXHdyKfCfUV9S0qT1C0C6U32aKxY2L4cQLx8CQW7drWAr9rDxmjV8VgdM3fmQhTstf/Q==
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j1-20020a50ed01000000b00560ecb22d49sm3827246eds.84.2024.02.13.10.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 10:05:06 -0800 (PST)
Date: Tue, 13 Feb 2024 21:05:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/imx/dcss: fix resource size calculation
Message-ID: <4914592b-4256-4c9c-bc1d-6dec1e473831@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The resource is inclusive of the ->start and ->end addresses so this
calculation is not correct.  It should be "res->end - res->start + 1".
Use the resource_size() to do the calculation.

Fixes: 90393c9b5408 ("drm/imx/dcss: request memory region")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 drivers/gpu/drm/imx/dcss/dcss-dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 597e9b7bd4bf..7fd0c4c14205 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -167,7 +167,6 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 	struct resource *res;
 	struct dcss_dev *dcss;
 	const struct dcss_type_data *devtype;
-	resource_size_t res_len;
 
 	devtype = of_device_get_match_data(dev);
 	if (!devtype) {
@@ -181,8 +180,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 		return ERR_PTR(-EINVAL);
 	}
 
-	res_len = res->end - res->start;
-	if (!devm_request_mem_region(dev, res->start, res_len, "dcss")) {
+	if (!devm_request_mem_region(dev, res->start, resource_size(res), "dcss")) {
 		dev_err(dev, "cannot request memory region\n");
 		return ERR_PTR(-EBUSY);
 	}
-- 
2.43.0

