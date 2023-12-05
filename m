Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BA/GDjsT"
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72971D5E
	for <kernel-janitors@vger.kernel.org>; Tue,  5 Dec 2023 04:37:22 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40b27726369so57773255e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Dec 2023 04:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701779841; x=1702384641; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEQ0nPJK2l6MEItIcOUo+Cj1aUU6b9K1G/w+FexHPQM=;
        b=BA/GDjsTIHpykQtRNDowRNmaQIXe2g0tGNJL54hfknz0eL9S2PfnNQTruDPPjnBO70
         kEd3d7lgJh6Al8YKhCdoF0Cb8Ah2Ue+7QzO5nzlBy8P1ly91C9ApOnLwt6vVIEPBDUG9
         6O+OD5Qf0hnRwKMVdVt3HmJpY66TUonkjFYJ9koHk5R7LUgEquR79GDZ5AWyWYt6whzm
         1wGHhpsbs9CcrgSHKPmiSbVobu5cU0qflq1sKmkhmpkgpRhcuo0oKEw9sPstV9FU9ety
         0wKNtu9JpcGcaeoFBWlhcjv+9mcVBGMHXIIXvpvWUkqxO1VSGgkzfAGYIFYiT1SN5rFQ
         M5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701779841; x=1702384641;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEQ0nPJK2l6MEItIcOUo+Cj1aUU6b9K1G/w+FexHPQM=;
        b=IkNA+ceFl4z2PJekBnRb9pafY7oKeGBlY26lKxP/8VnoTb+EB3+CghHXrwa78FnHwH
         JRHrBmge11ozUKGgUCagDKhivP6Z88pTchAC4b3EtJEx5yL+g/NHu1CYnpUBYmaoI5CP
         cspvX7o6x+s3RbigGsgRZbiuYU6dY8Z4uMMmwaRjqSYURPMTeU5g2REI6IWpTMM+yxYb
         cIJbm63UgCLQch/JX/PemNvyp7tl+Uk9hKX3Goh6a5vqzqWCr8fNGVd1OA/8JOUFKbtW
         J2NOeUHui07LyPeRvQCNzpvv8po2PJmiDwi2ug1pxF9aHmv9ZQM/w6VteWhMMEDOHOqp
         WPBA==
X-Gm-Message-State: AOJu0Yxjj0RQyql9X2TF65CFReFDUPjHd4YjRAoYaOEMTZ8Pol+KndSv
	Vqo9/tjcslOBQa/y++Hry1NILB70e3wMwNvISPM=
X-Google-Smtp-Source: AGHT+IHGwMratcq3hVnhryBa3837VxHeTKKs/Jd/i8LMX25Dk+Chk0tB18TP0Xcjd5ROraLCl/4gNQ==
X-Received: by 2002:a05:600c:2199:b0:40b:5e21:e281 with SMTP id e25-20020a05600c219900b0040b5e21e281mr375751wme.110.1701779840967;
        Tue, 05 Dec 2023 04:37:20 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b0040b43da0bbasm18511650wmq.30.2023.12.05.04.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 04:37:20 -0800 (PST)
Date: Tue, 5 Dec 2023 15:37:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] io_uring/kbuf: Fix an NULL vs IS_ERR() bug in
 io_alloc_pbuf_ring()
Message-ID: <5ed268d3-a997-4f64-bd71-47faa92101ab@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The io_mem_alloc() function returns error pointers, not NULL.  Update
the check accordingly.

Fixes: b10b73c102a2 ("io_uring/kbuf: recycle freed mapped buffer ring entries")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 io_uring/kbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index 268788305b61..bd25bc2deeaf 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -636,8 +636,8 @@ static int io_alloc_pbuf_ring(struct io_ring_ctx *ctx,
 	ibf = io_lookup_buf_free_entry(ctx, ring_size);
 	if (!ibf) {
 		ptr = io_mem_alloc(ring_size);
-		if (!ptr)
-			return -ENOMEM;
+		if (IS_ERR(ptr))
+			return PTR_ERR(ptr);
 
 		/* Allocate and store deferred free entry */
 		ibf = kmalloc(sizeof(*ibf), GFP_KERNEL_ACCOUNT);
-- 
2.42.0

