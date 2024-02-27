Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F98F130E2A
	for <kernel-janitors@vger.kernel.org>; Tue, 27 Feb 2024 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709047314; cv=none; b=r9IuBeRggxjtvyVSiIeGiFA+b2dQYJljgeTNEeEg6OtkQF/R3+gY5LZUybfP9+DzhrKzl9Q1zAQZkM6OnBBWfrjh0IIOxMxmmvwuzm1+wUgDLHJFW8hmZczo9oBzuNoHsimrFgUyj76fGaUlwk9Fl05VGlzMIfYca6wU0Yr1dXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709047314; c=relaxed/simple;
	bh=QsD3Iiv/LhOTtgVgR1olwTS+toXhr/zliUNlH+elpAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k3VIwdQqWmC3KRECJPlsXumZRk8g7vTnZdvaW6f07YR5Cy43BQ+K+EMfLU8WEJ6Jei3OjOOqFyLDromFMbP0AbGPdggKzMQkxfm6wWaNRNCjJrjW1aNj2l940ws1rAg6jpK+VjsUXrSLMCQwLZLOZZX7HiISlkwO0Gf7b9Wae1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ri3l2R7A; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ri3l2R7A"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d32f74833so2437580f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Feb 2024 07:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709047311; x=1709652111; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAR0191YpG6gmNK9RS3NwTYy2tpEgrl20yHlWytzXZU=;
        b=ri3l2R7A+XrPEGDg6IcfpybA9G2bLkWtL9ROxsuL+Bs9als04aADEZjU6hoLdwWmxW
         DI1YwI6IpAeWNUkGBFLgwaQqRpQKetF6mIT+UwHGaviO2aPiYCgB3hDNeWLruViR+r4X
         ++HMzuE1EZ7fvxbMUk2E1q3IJoIUDw3yjXXiXCz2BMhMU1md//636IORhVO0U5pDAi7d
         7kzLuNr8YUPxlUZ4lez7BBG3lPDRcGjBMqw2/+p1vCIrCrKf/sKlOLFjPayhyYtMQAQ8
         +XSBdiT1IZ2L6lEA4xgjY2A3994vSge7hRfNEzO6v4D6XTf2dLqlqJbvdv1A0i0LgmnG
         WVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709047311; x=1709652111;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAR0191YpG6gmNK9RS3NwTYy2tpEgrl20yHlWytzXZU=;
        b=fwh6tCwE4BIFA2C0GW1PrTzPbY6PYtLsH+VBgINZV0/lZfyNoVhKxFYz7fLzGI5QNZ
         lgy1sTwqbz/Bt4bac3X0zZhTDapve5qo9SZ5k69KXs2H6cuMOeRc1NT/xuzpZ7njIFmg
         GlB1VElQbNYpbOigpRf0VYYbRbwUMvm878AIT0oSRiFZ4UrA/IJdsShUp1q5n4Hx6OoA
         7Dxvtl7smD1ZkgIrrlkntufl5o8HGTTOi2lYOLOXnltKoN7AimxDXUpq2/5qgzUr7wm2
         SxSy0fTjcVoZg+Z66QRDJ8e62dI5PoJz1Au5N4LURBL/ejsCx4s2p2wmB+mxZ8pO91iY
         u9qA==
X-Forwarded-Encrypted: i=1; AJvYcCUwJSDW608Rn/BJ/KPx/mTQ7lt4GxTufliaA8NI0maVmebLuQYWI9itPIPwPfw08mPFr9IDTrS/bEHLjSsH2CRSxc0E4UFEkeiyen0luock
X-Gm-Message-State: AOJu0YynVVeWhy/Y22jodpBw+HMjT2GLbwlWduGelJ8QPboHJkS12HrO
	+XXMof5loAILQuIVNmEWfQu9TUza2WjGzwzGjEtbwow50uXPxyrZ7HXDcr7qmHQ=
X-Google-Smtp-Source: AGHT+IGx3UJwCU3OwYophAFSeMY+HT7j8jGN+JsrR+9BGVpaMQSzmvZQht8iS1eq9Il37PGPrMeIYg==
X-Received: by 2002:a5d:4f01:0:b0:33d:87e9:5905 with SMTP id c1-20020a5d4f01000000b0033d87e95905mr6160029wru.28.1709047311631;
        Tue, 27 Feb 2024 07:21:51 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d6d42000000b0033b79d385f6sm11579719wri.47.2024.02.27.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 07:21:51 -0800 (PST)
Date: Tue, 27 Feb 2024 18:21:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cindy Lu <lulu@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] vduse: Fix off by one in vduse_dev_mmap()
Message-ID: <e26476e0-68ae-412d-a5d9-4996bc30d038@moroto.mountain>
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

Fixes: 316ecd1346b0 ("vduse: Add file operation for mmap")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/vdpa/vdpa_user/vduse_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index b7a1fb88c506..9150c8281953 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -1532,7 +1532,7 @@ static int vduse_dev_mmap(struct file *file, struct vm_area_struct *vma)
 	if ((vma->vm_flags & VM_SHARED) == 0)
 		return -EINVAL;
 
-	if (index > dev->vq_num)
+	if (index >= dev->vq_num)
 		return -EINVAL;
 
 	vq = dev->vqs[index];
-- 
2.43.0

