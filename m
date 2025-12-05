Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F332B9BE
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Dec 2025 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933037; cv=none; b=BjLmMNhPEi5HOCZrO9kkVSPTTVVi/NUOaXdksCeN4kDazml4F1WUnWHnV2h58sADGSSAaY/f8YAho1mhSFU62Emdxfiv4s+Upf1+Ylvp/+zyZG+gNH0uc3k5IzX6EFjGt+G10fdyWTkLlmNsQcxhsvB0o3rnOGenVBBxasfWDpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933037; c=relaxed/simple;
	bh=FIqRbn0iSd4HWbkmd2425iWGFEgDgReDrwM0rbsXrfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z1zGCgenoHxj7/5MgeTAhrYYcxPtZmkpwRHZ6VaQ0l6PtsdSalHBJCHJ4J2nVX2pTc5f4JgK+71SKWiw3ynS0mQ44MSYA6KArEUEBVZumTZOGz8uCQLsvWzfalpY/nt36h7JFQPUm1DPY/XMhpPL1560K/jVt+L7X9dkPjH24dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=trTJNZ53; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="trTJNZ53"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so15816335e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Dec 2025 03:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764933028; x=1765537828; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2Dv02xDxln81ZjHynp+AfkUOxA71nmnU4NFvPsIXnQ=;
        b=trTJNZ53ErYVRzayyFCeg09FYlcPiO/fVPg8wonb4YDCeZbmCPe0TfQyug2eLqy7Cp
         lQglICdBrFuJYYQBPSD2VJqCC/eqi63mkNCW96gLLvHR9ZfOIJSQNFv6x976gdK/PHaX
         8ZLtwlb8JPl96RqtTSHvWJtW+U2f50KCG5rSX70NwM4doaN7fg/fVfLFSMom976QfY3/
         e0oIaMo6Q/L/1cesohqAfR7wB3amh7i+P+QB8GVwZB8c7nCkH43kCSoxSGMTYlk/nBA+
         qy14JzBXgpf5yExKsDYL3rg8om4meoRebT1Af1rojaFq4Ci/tsfYob66GIhsBGQ8C5TP
         0Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933028; x=1765537828;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2Dv02xDxln81ZjHynp+AfkUOxA71nmnU4NFvPsIXnQ=;
        b=gjUFTOICvaJRIKpF1Fab8xFo9mx+F/C09btV3fWLbDvDIPbMa47SrN29zX6zSKHejN
         tLZK/0fdkH5mRLz9cb7fiyV8/LMyxnfzsTVHzPD9YrdPCc0SMuNb1IsQHa4YXNnLjV1i
         z4Naqf9StP+2vdkSAgIBYusBM6sYfUzZKhvojv5zP3xE2Wn9ibA1Hmyj65ju8cX6+b5v
         fuTRimjl/L+Z2zvtDC1cLR6qO4y9mEZgqNC5OVif5Yc92MpcGLVW18m9fBAmdYrieX9J
         TmXC+No90z21hflht8mjwmNVmWxbmB1amIOKS1R0glCDNb8XT1z7QdhVVBCGjyeG5xDD
         qgEg==
X-Forwarded-Encrypted: i=1; AJvYcCXR1b1jZn59hG966dnicVyuQyMZdg75NhyzWv7LAdarL++5WjNV9iAWU7JHA86sJqPw9AU6ASl9xbva+4LZPwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwkMbKCSVJF7CcYfJYRpIqa3dWMJGev2a13pyYVn/UnWuXKfQo
	Q/OXQu0ATjLLXbIf7jEZbQrMrPVy1w+04mQ6V76akAQowCeiM+/ub/iidWhITKcp2Yc=
X-Gm-Gg: ASbGncuCz0zftMCWoQwgQyRuJonJmfaPZEbgbUsFSyICRaxElT60GpOk1LUrrahERjK
	ObwsaagKgbAoXMNSNtSM+w+E7xf+fnTa32GtrTOT4cmOHJhanoh3VQXrSgi9ZMJAdj9zR/5BpSI
	zA7Yuuy2z3NiDMpcjkA7HC3BBAsvhmYtDeJflKrCg2A2saneg/atcsqL2euoTXxVKAsqHoGjJLM
	rhTQIVyHLi2+GeQjTT8Iq4p8Mg3vapr+fPgzhxtXWJB9NNvnlLNbL/hXZQXUyPzv8TC1/s6TV9L
	sR7qWnRad0rL8tAqa87JkIxZl2V5n3r0THqk88lF66fKW+WVV+UwhG+pDRCB4/wL9YKJsCK9mnV
	cWM7d1aUkP0wnhIVoKJNuzzgQeK3OPWuAUwXGEjk1KNeXOsycd1Ce3Q96MARhWL6OejTyTXwTpW
	IhpDtlEGb9wHRAUBwW3TwsS8YFERw=
X-Google-Smtp-Source: AGHT+IF4cZwMgYUn5BppW3VrmacPI7X5JRdwSyYMQ8T8eEKTmMfQncgG00M1U3s8j1O3a01skm5S6Q==
X-Received: by 2002:a05:600c:4f90:b0:479:1348:c65b with SMTP id 5b1f17b1804b1-4792af34f30mr83682085e9.26.1764933027960;
        Fri, 05 Dec 2025 03:10:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47930cb6a96sm77241035e9.15.2025.12.05.03.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:10:27 -0800 (PST)
Date: Fri, 5 Dec 2025 14:10:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Li Chen <chenl311@chinatelecom.cn>
Cc: Dongsheng Yang <dongsheng.yang@linux.dev>, Zheng Gu <cengku@gmail.com>,
	dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] dm-pcache: Fix some indenting in cache_info_init()
Message-ID: <aTK9oGAZuWBfedTh@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This should be indented a tab instead of five spaces.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
It was changed accidentally in ed79b300272a ("dm pcache: fix cache info
indexing") but it's not a bug so there is no Fixes tag.
---
 drivers/md/dm-pcache/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-pcache/cache.c b/drivers/md/dm-pcache/cache.c
index 6d5001548628..f02c7c4148c9 100644
--- a/drivers/md/dm-pcache/cache.c
+++ b/drivers/md/dm-pcache/cache.c
@@ -42,7 +42,7 @@ static int cache_info_init(struct pcache_cache *cache, struct pcache_cache_optio
 	if (IS_ERR(cache_info_addr))
 		return PTR_ERR(cache_info_addr);
 
-    if (cache_info_addr) {
+	if (cache_info_addr) {
 		int index = ((char *)cache_info_addr - (char *)cache->cache_info_addr) /
 				PCACHE_CACHE_INFO_SIZE;
 
-- 
2.51.0

