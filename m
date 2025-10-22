Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C311E28DB54
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131011; cv=none; b=HNWuZCm9FwWHxQMoUku9yHh0+nQinrqhuRyMjSMlgX2E0i3D4NmA+x3sx8wM/pwNmUFlRycjcHuhgFSMEeG7VvpyEsdl1nT0LfTfYQbwDQVsuw8ZSpjeVtCdCelLSPC7nevWuXwKXeFCX/4inYXONg1tq8iZNfP9KQmgm2zkXhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131011; c=relaxed/simple;
	bh=9Uy/GbSSbrHH+J1cYw/X1Mkj5ppEIj6A+wXow5MOoZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPD4n6umA/mfYW8EC0qgEqEH1sIGHydLBEdtsmaJTHGiX18tVHSJf5vOdg3WIMuiUC8nXAMft+7LHjdoFKNLw5cFgr5G9/rQYgJlwLesn3exYFR4SfS+QIdUOzM2Je9P0YvMK18K5uzk/vmyumQQqo0rJSkurdQKSTap0ohV5V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OMLxvlHs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMLxvlHs"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so8680034f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761131008; x=1761735808; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXsoFSKSD+Jxnxd3GCdpg7hzwIK45uE+7Oq4mebbZTI=;
        b=OMLxvlHsHPYWxDDfKrfCcfJoehPNralEwh6Pw0I5Udm+OBYp3YvwNz04s/HAw6d26M
         PtYxBO0ypue+JIe1Tshop/EAGyR6zGUeG3eGGWO07Z6STRLfZhlcwZleohZ5jMJw9ID4
         C6ncMiS5+qhx54JPnCLfZq5nACHk9i7RYoVnsJrRAUw0Bi7S7glOKL3z+XgPhvp29wmM
         vb2e7XJTIfu5ttx+p0//sU2dtm0eghdiAZ/A32bUeuQ1fcoLqoqu3OKuFn35Z1wsJKAE
         jXa4w9aKyWXB2WUldrMVJBnoDZHdmfh80f0JAImWuZS0sW556kRNkjbohkA8Aln1vA1A
         PerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131008; x=1761735808;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXsoFSKSD+Jxnxd3GCdpg7hzwIK45uE+7Oq4mebbZTI=;
        b=EDZreaueqKaulJSniRXBaCh20BesMwlZraHHHLNvLKvK9J4xVDnY3qsSMZ2hAdmiz2
         n6K2RJbHwxxlMbm65uDQ2zlrO6z+tmC/laeehMfR93qaLeiWE/aSwppOo+TQCEpJLhT1
         LIcRUszGVFoovhIREpFHFV6IeYfO2f4Oqr43mqHafBecn04GgqphFKrHoND1ByOZsTKr
         KacDjTJQ4+aYbxkln8dhzFdOe+bqQahwUE1koVzyeFy09Vi8hhrdVplrb9bZnkOLT2rW
         1WYcovEoNM1fOftTGuk9M8ohhhVY8sao1fI/Mi19aDlyyy/M7GHiAheqLiWLSb5jvMRX
         9DSA==
X-Forwarded-Encrypted: i=1; AJvYcCXma6L3XjQ/xbBVWxmt7+zzSCczVsBa1E95pXfkKDiX+nHnLqO5jr05JCWHbMeGDQtfx3WMl9B5bOhsxZgvTzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/u3bfE5fIqyL1xGz/tzD7Y1DF6huJo+MATKyZjXTYJeTcaato
	NNf0THFxXw+M4w/jKhzz4f6g046+an09xa5W8CZCYqMiVkxHkVRVCWZV5n1dXSOP+v0=
X-Gm-Gg: ASbGncssa6ujAge9BHmvl89H5ta93oUMf8WZbAoUwQrdDhRic3dJjbl/Kq3vuXryf2X
	5wvieVjB/42d13nvtheTzRnbkFdQkWVKVXjdC5LJDI/dK94AlrDa9e6qrx91t1ROqhkfCplZ2PS
	tOsSDVPYf6KD5X3Ga/c4xqeoLmrlQag5DPhFMrObbsaCLMHKtJkNEEtOAU5VmL+aoSNQcYs94gK
	GDgp9lpEic0EpnXfwiEUbdIhW7iInMVgCkbSEUbMid2KdwPBpqyI5ew6rqWZa1PkDJ2yH9ruHs+
	gAS1j26Bb6TduFMiAOb7xkP0bccq6wup4GpEWw+R1dRKKcmsPP2ZkD7LA8hH4Rwi6zTjXrfN9W7
	iT85ADJ6n3CHajgS6vGJydhLIA1InJvvrU8fdJ21/sRqM9KXuydQ02NcrJ6tY2vA7K+iC6XssJz
	MmoT+G6StIAyOOisu1
X-Google-Smtp-Source: AGHT+IGqGsmmm51ejlY0k7sOzKGZrFx3JPVXLYQMM7eHv3uJuXOnG04Xu33Xnd/PMxPWMzgUajg6yQ==
X-Received: by 2002:a05:6000:470a:b0:427:491:e77d with SMTP id ffacd0b85a97d-42704da9e16mr13267011f8f.36.1761131007920;
        Wed, 22 Oct 2025 04:03:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5b3c65sm24546043f8f.15.2025.10.22.04.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:03:27 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:03:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prike Liang <Prike.Liang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu/userqueue: Fix use after free in
 amdgpu_userq_buffer_vas_list_cleanup()
Message-ID: <aPi5_CILMKn3ZrVd@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The amdgpu_userq_buffer_va_list_del() function frees "va_cursor" but it
is dereferenced on the next line when we print the debug message.  Print
the debug message first and then free it.

Fixes: 2a28f9665dca ("drm/amdgpu: track the userq bo va for its obj management")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 9d4751a39c20..2200e0bbf040 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -159,9 +159,9 @@ static int amdgpu_userq_buffer_vas_list_cleanup(struct amdgpu_device *adev,
 			r = -EINVAL;
 			goto err;
 		}
-		amdgpu_userq_buffer_va_list_del(mapping, va_cursor);
 		dev_dbg(adev->dev, "delete the userq:%p va:%llx\n",
 			queue, va_cursor->gpu_addr);
+		amdgpu_userq_buffer_va_list_del(mapping, va_cursor);
 	}
 err:
 	amdgpu_bo_unreserve(queue->vm->root.bo);
-- 
2.51.0

