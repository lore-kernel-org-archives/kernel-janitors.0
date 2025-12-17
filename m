Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D570F35CBD3
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967131; cv=none; b=jcfxKmc64t8zLNTsFzd7nLon5zqOWnwwl43lURZcFiLcXyVk89P0sQLaIZZPOJMkMI2YabZwi6rURaLiy6Dy+MKdhtYCxdApr6BJkazlgrvKTncmZOpaBLOCQeEpmHW2dt8aAxOL5LvsnNEGz6JdRKaQQy9aswshKgHzK7tOPxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967131; c=relaxed/simple;
	bh=BYbKHX4dTFPN99WnexO1X4sRqPo8Rn23NQoY+DLrVr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGGSq4xNn0TLdyCmOvRmHaFh5zVOXVceVsZya8uEQERllB4PqSlKDGcWod0R7HnvylDEV6F7ltVeG7lju7W7lOVQhjeABHQAdVsq58uTIOcfsqrUDqQDMb3+Ywnlvl12U+HsvKgo2ZkbQaZvLmyepIqZiAqhgKVBwcSKCBHIPLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kw3lSd43; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TE/EbRSB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kw3lSd43";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TE/EbRSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765967128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=smHdiTegAULuGhXNBZg/bX/26IPaO/x2LiGtrg1VjdM=;
	b=Kw3lSd43NiqNqTebsm8RRHl+73UMpp5eROaUePU0jG6La7vBzXH4Xm/tMj6m8LYOtG1kB1
	3ly0qa5v59r1+P4UMk4qQBjfL35GBKjQWCYJMhvR0MK5rEO4DDyGIhLhi5qPK0Bq4vCBUm
	0XEl3aqOsysZtQHYBP7y5IJu+UMmeGk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-Eo8ItUUZPAClrsoMg6Hh-w-1; Wed, 17 Dec 2025 05:25:27 -0500
X-MC-Unique: Eo8ItUUZPAClrsoMg6Hh-w-1
X-Mimecast-MFC-AGG-ID: Eo8ItUUZPAClrsoMg6Hh-w_1765967126
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47777158a85so61975325e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 02:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765967126; x=1766571926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smHdiTegAULuGhXNBZg/bX/26IPaO/x2LiGtrg1VjdM=;
        b=TE/EbRSBcs7qFiTjVsy8yOBeGKOcEACMkZJOEBuVrO62AjCA3UH/ldTuCNKnSFUIUS
         dgBiuQrsizuOi7ZfvxaPZ7Pb3C+MPKXWbN2hLYexxOy/WmchRbiQVTKglv0KIJw6O+0m
         dEARVxiFfYEBIMwnoPok58OwDU9laxmuNUdAaZsSus2ASio4cdQbkV6HPMxPTVznoUTS
         LfRPvJPL3NpFhbf6Aaqob2lgfzqDO2hDnXleVEzAmYzDhRvtG+xPZvWRuD++42NqfhJd
         i3KmR7mI+K04uBvwLX1rzqAkwIo3g5JT4Woehw+u9DublNS1r8cxt2gXWlFl1kecn7I2
         2L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765967126; x=1766571926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smHdiTegAULuGhXNBZg/bX/26IPaO/x2LiGtrg1VjdM=;
        b=mI+8PN26CdgxwXQEStWvGWjgd1ThvE6n9yaeI7UvOuIv4K2s5qJar8DZ49tb6f0HZk
         PjpP9/C1zz9Rs3lOuVN4kIbcAdfzDQA+540gURyH/Rukkl5+BEp/DrO4iPWhHk0gg38a
         /YRSaapIPjFzOEixoQbQSwFxiCYDHWO2ZboU51keIR+CGH9YJM1qPWIR3EteA8a/GG0G
         q69IzmaHPHUBVCv8LF7/VshkHSOyfLtRJohaKvRUMaqgOVrL0CPvtYtTeUT1zep7Zdoo
         yOsZ/JCK+rwFuM5DA0We/duv5Otkbop9uMXwAMJmzbSA9BZmcDUNlzYrVvXdTzDVOnFC
         /+Mg==
X-Gm-Message-State: AOJu0YzIUSiL/DytTtyxXqmHBhMPAmhVo/Dy44hjbjDt+roynbCCSYJ3
	UhqBhOJu7wZN+d473+VRSTzo+SfrQQlOJcsjeVnpj1dIk6sYnbmSMQir/JgzrrwMFGxzlz3nViv
	Z1Te0et2vrTs7afQI/lRBtF/xJxYa8UsZl2Fa1N197QZIzyiUFUdq6uwvb4NpvrZp5KaujQ==
X-Gm-Gg: AY/fxX7ao8ZVebPQDhPHDymN+rZwhGKrnAICazna/DtIkPQldvPwgFGICyeUX31UNyd
	wBaSdh8rgoegfoONO5PIKSQl7b0xYDmKdjQwu5z24u83YFUSOIbaYV1LItvp0xxHfhO5A/I40K4
	hyIcXVmENKmjFVza/L10lypqHel48FNgenS93ee9YK43sJWPFBRDIMJSmm93l416DiHGTeT12+F
	Cpz0zqlxem021FEL8nHPMxmfUpq6pqDvjJGOaF/cmhdpES3N/8Q13MhqZljZJMEoVfmXzThZdJJ
	VyiE8Znf0kOiy5yHaxgl3yrqoGi9KwWDu0bAasGPuSpAq0Q1+8lghpW8bDs0rMQ5avCuQeUvaa3
	cl1mZv6Zbe0uGp1mjwux+EHnceO5Rv4tOCWwP7owRkkY1o22Xvt6EEP/ICuY=
X-Received: by 2002:a05:600c:5254:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-47a8f90d28bmr183474995e9.30.1765967125956;
        Wed, 17 Dec 2025 02:25:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHv94oYFukoKO/fNpwSZWIAqty2A+HqHfndysVYm5pmz3lseu6l1OSQncA0MKLpd0JpALSjTg==
X-Received: by 2002:a05:600c:5254:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-47a8f90d28bmr183474695e9.30.1765967125517;
        Wed, 17 Dec 2025 02:25:25 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1e6ca3sm30491045e9.12.2025.12.17.02.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:25:24 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Michael J . Ruhl" <michael.j.ruhl@intel.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] dma-buf: really enable DMABUF_DEBUG by default on DEBUG kernels
Date: Wed, 17 Dec 2025 11:25:22 +0100
Message-ID: <20251217102522.2790298-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The intent of commit 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default
on DEBUG kernels") is clear, but it mixes up the config option name. The
config option for kernel debugging is named DEBUG_KERNEL, not DEBUG.

Fix up the DMABUF_DEBUG definition to use the intended name.

Fixes: 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index fdd823e446cc..426c9ad3364f 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -55,7 +55,7 @@ config DMABUF_MOVE_NOTIFY
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DEBUG
+	default y if DEBUG_KERNEL
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
-- 
2.51.1

