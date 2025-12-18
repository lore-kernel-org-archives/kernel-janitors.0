Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5FA29B766
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Dec 2025 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766043868; cv=none; b=rutB6wEqV1j0pvDfC/JoFSZEp+rjMf6R0hJkKO1bU/IaGnIgHZH6dk7KOZfpcgvKs10PzmNBnE4PrkmTTx8oQERv5ZizB2/gknCVyCVLweL2hbGSsK8sIsVPH5j6yV7LgDUYnHrge9rwEeG9nKWoIfccfpH4qI77HfkWPXP2wO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766043868; c=relaxed/simple;
	bh=XbnMB/v37ZvTMnfVrio95/zDhdVKRpunW29/ufxDUwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V0D0eEhlfqH2MnkuSdcky8y0ZYRDQ6PvPudK2ug9P7IiLbORdBP+a/48JbW/LUdRedV+bHRI18iTfAvCjwiY5rPgSupY0+Icxi84aX9u3DEuCSxsaMJaGU7Yx7itaed+v9j2cvtzB0vEATMhIO2md7lw49UYJ5vTPZ+8jOI4Nw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfEbjCUD; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfEbjCUD"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso3390285e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 23:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766043865; x=1766648665; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmBu8zFR/klecwYr2D2QZWbIrMNrDUPX/mNk79sUoPA=;
        b=KfEbjCUDjlxbQpbNyOPUXqcyclaeCmeKPHFMJeXC9Tci9Ie5ZZtwV5u8AeaXrNjK1/
         b1Z/ZQHN6nMOGYIoCYsK19OtVUBbDq7rO70T6tEllFjqjajAipMjx7hRF0JpoWk9ahi3
         4Q//rZdrtGHF5Y2Pm0Th9Mz/t9CqglFp9GmQecKwVVNunkEf5C491U3jJv//OQfAr1rV
         3pyxzRxR9sWsOiNTA13mvHVP0rAnjfSA4t1LuDgq2mF4Cyzn8NELqKB51j9LuOQSUwqR
         4nLWYbSMOvXV2xhq9cQh4r0hdlff+LOr+J71cuSQwhtTHS3TDSxAQXsvzxlS3r9Nh99+
         98Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766043865; x=1766648665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmBu8zFR/klecwYr2D2QZWbIrMNrDUPX/mNk79sUoPA=;
        b=KtIYQBKVrLUJq35PNoFjjTm6HuCvcBEPSYJf4HDlOnJheDwuSNumaYn4MSFnmsWQzx
         Qw6NZ+zMSYD6N2Z13G5RnpJR+vGmi3vfQPuG/lwEN6o0Dptu+ybrUd7iaCy1ktRxLuIu
         msze6GKOWz6bv/Yeg8GQIMNAs1iZA57oNac9TtOPlTdlrsoGA1l4/4l+omBYWHDzd+02
         pNwuSM6/hO/e7xzsmCVmereRTWd4cGCxcppSjyxtdkTh/WOHjr9oPzpGTEaw0qy8JbHF
         cxPl6quIkXYwl1+K+EVUmjdTRtH6L32KzoXTwFpKkv0Kt5aayo4ZjW++/zvEkQUNXhjS
         EcNg==
X-Forwarded-Encrypted: i=1; AJvYcCXPwheAAcJ9eiz6mmN78Ydc07XM1IAfUSyibfq480Lqn4XFvSFa0K6f0QpV3mFZvxY7Z8goTaykzqHIsm0bx9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZ8JN9E64U3FZ9vqZDeII7O2R+VSr0dENxdGbeq4jKbYPZ6Hj
	J2tsc/DR3LE37Z8I6cPBME3Xh35ujt0oYfTs5hzdFu4yRcsjAOOnz0UGFYP4Nl3ZTTs=
X-Gm-Gg: AY/fxX4nXciRuvO8eTuh4bsqPqzFIWrrylNU+SFFVUl2bArljb3R3ZUxYMj4K7ojUCI
	ts8QdGX12CO5si7YhtnN465bnsmaX0iqM+aZdMTsJWdkNxKFcoPxxJklwHpCQzSsG6s7kn+Ao6y
	cxzNaLeU4HW3LGA/Sxv7OK7Hc/xKWxIYDK96JipsWFQus8CGwUD5CzFRJk4Q28kohXN5Ow2b7ep
	PxsL0lCP2QzwAm36irruRVhHGGOqP2oL00MVo4NRvksjsZBQdeco7t/Jij8E0iRYUYn11DEcIPL
	qb0TMbm7ZyBEWv3wTP/m1hpHQhpryd7MBYT2AeNDUbsnJoefBNcaePz1ownBNSepJxYhmwyTws7
	fOyf5DpXJPUL5NgUv9ZWni8Dd7vvYseq75KPK0HJqT68b43O3EF33Y2qmJSLDRabtwSGjoallXE
	pkMGKaQ8/sB9ffaD5P
X-Google-Smtp-Source: AGHT+IHeT5UtBHWPRMxU9FR3aTP1+g1lAhxDtBjVewu9mYYmBR2tXxoSh9w6+3wkstsmfDdqt5pgvg==
X-Received: by 2002:a05:600d:14:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-47a8f9a825amr168231755e9.1.1766043864798;
        Wed, 17 Dec 2025 23:44:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm29116925e9.12.2025.12.17.23.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:44:24 -0800 (PST)
Date: Thu, 18 Dec 2025 10:44:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Ripan Deuri <quic_rdeuri@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
Message-ID: <aUOw1J0TU4VgeXj6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Destroy the rhash_tbl before returning the error code.

Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/ath/ath12k/dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 9f05eea6695a..ab54c8a84d3e 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1513,7 +1513,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
 					HAL_WBM_IDLE_LINK, srng, n_link_desc);
 	if (ret) {
 		ath12k_warn(ab, "failed to setup link desc: %d\n", ret);
-		return ret;
+		goto rhash_destroy;
 	}
 
 	ret = ath12k_dp_cc_init(ab);
-- 
2.51.0

