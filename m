Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49ED1CEEB5
	for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726307884; cv=none; b=m+7Q1f39d18r9Wosl1zRLABKF2kIhFuRil96V24tmsQfywlbtMBXm9O0tCLWo4y61ED9E1OvH7rCDpaFyR2V2w4rK1VjIUEXaqo8tWLGo4iuZxCLlzw1KUuZmDDPEIlkjhRE01h1UXYlX4hi4cgbLK2ELl/5qd05T4/Hw4Ms8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726307884; c=relaxed/simple;
	bh=/5HMoiKsNQpQYsVih2u9baT8T81pGg0AoSnNhsPK+ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3fyxkAAtTJfZeDgL5LjSZ+FL427eQQUOJFzdKGB0aUteBOe2eUOz45L2FcWFhw3RxhMe/qsOv7wocMPCcrjObXYCl5T+4VpRgdHXvr52pXYiZ5OcTvER0f/ad3Ab0lSiu00Mq21skp7Uw7wdi2Liqmb9Q/6BN5fERXcTQCCQHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFOWjVhI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFOWjVhI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so23005145e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 02:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726307881; x=1726912681; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88eCWCoJ6XR75TD+7uqwXik/mRXRbb4L/oRDMA8RVAc=;
        b=RFOWjVhIv6CimJ+dEyqLUMcW7ICZPRYhey9E0lbnoHsUn3lz3x9xc1kaa6tsJPFFSG
         myBuko0uhM8fvSYIf/c/5xxevBqZYjDBaRcutsuEGdLadZ2pC8/0RUn+rupIpYwo3eyL
         r7xmLAaKuTxxu7e80a/bzefhcWJ9xigFiKVx6wS6eEBFH1IW69uo3z/lJqjALP1wAQ5/
         o0SQDVpIDT6EhB3vZV1CKY071eWCKzypoDNacwhiYRhwGQzvKNZOsGEJtyHz6+s1hYOG
         BcQNaxnMFtsuZSPWWB7G0CmqrkRS8g6VizrdDctNvPK0mXA0XGcgXpJOtyXINP+BQDAs
         8O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726307881; x=1726912681;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88eCWCoJ6XR75TD+7uqwXik/mRXRbb4L/oRDMA8RVAc=;
        b=Un2T2VgBHFPWuPU3kulYttbyhU3caMdQG/FncfBi/BAWapDyCRQn+J7FjYw/W2crK1
         CoGKcLhwdlCNxRLb7BT80rPhVehRItDEaCTdO5E31rEjQ5LNYUjqjng4i79uLz2yfru3
         WOy3IVOxO1NemF6HVbBwrkSLURNOWTgK6hiHd/g1sQG5qsNL9fNGB8oGp1flJUCOWC6L
         zsxmEZ30MRfZOHNt93BJJ5LlKHwC0RQLvD4Lc3wCD9MCDxcAJa5Ap8l26utWZHDiGenv
         N0fNI11PYAHCu2Gl28ws7LMMx5YCkJ3yP2jSTFaXnFs2Zbj+su2VsvpNrQc6ipF+yxys
         d3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXMzZCaaj37BMpgpdDsdl9o6VgdJ2mT0eQSIwXEvMZpR1c0X01bMjIksuV9V8OLHrXzWi7PnudXjOoYAhRfebk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7lvcBGZhfnHRbpWnHpI4pc7z/GxDUfa+LU4I7/vB+uStlIVjD
	3dMWIwg5gQpN4a9n7tNOAaRZXQR3OY70/WPO5KdnXMmtNOtSWKVL5PBZhCekl14=
X-Google-Smtp-Source: AGHT+IH7GmXL2XmaP0VmzSlcMV8/a2NLWHWGYPOZMBM/UtK5vb5oZb81UImFpRwQaVXMv0UR3lG/Yw==
X-Received: by 2002:a05:600c:83c6:b0:42c:b220:4769 with SMTP id 5b1f17b1804b1-42da2bd7679mr14208405e9.32.1726307881005;
        Sat, 14 Sep 2024 02:58:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3eb6sm60495966b.105.2024.09.14.02.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 02:58:00 -0700 (PDT)
Date: Sat, 14 Sep 2024 12:57:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Piotr Raczynski <piotr.raczynski@intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] ice: Fix a NULL vs IS_ERR() check in probe()
Message-ID: <6951d217-ac06-4482-a35d-15d757fd90a3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ice_allocate_sf() function returns error pointers on error.  It
doesn't return NULL.  Update the check to match.

Fixes: 177ef7f1e2a0 ("ice: base subfunction aux driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/intel/ice/ice_sf_eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_sf_eth.c b/drivers/net/ethernet/intel/ice/ice_sf_eth.c
index d00389c405c4..75d7147e1c01 100644
--- a/drivers/net/ethernet/intel/ice/ice_sf_eth.c
+++ b/drivers/net/ethernet/intel/ice/ice_sf_eth.c
@@ -108,9 +108,9 @@ static int ice_sf_dev_probe(struct auxiliary_device *adev,
 	vsi->flags = ICE_VSI_FLAG_INIT;
 
 	priv = ice_allocate_sf(&adev->dev, pf);
-	if (!priv) {
+	if (IS_ERR(priv)) {
 		dev_err(dev, "Subfunction devlink alloc failed");
-		return -ENOMEM;
+		return PTR_ERR(priv);
 	}
 
 	priv->dev = sf_dev;
-- 
2.45.2

