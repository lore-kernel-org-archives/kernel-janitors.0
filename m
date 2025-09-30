Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2300260586
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235561; cv=none; b=NwdbEQNgNHaHUdRh5uoF2+5X2gtrfHo011qHfBqdY2JA8jd4ZbCa6HPwvxyQ8q/lERiwd7pbRwqjgrzhxYza2dTfeBx1zty6rV7sRR+eGtVBzPl/D3i/RF7tYvYzpLiIwjuzEvqQKbU49Xa1QzQCaRMMmnoSNuqklfwoWBLcsfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235561; c=relaxed/simple;
	bh=YCihytYoFEPvc+LW3TD22q+/WXxZuDSV1H6/KH+fhMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bi9tqnI5vbU2fwwZBYZxLXp+idbKjwAsqbHvmPq8IMXo0B2TKermxUa7Nb48xoZGaST+6lTQSAYvCRiDwFAsnSa5rvALjhOZWSPZRVk96+TJHhZIhuS+Mj6XcZ4WvjX+9TdI7lxFO1sLuk3mqvtzHJrOImmmutM9I3CnWTzPGRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TbfAOzad; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TbfAOzad"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e317bc647so37896995e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235558; x=1759840358; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oo5sOp/6AYH4FHUPQLIVvo5r8GtAmL8I6jk/YzlSnfk=;
        b=TbfAOzad01ZGUUEA5Puh2vae6b3Knm7lZVFTy/q3yOFnUfokFrxjLTW+wHr3lKTXXj
         eHhvvyy601PkwxuBjSCGn7op/FmGXHg7gexZmf0fTafo/1CmQ/su8CXYUxqzgsAo0T2T
         m4mRgGknjA/FGhzASGqk/cslGBPjozhvqwZPPIU2o6o7PzUCGjwY2vX4KghbP3maBVvC
         Lso7BziW28iqmzAl1dBJRuFUjWaUGbEziYyif6KkCAi/93ACF+alCRqCh/2x/X1c4Vqx
         FqYvzMS4EBg2iMTqvQ9Fc5b8MfSxhHj8FpVmgxwAvVpwQc3jvir07Qm9MeBVEmWfzwiM
         yD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235558; x=1759840358;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oo5sOp/6AYH4FHUPQLIVvo5r8GtAmL8I6jk/YzlSnfk=;
        b=as+PvzHacclu+7OtpWkRI7WrOkHXzBY7Of1YGwMmWN60cQK+X9pfQW2XdEnh+vbArB
         h8/sQu2wBoYw88UECPdR36qqmpMb/sn/6wjvDj3jyOSxmy8kgx5vLNveYyRrbu/3/RVa
         9dNMt7n+6TREFESpcHPNHFAYEnquvJr7mQn+4jbb9BhSHaRmhMOR2P7k0GSBwoHsnlMf
         izRISR9toFUuJ8B6XPcanzvqiLY3IIFSb6BSmajG51lbrTNHGaDExArXENm5ct9HDGum
         6nT54VDIeqqkuBLsl1zJSmOYL1uky3OsZhWsGBal7gu3FBHq3/GMJj2Lwlc+cFyUbMTw
         0rtw==
X-Forwarded-Encrypted: i=1; AJvYcCV/26WObwyfhIJ5n6s4HT0+NLxDbf/Mcof2YT+omAHnadcBW8xjPRiYX4jX8qO5TsNpTNqXGMwrrP1L5Odmen4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVU/zhsrQrgnAXVqxEpx+UEkpZlPtRWWlf3aTjG0oH/9dTtITG
	r5gIir11P+W25/QI8urK3qciR7aT96FZKaaze1hfRqPfssnubFjUMj+iobB2321LXYY=
X-Gm-Gg: ASbGncs13WXp9TMSRhkI71GDguwhIs3oBWieUtxAQbkSQbdMgkw1MG+K1gVpJV9xbrZ
	sx9QAJevR2LscvV2qcmmnoKjGJ3qnCpp82+xmgo5QuB3Wa7tvsDWl/tKHHQO890jV90S5JkX61E
	+NB85V3FSaf5YIlwCIk4GRjH2zy2b/7wXdeGATUnvPrTea73vctWyZ1yb707+ZGVWN1cVnVaFDV
	64LXsNNt+P+Igkrw+r4bMnShvPBxhRQQj9dCHBYhEdpTGLC8GKd90COI4nKgHiS9KGTubWDyeOr
	Iq/u40zi33h3nvBb35EsvuUM5vmzdKWzPexpfXEZFnGsM71t7NfYn/LVoIuHY4fWjov7yifQ99s
	B+1c9N+GPY+i7uyxePjNPlt0B8d3eSHpeXZsXYUgeDPkplh9ICl1z7RkLt6/Ybvc=
X-Google-Smtp-Source: AGHT+IGtnuuyKdDtHZCb3YIUp4ExKAmej4+wqFfGXxKG2xkl3FbcmieoXV3KE7JoIKB5oOnwCudRlw==
X-Received: by 2002:a05:600c:154d:b0:46e:4581:6634 with SMTP id 5b1f17b1804b1-46e458166eamr108608805e9.29.1759235558058;
        Tue, 30 Sep 2025 05:32:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e5707c1e7sm54805665e9.21.2025.09.30.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:32:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 15:32:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 resend] mtdchar: fix integer overflow in read/write ioctls
Message-ID: <aNvN4kfJ2ROB353Q@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The "req.start" and "req.len" variables are u64 values that come from the
user at the start of the function.  We mask away the high 32 bits of
"req.len" so that's capped at U32_MAX but the "req.start" variable can go
up to U64_MAX which means that the addition can still integer overflow.

Use check_add_overflow() to fix this bug.

Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: fix the tags.
RESEND: I sent this last year but it wasn't applied.
https://lore.kernel.org/all/Z1ax3K3-zSJExPNV@stanley.mountain/

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

