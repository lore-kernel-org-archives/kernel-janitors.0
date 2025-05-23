Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC24F28382
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016599; cv=none; b=MvbFTRo1/Cc0BuZUGoNonjwRywD1fKqG4aHEhVWlgN03Hv+Iq/ZTc+M0iVlKn+cE5psYPjHrLOO5yUi4yzVFleKvL+IuWKT5lJzI+e4/vFQdVVRTQxwf/zW8Gkd8QeVRyGkv4OtNu/zdUG0WA/O45foBVaSwdEulV5cU41KifgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016599; c=relaxed/simple;
	bh=Ckf2jUAJFRz5XxW1A+FCrCqbO+DN3zf9KbfrM+7gGv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=llS/ypstC5QHKMLiC7Ci5KXtSkumwDq5poZSBJMxywvycTUgqIRWpuiOQ25lwsEe1jtqwUU43NuJxSvWVz7A2XUhv0bdSqH6pe7viZiQPa9Gz7XUfzTemR+ogY79Juj2QHE2pGGc5DVmwcxmb+uudeJVxkqgYYam5HBR2tq63l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYS1q7tP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYS1q7tP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf257158fso72471325e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016596; x=1748621396; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ui+xdwWINFM5L07zkqDWB9NaMyj6SNEWap+rmv8ceEY=;
        b=jYS1q7tPXP7UeocYNmmABadjZxb3ZS9DMJXu4lDPBKbMe91D2irTJodV0J/u9pZUuD
         xa7cSGXdDCaso/4gMN3dx8W1juxvu7l9tNFvkfazSZa+FRHLlRjo/RvZw1n3jUxQ05Z+
         ML6XYWCfB4hcgJQzfC95HHtbUoQggyzSGNzr6Bu6BzM4RfxiRWZFpbMxZoZzKLeFGTfM
         cFoSTnplqbHzncWl5hByAmf7pMQFOqhVMNRPQIYyj46PI5Qi2jCGydWkIKxJ6JRIaGwt
         xBAQei1lS5EqxaN7P9Sh3H3vVqiqCVZUl6fNFnUX3WcTcf4cx9oJLUMTBCEMVR1pqBKt
         72Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016596; x=1748621396;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ui+xdwWINFM5L07zkqDWB9NaMyj6SNEWap+rmv8ceEY=;
        b=mrR+np7cFH9x9SewwcZOAl8fSgvhyqEvst/MbjZh4aSxgOv25AkrlpbV4JEhnKu8nh
         DeTn7amtZQ/Dqk4BwNeiaf5zhkZKK+itHngmtKxw6bLxZ/sG/JK5OulI5dM9yOMksxCs
         nou41uV9+7Mc0OspEUpFarfZLvwo3hUIgXSZaWQ9TAyIv/8h32CMkUn2+cCI6W19Vd+O
         j9y34ETxSXj/u03I8DUIiqz11nI9851vJCJw2vXTHPXjj4Cc1ezHCv6qf+P5lCdkxT5d
         WRA/uAgqKaS4nl8MeSYEhRJsrwcjylRF2WU/UOYcLqdNwO4GNyOwXwuBMmH6Zql6xbOO
         /GEw==
X-Forwarded-Encrypted: i=1; AJvYcCWqSSsi+LC+DfpSvDyX8vYE4Tzlgh0S0bXuus1MDj7RMo0PilmEeqmXDe6JrVGle6EuJK4gBkME+7j0DuDoZm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYoCUXfhHbgKXCBDXDz0zxaQawsz8xz78qtZSX6hdcGBM7+wJ
	VaODtj1EdPUBSnvlUv6jZhISOaC7ta1FqfKt+UK4fsXl3wEDtjiJ40/YjSy08RzFMiw=
X-Gm-Gg: ASbGncsB32B75cQHZ89KiIkq2IZDxn7QNHWVHtwPY/KnUVl75L8aSs9c4f5tSoUX390
	8YU/QvF28BMU1FCpPxu87+41XEHMWsGlwbnZUgDEmlKbt2BMVynbNkEj98jmnC8eB3sA3Q9GpkD
	5ot6q6u2oeECrpA7MPeUJecC412w1UGJw3p4lqdw+gqqJYE8jcvFvIA0UA9yt8vT87hJxjrA076
	IalKF6+1uL3Zdg6bPOTFVWHSudPS1gH592iSimW1eawKRgcfO+YHIf0s78nCnatdnwSVK7Suc0l
	ZBABtAacf0Ml9IYMWal0YWECYvdP7EEZFhJEuUFwwrBlM7g0XBxt+lXYPnjkpJV+tYw=
X-Google-Smtp-Source: AGHT+IGqMESqzvP/96nvyjOYKe0RppaRLZiQpOwJY6/fZFSF8xVdTA+Yk7GHTTmFzbVLBQ3RWhPt3Q==
X-Received: by 2002:a05:600c:64c5:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-442fefdad81mr267539755e9.1.1748016596132;
        Fri, 23 May 2025 09:09:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f78aeb8csm144108785e9.28.2025.05.23.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:09:55 -0700 (PDT)
Date: Fri, 23 May 2025 19:09:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arvind Yadav <arvind.yadav@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	Yunxiang Li <Yunxiang.Li@amd.com>, Frank Min <Frank.Min@amd.com>,
	Kent Russell <kent.russell@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix integer overflow in
 amdgpu_gem_add_input_fence()
Message-ID: <aDCd0MrLste5b2HM@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "num_syncobj_handles" is a u32 value that comes from the user via the
ioctl.  On 32bit systems the "sizeof(uint32_t) * num_syncobj_handles"
multiplication can have an integer overflow.  Use size_mul() to fix that.

Fixes: 38c67ec9aa4b ("drm/amdgpu: Add input fence to sync bo map/unmap")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 2c68118fe9fd..0ecc88df7208 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -58,7 +58,7 @@ amdgpu_gem_add_input_fence(struct drm_file *filp,
 		return 0;
 
 	syncobj_handles = memdup_user(u64_to_user_ptr(syncobj_handles_array),
-				      sizeof(uint32_t) * num_syncobj_handles);
+				      size_mul(sizeof(uint32_t), num_syncobj_handles));
 	if (IS_ERR(syncobj_handles))
 		return PTR_ERR(syncobj_handles);
 
-- 
2.47.2

