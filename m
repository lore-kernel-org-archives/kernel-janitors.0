Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAED1E766E
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Oct 2024 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727866058; cv=none; b=s/QuKr6lfZAI3KTOWBtz5Ggm1m/3MgxOywykPTraQX3B1dsqIm1j6q3Q9RFnpl4GlfqdVOMOagtREIOs5+v0MRLAxnvZ2w7igdmNdqnIggVu5lRzB8AotGJ5I8ubWzbXVSBZLwdXX6rknKVl6v8OvuNj/erd9UXIZSyDKSPux24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727866058; c=relaxed/simple;
	bh=5KapHuvavI4Se4rczWiyFO1qFaxo3pXSlIcqLuWKHaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8QxRlGamk0LUyGaFV99T9tQzXDnf9zYUV2ptTkMF6Kjm2ULc24b6bV9su0yW6FCRdfUbQAawN5l+t4dSu8yY7aoBifo0Q5wpkPcKFst/DfyEYpJHQ7xpjUWyXqPkR3lGDh5GYXOhxRU2CC0eUzKRhgcd54pPGEcIaVdooco8BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w2TK15m2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2TK15m2"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37cfff59d04so249183f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Oct 2024 03:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727866055; x=1728470855; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHmSQBGzytntPfgJ8o5KGntZ1Opu2hYPtLIGWQovKwk=;
        b=w2TK15m2qt0E0Pez+5UTB+LsQLt8KolG8zX4S32941BpKTm3xWgJiOmo65cHj7AVQA
         Egvg4d2n39ckWAwHcW2HFZDtaNddJNsDhBdNK0Gyj7E0ebA6J4VX3c1aTFi4FX+sOQ6Z
         2QJWgspJPdn1gSpMpQGNDbS1CiQQpZS0oPpGQMm6CWYCNZefUjkXSns4W2OSh3ckanKX
         TAfZoL+Sx8tCiJn7RZMQu6Tt3OVjWNvR6/0RAu1qnnxi4o7M1b5ksdPuVLhL9VB+qKAP
         dMEZ8/JAtIhGf/TAdybCaeNJE8WUWF3u3K7RnGYs5B3KunuVdL/+fq9j0M2azfm2t2Dx
         Ksaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727866055; x=1728470855;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHmSQBGzytntPfgJ8o5KGntZ1Opu2hYPtLIGWQovKwk=;
        b=qkhlT3WztSGuTD07UFbq112UxUsqCPLntexbrekxoWL+HoGdoMMfbbhv5eePQj7vBy
         8Fcm6xXoD/7t5el0vSSv3FEzf8qfx7y3ZQRjpVpjEbiaAKYqAmh+3rIlqg5hn0NtXQXj
         gWrJ7v7NHcSrFq96sjZOKypN8PLrXuaqhZUoB/UvYwtXak2iRr4Y2QrOQtwZJas5kvwa
         OjWmoQ6/YISiAbekGsTMM7Hcg+xS1O/6JBnEPwrYCy4rloe6NzUOCRTYGUAa9eK4pFtm
         CqBy1mbIbOHJcSd8mVNbYKYp0fyNhe3B6g4BzAcsnseLK+tU7piqyVGOmacgBqy4od73
         36rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPmZedcjEPyaRaAH1dN+uSOcbHVR7NegE9WBIUVCpBepWfU034dcTYibAj1d+RnZj26QrrwvikZ99CmYuFWzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBQVTNtSVtS05RN6rhfZ44QFwj/Dxk5uIygOxtiW99IupJ2tT
	UQ0swD7SFd216DqN9Io5BcR/4zC0HlerAEl9Ri6ceHE2pf/m4vEzTi8hUjyejH8=
X-Google-Smtp-Source: AGHT+IE6eEPaGebslyh86mbGsKbp5uSQnqGRvMhcY+lsSPSSBCOC5HgUEH6R7dOJhN4Pc/2QFlEnIA==
X-Received: by 2002:adf:cd05:0:b0:374:bd00:d1e with SMTP id ffacd0b85a97d-37cf289c624mr3980887f8f.3.1727866055377;
        Wed, 02 Oct 2024 03:47:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79db1de9sm15343485e9.5.2024.10.02.03.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 03:47:28 -0700 (PDT)
Date: Wed, 2 Oct 2024 13:47:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yu Kuai <yukuai3@huawei.com>
Cc: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>, cgroups@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2] blk_iocost: remove some duplicate irq disable/enables
Message-ID: <Zv0kudA9xyGdaA4g@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These are called from blkcg_print_blkgs() which already disables IRQs so
disabling it again is wrong.  It means that IRQs will be enabled slightly
earlier than intended, however, so far as I can see, this bug is harmless.

Fixes: 35198e323001 ("blk-iocost: read params inside lock in sysfs apis")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
v2: Fix typo in the subject

 block/blk-iocost.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/blk-iocost.c b/block/blk-iocost.c
index 9dc9323f84ac..384aa15e8260 100644
--- a/block/blk-iocost.c
+++ b/block/blk-iocost.c
@@ -3166,7 +3166,7 @@ static u64 ioc_qos_prfill(struct seq_file *sf, struct blkg_policy_data *pd,
 	if (!dname)
 		return 0;
 
-	spin_lock_irq(&ioc->lock);
+	spin_lock(&ioc->lock);
 	seq_printf(sf, "%s enable=%d ctrl=%s rpct=%u.%02u rlat=%u wpct=%u.%02u wlat=%u min=%u.%02u max=%u.%02u\n",
 		   dname, ioc->enabled, ioc->user_qos_params ? "user" : "auto",
 		   ioc->params.qos[QOS_RPPM] / 10000,
@@ -3179,7 +3179,7 @@ static u64 ioc_qos_prfill(struct seq_file *sf, struct blkg_policy_data *pd,
 		   ioc->params.qos[QOS_MIN] % 10000 / 100,
 		   ioc->params.qos[QOS_MAX] / 10000,
 		   ioc->params.qos[QOS_MAX] % 10000 / 100);
-	spin_unlock_irq(&ioc->lock);
+	spin_unlock(&ioc->lock);
 	return 0;
 }
 
@@ -3366,14 +3366,14 @@ static u64 ioc_cost_model_prfill(struct seq_file *sf,
 	if (!dname)
 		return 0;
 
-	spin_lock_irq(&ioc->lock);
+	spin_lock(&ioc->lock);
 	seq_printf(sf, "%s ctrl=%s model=linear "
 		   "rbps=%llu rseqiops=%llu rrandiops=%llu "
 		   "wbps=%llu wseqiops=%llu wrandiops=%llu\n",
 		   dname, ioc->user_cost_model ? "user" : "auto",
 		   u[I_LCOEF_RBPS], u[I_LCOEF_RSEQIOPS], u[I_LCOEF_RRANDIOPS],
 		   u[I_LCOEF_WBPS], u[I_LCOEF_WSEQIOPS], u[I_LCOEF_WRANDIOPS]);
-	spin_unlock_irq(&ioc->lock);
+	spin_unlock(&ioc->lock);
 	return 0;
 }
 
-- 
2.45.2
