Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469C825CC6C
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Dec 2025 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764934761; cv=none; b=ZQWyiQXq0vcBs3df0zFA1A6lxIYk+I7S+OPLrLPp1sXO1mjK7+wZYNSmU54bxhwi4mh6sVJImyxPbtZpftdJSgb/625P84+MybT8mmA2P7GEF0+Bd989AptjsfuTeDamHpNrx+n2duS/HJjdPJcA7lQnRAsLwPfYrXit/dyn2GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764934761; c=relaxed/simple;
	bh=QqH8/pjRCcGh0Jyr6tcZ3HotdYoJ1HgZDkQeP8IceDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfLO8fqu+UBtkUCKblyY/vjIWs8MTWgckr2p9kHqv6/ZvAkwl9tee+8HOftZ6/VNR3jVjXqCnm/3i4DhdUWfC1S4+Rh2moCEUY1+5CreSRFosxDVs/UKhkmFlx6IfG0ZAwHI45XY4D3SDd3gUIWqlAR2+g6xhKLylNPKkIhVWg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ICG9sMR8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ICG9sMR8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso21913425e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Dec 2025 03:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764934756; x=1765539556; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydvHPuR/TEWjlqHSyc+IuhV3845FKKl2OTvoX5xFzHs=;
        b=ICG9sMR8JnkA+elVgSM2l6ApOru1cWYXHe00gVb3FdUMkDOiC0ZikjRSWfQForHPDv
         boYF7OzPI6ZJS8uIPDGDfN2h/ZyawiuL3v5QRtbxvS02PGWnLMkwT+C/52tRIwZjqJCD
         ip5cm3tYVvWVRlG/tEvBsMi6+MUKcpjMHxIegnwtPsTGHjxAlE2TIqB6GuXk9d1gFCZV
         RBlox2NPs8X5bMrt/17ELOdeo62PLNul8bfoO33+rn1BPe+IyBdKz0LGxtZQe9u/W6q0
         XqUjDCn0df5TvsnRq2RBGN5UR2/Ou8l7z3R39irV/tyvmhLnExjWhoyNnubBSxjxZvFr
         PhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764934756; x=1765539556;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydvHPuR/TEWjlqHSyc+IuhV3845FKKl2OTvoX5xFzHs=;
        b=Uat5sYuogRCyaYSy1lCsRtXgK10hWxaz1FCl/HEkmlzluuEr3gbj2iO6vpAngXyilh
         MXmYBsms/xMDmvYA+xV8az8zWeLKrbKkF7k20LpdRTRh7fYXRtqcakzF4brw/yoaPl/N
         o8zdQETDzALG0U14KlBSubiYoZwxJzyyZMJ8JJ0I+SUGcKEJT0CIHCmHxGZMi1igLKHj
         PjlJiGqK98xQAuYMSGuZdwUAVuzED/U2noFQ3jx1o+W5WQz87Y1uI05czRAwh/0SBN55
         PiTFxLJpGkNwvr1owm/uMxEuLxViEqeqQ+ikKwtuRVWrCasMDzkHqZi4wT0+mhcc/5IE
         brUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPEOSnAiYSfdw4Dh5Pp+kX0fSvTg2t9C+3Chj1g5sYJ8hq3BuFLL4ymSnxdfzXpxrJnrGBVopd3upYNAF6CN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUY9qWa2f/16LO879LlkQGcMkOWA87VpgyZTErxkUUmO4uJhhu
	+vRNOKh1LhH6ce+KGm/S9okIvd0ozlp5Zbuxrh97n3M2V065rXQ7do3iBPUFrr3rkGg=
X-Gm-Gg: ASbGnctYY4907JWMMhow6W1nSyZAQDqvYWigUckA7F3RUQ+LSWVDiXmjFSG7lXRQqfX
	IB2xtZWIDyRAW2wwU03MGuiI+LozHzYTkgTP8YpFbU7cUwQFe9Sd41fJ7MyUZYlSayFFRqD4LqZ
	Ha/kf/71Nkpj9bSVkOdteP64s2/OSAAyMiq5cM7nEIbya9NrJ9kILG7PlsWDG15iOlYWGrCU3++
	+dN9Pkkimia3fUG4QimYZ1MCGoTrKLyVqcJtRuOfqiMV8GC6GH0Nu/0wUf2kiEQelGLvXoUn34e
	FjDkKHiv1puqCIbpkm3R1nlPVA1kSZ0+CMPvWCcRPKDEZGCqTCYE3QkM0Qr05WwRtGWtPtpeozV
	qpLsAPZ7yWAxrLysX2SxTeJw4/iN/BEChc2OkdNEWorKaF+UpmLQ9JCq8DoBuyy8rQINbDz2qTE
	MSOSoOUZiqnON+FHAmOLbFJ4I8tFc=
X-Google-Smtp-Source: AGHT+IF/vwM9KOmX570wAov4Xy6x0tD+87+iHCXLimHTetQ/1oLM41jUaLHyTjztyr8/nNeI54dvbg==
X-Received: by 2002:a05:600c:c8c:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-4792aef7050mr121690165e9.15.1764934755224;
        Fri, 05 Dec 2025 03:39:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d353f8bsm8501158f8f.43.2025.12.05.03.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:39:14 -0800 (PST)
Date: Fri, 5 Dec 2025 14:39:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, kvm@vger.kernel.org,
	intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] vfio/xe: Fix use after free in xe_vfio_pci_alloc_file()
Message-ID: <aTLEXt_h5bWRWC0Z@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code frees "migf" and then dereferences it on the next line to get
the error code.  Preserve the error code before freeing the pointer.

Fixes: 2e38c50ae492 ("vfio/xe: Add device specific vfio_pci driver variant for Intel graphics")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/vfio/pci/xe/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
index 0156b53c678b..8e1595e00e18 100644
--- a/drivers/vfio/pci/xe/main.c
+++ b/drivers/vfio/pci/xe/main.c
@@ -250,6 +250,7 @@ xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
 	struct xe_vfio_pci_migration_file *migf;
 	const struct file_operations *fops;
 	int flags;
+	int ret;
 
 	migf = kzalloc(sizeof(*migf), GFP_KERNEL_ACCOUNT);
 	if (!migf)
@@ -259,8 +260,9 @@ xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
 	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
 	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
 	if (IS_ERR(migf->filp)) {
+		ret = PTR_ERR(migf->filp);
 		kfree(migf);
-		return ERR_CAST(migf->filp);
+		return ERR_PTR(ret);
 	}
 
 	mutex_init(&migf->lock);
-- 
2.51.0

