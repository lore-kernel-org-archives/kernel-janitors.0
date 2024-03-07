Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F9D82D75
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Mar 2024 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709800767; cv=none; b=oeDmiQaUCFFx/QC4JbhF+aSQkxRbgZMjZPKvMhV5a1LdoBfJBkbfnrPCrHmiJJq/K5egcUFPRF6kstz5wd8dFU93bRs/1BXbekm6/9g7MwsrBQVJHdpqtFv+jEWHvALFoPhxGN3aZyO7mbuiPMdO8JisyKxnHw19fxP1ngvZt6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709800767; c=relaxed/simple;
	bh=EajkfPF4XOdvGbZOn/CrnjZTPHr/uf5N7kNuu1geeyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=id0NDEPBJj2U+OwuMGfJh/CRC0NBaVc0B0jr85hom4aRp35pGhLJy5v3RE7bwJooffBAZOdI+L91lKDbfypkVtmiQ3e+i/G7YbFUoycq/qHncaE0eIt/OJarvHTsBVO8p+sC191MiiBSWn8AtSUq8UKXuF1i6blyOAQHFnG3xEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VroM5gZ1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VroM5gZ1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-412ed3f1e3fso5263365e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Mar 2024 00:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709800763; x=1710405563; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnvP01sqSCbkr/XzKyXEVDF7n+8RZwMaxaOyNtLHfAU=;
        b=VroM5gZ1qWRhbOxriUTXdBQ2gAygf0XrgOK87sdW7RD3tjHTKTE1hlKbFHoo+hdQQW
         N7kFYvM0Ss/CtdkX3FWKfHO5wpiM1C8Srthe82PPFr0HlKJN4XDLKeJM8ejSMCxLcZMx
         aBfdcCQGZiK2AigwIadrBDKfOCyjFH88+7Tojjeb276zslrnFxFjyKpoCiUlw3bs0WGH
         fOIcxHNjlB0JhnSMeCukz4BnB8nP+anXIe8+8w9U2BkIliOFwcESu+qU7pYBpa0Gj13l
         ZLZr3oZsiGaF0Dz4H2hkR3Fgl5qK7o/usI+M1dxPj43ZimEypJ43rRLhZiWnAU45miyW
         uiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709800763; x=1710405563;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnvP01sqSCbkr/XzKyXEVDF7n+8RZwMaxaOyNtLHfAU=;
        b=keyxVKCq/4ruw1VosawHIcVNvtgNTaQrbiu9Hodn/jTCbOvCe7Qu51ekxvV4LdG4ol
         wNM4lXpzVvOr4kJri2aJMXSdeLp+8sPdtLV8cUjvd9SuU36LBtoTSWSgMosgXjpdLPzF
         lHxuz//HobiEC9+QfhEBH1N3FQEZ2Z9Y1phwg9zfDSIl3if2tO6fdwuI75H600MTJtsy
         8ZuJGT+XJTYY887O/zhvJlrr7YJM/4/WTk2U8jVuoWa4gWvayNRoNCVZMwO8FXLlkz3k
         bLHnI+rZdPmTa101pTt6PsYe1/AVKZLBmRYfLhN3TpvoK1MOui+C5fAHxljARZ8p+B3t
         4yfA==
X-Forwarded-Encrypted: i=1; AJvYcCVe/jkyvY05shI3+CKxh1DY3jaQhJco46uSCICPY+V3ctpAn0XHWj82UGooOytF8cP2djf0zwAqAvB63LIc9p45VGv6XXJm8JZm3zI04KuZ
X-Gm-Message-State: AOJu0YzqripYzSwqM4vnuuvpB68kZP15mlecJi0GiG+y3a5m47T8z1Sj
	FZAjrAOA5wq8mvD7iQ4196ORQvgUnPS6ch3Yrm/7fV+w0h/AArkrQLQ1D5sKqFw=
X-Google-Smtp-Source: AGHT+IHwdVJnLyPhxmA+xwcyhbQLGTYcljpn6bF2PF7D+cZuR+YCWXwL5IVs0ZpL20zkc42ROTpCBA==
X-Received: by 2002:a05:600c:154d:b0:413:1012:5b6 with SMTP id f13-20020a05600c154d00b00413101205b6mr1063558wmg.22.1709800763188;
        Thu, 07 Mar 2024 00:39:23 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fl9-20020a05600c0b8900b00412eff2eb5bsm1910902wmb.13.2024.03.07.00.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 00:39:22 -0800 (PST)
Date: Thu, 7 Mar 2024 11:39:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Chandan Babu R <chandan.babu@oracle.com>,
	Dave Chinner <dchinner@redhat.com>, linux-xfs@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] xfs: small cleanup in xrep_update_qflags()
Message-ID: <72f966bd-9a5d-4f57-93fe-c62966ae6995@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "mp" pointer is the same as "sc->mp" so this change doesn't affect
runtime at all.  However, it's nicer to use same name for both the lock
and the unlock.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/xfs/scrub/repair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/scrub/repair.c b/fs/xfs/scrub/repair.c
index f43dce771cdd..8ee7663fd958 100644
--- a/fs/xfs/scrub/repair.c
+++ b/fs/xfs/scrub/repair.c
@@ -724,7 +724,7 @@ xrep_update_qflags(
 	xfs_trans_log_buf(sc->tp, bp, 0, sizeof(struct xfs_dsb) - 1);
 
 no_update:
-	mutex_unlock(&sc->mp->m_quotainfo->qi_quotaofflock);
+	mutex_unlock(&mp->m_quotainfo->qi_quotaofflock);
 }
 
 /* Force a quotacheck the next time we mount. */
-- 
2.43.0

