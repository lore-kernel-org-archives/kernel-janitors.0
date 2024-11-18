Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B4D13E02A
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Nov 2024 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731910106; cv=none; b=tLv6+k/QrqfJNtJJEc5oiCLiR/bNdRPgDMd/qgwWG1Rv8PKowx+2iByAc6ydGGmcxiC124uQjD+p9TorH0anNnwR6kLYJyiHex7qmWz+T8xxbrLyOAuk/Gn/K8VIdueLhLP/TPIuyhwevsxKohqOPS49JLZcRwzk7M+QIRZrd7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731910106; c=relaxed/simple;
	bh=cJ2P6uR4opZsVGWIta5h5IZmD3jekZ9UDttr48No1E0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H6Db6fDsON3FDXwG5t5rFYAe8E8j41P00mjVbplPkdmk0EPk+pyg+lufCQ8IlHwElQ6vtjMfqj5FZPIsX9CI/yNFq94ACTQ5nQKTBef9vkjykMquPCJKmU8Hb3mmUZtHkoc+ddS0WrkvDZUwOfNCTPaYD4QTsZ5TBvCJvaIbEWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dj432bVi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dj432bVi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so34774865e9.1
        for <kernel-janitors@vger.kernel.org>; Sun, 17 Nov 2024 22:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731910103; x=1732514903; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fF7b8budhWUD2De6hv7m+BHsAeeg1J7TYowVwHq0Uok=;
        b=Dj432bVieEbcQxizrB7AhmvEEiIYvJJsuqzBbCQJEsDYCv4WHJaiNywoHacU8CEwht
         2hxP89nt6T5IjXvtqiihUxB7cDYRmidNWlayEYHqgnC9vmoWpGt5Fir/KiAdFsv1O7oB
         VF+LY5UiBFR0qtkU7rA3ODPWU4mN8hYptXymGWWJH3mKLS92Wj/IK1e+drcCiqyCX2qY
         +DuKsUBhz0JpSy8pTZM4zHevnzf/GnkJA8NxR3Q1rJ6UY2pnia+Rxq0/cVYX41bmBSYc
         IM1Mkpc0x6oGZ8t+sDGFoDG/9FqnWHd1/tFfNvXXf/WIUlidmGsOTCWiWdo/4khMXhmu
         e3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731910103; x=1732514903;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fF7b8budhWUD2De6hv7m+BHsAeeg1J7TYowVwHq0Uok=;
        b=EWXo+TY3CdcHeFH4HDUk9ArnmmlnOkkMZLtsekswOlF25YLVXIiA8GYrRhjHbNkiMH
         TAYYjb02p6O5fmRe2IeVeZlUlaK93FGXhXRmCq3Ge9aU9FWGhICKPO5Tqck7LbE5rq25
         5LDTjyQgqPoIn5+UecqTiowccBowG19Fe4beGllUWR6Dzqe9wx3KHejfT442M8gVAx90
         7/s9wyxEDZriQdztKxdNlxwGNwcy08mmiT/+HLLuKchuR8ZlbvvQ9dpemijGDqD35jE/
         Wgi+VcFRVJwHDMcX95hzL7YM5B8R4MOs0DBEaMWyB52OXdj6k+0B0G4SnvbAX6cfKemv
         fytg==
X-Forwarded-Encrypted: i=1; AJvYcCWgfBG/ynhHjTI9Qhq4sae66E1Em0N+A/ZgqWhGqA86qVN4xnSrNkDEkkvsgvtHo1cSNqXSvyHNDJNdSVN4wDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzkmNxBcPAfMHRNi8dwN8KKfGNyOe8rKhT1cYOtYLRXgOblsyb
	bYetFSQEmGzR1N5IW1dxTIz6L/72j7vW+AhLM2SlPV9OHQKPDrp0z+soh8ESMsE=
X-Google-Smtp-Source: AGHT+IEro4yYmZP5OKHef+XOzgZ/LRIKlD6qWiYZLHMGCu2nTq/i6YxPj2oMalXqgeMbxjS/2dLAvw==
X-Received: by 2002:a05:600c:4505:b0:431:1868:417f with SMTP id 5b1f17b1804b1-432df74be9amr107263115e9.17.1731910102919;
        Sun, 17 Nov 2024 22:08:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab788a2sm141599425e9.11.2024.11.17.22.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 22:08:22 -0800 (PST)
Date: Mon, 18 Nov 2024 09:08:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@kernel.org>, netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] netfs: silence an uninitialized variable warning
Message-ID: <867904ba-85fe-4766-91cb-3c8ce0703c1e@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that "ret" is uninitialized on the success path if we
don't enter the nested loop at the end of the function.  In real life we
will enter that loop so "ret" will be zero.

Generally, I don't endorse silencing static checker warnings but in this
case, I think it make sense.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/netfs/write_issue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/write_issue.c b/fs/netfs/write_issue.c
index cd2b349243b3..8f02d8effe78 100644
--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -862,7 +862,7 @@ int netfs_writeback_single(struct address_space *mapping,
 	struct netfs_inode *ictx = netfs_inode(mapping->host);
 	struct folio_queue *fq;
 	size_t size = iov_iter_count(iter);
-	int ret;
+	int ret = 0;
 
 	if (WARN_ON_ONCE(!iov_iter_is_folioq(iter)))
 		return -EIO;
-- 
2.45.2

