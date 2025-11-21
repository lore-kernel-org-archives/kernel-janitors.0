Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43FE34A79A
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732056; cv=none; b=C3yMVu95Cx3STj/VQfZk1RXEeNudP3pD6eNuvkSI6KVXbdXzh1czC7GqDwJqAyHr3RRemrH1pel5wZcoYuEbsX+i8RtMQKZDN5dBMRMBkk/p/48p4uCBgabMsmtIwQ+BzZlvAyTjs4e12PxDeg27Kx9cHm7CYuuWnnWg6UHx3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732056; c=relaxed/simple;
	bh=zQUJYBQmVk0ptf5pEgHcnojTUQKHmZAz1Da32yhlxZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjuqDP9mVTBnPKpg30vg7G+bDImyjPUCqhjNIzomcpzyoMa32r9F+dpmiHo8PfmcLsqNIquUGoqyg2bKkrr6O4t7VwIXmB70WkEiXgaIol9annAXGMEowHCOXFn3GDAxrx/7t6e93Zt9MJI/k+tFEdbe3LV3OW9WMxgsqF6pK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gx8rZv18; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gx8rZv18"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47778b23f64so11671165e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732052; x=1764336852; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+L4T0l17WSA4vjG+LcSmcOxNpZmSPrGCylTE0ZSJZE=;
        b=Gx8rZv18ziUuus34WjMIIjx0W2fJqdk5fGwFyfP0IVcN/NKcULkyArzUYdz/W3mqbY
         9WqAUsY9Z1MSv6+IQg/H5/mZyk9xEtFhc2gBlWcpFT+oWvZAx7LAKNSKTSVmM88gW3Nx
         a1/iUuqpgWZwCVpxhZfpj66v5P09296SvUXEHl3IY1ijEqSHtACsd0UPxThdw0yTf+YJ
         FE0wWBBmZWfboOdXDTDNyLKW9eegVDhTNeik1q2b3gkeHis1tCWL0UBh0HLTN0Dr5IUl
         6019lvIhyy953MzODmcjPiK3eiVHAEyT+RsEC272x/6mxzbPrukA5cHnL28sDcyIDxLs
         tRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732052; x=1764336852;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+L4T0l17WSA4vjG+LcSmcOxNpZmSPrGCylTE0ZSJZE=;
        b=YVmIJW2KOf7MynNVuOoRxaAo7vfTrqkKAYEc6CpRxCT4D3ydYsniBX20idwcem9cDy
         Ew1YSq7BMIYC6KP7BdQkqbxZUh5LQEsh4AFswi4U9YtnCXxxpPtmuiBpikGD1GBeZcEM
         VngCnPCw3t63xkFM89EtEpJLON/2kJClXVA86yxnHV1qVGaZ2gegldHXA1hsB5UR0805
         3CmLa0kcklHrezfmqcKoGDkz6SD2VDsZm6mZnHnr2Rv6CzLlC02rAzs/KgQjz8/YC+yY
         AVvoNX95ZJkAVm+JSOz0CbVdW4bjln/+/BJkceZSYYwc/7nkgeoy0CjW6g8Til14H6/s
         WKPw==
X-Forwarded-Encrypted: i=1; AJvYcCVinJ2oOcyyYQsNMOYHy4ysO9g821xihGuaamuqtMym8KfdmTaOyd/9K2CWEGN1tT6wip5M0WQyL+Wa3Sy//1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJFvZjGSj3adyMDc+Wk2M3WyMnzh7dmNbsK7gflLweh76dQDrF
	rxY0oF/IDwtgHhMp1TYEmnTA1osBxMd754i6kDHDfgxh0tLdlb0n1UvsjBvH1Q6vMno=
X-Gm-Gg: ASbGnct6mgNpdn2RgfuzAplYLi3/4lypXpGU8w2zvLHgv8vQMAIwKmTe3QAjkrZ34Jg
	u61pZZ29eAb9JDCB3VQZYB9rlhzsO006cT58PJIBZjlhGBL3x6BXBcugtsemP8y4rPzu9BohMHi
	qT4QcoGHGVnlyzhvZw6z8lLCyJi+XhbmgrIfUmOYQqs/Ph3CEF00pnSrfcORNLoru5WzjlSOi6d
	4FmpWF0uYYp6zQU1mNE5ETD3NB6rmyK9rMQ+QrbB/d9ukECPsNJZSKOhGj/AXdPmX3sCYckQoKO
	Th/4MiQaae4nhkLv0PGP3MOgCT6G6MGDeT2rIP+muPhFxMtrOldRcQ89V17Y8do+PD2OmLW4Dom
	I9sUIHhdqRbEUKxuiFxNpgzLpl7hE8lfYx57PbfB4Jy8OrsR6O2K0DS20CB1xFeYXxDAj6e+d1b
	IM5qWP0XhV7p7qcUwT
X-Google-Smtp-Source: AGHT+IF1+crTfIYeEU9M7DsXBYJ60sLjbKYxri2d7Qo/kMnDk4ENkEccSfjGCmcuopV5Y5KjHpyOyQ==
X-Received: by 2002:a05:600c:4691:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-477c110e521mr21905045e9.11.1763732051761;
        Fri, 21 Nov 2025 05:34:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf22dfcesm43851275e9.13.2025.11.21.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:34:11 -0800 (PST)
Date: Fri, 21 Nov 2025 16:34:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] fuse: Uninitialized variable in fuse_epoch_work()
Message-ID: <aSBqUPeT2JCLDsGk@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "fm" pointer is either valid or uninitialized so checking for NULL
doesn't work.  Check the "inode" pointer instead.

Fixes: 64becd224ff9 ("fuse: new work queue to invalidate dentries from old epochs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/fuse/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 761f4a14dc95..ec5042b47abb 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -201,7 +201,7 @@ void fuse_epoch_work(struct work_struct *work)
 	inode = fuse_ilookup(fc, FUSE_ROOT_ID, &fm);
 	iput(inode);
 
-	if (fm) {
+	if (inode) {
 		/* Remove all possible active references to cached inodes */
 		shrink_dcache_sb(fm->sb);
 	} else
-- 
2.51.0

