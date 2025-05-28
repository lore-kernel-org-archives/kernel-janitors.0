Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8252926B95B
	for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419880; cv=none; b=Gs1tNQr/f4DdBG53dw1FDQUuCZl26d6P80BidR8/Eg3BG2LAHdSbUEXrLOUDlOKyiDzxVJ2GpiQU1sp/8N/YE1RhrRRK/Zvk0Km66ulP1Q4muTgPMOsCfYqkwT1HyanYXIKAi6+DmlCiExn83cp0Y5d6+f5WccZ2KvM/r2wuAQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419880; c=relaxed/simple;
	bh=Mou1ieGyUfMk0Ql4ddZnpgGEyPlSxoqDatPUfQa5VIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lwEDsB2QtglI019yjrsL1Z/hQ+MmfAk1MkMmZFcmjEplbJQWn2rn8MRadiGwzZsTsvs9KOhMGV/XWTNcZId4JinnoNtKKuuEYQKf5yN2otJHoxYiGRq6e0EcBGOe5lQhbel89DiyyLkaC6QgQ9pvHCTtVMSOhdC9IHazI+oXhsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jNC7emi6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jNC7emi6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450caff6336so942595e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 01:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748419875; x=1749024675; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eGBmhHpAoBCXn4dDL8o5LjT2W5woVp7uljWhl0TnKw=;
        b=jNC7emi6wYAwBAiImbGKNtj1Q2E67QS0x16vRg3FYVpbVMTSyAnIEs8p5P8bJw+3ff
         8wiX+fmqoLiwrltW0M36lfDPlASi80uz12Z9VeTXsLhZ5gp2DLQUmCOfZYZNbyhHWScy
         UuusIaQ9rE8sQFJv4WaMvWTgBntbm2pAWLTSIqgehiZmqxHJNtnL9t+sAqbmJtGx4x/j
         LjWR0ypMlFm9ZGZU9O/UQuKtSjJf6JVSogB9xJ176KH1ZVtUzfIrs6xyqNqXWYmySr/9
         eDmlKCgAFxp3cTlNP5mkkCpnsCjSgMTidJ+w73bujQ+uAQ4RSu2nSVnGQAalegtB9RPg
         dqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419875; x=1749024675;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eGBmhHpAoBCXn4dDL8o5LjT2W5woVp7uljWhl0TnKw=;
        b=JmibUmlWcQKyLoGxu1vumOi2PxavTmwn/p5VQCahzsivcjsCCKwovv+V0Qv6XGx2ik
         MFw808risj8tF8PM55ablL/F5JITzh83Y/Vl7EWdsrVZrn7SpsnaTLN8wNweiDbgAxMy
         U/XqDEsmih8Lpkw7dKcYUSO6xteIxQ8Qs1rKFgbIk8vAWnrJtMBWewo6OIkeps4qEQXQ
         m9+QjCpRFbdECNcRhlv9NYo82SfSytibJEYVuNbPydek9kd/p9rgqgopawH03q3hN1B5
         hpHfMTZSeJEzm49K+aghABanVxm6HtPiqYNuqxsaEwDFu35VEJECb8DMyopVbmGeUoVp
         7Wmw==
X-Forwarded-Encrypted: i=1; AJvYcCUCJZaHyXOyIW6Z9tggiNRaEb18XAQi6LpX4GWRVxlnizyFViOl2oTfNWqSWQ8tSNuVqjbT29vFWTHwwT2k5s8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYl/Cz7Q1cjjt2vIvoKt3PhGJWEZRd1PjvojDofNl1tkgN6DvD
	tvaTwrGLZ954RuZITQaHnSo2UiHW62DziiVMe7tHPpeLA3jOi0L7n8VaKH1P5UZuy4K+KK6z+Ou
	Di7LX
X-Gm-Gg: ASbGncsH60/L8/PPRtCt8ATNIejAqQpHtOLl7comyZEpS0UFAIXb1aODT8ptVbAABo+
	QIBMvatZXY8GQBOdi1+/vpjHtwFGQ4Btj9XzPb9vUsSrtijS0HWRf5VQEQ7bh8AIc0L6CNUCPSF
	YCtmmOYYrvnxEPDbi9UWPK4q5/R1c2UkOULXYpHa1gC941Z/2j+jVw+c52QaXrUKg5otqc7BdPL
	Cpc8jytKl6pOe7J1RywqE2uizdR54E5jc9sg4umcvG7AiAMU8D9IVa9MH0g/Fn2SZOAmE9+L3nH
	hweruRp7u8xlg8oz//CZ7vHJxocrh5XvWx2IyHOgxTwm9jiPx5STAV1Q
X-Google-Smtp-Source: AGHT+IGyt9pIlXzNb8QFnz35HETogZyJleM14B194rW68Yuuufz6AtscehzIU6fQJn738bKFOwrivA==
X-Received: by 2002:a05:6000:2dc4:b0:3a4:e8bc:594 with SMTP id ffacd0b85a97d-3a4e8bc0917mr1162825f8f.8.1748419873739;
        Wed, 28 May 2025 01:11:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45006498d2dsm13303805e9.4.2025.05.28.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:11:13 -0700 (PDT)
Date: Wed, 28 May 2025 11:11:09 +0300
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
Subject: [PATCH v2 net] net/mlx4_en: Prevent potential integer overflow
 calculating Hz
Message-ID: <aDbFHe19juIJKjsb@stanley.mountain>
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
the u32 type if we went above 4GHz.  Use unsigned long long type for the
mutliplication to prevent that.

Fixes: 31c128b66e5b ("net/mlx4_en: Choose time-stamping shift value according to HW frequency")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Use ULL instead UL.

 drivers/net/ethernet/mellanox/mlx4/en_clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_clock.c b/drivers/net/ethernet/mellanox/mlx4/en_clock.c
index cd754cd76bde..d73a2044dc26 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_clock.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_clock.c
@@ -249,7 +249,7 @@ static const struct ptp_clock_info mlx4_en_ptp_clock_info = {
 static u32 freq_to_shift(u16 freq)
 {
 	u32 freq_khz = freq * 1000;
-	u64 max_val_cycles = freq_khz * 1000 * MLX4_EN_WRAP_AROUND_SEC;
+	u64 max_val_cycles = freq_khz * 1000ULL * MLX4_EN_WRAP_AROUND_SEC;
 	u64 max_val_cycles_rounded = 1ULL << fls64(max_val_cycles - 1);
 	/* calculate max possible multiplier in order to fit in 64bit */
 	u64 max_mul = div64_u64(ULLONG_MAX, max_val_cycles_rounded);
-- 
2.47.2

