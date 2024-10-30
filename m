Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEE01E493C
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282114; cv=none; b=Pb9MyuOFCsHJqqfsAJ02QpKJs5rx4n2Nc9wt9cqVoTfZeY0Rm/p1aCj4/zYrsyQpH3JAbb8P2pONlqP81mTUABkHWRXJf6dSqxGEUfJ59lPaghmjUO9BFQk0eCmUSnpG/FpgQiavQjP+VWMgfME6w/1MgzOmuyrmBOf+KIeIMcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282114; c=relaxed/simple;
	bh=QX1c2rnUJdAFC2RHAlIPCaiJEIHCe919jerx2/vD1G4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EcEUANID+CqYtmgprpuq+EymrqFsqnqby0C4t1jmXpDt1bDAW7CI4T9DIFwsO/s/YjJTxPQkjZNQSCWfQsuXs/FQF4z+stg5eDAynDKIoWtOSnl4VrdZzAA+DI46ME3g1qlZ6E7WXSm2exVes2yxIDctu0s+/0XHAgBN0+/Fb5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XEr9aXMt; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XEr9aXMt"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so9051597a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730282111; x=1730886911; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myhzYHHZOsBi8fssbTItbk4eRlkhy/GUThFWV76ORgo=;
        b=XEr9aXMtYG5q9YBatK1/E+t+YawsLjbeZgwOOsWlyh1pPu3yTNp9EFnOzyTkRVFH3o
         H769bXEZ7ErlVvhYXe7HnFTqOaPm+ulB5fGcjuNuwDHq9tzJuVoKedvj8IUIBJjUPeAM
         FOhb+RjirunhUrwaXR7eXOUJcNs9Zi0J0KK/Fif0r3FgdDwFSHhtGVP/VaM5jp9/nO/W
         +KF1N2rR9JK7Edr/BKfeQQ4s0jJPA7l9YXubI8pksOWv/hwjNgIKNCz1R8+q4hXEqh8G
         QKn/iBm8apB2iT+sSr/DVa2tc7mCI1v6UjNPbzNCLEKVcxW4XwRyKyyx5RpzAha3aKG6
         Yr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730282111; x=1730886911;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myhzYHHZOsBi8fssbTItbk4eRlkhy/GUThFWV76ORgo=;
        b=wdvdbUrnwvOLkJU4pDQxKohiE66QrvPI9P+oMYYmbjHS4LbRfhpKTw8YOyk5PbLInq
         fMTYBc9jXA9QSDzMsU7sbsqLR9ahKvwuOgT+GzQR6UiA/edky9BE9d0NT+jWfpaeINZH
         0H1VZSSkki/q+a+bwJ7NlCR6uA1DFfCxWLdJHVHtzwHtWojAg/NCmZU87etrsWg3KghO
         Ix9NMxWen/NOaSVg9/0C6Gtv0oRH/gW6VJfyB47UOjipjhCQ4B96O+0YFUkIwkhpyPax
         hv/YTVkSU8s1nL2yU0Gu8qzjxxRAYrL8Pa4VAy0z8lsNbSxVUibyIjHqicWKdgnHFPS6
         m4AA==
X-Forwarded-Encrypted: i=1; AJvYcCWingbaDAdbQzLR/HFrNlasf/qEyBU9nUpJIprsehH1UHGajG05KTlxILmiHAARCsjTjdoefUxjbpV5rVhkj0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKYO0WCTN6UZ7W4ZRQH8EBl499QcLD2k3c51KdRX63OBkZwwcI
	dlwFY3cpNFBS5PYLh0PLilTLemOThH8QMD68+3ktJRnpRTEGxe4VWQa5KmZoeqI=
X-Google-Smtp-Source: AGHT+IHsaH3qIoU/LqTqY0qV1GT3CRkq1Y3kFNvfZmWxV/jzT7lhY9M/Jf8d7CNzzM4kKfxO9/cmHg==
X-Received: by 2002:a17:907:970a:b0:a9d:e1d6:42a1 with SMTP id a640c23a62f3a-a9de5d9105bmr1338783366b.30.1730282111023;
        Wed, 30 Oct 2024 02:55:11 -0700 (PDT)
Received: from localhost ([41.210.143.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b928cesm14995506f8f.102.2024.10.30.02.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 02:55:10 -0700 (PDT)
Date: Wed, 30 Oct 2024 12:55:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] io_uring/rsrc: fix error code in io_clone_buffers()
Message-ID: <70879312-810a-49ce-aba3-fdf7f902a477@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if the allocation fails.  Don't return success.

Fixes: c0b9c5097cbc ("io_uring/rsrc: unify file and buffer resource tables")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 io_uring/rsrc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 784fd1ca6031..f317f39e8b95 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -977,8 +977,10 @@ static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx
 			dst_node = rsrc_empty_node;
 		} else {
 			dst_node = io_rsrc_node_alloc(ctx, &data, index, IORING_RSRC_BUFFER);
-			if (!dst_node)
+			if (!dst_node) {
+				ret = -ENOMEM;
 				goto out_put_free;
+			}
 
 			refcount_inc(&src_node->buf->refs);
 			dst_node->buf = src_node->buf;
-- 
2.45.2

