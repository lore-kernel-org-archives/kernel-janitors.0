Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383FF182B9
	for <kernel-janitors@vger.kernel.org>; Sat,  4 May 2024 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714821930; cv=none; b=pVZ2v9qv3e6UxNLtuC/c/ydRoeIwTNk/XGkg0o5KxaEXyE7cRI5TJad3tBRVrg1YGEfAKdQ6/ZA2OlJiGIO0XcfT5jaQoKy1ePL3Fcd4enIR1dYuRJ2sTzPlRB9Ateuqk7xg7ryM4dqKJ+FMcGcYH3e52keQOSp2kXdjZFONv80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714821930; c=relaxed/simple;
	bh=zThw4UDAOnEh6F/I9eYX3+ObEBgRTkhGcMAD0FioUnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GYP3ZRO38NGWdihqqaC5cZCD9YM1LiZUbfOHiBHBHlWvPpBXi2vkp4n6cJIZuWKgAJJMdHAAyVCSjqa/TND9zNjfOZBq5FRAgX/BnFBQ9I9t1ZiYnnaDP58/lvtkmePPjzKesv7BBfuX5j+u8FWi7fVpz5pl7saUuXLpBU2+Ch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LjOjICvf; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LjOjICvf"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de477949644so478821276.1
        for <kernel-janitors@vger.kernel.org>; Sat, 04 May 2024 04:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714821928; x=1715426728; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPKRgPrnhQkyQvjVNzNYJS982z7u5glAR7kHzQu9FB8=;
        b=LjOjICvfAs2LtW1qzETVjwP6Y1ALQ+praSuAoyouCEaJayFuzzvlikOgOwUS0x/wcQ
         /E8oc+Pem8yya6aRg+bTt/oJL2lSc+CJq7SiCJmLHoRusCAmt16v3TVKbBPjbRU1cXdi
         roAmS73itEGh2HHmhbYQUiPJVVbOS7sk1SwnANHB32oIxpNP1hMWyVOsWCXcWdL8fBsJ
         sMIqb9qi+XsMG1deVhPsWXbJ2e1u0gQffw4C95XVy7FyqzFqmqRlPo37h4dRDmTWUJ//
         yBpZL5ayrPqB5duXytrJYpAYXbMltwskJ9Bvgxus30BJWRX6cmofi/0KEY4QpvH/lqJl
         hYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714821928; x=1715426728;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPKRgPrnhQkyQvjVNzNYJS982z7u5glAR7kHzQu9FB8=;
        b=SDKkBD3v846x/l/uOieglzi2pdWNwwBiEAu4jy11dABDiHR0vHG1G2l+ERkBTvz0i4
         GoN2BnXEhZVEyYDubeK92k8IZKWh3u+HB2WOAHl4aVGSiPgTVBLsWDksgNKq0GSctZdw
         fJ0rBJGrjcGCCc24B+SiSlv14LR39CP01B04lzH2z7FOXkyNfSvHnMUsVUXldwICHarF
         4dvyEGBdUIA9/7eVTXXm73VtXWfOkilaIjCPV1YornVpXjlFmbLPT4JZ81yTTy4fRolM
         8d31uE7Kx50wTofmNPgDSW5Yvoys8X7xmGmr1oPIe7H67QRaGkBd+cGFpxn+8HtBkQNt
         PrXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiCRMw/KJC1DpXhAIGYGX03V37ukmZU/uyioo3BZmzKvSAtC/7P2DbjsYLpCXc68q0WVEYXSQNEJDYHDebRoLkWmSZKI+G637FLnzykwJZ
X-Gm-Message-State: AOJu0Yy2GgYgxbCLFxGavmWay1Uz2uilkPEUWyt/KUbHxs++X4/uPLLu
	jIyj1j7nJHz22x9xliSonUD8JUP9KEwF6VtTt7h1w3Rn47R+o9C7bDkiE9Urqyw=
X-Google-Smtp-Source: AGHT+IHmoThEg6ZICI1nanJtD8NqubVsHGjSSagbRYqxHTK+797ThcIKk75RKEhweCH/CV76yxB55Q==
X-Received: by 2002:a25:aba7:0:b0:dbd:8f9:a71 with SMTP id v36-20020a25aba7000000b00dbd08f90a71mr6069893ybi.28.1714821928012;
        Sat, 04 May 2024 04:25:28 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id d72-20020a25684b000000b00de4f5e1e45bsm1055110ybc.54.2024.05.04.04.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 04:25:27 -0700 (PDT)
Date: Sat, 4 May 2024 14:25:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: Amit Daniel Kachhap <amit.kachhap@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] thermal/cpufreq: increment i in cpufreq_get_requested_power()
Message-ID: <a7c1fe73-b40e-437c-8ccb-7b3baad04df7@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We accidentally deleted the "i++" as part of a cleanup.  Restore it.

Fixes: 3f7ced7ac9af ("drivers/thermal/cpufreq_cooling : Refactor thermal_power_cpu_get_power tracing")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is based on static analysis and not tested.

 drivers/thermal/cpufreq_cooling.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 280071be30b1..a074192896de 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -249,6 +249,7 @@ static int cpufreq_get_requested_power(struct thermal_cooling_device *cdev,
 			load = 0;
 
 		total_load += load;
+		i++;
 	}
 
 	cpufreq_cdev->last_load = total_load;
-- 
2.43.0

