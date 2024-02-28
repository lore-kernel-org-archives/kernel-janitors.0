Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8715CD42
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 17:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709142250; cv=none; b=fUgI0BZMjbO1xgVUdkx1eTaVRNafD4Ayrm6o9IuxhViIC46bI7GfMXhsgrdJiFgzATNZFX+KQkm6QW/LZAU0lk4OUeyxnmT2UgrefZHagbsfxlLrSyoRlbVc9FXRSS2L8NUqdCuUdPRt/bKCgcgUHc0WvBBwrvmDwtumYZ7Z2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709142250; c=relaxed/simple;
	bh=W6V/WUDrcU6ltqu9bzNaahvrM7LME69p9CtE6KRKCd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=it1u5ausZ3foyPunfgul/eF+wi5kBn2C3nHXyYepHDlmGddSSJjw9k4hyDEfmztZJshPFemfBHSZi19R+CDEVqd1aSaX8bq3+QGvIUFbHVLHKEmGFo3/Rilfv9Y/LI7WLk+4ebNlzbYMhgpi6D8JwWvqeW2uWgK4XzR1gCh1rk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ymi35g3E; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ymi35g3E"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-412b814da6bso2690015e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 09:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709142247; x=1709747047; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQYfGRlMuAzV9NGrkcAH7hkAKHgrR0yYSvegD/d+xL8=;
        b=Ymi35g3EEvkMiXXIouWabZ77SZcpf2PnI9YixiRbeWetDQW5jVnR0/tzDLx6B33lb7
         mEwhM0o+GsJ15JdH2I6QtSJLUYiyKJgdytf/qU+QbIwuGU7J+3R23l2p8jLII2PFUyCt
         PceCeRRomVtvwV+l8Koe0VfAakSwMeFBzADIFlk6wqyuuT4YvR+uD8GQ7aDsv8xi/ICF
         06tkgwhsxkzWc/Q1qG/b0shlaVDg0dwtmk1SxZu68jzKN+zpn/QxyK6D8f9Tw7DRuhVY
         KhU/LS6YLpruRlZqJiJIGkW+IKx8HruMK4gJC4BIGSShmpPYew7tLI3BQ/QpP7ICcQK1
         b1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709142247; x=1709747047;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQYfGRlMuAzV9NGrkcAH7hkAKHgrR0yYSvegD/d+xL8=;
        b=NBnK/8latyJchpSpJmOpCle92q0KrEMfgi+4w5bUGCHZy1jtB7cA56NMueIh8Va0+K
         SdEzePS0/y24+wDPbH8uf/TRYbGbxBrI7llAAQQ42teHD2Xr1TdNrx6uDZ5xaf80P33J
         brcRIjT/vIcOC4iYOOEMCRkEkr/G+LUIo7bLx1BxW6ewbt2fpv0KLGuuokD03wZ6kcCo
         vMk0Quu1/o38xjKyN+3DuL5jnn5jdmCedmDZLa7mC2Xy1JBJBDhLaFChEmSnga6Sn6Sl
         PnQFjZcDhiBE8t6mhDLrUIup7c/msI+a+AeUGCSGMGDKAyafYzoqDItDzIzgf037jWIW
         n9tw==
X-Forwarded-Encrypted: i=1; AJvYcCXzqxk+STrru+YqqQ8bAIqtGoSbLwWatnpVwbJv2kSCjZoA29EMG7pfoEz5NvnZNm5r85c7fKUq5upPXamLGTfonpd57HOKsF9hovrcoyGa
X-Gm-Message-State: AOJu0YwT6JaPZxdw3u9hX8EQSAMya+eUDfQNbgAxRAH9wS5s1IXQa643
	jJB/vlRAVT07CD3AvNzD5PjODT6XqEFZud4A3+84vwatiD3OGRYq+kTfLirJBC8=
X-Google-Smtp-Source: AGHT+IHOwDyfmepDmBoQvFrRKQ7FFwyrzLDzVXnTAg0OSmmsmnEyu00VFewWnjH4ylk3CMxRj1xMVg==
X-Received: by 2002:a05:600c:468f:b0:412:64a5:a21 with SMTP id p15-20020a05600c468f00b0041264a50a21mr127317wmo.40.1709142247357;
        Wed, 28 Feb 2024 09:44:07 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j10-20020a5d564a000000b0033e0523b829sm1008975wrw.13.2024.02.28.09.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:44:07 -0800 (PST)
Date: Wed, 28 Feb 2024 20:44:03 +0300
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
Subject: [PATCH v2] vduse: Fix off by one in vduse_dev_mmap()
Message-ID: <e2361611-e8e3-4c6a-9f71-30e81a65f793@moroto.mountain>
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
v2: add array_index_nospec().

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

 	vq = dev->vqs[index];
 	vaddr = vq->vdpa_reconnect_vaddr;
 	if (vaddr == 0)
-- 
2.43.0

