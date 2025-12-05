Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240C032C305
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Dec 2025 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933027; cv=none; b=jL4jw74zdq6mWt7L/C6yqQSmXsaQoH4CKW45ehpPas+FqNGaCJwKGtEzLa2o/SER+K7Jtta5HDl9RPstRGc89KkIkJaExRwPZyEGqRfAKyjwYZwCis8OHqCUhKv8uPKhsVq8Fy6RP5RpaWuEAXFOxZtvU+Yy38+VQJNHcYvHDIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933027; c=relaxed/simple;
	bh=cTaP3uQ/pEL+ga+iy9DqlzB47VJBZvrr8ZoqekBpfaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DO07gs2M9dGbNcVQZtLsRHt/dQ0UiqWAXkaUIfGzlA8j2IAR73jB1Jm2QjHMngT+kf0o/T0R062nOOv75LM42k0xC5FU6NQg60J79yeVqh+e0KR3QCs/6BzH5Xq2lPwD5sUScrEnW2kbkEYoezru9Qz4KTylaTRGszEPfhRlotk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fq+rOa+Q; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fq+rOa+Q"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a1c28778so27401315e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Dec 2025 03:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764933020; x=1765537820; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMabrmVU5jaPqm7GY62CMhlbea5RlGobfNxDCb6Dgmw=;
        b=Fq+rOa+Qn3s0FwwpiM7keD0xdUi3MoeNXiNRLsbsKgYiyCUg4IgtLH6I7V1j3tlcYC
         zdD3Mox0ICJpJ+fPeajW8KV9ZcSkjEq/CyVEQfmJKG0OhOvsHrAO7sAcbmahmSFWp5jf
         WLQSYhaWJ6D0SIHcZsaDGIOdJ2CZU7rSFfFnroyYOPrcKhtCWU2B5/KA7YeHDQ35g0zg
         /8jOsMaWsVxNU/l6qBhlgZlSlkdQSoxJd9ZJHS5yH6t7oML2LpddXxnytrilAM6kYxKi
         iClyYjQkKZ6515+Ae87dID2g+JsOCPXCz0FoczymlYqsRqL4EIigpF8K3i5HUI4bcB+M
         ngFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933020; x=1765537820;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMabrmVU5jaPqm7GY62CMhlbea5RlGobfNxDCb6Dgmw=;
        b=OktRnTgViSEIgJbo06dH44U3q+L6qH5e0yKhyES/jQ979Pbb2oVceM2q/mCsXqwFGe
         s9RkpxB+7MNWsSepwZqp07Pq8ojfZzSbwU8bmx8ZLoanyDeu4QqF1YQq1xjvrhomjYlD
         WiBdyx3QZ8LOVPrwcsAVVzbXxZzVq0i6DikHtTuaR1NVRagmA7FFGSQqZKuzg5FYzSeu
         d0hjeWJgo6G0u/gYwW5YwsXi3GAqrn/24sZZdseawnakYRTtFNb8d7j5UQ+X9bnCHbhp
         tIPPwdTEqtSIdzuPa9ihaMYFo2ADI7noNQTdRRvBTFIa8of+aJqd46mAZsVLCrqviqhO
         38DA==
X-Forwarded-Encrypted: i=1; AJvYcCWoHMHotD3iPK2nwdFbfuGloCUXPGyfyiJFuqOrYkxlXNsFsoSopRcCnsMp1vAtTblNx6TJ4ZaXBF4afRYx4mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtfAuXi+dQ7veSeRAY+sn2dPqs90x4HxU1Mahd0Il+9XoChe63
	h7J/1ZWtr+gO2AuVkhlSKNmF/L0DX0/1iFKT5TOYXQ0CwdhMfXbSEsRLiD+EKOYWIdv0YvN5yvX
	pAfcU
X-Gm-Gg: ASbGncsDV5NDr79jCgjfDfZwRqMyK8SI6wBPYMkcoBUWTHNO2kecUkdwBzvG70WwpvQ
	iygowRP9++bgcDsvq7WzZIjSJC2oJ9buJaf+ejq+hZoeBf99dvvvqeLV5NaYvY8gZnv1ejRsXv7
	W+HpIZA1LlP6Lwrwqo59xP8k/yc4mv2i3BRy2PgZ7vxu4DR4itcY2aDuFw3LEYl5HNKyTgHPohP
	d9ArDnsgHsZIFg1Bt7NMeADl824sh2nXVVvtdfaCo/EI3VeAdL8rOkEsNkFTGfaJWbZCEvIa6VI
	cVcbXq7ZYXa1/OrL0HY6wGzrv2SXTBwoGiDFUyV2K4uy7rC7cse8AmCd6b3+CZwjejaCDItNnUJ
	aZT13oJwtUPykBvlMSwplLzAllS9DCHgrZHMso+PwU6GFQO7KaJYw+NrFV5jz34UbDclF4cUh8V
	ze4SLptoETHp0J5vN3fyr5w3+LMm4=
X-Google-Smtp-Source: AGHT+IEREuSiwKiK8EKFbQwV5t/3IxHIeztts9FpeYEKYzY9N/1JP404bWiT/KbtFzPB63kwLtqj/Q==
X-Received: by 2002:a05:600c:204c:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-4792f244ce6mr46574015e9.2.1764933019521;
        Fri, 05 Dec 2025 03:10:19 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7ca4f219sm7915521f8f.0.2025.12.05.03.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:10:18 -0800 (PST)
Date: Fri, 5 Dec 2025 14:10:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Aristeu Rozanski <arozansk@redhat.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] EDAC: fix a limit calculation in calculate_dimm_size()
Message-ID: <aTK9mKTphPwuR7qb@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The snprintf() can't really overflow because we're writing a max of 42
bytes to a PAGE_SIZE buffer.  But my static checker complains because the
limit calculation doesn't take the first 11 bytes into consideration.
Fix this for the sake of correctness even though it doesn't affect
runtime.

Fixes: 68d086f89b80 ("i5400_edac: improve debug messages to better represent the filled memory")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/edac/i5400_edac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/i5400_edac.c b/drivers/edac/i5400_edac.c
index b5cf25905b05..81c93ba957a0 100644
--- a/drivers/edac/i5400_edac.c
+++ b/drivers/edac/i5400_edac.c
@@ -1033,6 +1033,7 @@ static void calculate_dimm_size(struct i5400_pvt *pvt)
 
 	n = snprintf(p, space, "           ");
 	p += n;
+	space -= n;
 	for (branch = 0; branch < MAX_BRANCHES; branch++) {
 		n = snprintf(p, space, "       branch %d       | ", branch);
 		p += n;
-- 
2.51.0

