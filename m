Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D43914A630
	for <kernel-janitors@vger.kernel.org>; Sat,  2 Nov 2024 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730539888; cv=none; b=ZPwpHBUbbVoMLmQb3FWQUYrDlqpeSoooiXp5cvm0sxCmpusrZm6pbuTWFMf+cZYT17GtDZCkz7qqLIqXnhNgc0mCmXI/qePn+reQ92pmh+sIAJuNplmwq/P8x/zgjsGdoj1Wpi/Tf1qSp3sh9cPmZXq1e2r0YmVwuYoMiscPWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730539888; c=relaxed/simple;
	bh=AxfZ6gGVPQPRt1Kkz1e9AnPzzLi9MaVmGq3SQAO0XGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uiSVMKbSHBPmSsQv7IKI9MF37LAoAn/2sMxemOVx/A3zLTM3ztuHfx5y+C/eMSJ9dIK86n+ZvhpWUlGcdgntbD+uWTmJ8n0FI518ujy7Bfw1eJAB2N7KDqliPpFXh7QkVA40bMmKNjkUg9amEI5xUTUSYhINc+EY79yN/Ue6D8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uk6kea6D; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uk6kea6D"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so1506970f8f.1
        for <kernel-janitors@vger.kernel.org>; Sat, 02 Nov 2024 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730539884; x=1731144684; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2G33OuRKLaV8/Qlw+mzO1Q7pXloYVXQQTnj0b51x9wA=;
        b=Uk6kea6DO+3dVkD/lMhzKq9JPrLY/9qbLQ/kuXxTQ+vi9rzA+BBnbnWASGN9dWXM9f
         dwFyFLdyspMacm9C7UvplAdwqQ9eXVuUVkkwRlYyOAIKkKkculU385cJZjkwudrQHD2D
         Q0eMkChINXVxMIiygDybbqzTNjm9Qs3Y7L3FDJO5THPCzastnsy6nZQhNCTnWrdrZOCk
         ykFue19DfwicyBY7hyCMo5AIx/2EgicdObLblk8+u49ETXrOeTWNyIZ6G5Oqoa97lopf
         G0u9UoZJTKup53qAa3UgBGKCN9DFYhXtsJAVXp6H+ULuqimW5JueagC2VwptVBtrEr6C
         REFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730539884; x=1731144684;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2G33OuRKLaV8/Qlw+mzO1Q7pXloYVXQQTnj0b51x9wA=;
        b=VU9l9D7Yaxu0P3Dgh2rpaHx0EzjlTBEJvGtxL7W8IBI3iblgxHxJKn/I86YfIxAWFD
         DrPD5CoOiQR093ls/Pr0Bs2GpE3NMo0it7cs4ZhL+BN3TbpUcBguGElDAyxXKcGqoU33
         deEiQRxgr0oX1jiVDVFN+BPf7GQZVPRkrh11HE7qKwZlIor2hREGnu+uBv9h7lJRO07k
         lQsk4VL+cKKoDKBV2mDGkKngEoVxdVyVUpLNXBu4Elm0/PDY2wo9yEo6RU0ErJpig05K
         35NjxxqQYLYz7suFiZ15z+fc6tYWuRQMtGHypUSETcBtqsh4t0H3lH3Q5aLmdFlZO0AO
         5npw==
X-Forwarded-Encrypted: i=1; AJvYcCUz8DdLYAEJFhBqsbzRJicRdOwlfC8+WuRdAQHwb1Pck9E5Lx2BCExePHRVXBNe2kVJxvY1aUzFBL3v291paiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Zvey8j1AHc/eGJ64GgCkYjb3N4Kfq2w5Xw6vTaxp/SO6U8LN
	0HVqzKBQh6UBx5Ds1m4PtVEGpOm5DBpm9YOaL0BqRobMELPzLj2pkPP5gbbPv3U=
X-Google-Smtp-Source: AGHT+IFMNVmV9EFSObPL947fodX0Fb+SP0SISXcsLVbP/D8qbWurJtklEVb7Kef4HIak7PcfND0EKQ==
X-Received: by 2002:a5d:5f4f:0:b0:37d:4dcc:7fb4 with SMTP id ffacd0b85a97d-381c7a3a2e0mr5427434f8f.10.1730539884403;
        Sat, 02 Nov 2024 02:31:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d414csm7493312f8f.26.2024.11.02.02.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 02:31:24 -0700 (PDT)
Date: Sat, 2 Nov 2024 12:31:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] lsm: Fix signedness bug in selinux_secid_to_secctx()
Message-ID: <2d02f331-42ee-40db-a64f-5ee378eb44db@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ret" variable needs to be signed for the error checking to work.

Fixes: 95a3c11eb670 ("lsm: replace context+len with lsm_context")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 security/selinux/hooks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index eca9674c9478..0ff018f557ac 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6644,7 +6644,7 @@ static int selinux_ismaclabel(const char *name)
 static int selinux_secid_to_secctx(u32 secid, struct lsm_context *cp)
 {
 	u32 seclen;
-	u32 ret;
+	int ret;
 
 	if (cp) {
 		cp->id = LSM_ID_SELINUX;
-- 
2.45.2

