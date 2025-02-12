Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D615211485
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739373857; cv=none; b=Iuw809OTTk0jJEsyBv432gXuPk4nDBpFPKP0gB6PEQCA7+JS5YDHgv81FWL+ADSQ/hqLJAOzaRxtz4Gd5wAgoLgUee8mpfo/gEk0HSmFQOWdUcsa8VCFM8xrkDqFwPKZwzKfc7hgNugioy95OvOWAacRNxIPeK1CiaIW4DCcHEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739373857; c=relaxed/simple;
	bh=bfhirtH+13nY6B5i7ITAi7el5FlfqSgmoiQ/NTQ5BQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SiLKDwkYV6wFzsJkoOuQqRSJNrj77MR/MhQFHqzPQ2cgrHwkHzjj1jKvBljKcTJpkZySK2q7vtx0bpgQ0t0q05cZXq9SrmcT5GZ/vuIJhWSVDAL1K8JIx5GBdtE1bZU66xFZ0niKgXeTGi/kDBAlv1bTVZ0HBKHH0aTKFQXElvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O8YRSq6Q; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O8YRSq6Q"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7e3d0921bso324513766b.3
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 07:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739373853; x=1739978653; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPKru0l0aVU3WKEJ1///OpkRf3iWaCUXDAkjzEyzYT8=;
        b=O8YRSq6QE0txsM1ZtzklnUvHNx2VaU+U0YgadD6FT+3Q+WMVcoY9jgjW0WEpEeTzZ0
         CMAWDRlSGrUTLja/Pj3eIMn0dwLAAv6MbA8Bxe3HCyZBfNYGRgRWmAHCFpBnaBk2Aak9
         BoYfKX+zbL4pnHE9ESaJpy3zcACWdUba+Ut5T58T3yhl5lIcIJFvmOTnER1VCxClfkTY
         kpvVomQD9unSIAUz9DF3sVU8ek7bDOtQN6Y/suTnTA1EBOzo7SS62+CzEVcQWXBBWKdh
         iJGFqbAE0N9EKqPCgVBnoEv50cknz1hhQPgtbIg2q51mSsbUykriqy2rXWWExf1R96ad
         X5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739373853; x=1739978653;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPKru0l0aVU3WKEJ1///OpkRf3iWaCUXDAkjzEyzYT8=;
        b=bOh8dXS1vsFpqmTmZiXhKMtCZ3yZl0d5//ihpQhvISe+a9zhj3JFXkhQbXtdWmhi3n
         Q7odiBR6jW8oZBPCv1GdLc1dPRtySUMtGDaFxv6gJqCVrus38bJa7z6SrpWugAqHChUo
         jRPhyxIgwWRgn/H+jtHfDC7eATe3T9xioT0y2KRvADdWtS489GMbBHGkQkRGOfhJRbfJ
         TiH/N/TZeUq2VkIUyph72Z5lZqHb4Rr72eyFj+siGMYV9XMEFepAiEWs8rSKrFhbEs6K
         GkLh+rR/58DhsKORkw8yjHemHED4RK1wgW6O5BP0npVz4IwULVPFOHWU3xM0PX6wFjJR
         BmkA==
X-Forwarded-Encrypted: i=1; AJvYcCW/Psn9gk3hFVb7S0nYPUBiXdY4z5ZEu4WIQDnYGNU63izQF2rBGXjikwZJWZVyqU/LgriPJ/nxEyHyBuggmUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQCcpBREv6/m+ag30UtRGA7BKh5bYU8KVWkQNWI/unUCEL1nep
	capPx9FgkFPwq3gNfdcQCzOD4aHi7xMYHVoRtqgSEaSmu54kdb5LiOKZsn426/0=
X-Gm-Gg: ASbGncsDBQCXJluXzCzlPCGqWAiBo2EsJUU5P2n3f81QRj+PFszOdGoq+N8AUVKDuzp
	j3AUIEuGzSOAOqeSD4uy0ZBaBKncoktSprUpQT7C5mNM7FiKLl5wKT9CrXGKdMUuCA+q8/Sfxty
	vSSnP1riHQSbWomFzPftTPcCOa4q5W5QUCH+FezK0iamFTsXFQy6Xq+7HAliiaXkEFETi98Smd0
	XWfrB2C+iEDGBJeXz2lIEujzGnIp6UcGFcB6dha01ViD7UCJE1QflDpHdICsoW1HhxVLlbGbEMn
	pEmkz+XD4vKGNZ/RCn/N
X-Google-Smtp-Source: AGHT+IFjmw0Zgy4ifMz5CBDov7HZwLscmnRL30CFaXtX/9ilCY9ZxRB02Ln3oI9dpncAe8X2WxdR1Q==
X-Received: by 2002:a17:907:9490:b0:ab6:9d92:6d6 with SMTP id a640c23a62f3a-ab7f33d1036mr294868366b.26.1739373852788;
        Wed, 12 Feb 2025 07:24:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7eaeb8596sm269915866b.138.2025.02.12.07.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:24:12 -0800 (PST)
Date: Wed, 12 Feb 2025 18:24:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/tests: Fix a test in drm_test_check_valid_clones()
Message-ID: <c50f11c7-932c-47dc-b40f-4ada8b9b6679@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The drm_atomic_get_crtc_state() function returns error pointers and not
NULL.  Update the check to check for error pointers as well as NULL.

Fixes: 88849f24e2ab ("drm/tests: Add test for drm_atomic_helper_check_modeset()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/tests/drm_atomic_state_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_atomic_state_test.c b/drivers/gpu/drm/tests/drm_atomic_state_test.c
index 0ab5d9ec4a75..5945c3298901 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_test.c
@@ -283,7 +283,7 @@ static void drm_test_check_valid_clones(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
-	KUNIT_ASSERT_NOT_NULL(test, crtc_state);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
 
 	crtc_state->encoder_mask = param->encoder_mask;
 
-- 
2.47.2

