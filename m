Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1C015573D
	for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 17:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732123141; cv=none; b=OgrC3+MROWwDBKCQsq/Hrwg7MvNXlM03dSBPeEFNNFrN28dXvyV1SDZjOjNmhecDQvHHZGGoe9vxnZWgxIrVO7PbSchQKnNYSzmLun8/qRTZ3XPqmJvLRB4lBYpLecSkNg/LSxcnBEFaTfA6p4gc4440UHkoLVpxggEqzyfAXh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732123141; c=relaxed/simple;
	bh=VMLOhPH//1FlBQm40XRhlKtuyXZJpKN5xaEpPTsmgEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/+mUlPAuCvTFYY8LykVHuUPQrJVyGB5+i/MKnJ74Jop+UoBKybfXsY4YEFgSoj5ds2YvE08YkDXRmAYqhiHTt8zgaOj/PgiQenfppK9IZ3bMptQSTq4eDRMyJC2nxshyZityON9wWeaD3yln+rob033NqDH2W2KWifBP/MmI+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NfNnSeAA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NfNnSeAA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315eac969aso7105575e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 09:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732123138; x=1732727938; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6OIt9APg7rl+6VkRZLbtxcfZxEjXQpmkc9A4DcorfhI=;
        b=NfNnSeAA3JAcyNjibjkiJibFQOpOIgKVLQehyHA4mDeZdXgZdbkFRAqahvq3WEgIA0
         zazLGur833j1m07fHuebMFQT7s6kYZLvpo9oc2jUdTJkKtZw8c2nhEe6L3/GjNdchY90
         ebC1zlSXJ0QtbbOGZ7ZlfMkppwMbSJY2z03wRrWNEv2VmkcfK2EzM7hBtrocYrK3FiM2
         qrynHfyEinlpKo5oUrGDnDmBZiDPoWHacPwGN9sjmWXS6kUeLpkmO3hfM17Q0+U0aL0J
         RcT9EfFhop0N0FtKNQ0pRigXVw5ToxIMMIf16m2Wir8IIq/8tC7Cro8S86franiDL59G
         YOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732123138; x=1732727938;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OIt9APg7rl+6VkRZLbtxcfZxEjXQpmkc9A4DcorfhI=;
        b=dOXNbPCl+6SzMOeEyIC5sqhSncc+4nHO/JwbSbKl3/0SIj2MFEFG57I0Uh/4NkystL
         Zh5ah9ltdfW9rQaz6nkOh4Kz1lLoipLs0SJdZxunxDM9oz+K0cuIWn+sOXnoyD7/EDf9
         9FJkueauNJSCAK9c/+CYTbqOh3ouqtbYEWze9kn4gyQZqsksmpQ6Yr/mDgstcunQO3kY
         GUhqHfiopSWceCWNg93eIFfNzMfqYn4tqTP6Aqcs2WBy30fkpSaSoG1g0oMBs4vlbQhl
         UdAXVi958w6bEQ6he42G1m6hh2sHF+JhjbTStzjwTE5u9lfbQQV5DNSzMq09B6hgEr2D
         vBbw==
X-Forwarded-Encrypted: i=1; AJvYcCUVXDBarbH+HP696f70QtdFDaGUYap9aDs0wTKkAJHLAmwzLaGNONtBgCNP1oGX/IdYJjKWmiWu3xKL3agC6yw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaEfHOgI8xWEgueRsJgTOe5eRCE3tDWOGgCS1Pt5mCdOPT3cHC
	DOKoYHqE13mtZ3QSrq0/wQ4cFc6Z/AVv8TfPWADTdxLUXzX70lfFEOYoAULYIYQ=
X-Google-Smtp-Source: AGHT+IGN4jnKaNwqn5jDQ4Z0JFaJ3NGwDCLW4eL8iuhhfaD5aFK+WN+J+O55z5TrORF8zlK6Mk84zQ==
X-Received: by 2002:a05:600c:b85:b0:433:c463:62d7 with SMTP id 5b1f17b1804b1-433c5c97f36mr1677635e9.4.1732123138455;
        Wed, 20 Nov 2024 09:18:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b4633b5csm26761585e9.29.2024.11.20.09.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 09:18:57 -0800 (PST)
Date: Wed, 20 Nov 2024 20:18:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] clk: mmp: pxa1908-mpmu: Fix a NULL vs IS_ERR() check in
 probe()
Message-ID: <5b3b963d-ecae-4819-be47-d82e8a58e64b@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kzalloc() function returns NULL on error, not error pointers.
Update the check to match.

Fixes: ebac87cdd230 ("clk: mmp: Add Marvell PXA1908 MPMU driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/mmp/clk-pxa1908-mpmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-mpmu.c b/drivers/clk/mmp/clk-pxa1908-mpmu.c
index e3337bacaadd..90b4b2488574 100644
--- a/drivers/clk/mmp/clk-pxa1908-mpmu.c
+++ b/drivers/clk/mmp/clk-pxa1908-mpmu.c
@@ -78,8 +78,8 @@ static int pxa1908_mpmu_probe(struct platform_device *pdev)
 	struct pxa1908_clk_unit *pxa_unit;
 
 	pxa_unit = devm_kzalloc(&pdev->dev, sizeof(*pxa_unit), GFP_KERNEL);
-	if (IS_ERR(pxa_unit))
-		return PTR_ERR(pxa_unit);
+	if (!pxa_unit)
+		return -ENOMEM;
 
 	pxa_unit->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pxa_unit->base))
-- 
2.45.2

