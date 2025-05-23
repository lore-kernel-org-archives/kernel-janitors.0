Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603C130E58
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 16:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016365; cv=none; b=S/cFwY3U3DaF+NHFqwvuPhtyvGI5+VueRSZOyG1vdoME7yud0/lPlfwUXv18/goA9tVMkychSTQfVoMrEtEfZ0eAVLPeFx2u3oknCAarHwRR8IFV9/XV6Es01YSs4++GxxZNpUz8ovvUMrMRGxH3yu9NYALUAwk9N/4hTf7ISb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016365; c=relaxed/simple;
	bh=jVrjFU+9I/Crz5h30CzwkjrvZVdhY6m4bkGyhy25dtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BqndvSki+ruKzAPPrdv1EbZ2gkWa30/uef87cvrz8CLVCAX81pSlpsvXtuzmc3olF1crMYxMe+D3M0rUkyWay691psusILXGQbOIUSj+G/1Py+0KDvo4TUWE7YdHMvGniftnidYcFHF2etTTnrJNAbJrzLwradPut3J6C/Yd5Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gaqZG0Yf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gaqZG0Yf"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so57445455e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 09:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016362; x=1748621162; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M3PqxfXynfBYuWj+aBPHCbylQDdPJlTEN/Ktqk3XEWc=;
        b=gaqZG0YfQVTtXky9B6SERccgUHkTrRyRC5xRZwI33eRe5vJuE2mwzX6ubbyY8Ph2pU
         4Ij/TRES8tMSqZMZtPgNzm/DygatYWqNQBSr+3mVUqooHobm+Fa8c00V+1OsfjKwuU4d
         PzB623DktQA2teDISnhvbD2fSNHvHHZSxSXSPBUNDPbfE9I3WymojqFiuGksBaFyQmFx
         q3QiM0fot+h200BCPja6MnyfgfEJ/VjI/qoD65PzMjQEme2BxyxbbD5z6V5EBjJpQe3m
         aCRyEa+ay/jnd7pc0Xq3RczjKxUmv0YIE+UIKSrY2D3V8wBMcj5FlR1kjkJkBrQFF/3q
         xeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016362; x=1748621162;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3PqxfXynfBYuWj+aBPHCbylQDdPJlTEN/Ktqk3XEWc=;
        b=a8oHtb6PQchph7F4tn8ur9haPczrhtrHoMon5gUh/dg9hlSdFZSvKlMeLOdQ2ce+QQ
         WPZqn9PnNGfihSnOHkMiEHlaRv/JbKCUG/MKkAE5in49h1RL0OozLmyX0BWeeGuL/tXv
         HmfNh6iheqdHf3gj4Quq93vMAHuB/D9tjW0R9Jia3+Vm59VMz9YwMgVneqjs5skSXH+m
         VqEhuVyJVAW4NWZnqTdPDY80yKq6S9ZFRIdhs33iFDvpZB6ZLW7DtxX5gB+D/fRrLK2D
         Vv213kDR8KRDsvleJ4V6WFCFmzJfNcOhAiwM9vYlTIIeTBYnrDhj2yQIiox+2wwAHOzl
         z3nA==
X-Forwarded-Encrypted: i=1; AJvYcCXkW9Xfm3Ztl0D7uIuljxwA71UMzWWX+SX41YT1eeF53PhFGRxEzv21Yk+hzDtDJexNZjMC8iCkiaN6phHuTWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR9ITAPLgYumJ9IrNK88FM47qt0BMXxnhc4Wc9ZWwnk5JIpAoz
	C1sTpbBK6cVJ/A4FyGB18X1MSMYo65K6jnx4DWV06uwhafvec4nitHQ3Kh8OMpa99Rs=
X-Gm-Gg: ASbGnctsoTshNtY+nUiWsbi96ZjdE2WT9ogBV56nhsD7NmPiCOBNRiYbrXbvy3OG521
	mruc6+oOyzfvKTHL1jeIiLCrsg512FVN6nQB9ViUAm1SuLnaeXIc+X5bOgLYMLITzg0+tD6I8Nz
	e0SsLp8N/IXdKclQWRxbkkxaMDRQwnIimRJtCYqcuH1StC6BkG2ONfk3Ezb5C17aEeTEjpRJ2f7
	shUboCw55RIJD0xLwkEYNM+cuE7ktgwPGBQtsdNDgdQxntJ9M9+udzvpxiS02r0HJJgqn7nbLid
	XqgKo/7QDZ8IB9tjAo6Epb/Q6VSu5jbW6ugn4Krrugg2WxZwMhmrOfPT
X-Google-Smtp-Source: AGHT+IFJ5XQsT7wDZaHxzFgw6dPrlGsnDhIqeTPzVlX0Fk5sLByi/O7PehwjP3rV11vD6uhtm2P9yg==
X-Received: by 2002:a05:600c:548c:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-442fd6759c0mr247232745e9.33.1748016361628;
        Fri, 23 May 2025 09:06:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f73d3edcsm150813565e9.20.2025.05.23.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:06:01 -0700 (PDT)
Date: Fri, 23 May 2025 19:05:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix integer overflow issues in
 amdgpu_userq_fence.c
Message-ID: <aDCc5kawU4cWj-Cx@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This patch only affects 32bit systems.  There are several integer
overflows bugs here but only the "sizeof(u32) * num_syncobj"
multiplication is a problem at runtime.  (The last lines of this patch).

These variables are u32 variables that come from the user.  The issue
is the multiplications can overflow leading to us allocating a smaller
buffer than intended.  For the first couple integer overflows, the
syncobj_handles = memdup_user() allocation is immediately followed by
a kmalloc_array():

	syncobj = kmalloc_array(num_syncobj_handles, sizeof(*syncobj), GFP_KERNEL);

In that situation the kmalloc_array() works as a bounds check and we
haven't accessed the syncobj_handlesp[] array yet so the integer overflow
is harmless.

But the "num_syncobj" multiplication doesn't have that and the integer
overflow could lead to an out of bounds access.

Fixes: a292fdecd728 ("drm/amdgpu: Implement userqueue signal/wait IOCTL")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 029cb24c28b3..bd79f105d77f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -430,7 +430,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 
 	num_syncobj_handles = args->num_syncobj_handles;
 	syncobj_handles = memdup_user(u64_to_user_ptr(args->syncobj_handles),
-				      sizeof(u32) * num_syncobj_handles);
+				      size_mul(sizeof(u32), num_syncobj_handles));
 	if (IS_ERR(syncobj_handles))
 		return PTR_ERR(syncobj_handles);
 
@@ -612,13 +612,13 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 
 	num_read_bo_handles = wait_info->num_bo_read_handles;
 	bo_handles_read = memdup_user(u64_to_user_ptr(wait_info->bo_read_handles),
-				      sizeof(u32) * num_read_bo_handles);
+				      size_mul(sizeof(u32), num_read_bo_handles));
 	if (IS_ERR(bo_handles_read))
 		return PTR_ERR(bo_handles_read);
 
 	num_write_bo_handles = wait_info->num_bo_write_handles;
 	bo_handles_write = memdup_user(u64_to_user_ptr(wait_info->bo_write_handles),
-				       sizeof(u32) * num_write_bo_handles);
+				       size_mul(sizeof(u32), num_write_bo_handles));
 	if (IS_ERR(bo_handles_write)) {
 		r = PTR_ERR(bo_handles_write);
 		goto free_bo_handles_read;
@@ -626,7 +626,7 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 
 	num_syncobj = wait_info->num_syncobj_handles;
 	syncobj_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_handles),
-				      sizeof(u32) * num_syncobj);
+				      size_mul(sizeof(u32), num_syncobj));
 	if (IS_ERR(syncobj_handles)) {
 		r = PTR_ERR(syncobj_handles);
 		goto free_bo_handles_write;
-- 
2.47.2

