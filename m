Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFCF194C6F
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Sep 2024 08:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726733557; cv=none; b=gG1en8wBdUu5O/KXD6+ajebXMEovWlZunYn6WDK2wXpSZDLjlKsVvCMhojz6yiQkXw36k6I4Tt3/h31TiJy5Pki+ESFMGNBuSGTezDLOHhgwGz3F+p1vsevKcDZ7MswgtQv/+psqgmShNcpOEKY4ZmsGCJ4VWc+rw8K5JF9POto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726733557; c=relaxed/simple;
	bh=qIQgG18csOy6kgGKRi5pEdMcVvAiSxI1msolqZC1BCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpPpTi0HLqKi7CfgLpmaiJX4KEdeysxnGD1imWhhBsoDZqQeo+uZGHYDluEBxfbSDyBNa4gGIE7es4oQiBm37xtnfFgGg3CM7cqDxsz+vkSKPUMoFDLU5D8t4p92Tyg1ok1I37nppr44baZ1S/v7/YB7lktGWMUDuwlXWVVTz9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eIWVaT6e; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eIWVaT6e"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365aa568ceso658437e87.0
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Sep 2024 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726733553; x=1727338353; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ANV0wpoQzNiYfBg0MnHPCW3/mQ13dziuqPFMo/AODmQ=;
        b=eIWVaT6eNtK9CpKdxmIUDvT4g5quRJxDGf/TPR8A+2EeQ393FNpQ8Yq7Q9n2szt8qJ
         F4vzsr/Wipu7lhTUcYIqPrxh/YY+aT64zUXTF3tLeqFkzrtwG8jA630euxE0X7VLeOI8
         9dF7etzfjmltHXdZ6ELoFG+uye6QqEFi8irqlKB/VxKBcFpYvlIKpgxHfuVjy+5i2ajQ
         0sFmMh5Thwy9+VsM02pY7ufq+1GBgxgH7kJQEclUdAJgByrWfufh0yJiZIn173tkUWba
         wek1OkjW9LP/Q90Hi7pNnzRjfVJpoLCmFgeHlVzML4u/Enejmg7w0gOJyEsmPac+75LU
         N/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726733553; x=1727338353;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANV0wpoQzNiYfBg0MnHPCW3/mQ13dziuqPFMo/AODmQ=;
        b=jRFjENxeS8rkkyQwnAhvrzyvBPoaEkNaq6Olj8OK+ALjAJ/EapemFzYudiGrRP6Uaf
         Z/U7o3Q0GC5eEqHseT5nlIwsU093GMIR+2OZsuNJsfLWULjdGjS6Pm1pIx2ZWjBRWrG+
         txh+hbXJfquqVIj9QBBBpLXw3ipmVoNCdF9GFKrPQEtp8PvfBpGFdBVimwCP0t2+Te4O
         MAZQpUANfcUdLxJWo4aw329xKMrb373wTrHncK5jvERKiDUNNE50ojXH4u0Yb+lsFCnl
         WjE02Ub3JmN9GyL4oGjBEAqQl9RdX+WZnccsrit909jlxuN+iDvSzI43y9eGW472EKU9
         dAZw==
X-Forwarded-Encrypted: i=1; AJvYcCUxj151lMf5tIoJtAbP0AoLCKuwrkAE6kzD6afBSBcf3XtmjnSR+FvN0lbixmZG3GXirRMJDW3qbenCacjnIiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjH8fYeHrxGO+R35OimS37AnYpRA62X/24gWAA+Q5zST+nY238
	Bi3ZHGVZFxKhe9epgELMu9qZcR2p1zKWH61li+o9b74qQtNbw/S8yn9c5R8amXo=
X-Google-Smtp-Source: AGHT+IER3cTOEqdUWP9h8GoDDwYaiYR5RsjwiCjtgPrq30HGea8FU1Y/jeAXmIIywVvzyzJ4q8HdoA==
X-Received: by 2002:a05:6512:1385:b0:536:796b:4d6c with SMTP id 2adb3069b0e04-5367fee52e1mr15460350e87.27.1726733553175;
        Thu, 19 Sep 2024 01:12:33 -0700 (PDT)
Received: from localhost ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90613315d8sm688878766b.214.2024.09.19.01.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 01:12:32 -0700 (PDT)
Date: Thu, 19 Sep 2024 11:12:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] nfsd: prevent integer overflow in decode_cb_compound4res()
Message-ID: <ed14a180-56c8-40f2-acf7-26a787eb3769@suswa.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If "length" is >= U32_MAX - 3 then the "length + 4" addition can result
in an integer overflow.  The impact of this bug is not totally clear to
me, but it's safer to not allow the integer overflow.

Check that "length" is valid right away before doing any math.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Check that "len" is valid instead of just checking for integer
    overflows.

 fs/nfsd/nfs4callback.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/nfsd/nfs4callback.c b/fs/nfsd/nfs4callback.c
index 43b8320c8255..0f5b7b6fba74 100644
--- a/fs/nfsd/nfs4callback.c
+++ b/fs/nfsd/nfs4callback.c
@@ -317,6 +317,8 @@ static int decode_cb_compound4res(struct xdr_stream *xdr,
 	hdr->status = be32_to_cpup(p++);
 	/* Ignore the tag */
 	length = be32_to_cpup(p++);
+	if (unlikely(length > xdr->buf->len))
+		goto out_overflow;
 	p = xdr_inline_decode(xdr, length + 4);
 	if (unlikely(p == NULL))
 		goto out_overflow;
-- 
2.34.1

