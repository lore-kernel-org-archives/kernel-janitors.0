Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEFA1F12F6
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Jan 2025 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328373; cv=none; b=TkFcO34uwaK38PDhQ1zbhePeCVfCexonJvFxlXfs1Ususq+F8MqTiERWxqxiJbS0JESEKFv5BHIaoKkYxg0VNXfhjZMgosAGp42LLlQQCpEI0wv/wd3zTtCPvtGuIcKmBcj5XbeBG8ssf1UiCxLQtyfwS4WGyULC1RSPbnksoGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328373; c=relaxed/simple;
	bh=Al+JIkYrhwgUrke0Av47fm6GwPZPZQq1mOw0udRwbsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=chsupbfgNnFQhe/nWbHbF6hVWwe39FrUSogXaCjVnZ1y2phWRhR61+7pLqu9MlvlP3+5oybnimHh9eQWucfOn49viYWRDuGP3F/50JYczkGDQJ4Ua3xCVTXJUzuQjbDiMGYWUZNR/VwJpn8/UYp1jLCJEh/FI08Vcs2YMupgqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bg/wdFN2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bg/wdFN2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43634b570c1so118080135e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2025 01:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736328370; x=1736933170; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llw2mMGwxOVC/4Cd8CMxpSQ2joGdUS5FVjkkuZLdTQ4=;
        b=bg/wdFN2c6j6Noxoyp1P+OjM5+U+Sy1i4eeuts/VB8CY0YuYkU0oZ/BXwEMS8EQ1kM
         NAVS4KXdJQ9cMSbzVaeoKRuYspxUUs1Uks7yMOjEMV+RwGvydat1SIjbaodbVFB+7wWi
         +RUWkqCFhY8U+dMcvvFYBON3sjRqMHCBxalOkIy8fOvRpWm9uL7qSsCQCbkiHhxim242
         ZWicFyeTGt9OvxzaF//pQQMFutu12S9J6iTrSKbKdEEUQVtH+4xO04W5+N+lp2sqticJ
         cjgWgDQCwGSJ6leUVtIK9HJNoi+jJ5PfiQUXM8CrcG/gPraOFUcjqzuLzoWlVw+nbTjk
         vSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328370; x=1736933170;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llw2mMGwxOVC/4Cd8CMxpSQ2joGdUS5FVjkkuZLdTQ4=;
        b=AOgFfwVjOS2REfhrblvxhac3BG0aULtXX0Wx2bpQxbQJVbpv4TgJNqEj6N0V6A6EZf
         QtzqLzY9g45WgX4EcB+XfORkofx4c9lHuERgTaOzKkZZyA/vf17ogWmozxcmmIkoYdLy
         99VV0C9NqJgv1wLTwFYSOyGbPyGm1xUPrBZ5cln6+/65CuBz3MEqEeWRYbVg7wlinjru
         V4pdjy2nu3NyqGhGBiGGVJZqLVON2QXDtqMlcwbNT2Tv75SH9RxwwPIT7Ym1cMcGhUQP
         JrONZdbSI2oOP5kAwkZJToCbtd28YPxwSargqqizH/yjP5xE0q6vmx0JGoqdsq7s5NAS
         ImTA==
X-Forwarded-Encrypted: i=1; AJvYcCVAax6wpqDl2Iag9ER6MLFh52evROjmxDZUZLfEidyUcg0vK1FjZNDLkuDR/RwQwWObTWYQKQM4VIR26FtH7xA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdhuJUUbSeApalzm4tIcE0ca5SG8Ivq5DhLrK7nEqLXzdAHwfW
	5mvIYHE6Ky3LRYdl4esEfwGfXoTY9jH4LBgWzfegkFFApr3iRigBNQV3AiFXZPA=
X-Gm-Gg: ASbGnctj/6B8ifee6OPVFnKpohqOmutb5HnbvW7y4MLtdwtWX56NN/Sw5SqJkrhyKqf
	sMu7yM2P/pwCsbnvrn2mxJfyFTODB+c0I6GkGRS57oBuhq345+rvtNwqv4kbej6E6vJA94ppQ72
	FHYSam6CF6SIo6UJyrk0vEsHj8H0cNi9sWW71xtNx8+PmHYnr+vMvHVH2Ogdl6v2b0l8Ux8ZzWL
	FXPB8YMVxT9e+uB0Q8gNQyHIqFgk2iNLI87I3yGJHKtwk7EBfvR7poUkRyO/g==
X-Google-Smtp-Source: AGHT+IHYOyqY4pHUEmLh5C55hIoH02x8AafZyW/gRN9q2tRxk2NxlqiAWNdVuavxbFooX0Vi7IBNWQ==
X-Received: by 2002:a05:600c:4f47:b0:434:e8cf:6390 with SMTP id 5b1f17b1804b1-436e2684dfcmr13959835e9.6.1736328370469;
        Wed, 08 Jan 2025 01:26:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8472casm53257556f8f.45.2025.01.08.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:26:10 -0800 (PST)
Date: Wed, 8 Jan 2025 12:26:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wenjia Zhang <wenjia@linux.ibm.com>
Cc: Jan Karcher <jaka@linux.ibm.com>,
	"D. Wythe" <alibuda@linux.alibaba.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net/smc: delete pointless divide by one
Message-ID: <ee1a790b-f874-4512-b3ae-9c45f99dc640@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Here "buf" is a void pointer so sizeof(*buf) is one.  Doing a divide
by one makes the code less readable.  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/smc/smc_core.c | 2 +-
 net/smc/smc_rx.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
index ccf57b7fe602..ac07b963aede 100644
--- a/net/smc/smc_core.c
+++ b/net/smc/smc_core.c
@@ -2155,7 +2155,7 @@ static int smcr_buf_map_link(struct smc_buf_desc *buf_desc, bool is_rmb,
 		for_each_sg(buf_desc->sgt[lnk->link_idx].sgl, sg, nents, i) {
 			size = min_t(int, PAGE_SIZE - offset, buf_size);
 			sg_set_page(sg, vmalloc_to_page(buf), size, offset);
-			buf += size / sizeof(*buf);
+			buf += size;
 			buf_size -= size;
 			offset = 0;
 		}
diff --git a/net/smc/smc_rx.c b/net/smc/smc_rx.c
index f0cbe77a80b4..e0ff6ed83057 100644
--- a/net/smc/smc_rx.c
+++ b/net/smc/smc_rx.c
@@ -197,7 +197,7 @@ static int smc_rx_splice(struct pipe_inode_info *pipe, char *src, size_t len,
 			partial[i].offset = offset;
 			partial[i].len = size;
 			partial[i].private = (unsigned long)priv[i];
-			buf += size / sizeof(*buf);
+			buf += size;
 			left -= size;
 			offset = 0;
 		}
-- 
2.45.2

