Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5B1A28D
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726130959; cv=none; b=eDgtuMMyzcUymQAHckTqJCNuRlIRnmYZ0nKDPcRHLbTcJeZyp3x7XVsWmU9O5GsEnwbI2GZ6OEDpZ6RQp2j6KH9kOLADIJFN72k7NttWI8VtA1cklDiyDXnQN6E4G4fIXJhXLLiDH9INajQF5fwjbhcM2LA/dtu5sQNjp1w9I9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726130959; c=relaxed/simple;
	bh=1J3zCxy9ale5iPnZvhLv3BIL0HELGZX5YdbP0RlIDCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oEYRSbMwSMRfhyaZJhaLNfMmnNIS0I4NR4Drv95E3XZBEX5pUQZNiAmSkxeeKPXEbXitc/glPY6quaZsN/vogCdCzn74kNteVOMA8KQmcu1d5ZjjZYAzIzTUDkZAeYmdO7fwsh0dUT6I1VT2D1/VorqM0+vA6J/bu38m+mbFKl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jqo6VpIY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jqo6VpIY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cafda818aso6074835e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726130955; x=1726735755; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABTI+i6mJ4CMOQCHX/yBx2eOYtdjf5jrjUW+ELTOTP8=;
        b=Jqo6VpIYxXYgopCeVNiihBtgOQywzUOcijkwXm0Eob9wlMZWFt2ZssPK4DhN5r3o1e
         pnq0yvmPoXP2s8vFXRGZk7Y8cm1fM5ku1OSCSk3iv4XhXVuLk++bdSw0eFFtnBekpzpW
         mQ6k3EcjCXewk01Y0p0gUscm3UMEzqf46zx/dkx4kCN9sP4nCaZM09t+71hnsx9awrzQ
         6VoWeHqbcRMgJ+EE1erd4/ug7CKWOHa76ztWY8dg589W2plkLrdpzqqpxNKzvJ1+HEe8
         Tymp+fNhzXRSQkJRSRO3S2notZ14q7nrUUFeUZuDl7k6LMS26yZhiQOdWIMD1wYQE4Ws
         E5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726130955; x=1726735755;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABTI+i6mJ4CMOQCHX/yBx2eOYtdjf5jrjUW+ELTOTP8=;
        b=b3eyNpFzkF74DhhD+/YOdabF2Xj0dCC0ypNvw9V3Ajxea4TGq4rQWx5fYAgbI+J3g3
         8eLSzyvDwzT11K+TD35azGpWHwp3gJHZVjALMoMctjt9cUP9gdM15lo2XdGIzpPcF66O
         JKJTEyUwWtRocUF0mq9VhDXFnd1JzfCmZJa4bIQUf1Yesr0TubSD3ZhcL4IPKpdG9Nu6
         dlLWeVXzte3bEVnUnaxZsAby6fGZWw+KkMs47geZMTgAwp9HxTW7yaPTAK4eEKhDRukI
         mYmYfLb1nYVJcBuplJu3FeKCvNiB2DNlkkTS+D5MJ274qjX/7yuga3a0q/6S4yiNAE3L
         EEgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGHKeGpcI9NhaIZKS1nI4+SVg8ikZ/yNkSIR3FmZ4mufohl4gFm8YZeDbGkColm9yoiRhJSh35/K7MP7vIRRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHrDiFF9ax7GQxCnorSXzNwU0nD/krRVa93UYBZOUGt9+aQ9I
	MZM4WhLUriiqC3J8lRknZy87GLId2nCbYcE8cHTCI+oRULz2xrYBj0roGdW8ajY=
X-Google-Smtp-Source: AGHT+IFtFhvViZFvTwkPEdAJJREABhf7QxIe71ol7T4wz3pTBiMjTRfKnT+ODmIORLshY159TZO6IQ==
X-Received: by 2002:a05:600c:5127:b0:42c:c080:7954 with SMTP id 5b1f17b1804b1-42cdb575510mr17534465e9.30.1726130954537;
        Thu, 12 Sep 2024 01:49:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8120asm164411255e9.37.2024.09.12.01.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 01:49:14 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:49:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	Yi Liu <yi.l.liu@intel.com>, Christian Brauner <brauner@kernel.org>,
	Kunwu Chan <chentao@kylinos.cn>, Ankit Agrawal <ankita@nvidia.com>,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] vfio/pci: clean up a type in
 vfio_pci_ioctl_pci_hot_reset_groups()
Message-ID: <262ada03-d848-4369-9c37-81edeeed2da2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "array_count" value comes from the copy_from_user() in
vfio_pci_ioctl_pci_hot_reset().  If the user passes a value larger than
INT_MAX then we'll pass a negative value to kcalloc() which triggers an
allocation failure and a stack trace.

It's better to make the type unsigned so that if (array_count > count)
returns -EINVAL instead.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/vfio/pci/vfio_pci_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 077d4a2629c8..1ab58da9f38a 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1324,7 +1324,7 @@ static int vfio_pci_ioctl_get_pci_hot_reset_info(
 
 static int
 vfio_pci_ioctl_pci_hot_reset_groups(struct vfio_pci_core_device *vdev,
-				    int array_count, bool slot,
+				    u32 array_count, bool slot,
 				    struct vfio_pci_hot_reset __user *arg)
 {
 	int32_t *group_fds;
-- 
2.45.2

