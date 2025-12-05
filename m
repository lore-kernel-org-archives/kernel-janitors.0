Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B96732BF25
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Dec 2025 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933045; cv=none; b=kzArWEhIvax1QJqbGPdoa9JD7XEPhABXIVaqJC4D0KS58Whn8ywrFesQ90v0sHDAScK+ANWEu+FS1y0IzIvgP2hnyyBryR7lXwjJ4bARkH8WrwcnLpbxLgZrl+fZTQ/ewZiWw8nq6dg5FD0Sb4mH03TJhQfNONE1lnnQN1Y2g9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933045; c=relaxed/simple;
	bh=IBnAVWidb7zN/GLjeF3/xNaqrdPlXS2icM7IIaBqrjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dbuwJgeECnBY79+CiodmQEB9mbWT6t+M78t31cjFaWyNbqhefw/SrpjrHeifxopuRyUsOzAlDv4sSQYdei2nvz6mWYxf+fGcCm9QjnKsP797CO1ACEMj9wpiCjlQpbrmxch9StQyK7sV/xM5JgCw6YSZ50X6Di+DS8nxLM0E8/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w4LS8n/S; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4LS8n/S"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso1180533f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Dec 2025 03:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764933036; x=1765537836; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zh3HlpbXaEbsFU72svAbecwrRCi03W2DYbr0+25RALI=;
        b=w4LS8n/SKcb4x3xTmdgtOM7enrPjBiThYpIqo2YhRurT96eelEJE0kkAhQcTZW63J4
         ak/K+0sSzsWTO/J11y/vONS2ye4FDimc+edpSxuuVuETaUHnqnN1zHZ2H+Q1i/QafFwN
         1szlGvmRwp1dzsx4rWBVeRceU77sFXjIj9FJZVt+1STJ+rcN0fkG89uR0XVBy/RrCM3E
         oODgtTSpdUKnh5L3gwPIxvPI9JCCzCWnbfXmtaKhXRyhEz4bH3fWA3kD+n28pa6cRSLm
         yCnGKVoqHevkx5MVN47b56wRht/AhWZH9oTtkUPBFdA5lnhw/AZf71qkcwF2NqjlksOm
         RviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933036; x=1765537836;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zh3HlpbXaEbsFU72svAbecwrRCi03W2DYbr0+25RALI=;
        b=p7zcV/0Bi9u0kENgWCwnuznHfald8dSrz7rIRZKUV2g7n+cpUYRQY7lPktWAaWlazz
         LoIyolUw4BPIBVHr4QAOe+HLRYITwtUS+dp8x7sdktI1jq25ezPglzEcN2PgeEd+aqXl
         Tq51knUbk7apNB5WXdgVnou0ImZZRv2OKe9TPXscq92qhaajLDNeEeYCOrfCipnh3s1D
         f070oM6598g4IxukiA3KmlpLmC6sQb8i0sNOr87lRI0ZDg6kUKHAku14K9MX4q5vuG7W
         RBMa79yoE/JYNWdKBxHqJEXvlfovgrbEmyn18YcNBQz3AmA+NV91tZJJUUTrQLWm4OH9
         t70A==
X-Forwarded-Encrypted: i=1; AJvYcCUziYKhZabOLCJrCncM9IiH6gKhfZSZ9g66z5Ho9tAp8hDeIomQ1VmNiPR/fcWPCrQv6m1EofwyrskFGHD3sXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzURtVAlxoY2knbQa1R23vywlOSDjKtrlu4xIteFyJYy8U6eHyj
	SYV5mJgW2iGRZGMSED9b+6jla7qPY2ZzR8EB5E/tuZkaMcVP0m/BowrXkyJMZJS03lk=
X-Gm-Gg: ASbGncv3nUJHpa38NYK0E/iDwPHs2og9PBYKPrhy6CWakMLx0DajxQ/XIHERAC+LBgg
	FOz+Z7G+fA5QCcVZDV/IbFJQ0klnY4KUhUBp9+DXfFfWBfeNuDtNdxbs9VSrpLcafgWjTzLPEAa
	u9hy9k45y0v0mI+EbLDpatl6hjtfgDKY8V2vDciC4FYcruj0oVLKXhkhrEmutwDpV1EiNlUMQsO
	HJvVaHZNz36UbJf74JhbFVMjICzmdw9pB0GlNNxylNYFRpc2klc3eBCnfRBGtONTiksAmATu5VE
	HvVQIPzhqpkqoTus/NFkE5Xj2qT7rmchZXaEwB4N5urrT0nW9lYo8eDxCQfuDumOz+5YRx4SGW2
	B/sbEFxRjOfqcT/4h23oHzQKBvUrMYAWItKoKoBcHBkrSxE9wyLXXGGr4HRSn+RrK56aS41LtWV
	k2nWBOw1EoZTQDBmMyS76aLG5T5Pc=
X-Google-Smtp-Source: AGHT+IFBPmoLYadSLlgUwTUBgvI/LNUXNDFZy6frbQ03ZessPie4IT5h/pfwlVJys+MolOQK0aUa6w==
X-Received: by 2002:a05:6000:22c2:b0:42b:3c25:cd06 with SMTP id ffacd0b85a97d-42f731729b0mr10031252f8f.22.1764933035867;
        Fri, 05 Dec 2025 03:10:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d2231dfsm8337840f8f.26.2025.12.05.03.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:10:35 -0800 (PST)
Date: Fri, 5 Dec 2025 14:10:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe/vf: fix return type in vf_migration_init_late()
Message-ID: <aTK9pwJ_roc8vpDi@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The vf_migration_init_late() function is supposed to return zero on
success and negative error codes on failure.  The error code
eventually gets propagated back to the probe() function and returned.
The problem is it's declared as type bool so it returns true on
error.  Change it to type int instead.

Fixes: 2e2dab20dd66 ("drm/xe/vf: Enable VF migration only on supported GuC versions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 86423a799d57..1b75405b8d02 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -226,7 +226,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	vf_migration_init_early(xe);
 }
 
-static bool vf_migration_init_late(struct xe_device *xe)
+static int vf_migration_init_late(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	struct xe_uc_fw_version guc_version;
-- 
2.51.0

