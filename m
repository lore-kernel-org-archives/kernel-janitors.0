Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F2E1D61B1
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Feb 2025 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919770; cv=none; b=fwXZR8mXtAfiMGLyWGgRUNABsMS3obwHv6z9JNY8bOkSsfALm9jxTdRdvG+vaWSkNDZ39lxSiSCrMkoQdOcn54JlMuZUNwuql6Hpzg28Jmp5XeLhF5iCn8zv1KdEGX4i+vC4SjVJa5WPujscNh2swGOtXOuzOCcPq4JUAbjYa3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919770; c=relaxed/simple;
	bh=fLjMsIh/HJUQjg/hVkNg/XMCQsi3SepuuV9mpQx0YkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jm06YM87/2TA06UYYhjRIETP1f9kvuYKmfQXGYi7yQo5nEaAUJY7ItPPWZbl0DUxrOAkM27WRUeTl6D4SwuyxUTX+03YHSzIp09RcDmWl29r8kSRNjdp5pnL30GgOk0YzhlUQkc4AHgjgcFpzYmBea3TDCTAyP2R8NKNkj0mO2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwkS8JkA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwkS8JkA"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38da72cc47bso1357589f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Feb 2025 01:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738919767; x=1739524567; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4lQXrAzi2rTihX6fV/JOGU2Qmj1GaTD2TDSWqFqUgQ=;
        b=KwkS8JkAYngepUKakIgxlAw9ZJDEEqP0rlkd94WuzpQNTkw4VkenSSprCzNdsEWVPj
         aln7f+bzBCPhfPrimocpSmnfSJPnwaVchfLWyD1SA5DS5ZhmhDJtB9t/kzVAf5KYfGhp
         O0H8pvEAArWziNdwDT0loinNyRDacGGDxxXZs5ZUYxi+RESy4i3VCzLqA7MH9B8K7vKP
         qml3rAWBIo6M9k77Ub3M5QSKkc+RRPXwRMHk33lPjH+fZtphJ2/P0P918/7LaIcxqa2v
         UP0A78vXE+1YLWQ6hykfSALWIPcT+2dWNv/bx16e3VRyzQ/wocnSrVAiOheJmpSTGw0b
         Y4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738919767; x=1739524567;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j4lQXrAzi2rTihX6fV/JOGU2Qmj1GaTD2TDSWqFqUgQ=;
        b=ijr58EfTLgJfdjxYTicVZMvWh897kjRtVb/iUn0w1ZcuiSId2zJmvzHjDYTBqnu8CP
         bnHE+epYYfV2u2biECXu1Vx+Sdt7gv2/lKswgg9Pu44md7tok+qVtCDWz697giLmkKyZ
         aJcoOK381MiJc/raXfJ8A+83CJUOYWAundEWtdDFJY4R+6bdrPfDRjV/5U423GakYJNF
         dgZl8EEy1PrYV/s9jc37al+ImvbA5sf0knx3F112JIIg9L7oEqz/UuVJ9tFdrtMIrVk8
         bbokp8athS3Qp5qaCd0kYU5VdPN3ME7IGCj9YlzxQ+lAg3zp7O+AnsCij6w3nAQMYrr5
         2gCg==
X-Forwarded-Encrypted: i=1; AJvYcCWZygzcyBUdUHc0PflZoDBbMOAFJl1Moe6FYO0+5QgVBZtYRnxvniWP7D8upLDhYh0HUfpbMrVV45fbvt9lFr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoNWI1kdbxS4vpXKhVGwrzAvbQDPgg0MsTS9QryeXPz5vK25Ve
	dOqU5IqhYhAwflZb7i8XXDDA9SY68a3Tws5lSAZ69KcuEmhF21g4/2r2UeBIp3Q=
X-Gm-Gg: ASbGncv0A39q7bDvx90WWlFRlUoC4bIPvE8fuLxaq7uwHlbD1Zqx6LUxE+pbG1Jab5b
	BHhd8qERsBYShyfPs3Wxw2PGZS5FhqJumsG8sl83AiMZ2ESdKuMCN84fP8WFQfdyp9hsWF1q3E9
	e6dPcKYjKultJy3fmm6DFIb8VFs5coCFWZSjOx8OxKmKk696CQS/iiHZCJVAYgE8QEWceze7upM
	WgxINVaGzC++p80fXvZTIeL/Le4Hi/+Qnb8Zl7GfWqb3h6mbrk2oxGyaNLi9T+v480USk3pF4zu
	2I3XutSLjRpCyHeQ0Eu7
X-Google-Smtp-Source: AGHT+IHqtqD6HtRJQqxarv4GMNZzNGdDdWvX5SgVvhPcMKn3XQ/iYaRb3DhRIJRCpWinxpVTMd6nJg==
X-Received: by 2002:a05:6000:1448:b0:38d:c739:276e with SMTP id ffacd0b85a97d-38dc90ee4f9mr1602513f8f.26.1738919767387;
        Fri, 07 Feb 2025 01:16:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dbdd1b9b3sm3974521f8f.13.2025.02.07.01.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:16:06 -0800 (PST)
Date: Fri, 7 Feb 2025 12:16:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Taranov <kotaranov@microsoft.com>
Cc: Long Li <longli@microsoft.com>, Ajay Sharma <sharmaajay@microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Shiraz Saleem <shirazsaleem@microsoft.com>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] RDMA/mana_ib: Fix error code in probe()
Message-ID: <2bbe900e-18b3-46b5-a08c-42eb71886da6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if dma_pool_create() fails.  Don't return success.

Fixes: df91c470d9e5 ("RDMA/mana_ib: create/destroy AH")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/infiniband/hw/mana/device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mana/device.c b/drivers/infiniband/hw/mana/device.c
index 0a7553f819ba..a17e7a6b0545 100644
--- a/drivers/infiniband/hw/mana/device.c
+++ b/drivers/infiniband/hw/mana/device.c
@@ -144,8 +144,10 @@ static int mana_ib_probe(struct auxiliary_device *adev,
 
 	dev->av_pool = dma_pool_create("mana_ib_av", mdev->gdma_context->dev,
 				       MANA_AV_BUFFER_SIZE, MANA_AV_BUFFER_SIZE, 0);
-	if (!dev->av_pool)
+	if (!dev->av_pool) {
+		ret = -ENOMEM;
 		goto destroy_rnic;
+	}
 
 	ret = ib_register_device(&dev->ib_dev, "mana_%d",
 				 mdev->gdma_context->dev);
-- 
2.47.2

