Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CCC2D1920
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 22:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620331; cv=none; b=CzzoKaVVGJokOC6QTPGym9UWCo0RntI1WwTDqDTyd1WfSJmcw/RenkS0R9gequ1OenD2tzRu0E1N209kFKHn9nG4Xqjo0VD3GUVRFW1Tx4GVuMNwm3mR82fGM8g1T3nUcCuQBwmONdJFN/Ej3tT4+DTcqZfa0CAgQp4W12lPcZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620331; c=relaxed/simple;
	bh=sxduJx+oAePAjNzvsNFqsRA6MRLgkNZm51fzqOFHbDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tKaoGVjrX4hyujzoyA04Rx1D2luEzA2uRCx2XFI3y4asfYJyeDY2PaVElXraFfYneCGIa21h1zq7m4EKvhuFa+ciCerSRXVEKAh8Mv65lGlYbrqupX/355i3XP1KZHWL+arS5F0lqCOVvGlzRZhkyFvM94grqlWddE4RiwVD/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ipjDcwAV; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ipjDcwAV"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c27166ab3so3760656a34.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 15:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620329; x=1753225129; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQdS/fnesxZHeRTbK+njettpxhb9T3PJtvTTlq4Hbyo=;
        b=ipjDcwAVdEIBzQiDUqOZ7hog4rwKbPxvfQMoy0QhvYZEKaLbqsyegOO4OeOGg2DkPn
         /k9Ead2Y7U9wF2KgjhKi5RMYs3D4RT9D3MNB4hSV96Cn1rPjrqJkfmRmpK3IjdeEwUSM
         Mjyz9T78AbmxCtTLSBtiS8EsVT09R8LW4jv7pcgMgpkL+bqPcjZzR23rEeAieHeVOuBX
         Aj/ATBAbUk0imeUobNcRh4RMGQroY7WLngnVkXTRu4rQEVsMrFr7tZ5esaM2Bt473XNa
         xgm0fF18tbU4UBpYfEqy3MUijZkcpWnJ5O/7dXpKq2asHujt9OKan4hO6qRIAriwRRqg
         BChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620329; x=1753225129;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQdS/fnesxZHeRTbK+njettpxhb9T3PJtvTTlq4Hbyo=;
        b=bXYtmAbmDHqbgqdKlaXkMf5oZolJE6RXaR7JQAajqKoB5IV4w4+4TGwIfWb4oXs6iA
         WzHo8/TIV/T4A/trbg8iehD5JqSsjCyk1EYxYuD6+ILawTQC0fpLBscUdzIp8qNErz6S
         HOdnMa4UipZ5xNxhrL/pdOhIB0KSu54lXNq3RtJSt3h4wKuN+y2zChx0mHuC/nj5HU/L
         NA+ZRQUnBm7iXDUBr6SUqqHBHjmRkIMsVpD7OxZukvMw0BeAMAJ7kn6tOaWFrYfPZRvs
         Rg52lVaCmNixKttiYUZYhSqypQhrRhei7JuGsrt+3PHN54Xolhz5jb5tGuAQJJWRgakP
         Ocxw==
X-Forwarded-Encrypted: i=1; AJvYcCUl9CBvB4s6zL8QNoRgTN9QJ3iReqw3I3LKrOZaOrBAS+e7KM8yWBznHfn8IQpApGXyh/vtYxmc/OJs3i7CjmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUKT70RUa0/Rr/xd12KAtvrCnGqHvWkUE/bW+DHMXO9dUqZ+cc
	7tywEGFyOpzsC+26VUaiGpeZh/GZ8aB6xQ2MLBLt24xtvdIiB4+vNSlB8L+mC3tHwXsFtTqv2RL
	WDUDK
X-Gm-Gg: ASbGncv6Fl8gaLFhqvvKz3PjNleukCTjKxoUIS1apty05a+TnH3Oh4s290TO6e3tdtG
	YZg5IvNiGqRqED/SwmhE+f1UR8oW85RJkx+QxYlyxPMe+29yhU+F/NLFku5hu79OvaUlYS0EdnJ
	ImOMifDy5e3YRaG0OD7VdcH/pnFCSVxJoLfCvbazni0NKVa72EcwDis3OMaPFNlgx7XI/G1JhJA
	OoFUexq6DZFz3oPVvOYyPXJq7SOhrZHqtHpVRT+VcJ94Ubl4s/8OqVp2cSz+8yznhiQQlKSXrDA
	NhUpt9y5dLbpznNJSyp5Nx1OexlFQVHul3kiutJDGoCiXRTZf7HCGNwpX7CwhN0LZx0Zi3lALcx
	/mrQob1b/Zgv+/T1c1xH3+NTqVD9T
X-Google-Smtp-Source: AGHT+IF8MmVG4ypCu726fhwqLEetif2ChyidvWvdhwWbSrW4wyOjZnawR/MGOE0avl2B+dB2nPbJkg==
X-Received: by 2002:a05:6830:2d86:b0:73b:2751:eee2 with SMTP id 46e09a7af769-73e66613225mr334520a34.23.1752620329043;
        Tue, 15 Jul 2025 15:58:49 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73cf10857b2sm2518429a34.16.2025.07.15.15.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:58:48 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:58:47 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shashank Sharma <shashank.sharma@amd.com>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: unlock on error in amdgpu_userq_create()
Message-ID: <ef53ff29-4d1e-4f07-a431-c0b91578f93b@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We need to drop a couple locks before returning if the kasprintf() fails.

Fixes: c03ea34cbf88 ("drm/amdgpu: add support of debugfs for mqd information")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 492f1089316f..c3ace8030530 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -521,8 +521,10 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	}
 
 	queue_name = kasprintf(GFP_KERNEL, "queue-%d", qid);
-	if (!queue_name)
-		return -ENOMEM;
+	if (!queue_name) {
+		r = -ENOMEM;
+		goto unlock;
+	}
 
 #if defined(CONFIG_DEBUG_FS)
 	/* Queue dentry per client to hold MQD information   */
-- 
2.47.2

