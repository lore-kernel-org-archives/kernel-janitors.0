Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4826D1DA60F
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Apr 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196492; cv=none; b=W6jnw4nxgL6lhhSOoHS9v7UifAo0nLaIEAXd6wnsj7KUhNTZ6/Me0ramyfWsEzMilkZWFFCLQjc6E/QaJzT85OTW/GnYIHBcrI7FvDYIlAdIO45XrUXrGTqZXNKqqvdu0x5yMo4TIX9dQhPIfkmni5bUCXU3IekKnR5DL13Z7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196492; c=relaxed/simple;
	bh=kbcnBub2qRCGOu06jo+ufjNUGTCmhyGxpUtKPPrK65k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGqVH2m/N4/QgtXOulrcHN864XeY2TjXLEHj2PHCBJjwyx7x36m3oZKniI5VPnYphItnvuMBJXQf23tRSDhCRdJN8Fs6ObeZMpfYaP25/ybponOjwVG6YZHwiI67EqVrMk//uXQxZuBERXoc2VYrnuwGWJ26QsyBXlo3hzTY4eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InKwe0+Z; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InKwe0+Z"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso4027987f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Apr 2025 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196488; x=1744801288; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WexvrN0iRH6s5lqXIKOGOc76DID+kB8LkmF1Khh6aFg=;
        b=InKwe0+Zr4NPnAaN7KME36tJvgoUSCnXpsh+0E4c+omkT2jYPFPCi1iQaAGFxOvGr+
         8sA4AuTt5sAodApX0OwaoG1ob9tOIM66G8g13MtmdF83DmI7EA0pyeFlwAvhQ9K3zHGY
         yW7vh1M3ykS+6AGNO51Puvbd9jdMR/pEA4AUKmgMOzOTRIws9wyzqwnacYWqjU4VZ+1v
         gCINfWDzGqxeec66CHtzWePY9O7e6uaI/rL5drlzfCznIekjv4IKiWB/5SOFbFM5sYjU
         6ryevgrFMPEyQzi/tUVExaJHAhlGW9PvseXTsGoaPoOKCvfd/8lsbjlzDhdtHKV7v5zY
         DbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196488; x=1744801288;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WexvrN0iRH6s5lqXIKOGOc76DID+kB8LkmF1Khh6aFg=;
        b=HlAociJu5nFKdrWTLKkOwaehUlVddjQKrSZNnwuxX/k/cWvkl2o8XNQZKFpAw7Yj2L
         vnnqJwTt3dvhKPo3AhjLqH/2hDv2L+XyEd7VgDy8b+3BxfoS5KdIR6n3h4ZGTUiw/G3n
         MR2q81A7/Y/4vIeHCu4pQ+ygRzIEbLaVn9BUruidOtCtesLfyKyrRGm7YfngTQw1Q+z3
         rspJfsDRZsfpjUutV0UmkPzrw4Vmv1sOApm9nymKqsGvI6Hf1dvgK2BP/783+AXD3M7v
         w5sMVA5uVhC0OT+obmraMBmMVMU6Lzx32IonWjWIfShAAz1u5syA2n0RzaTvj/brhKSv
         mvmw==
X-Forwarded-Encrypted: i=1; AJvYcCVh/6AniFVBco+Sk5fmfJxnOm8+XEGVn1+lYvqitAYScXjLwoZdkB2V8Ra3vAam5hhoRCCkUQImBfLL5wkBeMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKqrVeF96GLitO1aCGkGGaZdvZquz77d+trL8CAOHKGDiQNVYG
	+GxwCKwABqkuPkDjO6/8DgNxEFjwVgtUhPgFWDjMOgXthP30sf6D+TlDUvj8x5o=
X-Gm-Gg: ASbGncv4PMVOqjhV+4a0gQ1ffWIrojFwBfXOpi/cIyjUIHqr1aLVqBQ5p/A4Uwo5SXI
	Ys2mQvtebp+t8oZ03EiKySHBhITlexNRcCebqeEeCbmDMH99T0Zxyr/+Od4+2EFnp5KSa1ll321
	dqyJZYtRKhN6A+JZ8vYca2jC3IMwBFY1UHWjLrmILH4MVpuJ+Z2KGNFMoqijCZ5cA3oVSCg9EW8
	QvNbP0wFeSFMXPpV4Zx5u2ygNWR8jCHTMv1INtlLUHzSUGlqtOVyl99WiaP2o3qNLi5ZTP3HASs
	Gc1jxJ9i+mVrKNu5Po/rj9jn1zP+9J3iTdwQPTo9tiLnZw==
X-Google-Smtp-Source: AGHT+IF2Njmy6uDcmNjK/vqJ2HttsKJfbdo9EDMtXLQyenYtyEJxAD4fQ/53R944kzDkaZ5HLwroFA==
X-Received: by 2002:a5d:59a8:0:b0:391:31f2:b99a with SMTP id ffacd0b85a97d-39d87aa8ae0mr2409272f8f.5.1744196488617;
        Wed, 09 Apr 2025 04:01:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d8938aac2sm1307492f8f.52.2025.04.09.04.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:01:28 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:01:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: ath12k: Fix buffer overflow in debugfs
Message-ID: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the user tries to write more than 32 bytes then it results in memory
corruption.  Fortunately, this is debugfs so it's limitted to root users.

Fixes: 3f73c24f28b3 ("wifi: ath12k: Add support to enable debugfs_htt_stats")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 1c0d5fa39a8d..aeaf970339d4 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -5377,6 +5377,9 @@ static ssize_t ath12k_write_htt_stats_type(struct file *file,
 	const int size = 32;
 	int num_args;
 
+	if (count > size)
+		return -EINVAL;
+
 	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.47.2

