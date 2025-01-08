Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530311F03CA
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Jan 2025 09:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327607; cv=none; b=F/KTlQC9Vb2Yi2PRZrr7gpC5tc5LOz/EOJfpSqrSf5W4yTbyntEKBfQaRGBLFNVoJzXF2P/i+xJ36wVKTjbYthoZmGwBjx5DqE9hRonGUGgDm1az5VLAaiiu2ClVyDh8qJ/CJ1kiz10hDxafJRQ7qlBXyq2ZAwGk+uplTE6m+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327607; c=relaxed/simple;
	bh=apMMjVP+kwbKtHPFp/A5uUFdrg+Nshc3Olcebw/xj6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrAGfxv0ev/+8CDKvjvqb5hJKA6E71EkFPeughS8Q9Bmsdas5d2j+OBMppzVd1kifTW46Ac6a4FziSWcXmfhRc7nwNJFuvOTUWGAOuGBqvvPMojl7VJzdRAvenGb5NhLO2jKJ/ERT8+2AIKGaqID/1N9oj1+xrDuy+K/EEOhDJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHo429h+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHo429h+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so163494635e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2025 01:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736327603; x=1736932403; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzXs3KFyj+OlwwBWlXhhhHxWf9NDPhglowmb8OrsU0U=;
        b=aHo429h+SPawfeaDbWlms7HxQFlUOrZkfZ5RP8ZXt0urvOkAMKbgIJxTbP6lLbu6i9
         JkDR+E792lAhzulQ2cohPyGG3pR6AsjSKsU9n6F2xXH1CpD5uFaR7Th9ORk77Jqpr/VB
         Uah7JCFm1oJ0XzjBOUI30gtaC6BDPARk1wO1t0jBYwIqd5x1LW8OVDP1CrG34CNJELd6
         O4lxaYEJk3C9jlqgsNdahh9+xlybDF9qNxRcmB4t1b7kGMwis4hrhXDfDCJ27/JMV0Ic
         2xyjO5PJsHf6adhzMRr3PmOFZSeYbCFGJgHCV88jueAlKPJhNg2KHV8DqqsbQgDPaltd
         giMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327603; x=1736932403;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzXs3KFyj+OlwwBWlXhhhHxWf9NDPhglowmb8OrsU0U=;
        b=l7PBseb/nGwSLKMjIzkeBUqSyb5562we/FSqINrJImjzHgb7FOK32fXDWRbWbTubpb
         KI9Qffu9SUrsx0gZlQjM5ExFmsL2lh2x4RP7jTK9r5KLZ7FfAY3zFmWdwe7i0EX6xfhX
         IrjyWG3b4hCWO8CHhrUlz2f9DoI9AM9eD/X+g+1n+LZITLJQiMo3CnOK46/8iKrYZ66i
         uzEkAyDX8lTgL9HnL0vVuD0S3NgORZWPeMefQdLuhrX7pRaFyiWfYsfLK6hQ+zmeQEaJ
         9UEwxCXaOPonaoUluM6yeGRHbIw3U8kwDhKLzCJEVT+Y31wSov1REMW8HmYwKhK7fsy/
         tAsw==
X-Forwarded-Encrypted: i=1; AJvYcCX39wQeZ/Td8cKIwInDve1p6Y8//tHbeHnQTA3pT39vD5XQq0jW+KpDRdFeC8+ie3ymzaJh4+BTGJpwza0xVJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV5zUsfrQqErf2QLSnIyo2i9PbH1VNG0arxvQ0rKSRCCxtMDyy
	8TUh62tuSdibD3uOptarOCA4bkIstSrMgzYw/h5m0gumdWruL6aCJkFnbyAP4II=
X-Gm-Gg: ASbGncvtsr6XoFlrD3qD/SVU7ajdR+iaH22aainSwa+WnZ/Ggx7JOC3QWBE63sEUAuv
	l6YyjV3QPNNkipQZ95bDqclZMsYayPdJe4FXaMkBwo7dGFx1zHI9PLQR4MUHviE/7qpvARuPV2h
	dycIDhX+G/urcOhs97g5Bk1RcVWbCz2+oX9GQxxHi3xv9n9kOH+7bjS+867bDh+kWbgY+JzC7yG
	UYWlNPRIJUv54rwyYjgxMYFZNg0YHSptC21DoRkE05moSHLXL2IIz7ewZpLWQ==
X-Google-Smtp-Source: AGHT+IHGv+AYtNiD8pZSgTeJJr69q8hxwaeSukDvA5nr1zKw8kvCDzL2/uyOHrj1po6Sh+MfWJg6+A==
X-Received: by 2002:a05:600c:4f09:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-436e2707f13mr11755805e9.23.1736327603629;
        Wed, 08 Jan 2025 01:13:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da6401sm13964575e9.2.2025.01.08.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:13:23 -0800 (PST)
Date: Wed, 8 Jan 2025 12:13:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Fenghua Yu <fenghua.yu@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] dmaengine: idxd: Delete unnecessary NULL check
Message-ID: <ec38214e-0bbb-4c5a-94ff-b2b2d4c3f245@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "saved_evl" pointer is a offset into the middle of a non-NULL struct.
It can't be NULL and the check is slightly confusing.  Delete the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma/idxd/init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index b946f78f85e1..fca1d2924999 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -912,8 +912,7 @@ static void idxd_device_config_restore(struct idxd_device *idxd,
 
 	idxd->rdbuf_limit = idxd_saved->saved_idxd.rdbuf_limit;
 
-	if (saved_evl)
-		idxd->evl->size = saved_evl->size;
+	idxd->evl->size = saved_evl->size;
 
 	for (i = 0; i < idxd->max_groups; i++) {
 		struct idxd_group *saved_group, *group;
-- 
2.45.2

