Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23A1E2319
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282101; cv=none; b=pLw/8Jp9Q2HjGYUJF9k2L/sshQk1tFwtART+CLmShItxTJQQ+ZnnnUsKfC8anR93On639HqoSt8wpbnK1n7qk/9AUT3xNFK5HwF4WCDHuf7+3FKC+i9xpqmWRYBgbbV3cWL0tep1S4V6ZPTm+YzAUSFjsc8jkIxOcYwqafhTy/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282101; c=relaxed/simple;
	bh=VuCpj2n89DoanslWRbLq8TnzKCV9aR5L9fpM5ccZyo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VkqpaTXZbRT6i4E7/iHT54jl70hCl2j3YXHaCT+oW8J8+J5yViK4zYVLLWFX0xWeSUOaoUKvpN83uSdBhWocUOFcnaVn65AnEG2unKjsB6RcAEA4Opeh8K169H9TSQol5NNI5tsWKXuB0JOqinidKk/11qeSZrBxyAb5OcPJnxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aa7m4Gix; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aa7m4Gix"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so55933421fa.2
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730282097; x=1730886897; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gDDDNSuaWmBznhMfkp5tEHEC36JKKYqX7WNIjg9Fd40=;
        b=aa7m4Gix8qgJ1U4j3E1DPojTs4xkcqecWuWWMNbRTqgN1Fw4Qx4LA89ZgwZQRf5G4v
         prUm9niU3yI0KoFOm3Aml3rQ3M+bvidJwJm1uurfJYUGBPw7YNcOjhP1rnWgxwJPqTiV
         c+3zAs2771rbPnWSdwK4vR4E9ANdPrcRTIdTcziUdhWlyZ1RIbaHcfFYaRy0moixSLm7
         kgJ5D3rUICEJXuCSV+KZdzas/VlhRN29Yajt1tUPbZPINoVyOPTlrdlAXqa4BBMf43e2
         kYw+LWEiOkwWo2jiyttcM3JYDjLJaYObouJ0BU7ggEkrw+7az8zOCc/8rs3+fmz1jlX1
         aJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730282097; x=1730886897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDDDNSuaWmBznhMfkp5tEHEC36JKKYqX7WNIjg9Fd40=;
        b=fzJsA087F/TWOQRsrNFvWwMd97ElmkQ8Ra1yDQBU1qnUQ8+1s6fPZ/8pjAOF2DAivT
         WGAoEtYnFW8ZkIsAlrWI8s/4z5B7QknPXrU6CxhVr0I0dIb1fjpawjNS4VSC576daS5M
         UFUhTqpEZVowkhnFtI6SJ/IVB1ZtSdX1jz6nTRhOR1qjJTOJ68FJLNEjdtDl6iOLWC3y
         AuF61E2iM/iHwfhUTPPh+fAbRc27sgnV7lu10GNUkqXFyZHDwwbiNu8uSJ9tWTTedYyD
         R+R/XTEoartsWMioWSwk1xmsDxeLmNnHGDzWHwIFcTn9HcnP46v0MKhKX2ntNWu+zQjC
         hCYw==
X-Forwarded-Encrypted: i=1; AJvYcCXAt5A1/CuEqEdX95PlT2KFvBY8vq+v5yPXH4nXrUjKPzY09wEY6HiNpjLkxbdQRDAXdDkhFDksJfTbIK05yj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPQpV2qtfsN/C3OmP8ZMvQJRHAOV7Dp5r4JXy2sezovVNKVYBS
	G/uffs+OWWi64akxDoTEiSqpOXc/gMDS/r6xUB0g7bmQo+pFgWLJB2k7EgYqQwg=
X-Google-Smtp-Source: AGHT+IH+TtYc1IJuGrClf3QG5CcuA5wgN1IsLr8/pAzsn43uVdspD6CyoRiCxP2LGdaFETGrr0KSjw==
X-Received: by 2002:a05:651c:1504:b0:2fb:5014:abf9 with SMTP id 38308e7fff4ca-2fcbe04f0bamr64348391fa.31.1730282096687;
        Wed, 30 Oct 2024 02:54:56 -0700 (PDT)
Received: from localhost ([41.210.143.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b713f0sm14889466f8f.75.2024.10.30.02.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 02:54:56 -0700 (PDT)
Date: Wed, 30 Oct 2024 12:54:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] io_uring/rsrc: Fix an IS_ERR() vs NULL bug in
 io_install_fixed_file()
Message-ID: <762b0c95-f4ce-4fb3-8212-01e216f683ad@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The io_rsrc_node_alloc() function returns NULL on error, it doesn't
return error pointers.  Update the error checking to match.

Fixes: ead12caeb8ac ("io_uring/rsrc: get rid of per-ring io_rsrc_node list")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 io_uring/filetable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/filetable.c b/io_uring/filetable.c
index 78e77e2017be..fc6872304136 100644
--- a/io_uring/filetable.c
+++ b/io_uring/filetable.c
@@ -69,7 +69,7 @@ static int io_install_fixed_file(struct io_ring_ctx *ctx, struct file *file,
 
 	node = io_rsrc_node_alloc(ctx, &ctx->file_table.data, slot_index,
 				  IORING_RSRC_FILE);
-	if (IS_ERR(node))
+	if (!node)
 		return -ENOMEM;
 
 	old_node = io_rsrc_node_lookup(&ctx->file_table.data, &slot_index);
-- 
2.45.2

