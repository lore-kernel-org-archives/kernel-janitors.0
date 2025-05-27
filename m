Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5041D7E5C
	for <kernel-janitors@vger.kernel.org>; Tue, 27 May 2025 05:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325108; cv=none; b=rqUB3HX4K4kLen258sd4Ate/md7fULD+l1ko3xBUy17ogwhfUhtMqQg35w8c6vHpPQAlX0gnmU0ZF5trQ2rscMv9ZqnCcgFLtyOZBAZ3i9cszpRxBfeJuSyI5BzD9/w9bJzM8/d3xVoEphAP1uK+teMWevTXFmpm/l8K9htLu30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325108; c=relaxed/simple;
	bh=FRU9W1+DS8rfpo6UNzEN6UMBg1u0Yz12fF9f8ZKM/kE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VOU1Gl6/3BGRkzwHNWJP4Mjtc8tpRZ/HCLfYtr4/Zbeoc2C9FIcCZfBndG+yjOf4EFdyWYUbbGR6IdK8/Vq3l9auKqaM3X8E+3XxDgZlz43VZTZ29SQSv2qcxE18qYpgGI+hJta5OPmODYRcYS9ZoTU834TOl/CJBLr9L9fMBLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bHBTFXVq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bHBTFXVq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so447401566b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 May 2025 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325105; x=1748929905; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVp2NY7FohPgZU2Typ+0h2uamFavzqINb4M9GCUjHoM=;
        b=bHBTFXVq7lydwB0QzS+hm0UM3cfkRYU8KwUkLGuYw2TcnPaOUTR13DvGMIXmoqNmW0
         HA2S3B579S0TlaPnpVn6T31o4VgrKCs2yJXpOTDGwxNxKNBh5Hffe+Bp5do0pn+GjdgR
         MpY0S9SaXpe5RFJEbnAdlLvQMlEKhCGG4bEzvW+a0/HC0o8ikkSUFjzTH1VKlodI4J1C
         l5Q4C7TJGoPgeNKaJqg3pzlnzd0+cs0RzloH7ZxFCOrwLaQs4p6zoG21ZdvrPMWPYWyE
         xmLtJaE+wHldpnrw3Y5Z2cJpuNTp3EJ3H5Aiz4sZGlXTfu8IaEpkray8s4svhPcYmgfv
         +5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325105; x=1748929905;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVp2NY7FohPgZU2Typ+0h2uamFavzqINb4M9GCUjHoM=;
        b=nLU7RKw56pQulifhUQ/uWod9i+ZCr79EhnBeo44TZ2v/vQPFsgNZzG8JjCfegPX1tu
         lCg4O1UaM4715QgJ+qnn2t9VvNKiFvu4vECyhGJzPepQsfNoVl61QHDjDdiSMIy0cKqS
         6ofYas/5wFqMHjeD2hIyVcftPPzzJD1Fl393Q8ba3fM6svUXbRTQCJBPaBfyIRA1ysq0
         FFi86XlgTE2UAu0s1v9sEzqdFjropQU2WvjU3Ki3zIwakX9w366ToQX4ETY97Q4aqVyj
         KkgYGj0clUHaYbTakBq18hlmeeHkdtuU2bs00gMC4FhukZpQ3gS8eStx23AtpBSAzIgA
         ZQMg==
X-Forwarded-Encrypted: i=1; AJvYcCV024VTkRcE7tSfVrhH5xZ5aS5aZUEtWs5JNm99Y+JZ9gspkYhOfF7seGQkMzMfh258imlvWx3o++5wv8/qiWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rdZN4ETf5097uT4Pp6WYE7tkywVsLMIXK145wplBaNXbYdlz
	+tWOHfah4gwoSveDBI09i9qhYAnGITtzG0aPpDdi4E8LdsbyWnswSYwR9WC/eJ7IDuQ=
X-Gm-Gg: ASbGncsXZaUiPjsG/VAbz4DM9ekpBLWKAWDSNnh/xd3UKIUDK5TC7qOoM2yWS4QwzRH
	IhtlDIL3T9U2S+HNt8izvTuVRO+4WMmTNEZEJXiayXHu1ouifsxLNTStj619bSGLe2CBj4fxIlI
	IBnyXDKl9/lHEcnoL/ZuSXTr7XWen83867HlltO4GJ4fPqa6Gh3LLUYk1EMh44YgFFbapCtpnpD
	BDXanSVSkwPxYUYpDF5Mg5H7Vx+6yoaCj89GzVesP1XDNy/LEnUsEWheV2Mo50eg4x2N233cViZ
	nqGogb0UfemejBkgQnYsoAZF8caqYdGlekwTtthhUoE5jx/FYgm5BI2ONKVv/ghDsj+nTU5deSQ
	=
X-Google-Smtp-Source: AGHT+IHjsxqs/6jcL8C7UZ6kgwo4G0JpqJqenkT3mjexlsQRl4jPPZvuq7A6WGfuQrzvXuOSfE1M6A==
X-Received: by 2002:a17:906:b84c:b0:ad8:883b:f10d with SMTP id a640c23a62f3a-ad8883bf140mr176024766b.34.1748325104785;
        Mon, 26 May 2025 22:51:44 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad8908a54f8sm40467266b.63.2025.05.26.22.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:51:44 -0700 (PDT)
Date: Tue, 27 May 2025 08:51:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eugenia Emantayev <eugenia@mellanox.com>
Cc: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Or Gerlitz <ogerlitz@mellanox.com>,
	Matan Barak <matanb@mellanox.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] net/mlx4_en: Prevent potential integer overflow
 calculating Hz
Message-ID: <aDVS6vGV7N4UnqWS@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "freq" variable is in terms of MHz and "max_val_cycles" is in terms
of Hz.  The fact that "max_val_cycles" is a u64 suggests that support
for high frequency is intended but the "freq_khz * 1000" would overflow
the u32 type if we went above 4GHz.  Use unsigned long type for the
mutliplication to prevent that.

Fixes: 31c128b66e5b ("net/mlx4_en: Choose time-stamping shift value according to HW frequency")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/mellanox/mlx4/en_clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_clock.c b/drivers/net/ethernet/mellanox/mlx4/en_clock.c
index cd754cd76bde..7abd6a7c9ebe 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_clock.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_clock.c
@@ -249,7 +249,7 @@ static const struct ptp_clock_info mlx4_en_ptp_clock_info = {
 static u32 freq_to_shift(u16 freq)
 {
 	u32 freq_khz = freq * 1000;
-	u64 max_val_cycles = freq_khz * 1000 * MLX4_EN_WRAP_AROUND_SEC;
+	u64 max_val_cycles = freq_khz * 1000UL * MLX4_EN_WRAP_AROUND_SEC;
 	u64 max_val_cycles_rounded = 1ULL << fls64(max_val_cycles - 1);
 	/* calculate max possible multiplier in order to fit in 64bit */
 	u64 max_mul = div64_u64(ULLONG_MAX, max_val_cycles_rounded);
-- 
2.47.2

