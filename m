Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35D1F4FBA
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728585361; cv=none; b=VtoqxDaPhbIifhbaqQ3dHlve8lxOyOZJNQHQk6WNusnGzDMTbU4qrpTbkOp9SWkGofrT7ieoxU9nWmAbVmCfjRQPbV4lIusWhpGjxGn6FBEvwlcOBcR9VmMXRI56AyxQiAI3M/oof5uP381vtk0ZunRcXP589ExjL9SDafcXeQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728585361; c=relaxed/simple;
	bh=Bh4cvu1KBjW7YtQl14oFIxFTSqYuZw+pwe4eb5TK9RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CulFBpxmv0qVMYxwTVzbLTJPNTJMAs1q8lW6Cddhz+gVD2NMuuNIQwv1d0eZrSbUhqune30aI2/pa/RQbxw8Pn/Jx+pyhxh/Z9IFG/sLwfV+NRmD5vFmsPKulrQ+aCeMeGME2BZ21GEnUT6ttoXVpSLBDcINtplJXTMnDAIYXm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AP70HdO2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AP70HdO2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-431126967d6so10810165e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 11:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728585358; x=1729190158; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YA/CbfE7oxW6xiw64WZhXy0TMYqF8Jc951OtJehnsTQ=;
        b=AP70HdO2WgYs4mtiY47qMoh4ExyATqxZtJ1xM7PHWMIc6ej/IQWK5+rLFooYxYJG4U
         qx1/zGiZIF51nSNfWlHA3xqBhyF09ps4jnT3ebNgcOMy8fRz96s+tfGhfZN61IhxLszc
         MowzFggilWe+kKnBmm5RnArwc8dvUinyM0/JvKAXjL2LyL21NebDf3+t5kXjYWnUWzv0
         MtIYbiNERdGeV7VfUaef3Ug7mK6H2CE35M427o8RlfJj/SQKhANuWi6BQAkZcwtiJ23/
         C71nsXmjrt8uHY8HK6GBXwyu3reacq13t6i6hXYqFI2uiwUiL4M3UUx3SudJwew2xwDQ
         ilTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728585358; x=1729190158;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA/CbfE7oxW6xiw64WZhXy0TMYqF8Jc951OtJehnsTQ=;
        b=wRHmjFzuyMonpI8/k35/x1xYe+pp2x5GSWMoJl/qTB9d0n1wChA/81HeolRgje00R8
         QMuypxYW6XCcK4SrfyBCPZtw6TADMAqPj7tuCHsCeo9IMy5EMz9S5TfY9knaxgo+nTGs
         oMY225ddVcXS0lYu4B19Jf6ckoUQzARV4Le1yaFX6lccGhfwTusRmgO2Lw5FSAZ00ZwN
         UVfML8bCIxzI3Wkczbyr/Vh74fJ1c1Zui+rN+GC1yqeobxKPDH991OT27Ln1VBbiJJKz
         zzgF6giT1mg06HUBjJ9Zv0vr01eo7TcAKnDaINBN2HRyAWFsCNy7EV7PEpVZUSt8kcfi
         Wx0g==
X-Forwarded-Encrypted: i=1; AJvYcCV64Drp/I5zvMPlOrdDkzUVVY3W/wbjlW6zAk85VrcVOTgGk3+H4P8bFchpHyT5vuqQ9FtHctqTZSBYxQJPyz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi2/COZKOJC5LKxHMTIBU2vaZhxnW3fQgAl//roU6b70s/0c0Q
	TeZjXbTFaB3VSxSKs41tetT7w+rKJAvl5F7ewdSmaJzX7HQWZDdWfqRxYHOP0WU=
X-Google-Smtp-Source: AGHT+IFG8EfIChDBnUNVC980rwXGS/R5Il/K4CbHJ0vE0tN5ohD5eVdklojXnnH8sToLawmLAcUlog==
X-Received: by 2002:a05:600c:511b:b0:42f:8515:e47d with SMTP id 5b1f17b1804b1-4311ce5dae9mr3567145e9.11.1728585357623;
        Thu, 10 Oct 2024 11:35:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431183567c8sm22744465e9.38.2024.10.10.11.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:35:57 -0700 (PDT)
Date: Thu, 10 Oct 2024 21:35:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] bcachefs: Fix bitwise math on 32 bit systems
Message-ID: <78e06425-2c26-4977-97eb-577ce8268d2a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ~0UL needs to be ~0ULL for this mask and shift to work correctly on
32 bit systems.

Fixes: bad8626ae088 ("bcachefs: CONFIG_BCACHEFS_INJECT_TRANSACTION_RESTARTS")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/bcachefs/btree_iter.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/btree_iter.h b/fs/bcachefs/btree_iter.h
index 6c9bc09c0597..f5f19340654a 100644
--- a/fs/bcachefs/btree_iter.h
+++ b/fs/bcachefs/btree_iter.h
@@ -362,7 +362,7 @@ static int btree_trans_restart(struct btree_trans *trans, int err)
 static inline int trans_maybe_inject_restart(struct btree_trans *trans, unsigned long ip)
 {
 #ifdef CONFIG_BCACHEFS_INJECT_TRANSACTION_RESTARTS
-	if (!(ktime_get_ns() & ~(~0UL << min(63, (10 + trans->restart_count_this_trans))))) {
+	if (!(ktime_get_ns() & ~(~0ULL << min(63, (10 + trans->restart_count_this_trans))))) {
 		trace_and_count(trans->c, trans_restart_injected, trans, ip);
 		return btree_trans_restart_ip(trans,
 					BCH_ERR_transaction_restart_fault_inject, ip);
-- 
2.45.2

