Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32B140846
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 18:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709144654; cv=none; b=fdX4+D821MiCtx5Ll1W0Ri+M7SsB7ydmG8FZOBfDXVU8gGoEy2r0w9KGdFAERYK9J7R30HIg716wy9IAleDFUBvkt7eqZzhPeP2WDTVp+qac/TrWgAsN1z3j8dWtJFty2zbImwEEUK1VekvAumDgU+pBprQDOg1tkAx8u3rDfTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709144654; c=relaxed/simple;
	bh=r81XQMf23teX1T+JGKRU64I4W8Z8plFKuxG2dA9W0e0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JCBWLSyVeDskxfPVBAVU47aKSHXFDFJXANOdP45oR+dcrgtunb0VSrlSSuYp/IhEav4DivxYKLHndmnLX8JaqQeAPBjrYJmfL+5Mw9z/djXxz8Kdl71yLCE+Amb+wLuFAGROl0VkEm90wbu03piiz+xQKTrpsymPydZ8oQDbMHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=joQFw1pO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="joQFw1pO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412ba5ce271so177005e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 10:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709144651; x=1709749451; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Qz1dKrMSqcJN7vhekUwEPSMU/YeVaBN11f7/M4F1f4=;
        b=joQFw1pO5rSKT4ik+toEE+KLxABAeNEwHJ9bgvPrBH57WAqAZF45Q2eNXGmArQobII
         H14UpvAfd5yEx9YkWald8rilqmwVzYSQ8l3NUfFQGb90EekzxaETh7pcUjnoBOItqCTV
         Ml5haV6XcRJpbUbM7W8bhN9fDMuuuIPRYZCJ8X6Pr39V+sacyf5GzCLAUqBaHgTgKv69
         3OD0lGEvF768gLee0+GVxREkHN/qWfbwr4/3jRR5tAwr09Q85ltW7B1s0YvWlEhjdZTV
         2doyaAzVOv2nlKr+XlZ33h20HhONxLGj/aSxgG20i6mrA34jcl0n2DO4Gl9LqSfQLXAy
         dvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709144651; x=1709749451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Qz1dKrMSqcJN7vhekUwEPSMU/YeVaBN11f7/M4F1f4=;
        b=K+y3gMXqTH+f3g03wvlYNog+7GNOxpB0HmnAP8fTLe+53/0rD0TliarbTUN0bG2kZS
         JHrWlSbxz6Q694ZQqY8+qp9RTxZ9vG+us82SHMiAgmjNTgJov1JsaXtGtpLc4QeJDN+u
         ajX9lZqgFkjt/Ae2vRx8G2aPe+vaoZZEUYwoHNtlHyjmFF0rNJK6zf1TV1HWx0bRf4k8
         kLj69CVoASrS3jtJcyNPqn1oUxqLTrzazAWyCqe6U43fYw1eF8KJe7NOU9jEorK6zHNW
         4S6XvlY2A/WsdCVqGyDvAPhASxbniRgeTHXf8pIiyNz//1IDF14OIoUWVueKEU4hGJFC
         p2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUJryw3oKaq5TdLcYAOVjHMs21jB/Vh6VvQijQrGtzMG0qT4+AfK12PIQ5+6SWIDw1QIgQ4U61s3fAsHBXm92EyquGyUt0JFPmAL8w+FGnI
X-Gm-Message-State: AOJu0Yyh8wry+A/y/m5MwCteohR137YSY54AHyXwsjx9eYiMvHHyvmVp
	RUsHI4is/uKVunBP/pddSDkYMf7mEOT4leiRaBv/8GUWoTT5y2xH1SnOIqKYMOQosFCdmilhM1C
	o
X-Google-Smtp-Source: AGHT+IElRJ3gqeiSGlL5qwYW93OYT6mf3vu1RfSzg+Bf0SkGa+KphevMjr4f+hkHMRduO19FmMIfEA==
X-Received: by 2002:a05:600c:4e90:b0:412:b659:1ac9 with SMTP id f16-20020a05600c4e9000b00412b6591ac9mr58808wmq.11.1709144651138;
        Wed, 28 Feb 2024 10:24:11 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q16-20020a7bce90000000b0041069adbd87sm2781312wmj.21.2024.02.28.10.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 10:24:10 -0800 (PST)
Date: Wed, 28 Feb 2024 21:24:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cindy Lu <lulu@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v3] vduse: Fix off by one in vduse_dev_mmap()
Message-ID: <98298b2f-7288-4b0b-8974-3d5111b589cb@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The dev->vqs[] array has "dev->vq_num" elements.  It's allocated in
vduse_dev_init_vqs().  Thus, this > comparison needs to be >= to avoid
reading one element beyond the end of the array.

Add an array_index_nospec() as well to prevent speculation issues.

Fixes: 316ecd1346b0 ("vduse: Add file operation for mmap")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: add array_index_nospec()
v3: I accidentally corrupted v2.  Try again.

 drivers/vdpa/vdpa_user/vduse_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index b7a1fb88c506..eb914084c650 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -1532,9 +1532,10 @@ static int vduse_dev_mmap(struct file *file, struct vm_area_struct *vma)
 	if ((vma->vm_flags & VM_SHARED) == 0)
 		return -EINVAL;
 
-	if (index > dev->vq_num)
+	if (index >= dev->vq_num)
 		return -EINVAL;
 
+	index = array_index_nospec(index, dev->vq_num);
 	vq = dev->vqs[index];
 	vaddr = vq->vdpa_reconnect_vaddr;
 	if (vaddr == 0)
-- 
2.43.0

