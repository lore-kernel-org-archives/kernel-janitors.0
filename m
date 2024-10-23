Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767E915C158
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672550; cv=none; b=o75U1xfEQszz5e60dZ2t9oYyAuOJKcBtH63Ip8jgm0NKK8xEI7crwn1553ziw70lJXC0isPEKrhaLwgKOjR++CHE8MKQCKVviCxVnwVDvYKbYSGFwpAWDrKh6aL2p/wYh2yykmx1st+aLIhbur4eYROf4NDPt4NDzNRsYt4zGhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672550; c=relaxed/simple;
	bh=sWr9BoPiw234wLlV9ndaYINN62ABD8IJIL0J3zlr32E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CNAOj36L16XBWS5ECrYoZyIOTmPdHclLftSkhTIVYNiSTp5ErU5lXZd1mf4cri/X7h8wQfQ4TSRuV8p950O1gfiAwIXLtfEvkK/Zq81m+MXzmNZU+i7m4VazV3G+M9HTvM2EJcJ4sSaIcFwNMJ7T3MJmX9n2NYfLfsN/PNZ04tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XxQ3WhM4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XxQ3WhM4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so5026188f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 01:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672546; x=1730277346; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3keMfTd6iA7sU3pCEbZeVuLo6cE9jEmFKIeI2gY/mSU=;
        b=XxQ3WhM4EiS4UkHwpWJ+fyPGXhmSqmSqMBOgfpaw7a+D3Q+Y8ayL7cbUT7fKd5F4B/
         6Sq3rodrDKlwKACFUo4Rajo9pmcu4Zo+iRTPHPpOKnMtRrVTfhROD64u2Pcymym/UVbi
         H/yvK/IAQB/TCPQbpFcc2zZjiyyFRKlyBT4HyeWT9YVZ2zjeT+NxG8Pq2OeK1ABzSNw/
         mJ/rV0Ap6r76tmUhYImn5K74xa/kmcNWzOIaWeNPq5ERUG4WOO+QvJ6eGaJj9Pw6YvuE
         O5FSpjuC2z2I5mUYgZkwB1bm4pyJZpal2soeqIxdKx63oChBRP9XZQdQqFZAxXbIjrJs
         kjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672546; x=1730277346;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3keMfTd6iA7sU3pCEbZeVuLo6cE9jEmFKIeI2gY/mSU=;
        b=gIz7j5Cfhwl60rZAq7FWn0tvPObuh4yqVrwacPVtbD+FYUqGrKxDB4j8Nv34zB7QeI
         5BngDerrEIaUmTRd8ds3imlgY4y5MQt7w/vmUNxqevHNMsHZp6jgSewE5b+mTaLCtd71
         aHLYL2/u0tmMMAqVUPG+/ok6nHz3P0p13QNpznUIfNEOEf2sFrUyQMOnxI591ghHq+KJ
         pvGf9bd3ecK8MUsouoqLQQKMVGFhZ3mwFzjrC/0QEv1/Oz8ekrWy7A6yGwPPBEelwBVv
         QXFAvhamLX5epsCmlFfEOaH2H/ZS5BVorFnJrKwlXvGlh51bwPpkZVPicn8br4J3V1+n
         8JLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGBgYqNjWRhC5udR7gGL8Mh6yghW/ngApjr8WjbVtewdqiiEBxAt4bg73/Nvjz4bNeHJDhjtv1bQGV+6VsAgg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3/PDezzXt9p+1sDRc3UXfeePz8c4egMMPAXyV9lcWbsmufZx
	sPwIv9Dlzo231YFH4xQutMPdYTAsnxLKHDMi62iz8l7gYhNOqNyts5YHuywEJjE=
X-Google-Smtp-Source: AGHT+IHmXnBGT7OF7hHGlVdNz3VlYEysdkSKiDQWAZPncpV01I9EuZmg4AgrOK3MaMOXgvIs1q0j+A==
X-Received: by 2002:a5d:5223:0:b0:37d:33a3:de14 with SMTP id ffacd0b85a97d-37efcf00deamr1112744f8f.7.1729672546641;
        Wed, 23 Oct 2024 01:35:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bb15sm8401812f8f.99.2024.10.23.01.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:35:46 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:35:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthias Schiffer <matthias.schiffer@tq-group.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/fsl-dcu: prevent error pointer dereference in
 fsl_dcu_load()
Message-ID: <e4e078ed-9342-48f4-80c5-28f0f7b711b0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The syscon_regmap_lookup_by_compatible() function returns -ENODEV if
there isn't a compatible for it or other error pointers on error.  This
code only checks for -ENODEV instead of checking for other errors so it
could lead to an error pointer dereference inside the regmap_update_bits()
function.

Fixes: ffcde9e44d3e ("drm: fsl-dcu: enable PIXCLK on LS1021A")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 91a48d774cf7..5997d9b4a431 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -109,7 +109,9 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 		return dev_err_probe(dev->dev, ret, "failed to initialize mode setting\n");
 
 	scfg = syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
-	if (PTR_ERR(scfg) != -ENODEV) {
+	if (IS_ERR(scfg) && PTR_ERR(scfg) != -ENODEV)
+		return dev_err_probe(dev->dev, PTR_ERR(scfg), "failed to find regmap\n");
+	if (!IS_ERR(scfg)) {
 		/*
 		 * For simplicity, enable the PIXCLK unconditionally,
 		 * resulting in increased power consumption. Disabling
-- 
2.45.2

