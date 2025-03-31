Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D81142E6F
	for <kernel-janitors@vger.kernel.org>; Mon, 31 Mar 2025 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414317; cv=none; b=kAisg9r5CQqwPB6aZ4/XfTNnDNQZb4gHJXWab74ZVJ08T/V/+VSGWRIrVa0i8iG380z73jbglUkwfgAx0lboSxBPgYeexGkrH8PuuykgKwftGH0MawuhxTWDgdw2aFrg4wJG8GYUhDdtwZuNFFE0lN2CtBGyRdqCEaE5hM+AsOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414317; c=relaxed/simple;
	bh=eb5lElBQ52SQo2tJMBhxvP50tBy4RgLuAmk+7/7KVYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ckU5W6OTaVAev1GoUuIG/JKhrOnDjIfvvyOw8a3fnXzYO4W8jJrY8MUfrlUA0Md9BUBNiJt1el0KjjkT7sHXZ0CVq5B64WoZJbJ73jYWIL72265TXoy6wH6HUtQZubVGYjKwG83FunYd64EpisTE5d2YcUCD8e6QA62ud91Kli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fK12p+UV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fK12p+UV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso40579515e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Mar 2025 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414314; x=1744019114; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKS0Fboa1dtHIDG4S6gLCYTAz2lAP8mKMrYFIOMeSw4=;
        b=fK12p+UVwSTQk21hUWwQ9pWJpdybFLDovx4h8HgAAxGbV+KYv9uxvopVmmCjmWBUVk
         ZG+Xb1Lqq69CWNWo5Fg7fHTp5bpncmAaHIrFwVYNyBsJ/hCMjtwttSSbsGz9lUbr/HyD
         SXsvKe9xyLV7xVnyHZCBf0adqBzerEVTw2et0MxOWev4YnttYGifmg3Ysb8w8K+l7h2q
         9WV2g7Xoz6Sz6s+YWTpV9ofJfjiEWcAow/fRwiiBLgj8XwYkDj9NZvZpfHHFtjqRFt6U
         RMs0U/+gYNASifZF/IyEMkVV9OwWAAWwd/2r05A3kBDIQTGlSCe8GohO83BsI7l37stE
         SqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414314; x=1744019114;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKS0Fboa1dtHIDG4S6gLCYTAz2lAP8mKMrYFIOMeSw4=;
        b=YKmVGBK9paS/Lzn131rbaDOkkUjIIALNYmnVBKeHn7a3YfaR3Mf8CHOS2CdiKGuIVI
         1o01Akson/KszhbRDAWSB1pkvnEk0oOaYypm81Qg3EhNPQsdZzAs/OZzWirnGjpOKXgg
         4Ecr3W7KBEUBlbyKnzSw0Il9NUNFXOE09H6PNlOc7fvFHQWyJug7FH32kv3vz+zy6zoa
         oL4r4kRFTJ4edmedVEHAmjEANSIKj+/RTkdG8m5pxiNElHggWsPwIj0yqHlYu+AqSlMd
         cNrpUBgdm2+6lFBQRPuQpQ/HlR4Ovz8gG8dWsM+fFQbPPN3Pi8azptsGdA57k0O5Qd27
         TbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDHkuWM/A3PeOCPFgBQZAqxLMn8vaxJ0fTRX0SFItS3Ec10iIh7+yw3JvdrbYOb7GLD6DSYFBh9p7NNjAy/J8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VYB3rNvz8Ttf6pepka1QlQxrDik8zuh+jhRDT6i8A0EhjaCu
	GM1UrRkBc3XyzasENsplrNK48/166+T9fsIkVsYe2rU3C8b+V8zkpAXihrpd0no=
X-Gm-Gg: ASbGncts0Kd8IzjKbKNyxE8d8rkSxqab6y+9txDjjvKbzHY8UvBdcuYFJ7Oznuqx9L/
	Wbluns4XOD5p/rj+Y/LNTGQVgCb0r9qxR7qsINH7emd/WSUD3/jA2JbQk5bp35l4vXRfag5aUrv
	fQe7PK1A1KvOyBbQmwKly8Z11BeyxLWDUvrVytL69+g4Dnvo2h4M/b3kPiXOSs6oVvsB1ir4yjU
	PgPvcRiy7pVdnjupwA3+k0cyxaknryIdGjmb5k75RhwT7Ejz54R9yd17oVerPQJ0LBBtK5/aJMv
	Acfx4WhVui/Ky237cs4A3aPkfuQIsuY4nZN+mtCZL3MswSHyEQ==
X-Google-Smtp-Source: AGHT+IFVzFpYmKBAGEXWi3zw7wUU5N+0+BO4pZCgxv4I35ZkC0wJP7yiqMMStfAjpc9DsFCTgkEtog==
X-Received: by 2002:a05:600c:83c4:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43db62283d1mr102074565e9.10.1743414313954;
        Mon, 31 Mar 2025 02:45:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d8fbc10e1sm115778485e9.12.2025.03.31.02.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:45:13 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:45:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
Message-ID: <5dbd6105-3acf-47ad-84d6-2920171916ac@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call dma_fence_put(fence) before returning an error on this error path.

Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma-buf/sw_sync.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..b7615c5c6cac 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,8 +438,10 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
+	if (!pt) {
+		dma_fence_put(fence);
 		return -EINVAL;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
 	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-- 
2.47.2

