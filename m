Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DAF269CF4
	for <kernel-janitors@vger.kernel.org>; Tue,  8 Apr 2025 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110095; cv=none; b=cyf4y4EU0WxiugvNiWaIcM+Pdx/pUSLwPcJC53l+cLfjuBx9FqTDXgS0ZcBH6ojfAW6IONhN2MsZIHphD2qqT3ujrDa7YkWBO21eRsmoPm8zTurPC1cQ5FwWZjP7pfiVvBHM7EsB+qMhNEnvTmcSWU7JeFN8o9iuN/4f1BvvH4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110095; c=relaxed/simple;
	bh=9vZ07Fu9TFUznVzjN0MD5NdxVuzdwWr225mK7qPMJLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pvkwf4he6vzVJEGV10CgARNy8BlGkkIumzl57yVFtiWTJcBb/oY8FiBg43swpImXhp355vklWyg/nbVP4W53iHj55GWsQZjf7uquWeq8wWHX0otKI0SiizWCZpsqg3EQJcKmGOvNVK2Mv5lIWDC3jOKAp9n8qlfBfR8dn7EKMN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fgAvkt6L; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgAvkt6L"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so42459105e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Apr 2025 04:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744110090; x=1744714890; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NirbuKEOTyR2moljejzdS649GYkI8qfTa3FOlPaWlDQ=;
        b=fgAvkt6L6AnUQ/sC4a0Tx5fQ3HeLZ/DrMb5BkPpSBuG6jpwqx6Ujfk/Ll9y/QlqN4+
         Ne331SGeeVPkDvHMMrA7WTDhp2SzGCWTYxUNguI+X3yflfrXFz+lTOHpBnZgsVdegzHO
         WV51bHHShySZ0SlT/Wfy6/JVWtiXsnRCbr0ElDIoITs2sCx9QcdY70s8infd8PnBiGZK
         SeGZ0RkyjV/Z4J1v1TV5XUuo0zlJP7E1mu8SlNt5MdOW0JiztWqJmJ3ChbaUkiyFmRqC
         8dRQ8ZwdCya14cbjpD7OUCO+GriIFmSSX0K7FfhHOeP2oKo7ZfhkoQ6gvaa70MwLPICN
         YCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744110090; x=1744714890;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NirbuKEOTyR2moljejzdS649GYkI8qfTa3FOlPaWlDQ=;
        b=nuyE5ApHHi8hvZTIFefowM7NC6OrUBdQ4VmMRgFThvhIVMsaUgJuBN/7HI1W0indbm
         JpQ+Ysy3Gi1bEVuXIUeAoJYqPdDilUMEYMcBxSHMeOUGHVen9BoIX25+D1D+dgj2WkAr
         z2MRzA+9zZ1FXTLXlZnR9TFIlxM0qmILxDA9869lKQ6N/Wpgf7+hKrii4Lj0GEDNyvKP
         dy2HBVz+S9YeEOhatDSn4+SgDXSbGnQcJRVLcP2FaSCbtnWcE6mx8wHWEnOl5777O3f4
         P1OX1LItV/83HjTnPSMtoQzkajFssBYnke7RrnkU6f6cnl4es2oiOFAVd8lHyopG08yx
         RB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU83uDspGW2RTF+syJTKFpB5OhO/4tUwV8tqVXRrJF1VNwuIqFn1NmnLSjopZsOQSBOCyOo4MH3nMfoodWLpIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOTnFfCCTOPKws6bfVD/GAWN+C0lFGuU24FyOkDnPM7MYXGxon
	cfr/scA1c5do924Otjf4tgAoRVWeLN+vuNuOVH8zvoxFzbUU/UwDB9MzjcPG8Tk=
X-Gm-Gg: ASbGncslQee6orMPU8ycjuHi1ZtRzNV8PcIUD/SrMBR66I6//VditEEnJQvoz5GAK6/
	XgkmB8liAD/5m/ACM7q32mDRBzHrTLCEfC9T7184iB1wCrZzLnJtMe7cw8Sdulw05bf7ObYy6ES
	TMrwYkvHmJKcNCIpbrvWCJG3MKctzBJlJtyzk7FpXji8wJjpsZ2vvdurwBRwhYHkENhj4cfEZvJ
	KwAl1DegnxDxy9sdMfkJ1CPb5KXYHe2SoTIlfFwXJRm0DF8CObq4t53C4s4Avx6/W+xNkskPFIk
	m1oVaWOkXxJfi+pJ525JZVKTf7kPqfq1Jqt9/xvGNbpK9FgR0nPDWVmtJZNm
X-Google-Smtp-Source: AGHT+IG1HG474H6q6bPpOt7xbsbQ8wAky1uvAa0teAmjbL304Djm6yn2qTXg3DoixKQK6rupsAkAwQ==
X-Received: by 2002:a05:600c:524c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-43f1890857emr4294885e9.19.1744110090538;
        Tue, 08 Apr 2025 04:01:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec169b8a3sm159770715e9.19.2025.04.08.04.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:01:30 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:01:26 +0300
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
Subject: [PATCH v2] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
Message-ID: <a010a1ac-107b-4fc0-a052-9fd3706ad690@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call dma_fence_put(fence) before returning an error if
dma_fence_to_sync_pt() fails.  Use an unwind ladder at the
end of the function to do the cleanup.

Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: style changes.

 drivers/dma-buf/sw_sync.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..22a808995f10 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,15 +438,17 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
-		return -EINVAL;
+	if (!pt) {
+		ret = -EINVAL;
+		goto put_fence;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
-	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-		data.deadline_ns = ktime_to_ns(pt->deadline);
-	} else {
+	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		ret = -ENOENT;
+		goto unlock;
 	}
+	data.deadline_ns = ktime_to_ns(pt->deadline);
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_put(fence);
@@ -458,6 +460,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EFAULT;
 
 	return 0;
+
+unlock:
+	spin_unlock_irqrestore(fence->lock, flags);
+put_fence:
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static long sw_sync_ioctl(struct file *file, unsigned int cmd,
-- 
2.47.2

