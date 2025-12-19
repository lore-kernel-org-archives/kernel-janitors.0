Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91AF2C0F62
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766140438; cv=none; b=mfCjMHB8CTpbt1KJDiMWJbhUq2CSj+vXJOievIr6JDsuuHWXhdWWbY1tniKmb3KH4VfEMQmoBx7Iwn0V/c0Pm/XljvgbNJ8cD5JqDnFmOH+s0dCNFA0kv5Hmhnc49ioAGkdOtOc9CNbe93jvlVQw56zxALKeA17Oui8etJBCay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766140438; c=relaxed/simple;
	bh=UDuRjaW4UHD1XjxUMKeFo2Bc9z32SZef334KEZG0PAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvHcFEfXMnCeifLINV5qEMXW7XhjqdG4A+gKIwRiEnMBs7zmePrTLTYoOc/Og4Bsi5tGGSM6LAdY1VxvDK7IxCluD+ACaejTJpsvFRlNGOPOWyeJorqy1ruJ7QHfCUF6pGIl5DZP9rLqtVlDhHBHqI/+EYULZcojO7TpA7YhYhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6shGhl6; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6shGhl6"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-477770019e4so13854675e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 02:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766140434; x=1766745234; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wJvVM05EsH+BpysKJZDNgRttkxy9i5ad4KGF/bGMt0=;
        b=h6shGhl6QEoWm4MS5sh5sy9Q1Cc3fX/9lpKauzQ6MdJNL3KNWrxlqFT3Y94E1UlXj8
         XdmHjZ1pEGjXK5oLSGjv904z2dm7UQ076knPCUPMyfs9Jr0SCH+P6QU/gT507lf93jsL
         FOceCe9WjUYLMRNL4RoVr2rX5De+DEvVeflIWGcUbOiiLrv8Gpk1KeL5tBU3gPdsQYiP
         dnzBPq5jgVQVuF/IJAEHZd1V9sSX1bVK2uP/rtB6PhZEMq6VhzU30uDuSSVrtz+f61JO
         RyBdtZQ4BEXZGcp3p4B+TEtZ/CHTX8VP/o0Ed5mU2epMjbHJjDn9qbJDqMmryEbmpsKs
         d8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766140434; x=1766745234;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wJvVM05EsH+BpysKJZDNgRttkxy9i5ad4KGF/bGMt0=;
        b=U5lLDPjMQAy4QVZaLMRm6Ompa+To3x7tI0ja1q5ESShoVSCI6EB2l5eBooSKQGb4H+
         1aja4Jb9SAp58q7dmT97n/Ng4OOXe/pS2R4+kXTP2kqJo7Sy5RtT9uBTajfX3p/Bmx43
         AF7pun7pJsgt8M9CkKVtO6wNwpkAz4uSzfxLcM7Q7fPiZcBe/Vdjuzm9kxh0Eq2botl6
         pI/vGRCNOHq9gseKFCH4YzsC+06wT12o2LjV3AbWv8z/kKpy3oU5uuYdpj69NLXUvUYB
         XMP5txhKgwEMeaAmxL0pFaXLeTPVBoVINHhvxXnfWsoK8xf0BFo6n0RSbWZDZui5YZt1
         a+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMWoqxGwiesnH4H/Tu06CaoYlzhFF/exyQyVhGW5Ya8yc9vaZbGyyo78O94ooa0HdQxjeORSAwDW7gajTiO9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZElXTudOVmFecTCLZA67+9cxqzOZH3c9oVrSXmAeZ5vNA4itC
	fDIkCx/oLsTpJxk8yIhs04nLzKjx9wyaE5rhOhthuoAGDqsKo0JffNmY2k6+NuJvneY=
X-Gm-Gg: AY/fxX6pIaBUIGLCQHRuwc2Ksd9Z5sYOMrEIpc1tNdCt98fKPacG76rJ+5rNgXH9vyr
	2PIGg6qICdD6CW5hU/6MG50UkEXQbAnJ4oUxQQOEJFZgTi4MqGf/89GftpeIAIt0fwObwy8VyOx
	n/rkpjM/XjmZfs7CqNTpyq7DpotP+cZmJ2PWL3z0o0X61qcoWyhVAWYLv0Ool2X+UnRdrP5Uh9V
	jBuDKEAlz6hrChOxU6PHIvDMNNyZGBrA7hmGsDEdus8W/zdeUR+jfUScJDmCX4WuHONPOFcjL2u
	/c3pwNLd/UeeJJy5meznTU8a7v16ovdzJNQ0wCQ+fUjml3t4ICFO1SxhY/8x6Tn9pJd71LYqbzI
	U981d22s3a6dyaHIig/6PdH602a2ple7ji3MeR8DMESMWr+F/+vJsrybDOje+Vyv3mSFlH1pW91
	mHg6o1qAidGAW5sqqg
X-Google-Smtp-Source: AGHT+IHiqVq0rJ/auLlAHgLqJJMP2FoFH8HfQSTnPppwr65hFDgnc6phLfstgUGrNAed4ocU7KP+rg==
X-Received: by 2002:a05:600c:3b8f:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-47d19593d0dmr26265495e9.32.1766140434206;
        Fri, 19 Dec 2025 02:33:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346e48sm36722545e9.2.2025.12.19.02.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:33:53 -0800 (PST)
Date: Fri, 19 Dec 2025 13:33:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
	linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] xfs: fix memory leak in xfs_growfs_check_rtgeom()
Message-ID: <aUUqDiGqwfmDcY_p@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Free the "nmp" allocation before returning -EINVAL.

Fixes: dc68c0f60169 ("xfs: fix the zoned RT growfs check for zone alignment")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/xfs/xfs_rtalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_rtalloc.c b/fs/xfs/xfs_rtalloc.c
index e063f4f2f2e6..167298ad88dd 100644
--- a/fs/xfs/xfs_rtalloc.c
+++ b/fs/xfs/xfs_rtalloc.c
@@ -1265,7 +1265,7 @@ xfs_growfs_check_rtgeom(
 		uint32_t	rem;
 
 		if (rextsize != 1)
-			return -EINVAL;
+			goto out_inval;
 		div_u64_rem(nmp->m_sb.sb_rblocks, gblocks, &rem);
 		if (rem) {
 			xfs_warn(mp,
-- 
2.51.0

