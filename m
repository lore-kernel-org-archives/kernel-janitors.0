Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A870A199E84
	for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094113; cv=none; b=k49nmYTU7kNBcnDYJr9hegds/VCajH4a8aDnrIWuwi2wqwCZyPR6aJC+qrxVVUEG2aFEJZnc/59kcAcU6xICvy+sQU9yvV+t44ASzUXoElk5yp976rxlcfGjqQ65Y0EcQG96S3gJoPuo3Ls30vR3Bn4OvxHqZkK8C0vjamr7cqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094113; c=relaxed/simple;
	bh=2hdAbT7Sq9ipOSToiegjJMfm1hDkH2O1SCc4PKB5D7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nERBZXihmlksiaT0ljFv0jXseRKKpZge7YDPo5eaRkVXwFiy0UYNnb7bN/2uq2cAfE6KbULljNaJzihSPzy8fmVFp5vUDc2i/RoXoA3X+nFH/A0dJcvQT8BP6BpyEaPNg8sO5oaSZ03RX7dSxY2JTfnB+GHOHbcZgX5Kuq3R6BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BrwkreO2; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BrwkreO2"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb49510250so50531251fa.0
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 01:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732094110; x=1732698910; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZqPJTooMuIvfQxCxUlIoLxMsIJNKGcrHg/Zv8d6/H4=;
        b=BrwkreO2me6Kg0w0t9CBycLmcioKk5bJoDqEjtHnPXP5m3txQarl9UjkCdEWDI3hy2
         muAk8GTFqdHwSK0SFbFIe9rcE8D3VAaFn4n8TTD80qOx5KJHtLIQrn2UVVusf7PIhYmu
         /tuYHNWUTtxVhWhPT9M/O60UAy7/BA9Sw1xxh3Jm1tmziOZjQ+NBoSUlRDNirD5SCn4o
         aKKNZ8kfQr1j94Jdh3Fb/BuJ3IHpeQPJ7+9eQ+2EYre2H1A/bR7H2yYGLfsgsupbBgAG
         CgL80q4u/pskeme61HFeYE3YBvzHxD6G19+kj3r7v1uY5ZE12OhQKmIjkbpis8rBpW07
         xSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732094110; x=1732698910;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZqPJTooMuIvfQxCxUlIoLxMsIJNKGcrHg/Zv8d6/H4=;
        b=j+nkDyJmg+qGW4IkA35A5VsLlD6Kfiq+CcfktR33ZibBIAjgZv9b1U1IIndu+34gvo
         UNd0qyKTgJzBWjvQrE+Xa/TQCNuEdaHrqAWuWe6XRHOBJZ0Fb0EO5To2N7qxxfd/LDlO
         RvhRVjKy2INNt0LEH10qkmrmrPi4MK38qhuL4fIZyTlZ/oTt3V0L3XCx1VIOLBzi0e59
         hcRSvUcV0GBrisWL3FXFBc5OEvKFBtAFxge0Abw1LbjP23O/mQ2llGKzvkvf8UT5TuI9
         TqifQdX405fPH6gs39zaG/4GqIqmpkOvizg6rov6sgxc6A51mSUYCDYIfH8xAFPVkFIk
         8aXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4joHr2WCNLkDVAlESqXuADJeaoSfBvkpS3WY5we+40RMj9WZdbgHHmDh4npeRVKHC7wufL3FSg4yF2E1gzXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdhcQehffvLuq92bb0zhvSB+ZgFEFLzTpIqbSjSJ+yol/UDu0/
	6EEM+l3k3+UcRrVyk3qno0a/UXMdk0yL7QGj7oFvXvx5US4EwvONvDsKNujUTfU=
X-Google-Smtp-Source: AGHT+IFpsEvlnavPKpISmZgS8ov+/Rflr4MbgvHBN0Ln88a6ToQBQhFBJg6MAGm+8dhJ0Y0wJj72pQ==
X-Received: by 2002:a2e:be2b:0:b0:2ff:4ce0:d268 with SMTP id 38308e7fff4ca-2ff8db6039bmr11228371fa.2.1732094109757;
        Wed, 20 Nov 2024 01:15:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432f643e65bsm38337075e9.0.2024.11.20.01.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 01:15:09 -0800 (PST)
Date: Wed, 20 Nov 2024 12:15:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] io_uring/region: return negative -E2BIG in
 io_create_region()
Message-ID: <d8ea3bef-74d8-4f77-8223-6d36464dd4dc@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code accidentally returns positivie E2BIG instead of negative
-E2BIG.  The callers treat negatives and positives the same so this
doesn't affect the kernel.  The error code is returned to userspace via
the system call.

Fixes: dfbbfbf19187 ("io_uring: introduce concept of memory regions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 io_uring/memmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/memmap.c b/io_uring/memmap.c
index 6e6ee79ba94f..3d71756bc598 100644
--- a/io_uring/memmap.c
+++ b/io_uring/memmap.c
@@ -229,7 +229,7 @@ int io_create_region(struct io_ring_ctx *ctx, struct io_mapped_region *mr,
 	if (!reg->size || reg->mmap_offset || reg->id)
 		return -EINVAL;
 	if ((reg->size >> PAGE_SHIFT) > INT_MAX)
-		return E2BIG;
+		return -E2BIG;
 	if ((reg->user_addr | reg->size) & ~PAGE_MASK)
 		return -EINVAL;
 	if (check_add_overflow(reg->user_addr, reg->size, &end))
-- 
2.45.2

