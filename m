Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6219A32F765
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Dec 2025 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765799573; cv=none; b=BKk4jLQJk8uWw1XvfCtR+zYl0SXafreo7CdOI3pQEZSHNpuG53buPnmD3TNjY7bVmAaO7puvfZSHI9RhkL1xWtrx6ueRmGEyRtm9XSSzAWG7rurQbKtRH5MY2LCF1cXuXpbGgGN6poEdClvj84hYpmnKQz5iHFPQ05tOxEehwo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765799573; c=relaxed/simple;
	bh=gg2nDCJ5hbYN62aROU8/7xo8tJxmcA93Qo5+tF6uz6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IlWyb7UtrjUKV44lqoHPPnVV9rSCjVEZLWDIj/nOIzNwQiTIqtrxKl9VcMuvgsvj64s4zK+JSkg1lTYy591AgZ6qjZwB2BR5Sl81TpR1HYKtojaEHgRHG+sTK3jn20L5DgUF7cEHIP95wktl2TJN0HDAQtxwPugYL6++9TMRBkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRpFQ+8J; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRpFQ+8J"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4775ae77516so40268325e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Dec 2025 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765799569; x=1766404369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HLPAAzkZX672SPFPNzY//QzztDCRnjOssmaLt2g73S0=;
        b=bRpFQ+8JQztAXAcQ4M2W60GDT8M70vnhPRYFtAPcnnQJU9upAvf8v+aTaRNp4/Kf0P
         am2hC/wM4W/XA4diKvf/bn+HnK9KDBZPL9kvCdBjNIl7KFjslHj8NPU3QLFTSIoNTStw
         8jxVJ8puEB+vq2qj7ksCP3ypBOWgAliiY8DAb44mCnRi02037voB5evfc9+pVPR9ZHPM
         qdwYFq+mvzg9BEnpKJCJ5Ye49vgNB3pcp7ns3L0XB6TJ4q1swUv5RwUfO2HJSxJg+c13
         Nnm97z3AIVnM6hHv5Z4h20Et/qBUCHgnytGIQPTNwsXI9g9HHCYZhW1/HUKJdCVV4Rlu
         kHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765799569; x=1766404369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLPAAzkZX672SPFPNzY//QzztDCRnjOssmaLt2g73S0=;
        b=WqfhZTLbrow7rIHqLN1oflBsYuX28k2KfVs96wxnY6ZamKnzciz6vPqhtJiOgtUVhE
         qv4ZkEAF74pbrdstfP2MuSWShbD8BxJxr/sHvAzytGInNeMrvoyNRDkDFYW5gAOLV4HU
         l28WAS6wJE1+TeNjnIr0z6vruvpFbfy718gGSX5MEiIDYGI9F1zK4ZTtT8ZlotCY8mM/
         TgxKAUzIwQTIvtMHWvJhkiWpQIga12nbVqUGG+VYF960faOV+2LcDVsTE8Y9jHqVFR4I
         k18hh1qRKHVa64xU12U0tQF7rrKTxYLXnSq5BbZg9x1QlGWbFfomVux72MLYWhNGDBl/
         5Hpw==
X-Gm-Message-State: AOJu0YxdFbvxDUlNl07X9BnmDm1uIBTRkcWa3lKzVO0jZzQL8Wpwnx9Y
	mBwlOEjr3Rkn7Z4rbfqVORYfWcKaNP+NryNayo6lEQnFm6NQ9v8j0Oxm
X-Gm-Gg: AY/fxX41l7i2yKL4vNqvyGmD2pCvRb10Nmk7W+RPczTSlokSikZE7WqSGrVZoVMwHbS
	UTE2SnDbTmDYxBPDIneJQXNFGF/lo9RmlBTGickcdE+wvv3c8FI7boWgdBiCy0sN1qeFLl2OEpm
	5dWanHDMWceV3wB+erJwimE3Ugf4cdiI20VilFGqhF2jPBGlsICSUBNd19FYAnUYlvXUnLFfidT
	FnZvuHSGQOIcSgRNzHwoxuVKWJuT//bnm5ut+EICWPsTPTXxgZy5DQ0JvBvx+oeHQTHO70Y1fuh
	ipFIEpMskDhrDAKfBFq8rshd6f3FSofNqHv7LDpc/3bhYLCCHuUE6r9o1xwylCbNxnHe64oABUq
	7UnBdDXJ8ccJFp47ufO8bWh5q5xgVHEmKPrFpSWJwK+IHvhaurgepqWLZs2U9GZ16amCwFjcZfg
	+WhGi4I7+ymg==
X-Google-Smtp-Source: AGHT+IE7KWwtiusfSz6ItVQJ6jWC1LkkJEmabme0vGMp/wCpVgK/njPeo+/ZPD4RDxUphEA/jNlIVw==
X-Received: by 2002:a05:600c:4f84:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-47a8f904528mr113128355e9.22.1765799568419;
        Mon, 15 Dec 2025 03:52:48 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fbc6e3392sm17181159f8f.13.2025.12.15.03.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:52:48 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdkfd: Fix a couple of spelling mistakes
Date: Mon, 15 Dec 2025 11:51:50 +0000
Message-ID: <20251215115150.3581277-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are a couple of spelling mistakes, one in a pr_warn message
and one in a seq_printf message. Fix these.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c               | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 2f66ebb5b029..adffa44fff2c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -830,7 +830,7 @@ int kfd_create_process_sysfs(struct kfd_process *process)
 	int ret;
 
 	if (process->kobj) {
-		pr_warn("kobject already exsists for the kfd_process\n");
+		pr_warn("kobject already exists for the kfd_process\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 5f8cda4733f9..d7d37f01f51c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -1115,7 +1115,7 @@ int pqm_debugfs_mqds(struct seq_file *m, void *data)
 				break;
 			default:
 				seq_printf(m,
-				"  Qeueu node with bad user queue type %d on device %x\n",
+				"  Queue node with bad user queue type %d on device %x\n",
 					   q->properties.type, q->device->id);
 				continue;
 			}
-- 
2.51.0

