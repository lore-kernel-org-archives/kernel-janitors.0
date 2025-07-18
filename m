Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FAF21CC47
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752873790; cv=none; b=U+vep3K+XTp/KbNhG4mzu399k+dNysFhxY2lQeukc4Sh7TQSqvDD3z9VQ0b9DCxpmEgKSrqNJpd52twyWwUiI7E689vKAGnGFbV1bk6IHRCY2LbPDlLoZMuUHJQGTAbTmnOIb1Pj6tAaSRboDCLxZlJ1yUdTGQ/SBSY42DC5sB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752873790; c=relaxed/simple;
	bh=DG9sa2v1F0UPXK2JNXm5sOExvIo23mu31aj3632NTWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ebJaJkt2Q/SBom7Bca+3BbcYmYKxEeEc3wnp+QPdqNYBRaT11UNqnBQDduy2+gBlGkNHxg6P3OhHhUWIltbCYrM1uJog3lUaZfDP9sshfsEEbxPBHodRjSktlnmVOONitYK57dKsaYRyrX2cL+9fFPuEmJd9TxIcjscHL3ZUBAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nc7FoqsW; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nc7FoqsW"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-73e88bc371cso494762a34.2
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 14:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752873788; x=1753478588; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tK+4glzE3WnB4vC6DvcGs4atxT+1n6gCTpv11Qz3u6E=;
        b=nc7FoqsWukwv521uGwMoSFpApLqh6K3t6qB5jPJyTI3qDsdbyzWezP5VIHZi9E+frG
         X2be89/k0vCAdjSh6zCMqoe5dZ2x9XS/PG7kuPSbdgYJp2E9j7lV438xOvR3DeG3kTLD
         TwwUbbgoyDB7gq+1rb9/AMCnDwuGknlj1BKI8d8UJCyyctNwRA87cVp6jpo8tZjQne+3
         D2h8V/bwAgiq4e/l2Nx2vc5RGpnqxuiLLTZqY7DZrgJe/EUxOXggSEMqRbBOBUEUf/YJ
         p2nMyoj0NedIXC2l2ouHIzodTh8qIs3wru/3jwtt06kHYfyeQE0o4gPAMNmr6FN2DAOU
         D+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752873788; x=1753478588;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tK+4glzE3WnB4vC6DvcGs4atxT+1n6gCTpv11Qz3u6E=;
        b=wjgASuJ5y1TuuapTFsuHTNVHW6PTcI8LccNo5h+EHbmTYGTpgppb6g/hi73+7rrgzQ
         lPPU8UvLMVDMAio28LcDZwxh9OW+ilJiOY5G8fh5LNdpK7Ky9yz3j0YXwaIoNxyZ4Rqf
         nytdZaTiNyd3yPegA6Jv4Cn29zanj6TuecGULSOpcz7bVgaj+TSfu8RhcCwdB2zcrjZO
         Hvev/s2SsTKZKWe9Tdp6d/J4XPQ0VLOEzpUVu+MYQcnyag38v3REZS0r0/FUAMmR1WTk
         S4IjgoFFziOFCP2e3v0m1gaWHEaHpUuWpCAzw4C6UYodtBFVQz8DBk7ykqVDmrdplzZe
         TiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn35GEQm6YXa6k2EsFyJ2+O51IbhQiiVxEC666vRzw2d4lDEZ31639sq+qpYtVXM28kC0p/0dxnrlGm2rqMJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZnVcMw5Knp1WmLc8maSWjA2KXjaG1yp9G4zzRvp0FMdw9fvpz
	7M2fz+dd1lgq7ymLtCB18xK9wRrvVN+j5MMtGeRNs5839NmzZO0qAfXL8wifWV0zBkE=
X-Gm-Gg: ASbGncvxzR68spVhG9ZdNSj/+BAHTdzNmzfvvPUihul7aRpzA9tbC91+kZWW8UUlwmy
	HvGI2Q3IF/IM8mZ2iL+Xmdr+0npD126QIqb4Tse9vXKHm1O8Ef54mcvuEbKfJ4ukGz+rBC1h6K4
	zuh/HdbmoYOMZqN5a/f/UPSViRPaHNATTrQJWw8fmWEF0A51QgmQj2TmF37U5bL4vQgY2CGzxQP
	fdn6CH+9U/aSgpAUbKzp0c6LLMBF4ajEPjepI8e+xEzQxcGLHmEa94fYC7OSOAlBTRTJyuaQJ4v
	943Vwa7urIR4w4BZea6XsmzB6dI2/7Jbd1VzfwEz5vEO9hge2FcoMAEQE0cu/UdZV+71n5rdf7O
	8s6kyaXJoApA=
X-Google-Smtp-Source: AGHT+IF9VLx8mE8trvjMG7+MlGusZoBXTEIHkS13K0W7mcIBsGRVkXXT81gfglD97zg1dabcDIqGHA==
X-Received: by 2002:a05:6830:8008:b0:73c:fb75:cee5 with SMTP id 46e09a7af769-73e65f33953mr8211210a34.0.1752873787612;
        Fri, 18 Jul 2025 14:23:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e83560306sm949902a34.13.2025.07.18.14.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:23:07 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:23:05 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe: Fix an IS_ERR() vs NULL bug in
 xe_tile_alloc_vram()
Message-ID: <5449065e-9758-4711-b706-78771c0753c4@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The xe_vram_region_alloc() function returns NULL on error.  It never
returns error pointers.  Update the error checking to match.

Fixes: 4b0a5f5ce784 ("drm/xe: Unify the initialization of VRAM regions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_tile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0be0a5c57ef4..d49ba3401963 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -120,8 +120,8 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 		return 0;
 
 	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
-	if (IS_ERR(vram))
-		return PTR_ERR(vram);
+	if (!vram)
+		return -ENOMEM;
 	tile->mem.vram = vram;
 
 	return 0;
-- 
2.47.2

