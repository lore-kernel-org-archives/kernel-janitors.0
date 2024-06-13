Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26FE1422B4
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718289281; cv=none; b=hGucuXAjhZMbcWhMlI+0mrkTaUgtqIPwI6dO5o+WUDODqnX4vKgRcs9RQ7ORw+7HuKiis/ZjFMo5YBPWwHOWnbf02cwBYt1wu3QBYgsvgpsrvh3AUGlpVNv3R/DwFXi7a3wTx5CvAIkyM6Zvp2Zyp2zPw8k3WB8Gc1fitWOW4A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718289281; c=relaxed/simple;
	bh=1GvzaJmYhr/v9fiS4GiqGNq8mR0s0kuyVdl55JSOen4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3gdqTic4p9oHdLudMAsF9ldH3uiXq0narM6LZUr0g4+7UkREek0IWq6caFc3REH4GDiBU+8XgGjApfLTB63ZL0vER/pDMrTfevB3ZtKTw2Tu4PbiMG37JipgWe7Eamz7DytPUrhCHyGcik6udlmh12qgktDbnEqV9A8GCMCLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BaSHju8R; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BaSHju8R"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-421d32fda86so12988195e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718289277; x=1718894077; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUu841f04EncWFMYW6vBBiSV3HmVz/jOjkpdY+qxO/w=;
        b=BaSHju8RJ87dvsBH5YigoNxfASTiHaUAkuOFEXXDiqjbE8vXg7AjidOq0VWTlPfPhC
         Vz5wbtv9eFd0WoehGQberbdP83nin+vMdgaQqB+rkR7DUT9R8JslsbSi3arwsz+AWj+0
         6EgjqeDd0DXr6fKdeUUKaTHG8Ma+rWIzb7fVdxtw99TEps6M/iYq/yCUKn2PsqDke7pK
         eyL0Sm1yvlIfcqQjIqkYwFDU1wWnpg//+TqSemWQB4AaRWijFW3AHn8iYcLSzaAP8DfX
         EFm1XNYxMl6IPzu/2VWpE7KJLJ0mA54yb+LGD8fB5XWMBbtj/skYpGu6Iw8cU2BZmQTr
         Si5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718289277; x=1718894077;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUu841f04EncWFMYW6vBBiSV3HmVz/jOjkpdY+qxO/w=;
        b=LCbID3d01LFrHdjdmN8u+CJpdRzoj5XD+F3kh9/LAXhepqAHkXDNUoEoJovdfk4hLF
         5fiPr3gcI4q8rHldM1r04eSLMjgW3QxkPzL44UNN+UEdhry59QNh7zYALccPnrEU8mNP
         8YOxun3P10ExD7oH0xh4/XrVUkzIJabCcVQ9vT5FwMjeFfDXwbemLdHtTWJij/2vcjdD
         GlA4WA1dkB4BD64eQ9NHL3cQxqRGeLXq1NPHDwW8xWWDcx1//RL6T/+lUHgwxr6fOrTD
         Qyn0wJ1jsYjWlhkRXPc0c1Jgv+k5F7rGvxeGHtA5BqLIPO4tGFCpNlsU0ZAOWFDfDBB4
         7Mjg==
X-Forwarded-Encrypted: i=1; AJvYcCUL+sNlqyBpynDzL5bRD8NzrMIBQAl8+B5jUjw26CCllkeaQX4Cd8BzPR7O72x5TBIk0NJKF58mI3GgBkKRC/udkJmilDPu5Fl2oAPw2btK
X-Gm-Message-State: AOJu0YxmZYePfLtxIP9a7hCeJ9AlfFE8tek7Jsca9U3XFRDvmMr9i153
	fCo7y7CY/dhzw2hoMD4H0tYnV73D+wFF8N6EWlYElmZvFISuzU4J8oZqqNYuvqE=
X-Google-Smtp-Source: AGHT+IF5rNvhSil91ql7BawniRIsmEGSLhXkLYJko0c4ZjkyuqNa9z81o9B9fbYWSGMBCYVzDaCyqw==
X-Received: by 2002:a05:600c:42c4:b0:422:6755:17de with SMTP id 5b1f17b1804b1-422867c90f9mr50286365e9.41.1718289277293;
        Thu, 13 Jun 2024 07:34:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42284d1130esm27960335e9.0.2024.06.13.07.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:34:36 -0700 (PDT)
Date: Thu, 13 Jun 2024 17:34:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Andrei Vagin <avagin@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/proc/task_mmu: fix uninitialized variable in
 pagemap_pmd_range()
Message-ID: <9d6eaba7-92f8-4a70-8765-38a519680a87@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "folio" pointer is tested for NULL, but it's either valid or
uninitialized.  Initialize it to NULL.

Fixes: 84f57f8b8914 ("fs/proc: move page_mapcount() to fs/proc/internal.h")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/proc/task_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 631371cb80a0..6ed1f56b32b4 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1492,7 +1492,7 @@ static int pagemap_pmd_range(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		u64 flags = 0, frame = 0;
 		pmd_t pmd = *pmdp;
 		struct page *page = NULL;
-		struct folio *folio;
+		struct folio *folio = NULL;
 
 		if (vma->vm_flags & VM_SOFTDIRTY)
 			flags |= PM_SOFT_DIRTY;
-- 
2.43.0

