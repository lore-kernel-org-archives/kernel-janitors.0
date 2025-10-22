Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499D52472A8
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131052; cv=none; b=goNcYyOLq3cNAgKovYtYWhbqDLptguBacmh5m+3XbxIoQZKBi+iR0NVGcQiMn+6QCCSUS/17MRTN8lW12Dv56uHhScrvumix22IPogiSXPzHUyCzETyP580J+uT03GU6rjk1fdqopcI9jBEoO8s3oWxrL2nSnI5P3BjmL7OKiPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131052; c=relaxed/simple;
	bh=IjzKzFr+djM5tXl7O91fV0Q0tMbyfuKgPsnKyaR44gk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kd8l8jm+tR7oXzJfQoHoO7F7n8ec0eIk24+NTaEMdcne3uskMbsdg9N10UWjGkDixZ17IRvrmiFw4qZdyHRtG09IpWT75faJ3i76Uapiqv9rGv2/9KgLugCvEIGtT58Obw1ZTfz3gUhMc0Omkvcy+3WFrE8VqaoU6KU+SkQrIaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M749U/6R; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M749U/6R"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47114a40161so25237195e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761131047; x=1761735847; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=60d4FN8I12bjhkv2m/h29YuwY/zOYE0TJa+JTgDeqZ8=;
        b=M749U/6RF2IqviR6sR7eqE8393ny1m5RAN1TdtYvj/G11aiiBHqrqWuqQvRGTzsIja
         0UBEVYL6794zOAxHI/b6/o25zgVG/1K38AB5Jkdgm7CJETqDv90BIe0QH+3ClLde4c9I
         Z0LbZ+PifIjs+UglkZvNbKqsfg+b3fgM4blHpWidfXrolD+VqMXxjULQ2P1tx8wq2436
         ywdcX14Ody3s8tG+HLicZS/FpQ+lV6nK4BIcLUb2kTpT4YIC7skFDX5ugnsaZKsOO3GO
         HSQWw6ATyLTQbxN3PTYB6MP5HJ/fDo0oZ3c5anFYRFojHyqfv7u94bDvha1CzbTMUil5
         tk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131047; x=1761735847;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60d4FN8I12bjhkv2m/h29YuwY/zOYE0TJa+JTgDeqZ8=;
        b=SieeYQiG9YoFYR3tS0KKTLIiskay4EjgWQWh5a0BUbFrZFgllfs4/Eym/ptXxAYi2A
         a76iBk4Af548lep/jBOsjOWSkCUymU0rhkhbcQpbeWMfJcG4F1/eTdKZRvFG3mFmlgOW
         BTE1QHA/w/zHEoG4hJ1V3ZAZFgUC3Gk9VHDW8UjfouxP4uHibvaJMioOEFSWDmEHOZJl
         +GuDQfPHPmpPgayGUhx5atEY4EuoeGLUwglgxDDdbBX7pyjeYEWNtVf3YIaXfmnPn/5I
         M1mCB9hC0nwKcg7A7dJf9NW2p1OlyiIzsWVaLnhUJrw2DBvGNNpDT/BEOyuCBOmx9lip
         AWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp2qV1JEVAUCoLjLJwo3XSW0XXhHHtX1a1I6If5vQ5G7nSkP7Wx0s/mJmA8FT+/97fEGky8otLuCaZFrK1ar4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDC3JuXVKZQcDNhkCiKYRKzQpKDv1KqLLI/6jw+z1zJjEShUJx
	p4qBqPWv6nUqvtGE/Cek0k5DsyC3W2xhqmxLpvMsbyvsSXHwZIMddvHVICYppKL+MAc=
X-Gm-Gg: ASbGncur+0Jkxv46EKAQKNo5YOCPObJzeOCZcb8ry2JasBxgDonH5JTPG5sPQRlHUY7
	hn0hwq//ONzrWyyld/BngrQpy5z/X4hMf1MUN0gIWb+D4Ana6j0UbSvqn4BORx/YN68Q5yweTfZ
	Ms4UrUxeAO7WoJBpjDr8ivPbc8TdiQl4cijo/K1WvtUaCyqM9q9Ddi73y6xhP68b5GLs3Mu88Aa
	92U9+NfEiRKSgX9dwlXYSzEEJt2xDHc9Wx04XGLoIWnegSxXDUi6NkeBQZ8ixZFF2nrSKnFSLFt
	SAuCOGIBQZco//KL4qip1OdyAxPeipnudMagccG37pOggjZzOkBDFKHlANSin+wX6dlnoPa2quc
	BAK0OLWBypUJtbPgDbqPfSO0ElCUa8bHbUi7ThMcVSJl20vPCloDXseoScaf/8NRX4WRJ1+O1jg
	1RdQB+/iAjYV+1krNTjX5TZUORz8k=
X-Google-Smtp-Source: AGHT+IGVxOZg/SGvzQXDgSR7/+Whdk7ScvRjRe/N1IbTeIwwfj/PV9uPXXlolfy5kHmMZfmv0uyAbQ==
X-Received: by 2002:a05:600c:4e8e:b0:46e:46c7:b79a with SMTP id 5b1f17b1804b1-4711786c702mr178910745e9.2.1761131047078;
        Wed, 22 Oct 2025 04:04:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c427c3casm38721405e9.4.2025.10.22.04.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:04:06 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:04:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amd/ras: Fix memory corruption in
 ras_core_convert_timestamp_to_time()
Message-ID: <aPi6I5z5oenppEuu@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The div64_u64_rem() function takes a u64 as a remainder.  Passing an int
pointer to it will result in memory corruption.  Change
"remaining_seconds" from int to u64.

Fixes: ace232eff50e ("drm/amdgpu: Add ras module files into amdgpu")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/ras/rascore/ras_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_core.c b/drivers/gpu/drm/amd/ras/rascore/ras_core.c
index 01122b55c98a..d8a004878a64 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_core.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_core.c
@@ -67,9 +67,10 @@ int ras_core_convert_timestamp_to_time(struct ras_core_context *ras_core,
 	int seconds_per_day = 24 * 60 * 60;
 	int seconds_per_hour = 60 * 60;
 	int seconds_per_minute = 60;
-	int days, remaining_seconds;
+	uint64_t remaining_seconds;
+	int days;
 
-	days = div64_u64_rem(timestamp, seconds_per_day, (uint64_t *)&remaining_seconds);
+	days = div64_u64_rem(timestamp, seconds_per_day, &remaining_seconds);
 
 	/* utc_timestamp follows the Unix epoch */
 	year = 1970;
-- 
2.51.0

