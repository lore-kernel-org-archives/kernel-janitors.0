Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E36D22A819
	for <kernel-janitors@vger.kernel.org>; Fri,  2 May 2025 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175223; cv=none; b=dFsWDjZmlJxRKf0WYjoeClq7wo0BgdDHC75wqMXRBfqNmvgJWGlfOZ85vi+W5Ouzddf1QkYjNYNXEK27m9MCTGjl+57ODZjtk8J3scoWVpPsFPJaaw6KdCXUHV7f8HPGZkf151CIi0bTn/JX7uTxmEr34JjBcHHBPJIcdlOH2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175223; c=relaxed/simple;
	bh=4GwIMV2g6kYQJfYrG026JnY99HzIdumMHujNiN5PFkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SyeZLDmuw14f244jW1JbD3hwrrBPSqN8fYPyj97h+6yJE+GN1xrPEfbfpM4xBVt3iNyV0gq5FPFRvr2UX/MdGiYehBMxIsZDSWUmVCCy5d3hj25V/g0YXcVbUOHV48D+ov+xxqTQfBvjoSnQRjq1E3TPccaro+5ko1+y9vpBjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e59c++Xo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e59c++Xo"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so956098f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 02 May 2025 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746175219; x=1746780019; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfPxHK34iqz0YjaqRlpXE1B0HpLY07y212OEUguH+Us=;
        b=e59c++Xolau9uKv5LXFDx7H/lPOQPzpuTp6hpnqxJpjBP3r/6dkH7pML7nyqFlfn7l
         Jk9/LaWBFyRpGjwX+0y252PGjgU0fHW9O+EAnDdsKcS+/ptq/AcWcAXVvAtbdsIJDb7Y
         vVomeIxKb7xYf/rNXMt1cj7WsGh8vVB7QzHDCZ+ab6x10LRy3eE4MyAFi+5k84PIfmI0
         ONasA/QKpHbEb98VZfvj2oGw0VVNU00wT6jhsF0ZuXm2QBT1NFCNA52O0JedBVmOzIjz
         K0U9JrMW1BJxHD3SeCos7d84A6Rb2oW0ayxKd0j7Y5nZSDVcmFYB0qTbolcKsLYoFZvC
         7sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746175219; x=1746780019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfPxHK34iqz0YjaqRlpXE1B0HpLY07y212OEUguH+Us=;
        b=e07WVuxKogtXhKmvlCqTFZW6tXro2SoTAOeM3hu0UMlJJ2dbhbcyJaugOp7seXg4+c
         4C9a6P34hQGk+6l52oBV3Nf0D0abVFdm2PETJCiTdgF9/DlHwwKRE4E5M1Ym9ylHAOEr
         EFu6zRpfpLUvMUB0oU9YRnqnbECr6OQr9lyubRM1Huq9IP6iqP1dl0kuMfKSty8V//5e
         H/AGHN2/R1eyCRY2Y9mRnTO+tnNJr/upA21PS98BNnT6ROnUGl4pT3dKVksiBp3sg33B
         0ttT7pYKQA1p0j4kDvOh7dw/SS3xRd80Eeyf+7y06MbjG009P/LMkmWZDK/SXFJG/OX5
         AkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEPoDLcca0NAGu07w+ObSTWFMln4Eq+Y34QnbotK1yVj/Pxhz93XXPrmgkBjV+KGrNS5LsbC5UB4v/49U1Xdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBlMd7AUMH7mHkoFjhXMu9zeDbeeYj8nlmnqqExR8MtZP+hvDj
	Ldop0IQy40lVGVLZhHIhX0NdGJVGXDtchfigag+OAl/CXS8fTR/nPVBGephvhgY=
X-Gm-Gg: ASbGncv4+3VUsHnnyXNh7mwlOgJ19kgi0R3DL+yE+JhQuICwJXIQ31XrJjk9CB26bmv
	KxlVOhyYR3x3w1Ebwd9ChpRNkbM3dwnnVyEybEV71L9aB31IduOzL9M/Bdc9vnv8Gk07FKPGLQ7
	AQ8W9uXwLtt8L2F0JLeb5Agkg2/Ectf1JssEmtPyUzOerQlPXohdSjBGoqLuLoxvXP229rw8xSb
	8DS+NyCdHusJ7+huhypGty71cwp7mBLOy7Gz4bRbwd62KT/k2YA3AcIoeON3ISniatbb7rCDnvF
	fPxVYksWslyUbwzED5iVPM/5ucWQAXrGDs6+Gh7YMwA/Sw==
X-Google-Smtp-Source: AGHT+IHreIZwzg9TVSTEmBpk2mrA1QNuEKFUEw+ZtdCxQ4dopKGMwZ9mLqKa2D9lb6EAzaR8gqchzg==
X-Received: by 2002:a05:6000:1446:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-3a099ad46a2mr1385443f8f.9.1746175219587;
        Fri, 02 May 2025 01:40:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b0f118sm1482225f8f.78.2025.05.02.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:40:18 -0700 (PDT)
Date: Fri, 2 May 2025 11:40:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] platform/x86: oxpec: Add a lower bounds check in
 oxp_psy_ext_set_prop()
Message-ID: <aBSE71VKfBlQg_fZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "val->intval" variable is an integer which comes from the user.  This
code has an upper bounds check but the lower bounds check was
accidentally omitted.  The write_to_ec() take a u8 value as a parameter
so negative values would be truncated to positive values in the 0-255
range.

Return -EINVAL if the user passes a negative value.

Fixes: 202593d1e86b ("platform/x86: oxpec: Add charge threshold and behaviour to OneXPlayer")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/oxpec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 4b48f4571b09..de70ca7e8493 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -582,7 +582,7 @@ static int oxp_psy_ext_set_prop(struct power_supply *psy,
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
-		if (val->intval > 100)
+		if (val->intval < 0 || val->intval > 100)
 			return -EINVAL;
 		return write_to_ec(OXP_X1_CHARGE_LIMIT_REG, val->intval);
 	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
-- 
2.47.2

