Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751D194A6B
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Oct 2024 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727858246; cv=none; b=lvM93qKMraWQcEJFBfVWXJMd01ifEcWk0TZx0u4O5UobSv3XtCaED/+DJp5tZtcGaP+HWqps7ihCCvihSR9c6zUnVnguS0RZ/CBsRrhJ12mrYnODJnqYS6nKJc+ncQ8rdProHbxqxWBu0ogd4xNWF3OczIW3gc2mYDnR3DdFvs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727858246; c=relaxed/simple;
	bh=5UtmpKTC6s7aR/Kx7xCErhbOSCRB0a7wTRFcnUYaloY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KpXhrbYL1TB2e9rq3mpYhFZg45abls4dfhfAdway/5zz1eS3uTKrxv+YGeY9V/v1mgArZtuxSsvmlk45S+1EZFJGdW1w+trs7AAHv08gAZTD+zHI0W34lEg7GrTiL3pu1Ew7MksGyYcwhc32MrWud1CYdtT4lkYrIBfMPCrMObA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iqbyeiEZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iqbyeiEZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so78623915e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Oct 2024 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727858243; x=1728463043; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwtFbtkd183rpnaZw+BKnFd/0fPS/fmbq3h2h43pXac=;
        b=iqbyeiEZFXBxw1hoXA3arK3nDN/3FxlivC5bGLMnr2BOfVj9JDIiBP2v+TX/t840FL
         4FZmSCxPdz4QJ3O8REfIfN5gaUjxgGa8w8NQ6rkKEjh/dleVHhYJV/GI6SaQf3x1+A04
         zuVQI9GLbKquUA67/LdM9haUl67hUKHAtf4cG/kEZCX36ZFyRMK/dUDM1o3rejr63xFi
         rVM3qejR33B7nEctG6TxkTrCK5XOYzu6sOgQIwDq55KBqo51LLP3kwImmH4CLaFTX135
         qyEU30b2zMEXTP1iFdKTZyw7rND1dfDpTtZU28c1C9LsBEhBgX5CjfCL65mQc4ErQJuH
         Wz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858243; x=1728463043;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwtFbtkd183rpnaZw+BKnFd/0fPS/fmbq3h2h43pXac=;
        b=VSINSpZvgr6pYCQvpVTpXiRFvHA1GwZhJP3TGSxaPZxcmywKBeQNiH4nJ5NKj8TmjH
         ylWFP4zjowkfyIpM4v+DZ3USpErD0qr9ruCjStPN0Tr4EcL8zZLzOgc8ksLFBM3zn8J1
         SLN2RnO8tCsRmnFDQJDZ36mJJdG014Il7WqYO4uMTDuBhjEGR2/s1JtWKUWhZs14+pQn
         nP8p/lL0qC33g3yIu7X46Z/XCISV6IQOJhcCdqR6Y4N9N44LBT4PR/8JHs30eKdj+BZo
         /Rlr21wnbKfYNKYGRH3T5vt1zt+m+sNCfoSlc8qOoy1HkmHzfZzGngIaupe2EAB0FBYy
         DSkg==
X-Forwarded-Encrypted: i=1; AJvYcCWJrUhplzYNHdtjF/xFSksoSDyapA/bUhwuAwmcgH40CIw089viRMj4XN36khdosELkmmmONuwTpfkc1o5Oymo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyWsT+K5ECvpKh6X5U9PK8Rjz3vaHDR3mJCbKkIRy/y/z3Ixtu
	yj2IT+ZyJOYoZAW/ySGnzh5jaEvhYPDeOMPnZEwhL7uRjSpg6ZpMLy5gnDuQVVU=
X-Google-Smtp-Source: AGHT+IFyXIGgjS4nrzyGishoIwlJ0/HhWx4Q7ZAnaJaIoZpCox8FMcIDZsRd08onTWLvZez1AhemTw==
X-Received: by 2002:a05:600c:350f:b0:42c:b8c9:16b6 with SMTP id 5b1f17b1804b1-42f777b1f87mr21363975e9.2.1727858243109;
        Wed, 02 Oct 2024 01:37:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79c67c5csm12578895e9.0.2024.10.02.01.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:37:21 -0700 (PDT)
Date: Wed, 2 Oct 2024 11:37:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eric Sandeen <sandeen@redhat.com>
Cc: Dave Kleikamp <shaggy@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>,
	Amir Goldstein <amir73il@gmail.com>,
	Chengming Zhou <zhouchengming@bytedance.com>,
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] jfs: Delete a couple tabs in jfs_reconfigure()
Message-ID: <12768f55-47e6-4bfa-aa63-0a82b911e098@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This is just a small white space cleanup.  The conversion to the new
mount api accidentally added an extra indent on these lines.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/jfs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 223d9ac59839..508666d4ed01 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -389,8 +389,8 @@ static int jfs_reconfigure(struct fs_context *fc)
 
 		if (!ctx->newLVSize) {
 			ctx->newLVSize = sb_bdev_nr_blocks(sb);
-				if (ctx->newLVSize == 0)
-					pr_err("JFS: Cannot determine volume size\n");
+			if (ctx->newLVSize == 0)
+				pr_err("JFS: Cannot determine volume size\n");
 		}
 
 		rc = jfs_extendfs(sb, ctx->newLVSize, 0);
-- 
2.45.2

