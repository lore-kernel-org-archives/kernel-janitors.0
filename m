Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E2C2BCF6F
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864935; cv=none; b=mjPLatmX3KK4F1DP47Ygj9uw/QT/6JBPURcN2kIGa3zpgqVP8LWEuI2gtAcq7tI3IjJPLggwRSWRaN7QlivSFDwfIgdapiJ/XVUMA8j03GSWzknmkFiTj0xp7pWzzupvet3yoxJ+I/Jt5kUSL3G/vgUmZpcFV6M8M9oZcuH7TpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864935; c=relaxed/simple;
	bh=aTkJQnR/3DETZjCrMFipfbUfY5SsPpOZ1VX4D8ujLV0=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=XzDapm1f3YPnA3AQmOZg9vyW+mlVEQ28OkTsdS9iwQXmaQ0mLlzz8da3U+GLCltI8Rd0KMgk58UsGi9itLvICHh7p2pJ+kgQ7QJKN7x7e7MpuX7SxOQPOTd34cHOcJ8kAuBMwvzC7Y++BS2oYWLWeT2WbR4HDcP7yiG7z88oiPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p4zTCpIm; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p4zTCpIm"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c09f8369cso565193a34.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864933; x=1751469733; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u98SmNY03cRBjpwBKU5+I1U9gP6hvTPRDks/D5f8cPE=;
        b=p4zTCpImNNnbGlWsO67b4H/W/CW0sjDE6vYfK0JTfFywa0bcYYIzVSNig62b/x39R4
         JDGiM/OHl+d8uz7zpjMy6OtMtzBDY8iG3Bbg8qBV1FEsh6ZtefUqNxxFM6lsTZyO+eKW
         UYsD/uFynkjrMFgA/W80A+pGH853Kg2iu0zxZ07hF6K7t07q0qK8ynWNoszVl0mK+iSI
         IflvDX4+qiZ6LrKrFNAAiSC8sCCkRULMqZ0GpGCWtsmjk5ViyhtHQGcYbvQKIM8bV7hc
         /TCo+PocYltKNpxDCeHBCsEvTVl46HykTQsXZUt99IqDf6qKQtCzhk5+jhbNqBK/0Uhc
         d96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864933; x=1751469733;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u98SmNY03cRBjpwBKU5+I1U9gP6hvTPRDks/D5f8cPE=;
        b=t0orM9jTfL/hRksBxmbxRkNq3VLPUafibqfNYu1vQAuu92D8qaitSyTZ99y7t8CrXj
         5jGV+I332JN7NPrkIxjbRNnw9I44q/F4eV/yQNRZrzs+XbY+Q0X+PQRnKI6XYgoh/m36
         nrIRwzv/w8O/IUcG9syuNa0WfhOt+lZ8OqPff1jdFW9bVvbV58MxRwEwZzvp6LgAUWhO
         QA7Bq1HgttOQpxqgzfrubIstdbDMMP8/CzYMiuAArr5dU9fDW9nvfYslB8Z+xy+xdg9l
         69jcw+Rd0VSD8h0HaGulPI4gv/SnKkiKUfOnqaGjlZcj1SspOOHWOi7Qw0iHS9JFePC4
         yjCg==
X-Forwarded-Encrypted: i=1; AJvYcCUu95m1JanDqFuEJOJ6yZoQ2e2btdEfad9elRtpJzQUdc79dyzDwbqenknxdaciAPOLJk8cU+oPBVHhfqvp/hg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy6TSznfARU0d5AW4+M3WQtpMqhDZY3Jm8azNDtV8iLZQ7kOa2
	EAQps/qSX2g67FIBduRqOlOu3z+/OlbQXXfIjsZTLxecEMLnNAR/6ypzFEMv6z2iJvc=
X-Gm-Gg: ASbGnctYX/CsaQhHMYH75PJbZXOEhLMeeRvpCVwTaR2p9iu1iFHPJzPaVlsC/ATuBoX
	v80jtEfbIoEb39/vEOvclLCYt6tqSJkjW61kEVLc3aCDEY5m/btJzWbaJjoREvDjdxxeqbmCOD3
	rx69zhdhaCSpRuGgi9LSldFdKuh2X7SBT/ailard64IjnD2+vE0epPqNp0bwRe1yOMvOASqaGma
	/l3XN/XEatvsIdfqq4XTy8XW1RN9+lfz3G5KYZKzmSAjFOUtB3HVWjmoDDnPjxpgHaj09xwQCCx
	gR414stcaSE1RCkVsDNDgKr0mvQ3N1LLt2ieOBiWbjo2/owfjgzAzz4+yYAZCorn44tvow==
X-Google-Smtp-Source: AGHT+IHkG6dat7iqtvzwTRnE7a7/Ug1VTKQvcFownkvnX4pRkEWxDAtT4ssRBcmMzlRv3IfqQ4RMqQ==
X-Received: by 2002:a05:6830:8088:b0:72b:7cc8:422 with SMTP id 46e09a7af769-73adc7eb8eemr1793945a34.20.1750864932939;
        Wed, 25 Jun 2025 08:22:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90ca9c12sm2236713a34.50.2025.06.25.08.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:12 -0700 (PDT)
Message-ID: <685c1424.050a0220.baa8.d6a1@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:22:11 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xiubo Li <xiubli@redhat.com>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ceph: fix NULL vs IS_ERR() bug in ceph_zero_partial_page()
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The filemap_lock_folio() never returns NULL.  It returns error pointers.
Update the checking to match.

Fixes: 483239f03149 ("ceph: convert ceph_zero_partial_page() to use a folio")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ceph/file.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index d5c674d2ba8a..f6e63265c516 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -2536,12 +2536,13 @@ static inline void ceph_zero_partial_page(struct inode *inode,
 	struct folio *folio;
 
 	folio = filemap_lock_folio(inode->i_mapping, offset >> PAGE_SHIFT);
-	if (folio) {
-		folio_wait_writeback(folio);
-		folio_zero_range(folio, offset_in_folio(folio, offset), size);
-		folio_unlock(folio);
-		folio_put(folio);
-	}
+	if (IS_ERR(folio))
+		return;
+
+	folio_wait_writeback(folio);
+	folio_zero_range(folio, offset_in_folio(folio, offset), size);
+	folio_unlock(folio);
+	folio_put(folio);
 }
 
 static void ceph_zero_pagecache_range(struct inode *inode, loff_t offset,
-- 
2.47.2

