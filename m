Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AEB19D8BC
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758626088; cv=none; b=sigBBm/qzfM8qxbpcPMe9XDq1p3ocwLgvXDqu3+KE4lyDNwDTT7jEbuX/t4Tvzb7uYblz4+XVsVW96rthnyen9FLE5/D7pTO9lSIBkKRthZAdKKEf7cpaKJUhJ+8Z3gzHcR87LmwWbSiag1E79QOnV6WVay/mnOX45SU2r+QgZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758626088; c=relaxed/simple;
	bh=YptwYi2KhyqTs2MPDUowQsobfWUXyvNShpVbrq//inw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKTbt/Lw21oy+SGD1/Yj++0Fmgz0DWx5TxKdzEnecT1D7UFe7xJFKvX87lGTJCr1YZWtJEi5KfMqKlVKNL2F57r1O2zLtlSWJWDmZWIAuaN0t/HCIfG1FLF533DVXXYVZDn+n/fnGK2HqDhReEFiHyIF2FCeXfoohqsga9F+D5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0PqUndd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0PqUndd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso38530035e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758626085; x=1759230885; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=veRQoXTOP5jOH7336MItrAXBwCoB6ZB/LrxpVKH7RUg=;
        b=o0PqUnddSAS6bInqUUA6bb5FZBQvq8yHaQJuN0nfxLYkcqvfG5vgDd3MA0uKxSo8R8
         9A47geBU6a/EmrK2quEftVqzHyTIr6M8BTSEtzbcsQXrqTzRJi8wbCz6YHMEAoTEl9dr
         nF5lofTZwRwrK9aNRXOoIsJGmF7AL/AIBdI9rRtE/MEvk4i7ZNCt2Wl9itowgfz7q4Dl
         IbDJDm5NLn7P/TAtKi2RSxEgBvHbcjfETZympUEIemBvMnHZfiIORqxPxHQUm2wjSmDT
         V7isVuffOzb+qy28ghGfujLf4pmCPAZZ91mo8VL8NPChgMKry/0wdtDfstToqZqcSKPI
         JYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758626085; x=1759230885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veRQoXTOP5jOH7336MItrAXBwCoB6ZB/LrxpVKH7RUg=;
        b=LO2i7EaZM4AjXhFPsj9onD2WeLr2cCLO/Tlw9ijk82U2WbN2Brhduaz6gD5pcnpqvz
         hcAOh7/2kdnzM0zHwmX2XflgfExibHQ7ag7c7kKVxn00JVn1kqBSqBcooNUmf6PQSRa6
         he6ViRmkX2j0zz9nEzMHgghq4V7UsmH7CByxgkYDHO1hdVZ3h+4ZxNHCKnU12FMQ6V5E
         agQFbtWBQ3uTEvAzP3kY+P7pVT7v3B0k8tBTnid6Cxx7dCqlK6aJscgfgqZ7TGPDRFnV
         98lrM63t9geM7D7G9wRLJREf12YqYscim/18r3TFoAOZcFYDmCVAaxNkGtWyYEV1Nhnn
         im0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQkH3vJ9w9s0uGw17TOeVzU9rI/YUi7iyLggApRBqfvjIjMZwNH9dOhv7sW6vIEspY/25jd1GBInCQBpEa5Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJTYOlEIrE9+auh2vEkDMVbpBDSz5I2PfiW+SvqbEEKYbHfIqv
	wX0i4xxI/ZJTD5fuJddHi5E8C17mLcW106mbjj1aW58naIl3TcW/c5ZIOygWY6r4hqM=
X-Gm-Gg: ASbGncuYDhnalZ0ZjyZwI6pYSGvANBm5mLJygL3deErriF4XeVF+UxhlrKCPa6bwix7
	/UPN4jReMHSXufwOsbWW3oALOHOJ3JjL4fu3s6hQWC7dv0xfHdd2cXyFIhRRRMWdup6Va/F9c52
	B/15YZBG9ZN4lDgfuZ60tICxL4+Qe3XScfROo0oBxJvAeDPcfHvP0xbGix5KTFhsAWOk9/RzUuL
	j+C5Jo6wEm8cM95lgqEyjHvI79Z6VXcTmqCyIpnsGze9wqjE5+e5nuMuej9eo5MZs45LKEOC1+n
	i60imOThbyrkLACVNdPcci3yquGp4mozQjC3RQ7p7TflOJI3tPrdz0xd/88G6dwnhK46ivwToZ3
	dJe6cE0g2pIM9Qf3cDLp/PqxZJPKV
X-Google-Smtp-Source: AGHT+IGNA4ZE/G6xv8PAXiFATMi0x7yx2B6IdUPeinnVHdHE221ujk0cX1DYaOF+khzLyUivuysi8g==
X-Received: by 2002:a05:600c:3145:b0:45d:f804:bcda with SMTP id 5b1f17b1804b1-46e1d9817dbmr22553515e9.13.1758626085008;
        Tue, 23 Sep 2025 04:14:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f5a285efsm270902105e9.18.2025.09.23.04.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:14:44 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:14:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dma-buf: fix reference count leak in dma_buf_poll_add_cb()
Message-ID: <aNKBIcpF6kZRG6Mg@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call dma_fence_put(fence) if dma_fence_add_callback() fails.

Fixes: 6b51b02a3a0a ("dma-buf: fix and rework dma_buf_poll v7")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From code review, not from testing.  Please review carefully.

 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..a14e1f50b090 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -301,9 +301,9 @@ static bool dma_buf_poll_add_cb(struct dma_resv *resv, bool write,
 				fence) {
 		dma_fence_get(fence);
 		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		dma_fence_put(fence);
 		if (!r)
 			return true;
-		dma_fence_put(fence);
 	}
 
 	return false;
-- 
2.51.0

