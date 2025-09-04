Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E82690D9
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Sep 2025 18:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012337; cv=none; b=m7PAVkj6yCmzmKaOBYDdhqVchDhiGIj/ntzejzzt49e2MLq4XO12mKRgCjWl80PtroR+srrGbpRqR8XwYN2thzjKoAfqOwgCFPdct+6p4u+9rcLuuOTOP6QSdSpSV3I+6Lwi2BdmD66oKxWOkezxchE6qGNLMcFI5/OyxGvV23A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012337; c=relaxed/simple;
	bh=Pb+xBGuXofkJWty7sR07UV3scv2U/dGsYvGE5Dxp4tU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtMt0T2wj16V93jlycH+z61miaQhe39IuqIFn/msyPtuxJFQ2NEZFpOFtsWq9/3rBMV5BdG2OxapgGR5lxl+Vo68wqB0AOzqPNeL+rJ8tUeH27b1+4Qwb9SsM6HxUaRHZYaj3tC1I/87XGQLz/n2pI00bLTZNpt6jYWPBgDQukg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LNSlqO71; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LNSlqO71"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3e2fdddd01dso38897f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Sep 2025 11:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757012333; x=1757617133; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THAARjTe9E517vMG9YGk7Zlz2cjrMzVkQSu/T28Yamo=;
        b=LNSlqO71VbU2FW0/k9JrBhxLdk9LMfrSs2IGADWBEYSYm6OFPGzDUG4wi0/kFgx2EU
         JjAAnit+foFy3L/baK3Bq4xFlkQlbdSv3g/8Ojgnk9u3TBq72dtbkpGdTCqLlVcaIm91
         t2m4eM1CxxtiaU2D7kVHWsnv7YB0Vfu4b6QOMmOjHGorG5P6gdkfNbNIi00iET75ad+0
         c1orivd4R9Ozk3EqpVcgmecsyinjICPMxASpNZXowooy0hbuov0lojpxS3UEX+ErQtWu
         86tFE8fzi5EiJEm58rlkNhYOgASBGr+9fCJf+Znq9BzKpHlkg3vDVTIihPUFOn5ujkK0
         /2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012333; x=1757617133;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THAARjTe9E517vMG9YGk7Zlz2cjrMzVkQSu/T28Yamo=;
        b=s2+S27A9stFGbkOD8QYlt/bVA3o5kY+dsNRUl0MjTBnozyVPhfzJ9auRi65ZPnR8p/
         L8Y2XgZbibhGR8LLgqXogfBsANeHhhwSOnRsnNo4oDrmTtkjSug+53v7HzzfVFvoasJd
         el8bxA0mC6yR7GlLzymIMOiHnoDeQl5+uy59b1WtPfVUjdfv94M4ZDwmQf5bXdbpvf0C
         Ih6MNYB53syt1j18Q602xlQQrtrvwzNrsla/jHGaJw9oaF4OgfpWPPTdeP4X6gTn1JGV
         oNSN7rc9daxO6GdTODi9AJvnDoTcHDDeGnsfAiV6LCzNLe6yZG0J8DA+twFEq+eDAoS/
         OSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeP5RN2qVU791aTy+1nUNf70yR1gnIq937o60A4UcmJL4Yle6eSnhWvTZFQJ8vRJlKjGow3iaQ+JD9rzp6pEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD1b2ZdZ1rVujsEGlpP5m/F4uif6a8H6Fy/2EYagDaMpc5wK6G
	fkpK05GjW3aF4VTbbxyrLJGoGX5JBaLkfhdJP7FS9Ydppom5EP2HI7mrKvirZEL5ZJQ=
X-Gm-Gg: ASbGnctLw08CIDl4TK8tXyp0lYxOa1RdqQ8u0x8LfB4u1DCqY0TliosquRPKX7siZ3X
	PDau17NJvrvl6vtSCTiElnG8VN1LeCBr/RI68yQK+yoCnDqL+qdzMRyl/A5z34hwI+HX5QnglvV
	pP9TnVnuI9rKrtksXgFzYTr9q957bk7TpWNW0dNQtwPbjunimFbcm5qzIwhIW/HTeV9hXmej6Ve
	l+ydKpprQ6tcPwMNz7D4ktEJp70yjPNFrKZc0C8Lt0MN1HlXOI6qxVrxHLae4PNc8nykep8wiq3
	RmmH812qKTctO0bFm2XTsngoSopl9jTgnnU3mBE98S7GgPMOkulv/0ln3U4pTBFvelpOBWwu17/
	CvPz5Os8XvMFgXn4RS72xWleyqaxj6lj79u59Ig==
X-Google-Smtp-Source: AGHT+IGHjaQMqzH68th7G1hlLUvy5iZJ7Ftrhmy23VSwVbhKc0VKhfXm8Y3FkmDt97UXGlsf+UOBzQ==
X-Received: by 2002:a05:6000:2906:b0:3e2:4a3e:d3ee with SMTP id ffacd0b85a97d-3e24a3ef991mr1671892f8f.58.1757012332670;
        Thu, 04 Sep 2025 11:58:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3dbead0b247sm9395154f8f.6.2025.09.04.11.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 11:58:52 -0700 (PDT)
Date: Thu, 4 Sep 2025 21:58:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Francis <David.Francis@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix error codes if copy_to_user() fails
Message-ID: <aLnhaU9cLeAdim7J@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The copy_to_user() function returns the number of bytes that it wasn't
able to copy, but we should return -EFAULT to the user.

Fixes: 4d82724f7f2b ("drm/amdgpu: Add mapping info option for GEM_OP ioctl")
Fixes: f9db1fc52ceb ("drm/amdgpu: Add ioctl to get all gem handles for a process")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 63eb75a579ce..2b58bc805374 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -1067,7 +1067,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 		drm_exec_fini(&exec);
 
 		if (num_mappings > 0 && num_mappings <= args->num_entries)
-			r = copy_to_user(u64_to_user_ptr(args->value), vm_entries, num_mappings * sizeof(*vm_entries));
+			if (copy_to_user(u64_to_user_ptr(args->value), vm_entries, num_mappings * sizeof(*vm_entries)))
+				r = -EFAULT;
 
 		args->num_entries = num_mappings;
 
@@ -1159,7 +1160,8 @@ int amdgpu_gem_list_handles_ioctl(struct drm_device *dev, void *data,
 	args->num_entries = bo_index;
 
 	if (!ret)
-		ret = copy_to_user(u64_to_user_ptr(args->entries), bo_entries, num_bos * sizeof(*bo_entries));
+		if (copy_to_user(u64_to_user_ptr(args->entries), bo_entries, num_bos * sizeof(*bo_entries)))
+			ret = -EFAULT;
 
 	kvfree(bo_entries);
 
-- 
2.47.2

