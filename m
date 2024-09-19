Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EEE194C61
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Sep 2024 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726735842; cv=none; b=pOUMwaTz1267Sdlv4Hn49rN/UG2Mt/dJHaB23dMcqOxZLnbFbUKyO6pIzJD3YDnwrQ9lmBSLZ6VtSgQaAQn1CLqVpM/uZWyv3nEwLF3x+zREyPeL0OOa4j1yn9ya8Nez12GJCfoQkCZAAFXerUhKouqMRYsIrCBKidqCx+nZqyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726735842; c=relaxed/simple;
	bh=LrJw1AhJz7sTYbKD7COLqvtv/WahjF0UZSPF3n8L1AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=do4ObDV2ejUZNdYFsNdgi/NnKJqoE4IGtXO9TAVo89fj4trORtNnUCHJ7jhFRFV7G2gG0upVmbBq86yn2U/BDa75MGX5Nmb8l1g6itDgLySbTzQYEGmQwY1cxrK0PVp004JY6D3t6YrGQNlb/UhQ/00tc8RlIWPjTPOyGRS+xZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LQAuY8fW; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LQAuY8fW"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f77be8ffecso6095271fa.1
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Sep 2024 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726735837; x=1727340637; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aXfImNByrHCJYvhykUtqf/Cf9grdz1yZdroYSEnzd0=;
        b=LQAuY8fW4NCyS1obfBddcWXm5q8x9UBkqWcTcNuq39VQ8DvPzDRgXGepireJAxFcZb
         v1HbwpN7ruzLIsRW09u3lo2knxxJ7PRZ5kMdC/FH/GOJMv3MGnBYY+eQ7jf1TpXbBqcJ
         T9AS8XOPIQnk2LVF37fDiEjldh+c/oBO27fvXVynZPIYx8CWceuIFQfHQTuWMyaNTPUB
         UlFQ7y8Z/WD/qtJYvQSV7VeBKUn84c7W6aKdp6hDLi6ig3u+yrMYkq262AfSVj3mrVqn
         NuIiAC5zxUHg3WRXc6nY4kc3gago+0/XPPNZKBWcsnGYFTbHCm0Wlf+eqVN6QSRAnOWW
         oLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726735837; x=1727340637;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aXfImNByrHCJYvhykUtqf/Cf9grdz1yZdroYSEnzd0=;
        b=NP0JFhQq2pHFJKEk0Wg/8t7E2b7CSrG9iei9W3KCSb1FVNbbUti4gd43AkM7YR9kr3
         NXqMiJJPU7j90q7G5y6y2A3eOwOb6CwrebVIgcKnGWwzJvb0ojogrP/uXmqMCCGC7QDf
         1aqb5AdHJil+lhZ2L9orVphDdiYK/aTBOK9uPSwHDzrXAQI4LqIu3xtKGVrM8TU4hENo
         QVFYjeaFOFZAdZAoMyMXOGL1VLUyJaEJILGySPhgkB2bm4mmF77lenKYWyss35fkMINs
         FDld/FlKhBzjR+7p93NJtz5rVJIBcaKfhDeKpHZYToR9WepAYSxepLiWSjCtuqEzyAbs
         ZDNA==
X-Forwarded-Encrypted: i=1; AJvYcCWRjS4A9IYtJr8DXLyhUFhOLlvot1wPkEP8VepR2yfJOvGPZIcYzQKKR6/owKJFKvFpJX3g/+QeYsoE368BYwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0d80aeB3lCb/YW3MwuA2UKkxy46mFauIkNV04mh4XjHfdhq0/
	8whnAywEq8h1Vkz5If8yzf+L0JzYt06f7jUWjAGIeqtKFSUkmBTSarM8zSDLW1B97yMhls1RirS
	W
X-Google-Smtp-Source: AGHT+IHSchKP46mdULrhq3wm2RZ+wk7t1utwjuIcumCt9aQiICck+yHRyOAOwRnLE0p5ES06sz5eOQ==
X-Received: by 2002:a05:6512:1194:b0:530:dab8:7dd6 with SMTP id 2adb3069b0e04-53678ff48d5mr12195614e87.50.1726735837431;
        Thu, 19 Sep 2024 01:50:37 -0700 (PDT)
Received: from localhost ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb533besm5833278a12.26.2024.09.19.01.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 01:50:36 -0700 (PDT)
Date: Thu, 19 Sep 2024 11:50:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Trond Myklebust <trondmy@kernel.org>
Cc: Anna Schumaker <anna@kernel.org>, Benny Halevy <bhalevy@panasas.com>,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] SUNRPC: Fix integer overflow in decode_rc_list()
Message-ID: <a13af2ba-5f33-4e9c-905c-0e0369daea6c@suswa.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The math in "rc_list->rcl_nrefcalls * 2 * sizeof(uint32_t)" could have an
integer overflow.  Add bounds checking on rc_list->rcl_nrefcalls to fix
that.

Fixes: 4aece6a19cf7 ("nfs41: cb_sequence xdr implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.

 fs/nfs/callback_xdr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/nfs/callback_xdr.c b/fs/nfs/callback_xdr.c
index 6df77f008d3f..fdeb0b34a3d3 100644
--- a/fs/nfs/callback_xdr.c
+++ b/fs/nfs/callback_xdr.c
@@ -375,6 +375,8 @@ static __be32 decode_rc_list(struct xdr_stream *xdr,
 
 	rc_list->rcl_nrefcalls = ntohl(*p++);
 	if (rc_list->rcl_nrefcalls) {
+		if (unlikely(rc_list->rcl_nrefcalls > xdr->buf->len))
+			goto out;
 		p = xdr_inline_decode(xdr,
 			     rc_list->rcl_nrefcalls * 2 * sizeof(uint32_t));
 		if (unlikely(p == NULL))
-- 
2.34.1

