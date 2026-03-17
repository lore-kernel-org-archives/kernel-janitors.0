Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE4C301004
	for <kernel-janitors@vger.kernel.org>; Tue, 17 Mar 2026 20:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780478; cv=none; b=nyHZ1ljOLevG9px9pQxlFAXRp1coXw1sn0/u2je8cZqn3gVS82VIL/1RVkh/8+BrS23UoZnNRT1pkmbYXw80RTIecxr+OaunESCW7aXZCzucpfAqZi0bdNp3Ucbk5mNZNXSpnusDqgYSSCXVMWSrKVxByIb+FuTnoqhZ9z//xHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780478; c=relaxed/simple;
	bh=erbVrTXG97D5FI0eFhcyGQkyScSUPMgDK8m5mqqKgng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=inpf4rzCEpXiMgWfPlR6QgDwzjG5aB/a756HK5HfT7P5NLbNeS6UtWRQxKe514u7wUaXYs2g4ZtYxOPiOTTduc5uJcKZ6t11IDrTSfbI5YoOWnbKWE1DWWV3gdmSyzcNsmIFjTin6dKebXoiSGMOCgSVGVz5b1KY0fYPO3+J45s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rof47hfl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rof47hfl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48538c5956bso2471075e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Mar 2026 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773780475; x=1774385275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/1Ej2QQkVfR2yUyXwe861yMTinfcJrjiiA4dl00sg28=;
        b=Rof47hfld/mXrYXwzhookdiJABxeKavaD1o5zD7+sgIMaQaFs4qInviaMEuAgk7LDs
         HDQbImb0Ngt4774Wu6NNQwCXGP3/u/fD4dKBQ4W8qQ2ch9pKSR9rncOKgoO+I9XmbRmp
         zaISZ8HGAW/3JTW0YWBt/aUYh0rPaQgw42c4ThD1H/XHjDNPnm2FuW+d/q0gXMgVrFCS
         hQlQHiM2l77jpLwDXW51n/S7EWUnlfrkHRgMqPeAiwrcs+Uv2VnEW2GYsg0bntbskclY
         62ZOwp5sYub8Af5XfthNs+WwPHI01cA5+1Ai7CqZBUiYt7t+yJfijXRm1jiYMEqvcPdj
         4eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780475; x=1774385275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1Ej2QQkVfR2yUyXwe861yMTinfcJrjiiA4dl00sg28=;
        b=DRz3XXdXhKh65ANVrErk4vegOoa/eZ0R/fFGQvPS/UsJ/GPD+q46aW1GgPnf7Aj/X1
         6Uh0Gw6NoVp+1S7LF/OZ65axOHMfONPDvwgecIFvrvsjjzYalSUcsiG7EPti7IWrxIX+
         PNQvY0hLEJ524+ykpqdpRPPEHBFkHkN1xOaTU3qbukl/9KeD//ZDdXRV+I88WH6tsiWz
         cZi/JkZYYt1d5QvE9LyVUUnpl5QkoZRGFWHLn5B0C6vCXZ/jl4bcvkMKQf5fAxEyIKSp
         g73SOym60D4GOd3HsM9CIC1jInkPm2ZJoZvZhi9tof6nzi6Djc6y09ymbiaNWgWh7DKB
         IwXg==
X-Gm-Message-State: AOJu0YyhulG4cO47f4nlduvNJ18ddffun3wdbzgP73IuoYHV6tHPTgqa
	Von23j+Dy7DdYDdc5S0mWHvQ3dCZ2bRUeFltVTwqvP8hGYkMbss6s84s
X-Gm-Gg: ATEYQzx9j5ffsOUXSHqSiEol+y/cj8iISS4YF4B1Vs8i3rIhv4TBWiEM42WL9sE68pI
	q0f4hGoN+QCaOXyXJ79NA5z3t9gb2gY9HPqz7gIELjgOF+aReV9Ug5PnmEtCeLYlaZH7If4gpCS
	BgX2FFYVEOXcy72Qo95jgDGn6ixYkyQ/46LFkm7kviMAHUijzV6wdz7fkxFGpF4YMqohXzL6jfO
	0Y/LNlzeZN4wcFUwg7xTnMGMnIuqMuIpB9bjsIttd298jcTCw2Dnjq+9uLh0apKKS9rr25U+N7C
	0uIqVQ1Ok+8jdVqhoFw2WnkBFZX4zJX30qAq9jBZrRpv5a5tbCLiOHqcO3HEZZsYiaImElKzJnr
	HkKFvzu4PKyw3kBR5HwuSoFUFJDTD7NZVK0CN1o+zgzs2acWDqLImLHMLNkxgD7n2c4eTIPL3Gg
	PJYG+DiP7V4pE8B+v0TZDD+Q==
X-Received: by 2002:a05:600c:8b18:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-486f40aca00mr16393135e9.7.1773780474467;
        Tue, 17 Mar 2026 13:47:54 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518a2cd3sm1641025f8f.32.2026.03.17.13.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:47:53 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] dmaengine: loongson: Fix spelling mistake "Looongson" -> "Looogson"
Date: Tue, 17 Mar 2026 20:46:31 +0000
Message-ID: <20260317204631.120332-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are a couple of spelling mistakes, one in a comment block and
one in a module description. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 2f2ef51e41b6..1c9a542edc85 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Looongson-2 Chain Multi-Channel DMA Controller driver
+ * Loongson-2 Chain Multi-Channel DMA Controller driver
  *
  * Copyright (C) 2024-2026 Loongson Technology Corporation Limited
  */
@@ -725,6 +725,6 @@ static struct platform_driver loongson2_cmc_dma_driver = {
 };
 module_platform_driver(loongson2_cmc_dma_driver);
 
-MODULE_DESCRIPTION("Looongson-2 Chain Multi-Channel DMA Controller driver");
+MODULE_DESCRIPTION("Loongson-2 Chain Multi-Channel DMA Controller driver");
 MODULE_AUTHOR("Loongson Technology Corporation Limited");
 MODULE_LICENSE("GPL");
-- 
2.53.0

