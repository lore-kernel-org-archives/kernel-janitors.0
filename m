Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B85B225A23;
	Thu, 19 Dec 2024 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611559; cv=none; b=uzgzLhhNlS9RQPFeP7nqfbnFJ6fYsdIxYuyGwv8zznQrZ0YYNNzc+nEWoMyJhpIleCK51uB0DNPLo5+rz774XF4uW53lYh77Efxujk2AAVn+ztVmSQzKYpyo7nomErdrkZG3Tdbyki5VeQjXFo9NI6TBhgBfTrZ048EoqnxArSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611559; c=relaxed/simple;
	bh=j92hZ39eHxVvxOBHeXyRC4Eo+r1zbB0t4hoie2ha+q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iMGvhDtUK+SFRoSqrN6c7pHtIPucGuNKDuuLn/NSkmJeUCe8WOzkco9F/e4FzL8eeAZqgyalOqT7RpmmiSygXFeeujbByKcfHM0VcYCH/DkO3gEHwVWhWJjpLF8SKBhR4o9EQMu5CM+XmZUmsKdBZuDRa2MILe0C7THRep7guAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpRx6Hg2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpRx6Hg2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43622354a3eso5179755e9.1;
        Thu, 19 Dec 2024 04:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734611556; x=1735216356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uOMmOxTuC9inC7UAGuj5K8CgVJVzatCr2SxuceBbgc=;
        b=VpRx6Hg27yqO+y5r39oRouCpFbGmSRdkLxgLguxwuBTzqUEEH3Txq+KVp+YjYwvCj2
         M8e168oh4N3bFnnkeqpLo57P3JqbE9F/k3VKHQ+gd1dppbaBH9lfMECp9CrcOQVLPkBI
         2qDF6oONqakgXfb4IlVpN1f2BkObHtPTiQV25y2hnB68aYT1+RZEc5vbTcufk2pKTFDa
         JbbBurInSai+ceKy8Iv6h8kEgILsI467YK9bOXqQHPyUQFs5ClUZYLEvoQAtQ1TyEDgw
         saSuR5WqpBs2/bVCVotX7ErKOni58hPeDevd7kkrL5FJx/rcxABVAgui0oeybevHLuUJ
         PfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611556; x=1735216356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uOMmOxTuC9inC7UAGuj5K8CgVJVzatCr2SxuceBbgc=;
        b=YzRMpOhvkx6jWsr1Szo7bjgyLIQIDdFG57SzG1/DB7+gG/tWpiU58CPOT/KC8fxQqg
         KPOXaKlPinHIxzzMvKedUSvWBJjPnaTUHE6P4IutkT2WEjG/s7QXO+V8F1swDNS6WDu2
         UPEf0Q3EBsu2/WY/zLpxdg0k+8GT52vYE7FgaR1X7CClYPejF+joxl4tGUWYk5SNmsQV
         1YQc+kVnanNEQealT9ShaERHdxy6CLl2SxhZIbGGj9QMLj8RCMwLBN8bvLK4w48/OHdY
         YbpO/oELvqlnvICOQ8RnVn6LqnPuRztXe0RMTdbu035T/+cmHRQFqfFXQdZ0neQUYQUS
         jzNw==
X-Forwarded-Encrypted: i=1; AJvYcCXto7+yHx5vjLQRdOPW0nN7mqXaeHV99e3+LWf5GoBrwrx0atXXO66OHEfAd1Ozgq7pKUzeugpTt7Pr/GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvOGB8SkT4iQORiNoSeqaDpWE9VhadEE5qaeHMlQrjpwIA0IvY
	X9NECEkQ2M4uxs67/yl7A1NBObYJH1u54YvpiYI/3Bwr6elMTqup
X-Gm-Gg: ASbGncs9D3C7T9Gp93SauUad/Baud1z1d+x2K1E9sYdFRziITnBFVrsU2+UM2/rNh3L
	kHJFQxsh3ZcXuEJA/6rR30blq00pEk1ogyU3MgCi6k1tDtnM+/I644nX+4eed5SPI+zzCG+RGL8
	bfHOwQcmRiO3eUfSoQIis2N8Ruo5UYuYIQoRpRkrWHPYFtm3m6dcjyzLkoRpvMqyxD8v25GJ9rk
	594iVvswr9qz1GkxEIt6m7+0PQ6ZtKhRl1dCArOncePZzbx0ZnsmyQ0Vg==
X-Google-Smtp-Source: AGHT+IHJaWy4Syj1FDqmmodsg0qce4bbV8C9mjEYRpvZWrWVy6MDcpPigtdiqfpwr/3HujPnW6Dr1w==
X-Received: by 2002:a05:600c:350a:b0:434:f7e3:bfa8 with SMTP id 5b1f17b1804b1-4365cbbc5c5mr23736705e9.33.1734611555485;
        Thu, 19 Dec 2024 04:32:35 -0800 (PST)
Received: from localhost ([194.120.133.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289e0fsm17105165e9.39.2024.12.19.04.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 04:32:35 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Chaitanya Dhere <chaitanya.dhere@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Fix spelling mistake "tolarance" -> "tolerance"
Date: Thu, 19 Dec 2024 12:32:33 +0000
Message-ID: <20241219123233.404925-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dml2_printf message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index b9ec243cf9ba..774c7692d416 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -8561,7 +8561,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
-	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
+	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 #endif
 
 	mode_lib->ms.support.OutstandingRequestsSupport = true;
-- 
2.45.2

