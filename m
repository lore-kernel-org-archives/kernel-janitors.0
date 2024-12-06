Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122681C548A
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Dec 2024 20:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733516804; cv=none; b=BD2l1qWnPmfKfN27j1tP7bRcaCNoRkAxSDHFN8+3jOFyJMdXBvx8xh3nmGVUrRXwDAfUOPu2UXjL3l8K03GNyHpNE3Q9cnC35LlTw5zyf4FWFGW3kWYaO62seEpe2CyvHYXIp5fm1zU0oNhLSsMc0Yt3DahtkEf9FR2kEKFQSDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733516804; c=relaxed/simple;
	bh=8oc8EwI0AnmhUu+nV0YrX6Le/d762O1AmGoD9ZK9eyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XMEKBt5BUrjmUr0T6n9ZHUyirRZ7J88sO8o6/fuyAoHm349orn8JhnFTI9LDOq6Q1tZDU9+L/cbkQUJJzK4IUiOWdKzvXpJiEx9pD+m7IeZIyorfPRl4qL2v8Rv8B6devZryDf6i6TV4Q0D7xpYGGQn80+2AlZtc5Wo6esGKTMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xb3bbHeN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xb3bbHeN"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862df95f92so712085f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Dec 2024 12:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733516800; x=1734121600; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjkawNe/zvVX+h0jYqx9NDeU0TKqmCFwHGIOk1udH/c=;
        b=Xb3bbHeNRj935sMdCVaZvMa9huwcWZ8KE4WrASzuz+BFZVai1eu3hQ2hfCzHci+fFT
         J+XoHZshCQHghv0VQWEr9UYUb/muDl3XaSyZtHXCsdNa4OdqpwfvoRWHgmufj1q/k8Un
         DPdMl0hxdpnt1OWubs3l7PQoF+4AyJ2k8YKjREXRe305zAAJCEV8SAHcfvFhioktSmtb
         ZbpC2lqF1P2b3CeplRRWATjp5u7UJ49o53Jw70Sd9QM8IU8fAlZ3myUVBnmUuid9Jzyu
         VxqJFx790KVz/pMMjd+20MbohS27KN7OendRJ8uhKgjjFlIBEDhm7VLSQ+RPt4nISDYw
         ClJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733516800; x=1734121600;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjkawNe/zvVX+h0jYqx9NDeU0TKqmCFwHGIOk1udH/c=;
        b=K2vT1Qo/vzH28uLneB0XcOHwlxNGxoTo737jv8C/tjTBqYkcuX8ph80d/vTYmy7fbw
         A431btSflkW32nHHoH2PKLzmkiWdG0QmXfZFpzreOL7tcUPJh32QyImhuaRW8ABD5zhu
         zcnzcVdSiRgRToVfbStMuurA8kIkgeUOg6g0zJvmuPIEKIRQvLRmvjxwN0tvvi56lB4y
         I1LqZcnQBl3PmR6BollVkCeTg5WcDakbcDe18udFPEXhL/srXyDOP87HoX+e457P6auM
         7ZIHoc45dDqOiJzcHYmnN6Uppy+ZGApQBOeQniLYYJDTTuYIO9ZbSu2HVjKttku5iJuS
         mmRw==
X-Forwarded-Encrypted: i=1; AJvYcCVzs/cdoANKA3C0GRz8wfA1UCMgC6eoxgk0Vrkc7z/tq70338Liic5E59aboYNxNSPYqF8GlTv1WnLNcZF6UW8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy13qVobGitJWxnTsK3G45DSNkMIak/+Ufm/sb3G2wQsFtvxDX6
	LmvUUuGdqFnpBHIEFBGtpwAngFLej8gmTogO3y9d8WxDLpo8WLjIz/KOQyb6O74=
X-Gm-Gg: ASbGncuaxDsKtDw0f0c6NT8mZwq1Uj0nu6UnX1tVf9renvkaa/BNVxCi1uRlYwWEBNv
	dkpEGcw0VZrJ9mEl40Fu6NEmC7OwGPycHD+BRDj37sYRjUpm13lpeNiviO8DB2lBj4g/6MsAy7h
	r8VW8M4Jm6MxoBCiorwLpu3nEqCQzNPZzV8cHZpfuuZFtTsb6Az+urK4Sx0rP5bFqpSgKzGsNm4
	Vzyj+YHk3v93UddJz89u4zY/Wx5AiHCn77Hdy2Wcac7Y3Y9w85r9ps=
X-Google-Smtp-Source: AGHT+IHuuNn8PhPAm12rBVa+8Uo5b1NeCY06qOcGgQGqX87r5PhjVJ2tEF0YYVoSm7KTEvHFh633VQ==
X-Received: by 2002:adf:e19e:0:b0:385:ed1e:2105 with SMTP id ffacd0b85a97d-3862b36cb56mr3597056f8f.26.1733516800528;
        Fri, 06 Dec 2024 12:26:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280497sm102052885e9.23.2024.12.06.12.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 12:26:39 -0800 (PST)
Date: Fri, 6 Dec 2024 23:26:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mtdchar: fix integer overflow in read/write ioctls
Message-ID: <020f98d2-eee1-434e-8236-775cca9fd157@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "req.start" and "req.len" variables are u64 values that come from the
user at the start of the function.  We mask away the high 32 bits of
"req.len" so that's capped at U32_MAX but the "req.start" variable can go
up to U64_MAX.

Use check_add_overflow() to fix this bug.

Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/mtdchar.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8dc4f5c493fc..335c702633ff 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -599,6 +599,7 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 	uint8_t *datbuf = NULL, *oobbuf = NULL;
 	size_t datbuf_len, oobbuf_len;
 	int ret = 0;
+	u64 end;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -618,7 +619,7 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 	req.len &= 0xffffffff;
 	req.ooblen &= 0xffffffff;
 
-	if (req.start + req.len > mtd->size)
+	if (check_add_overflow(req.start, req.len, &end) || end > mtd->size)
 		return -EINVAL;
 
 	datbuf_len = min_t(size_t, req.len, mtd->erasesize);
@@ -698,6 +699,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 	size_t datbuf_len, oobbuf_len;
 	size_t orig_len, orig_ooblen;
 	int ret = 0;
+	u64 end;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -724,7 +726,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 	req.len &= 0xffffffff;
 	req.ooblen &= 0xffffffff;
 
-	if (req.start + req.len > mtd->size) {
+	if (check_add_overflow(req.start, req.len, &end) || end > mtd->size) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.45.2

