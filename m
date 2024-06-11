Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264B51779BD
	for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098204; cv=none; b=GDWLxv1AnyoVmsdTVcgP2HY2LOzw+1l1k1GiwoKaCITj3vJn3vhrpjQOfkXvmja1FaNkkRy1vT6pvW45a0Ifh5wckCbvFDXTg/UnMhsASklP4I3XWkdpIrm0D+eWAjZewESWAj10sWYhq2M92GYtDrlJK3pXIhfAIV3tuH4ZByg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098204; c=relaxed/simple;
	bh=sROeVyOWP8ju/1YuUGlfVA/lz/40KedsP6ga/DvrQF8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o8kyhv5xJyooUxQmUXwpRaXpo702N3Uuf/qm2SCvX2UIM82cKxGUxzT9/Nx8mhBUsQDvZuZePtA7FQFD8sU7gE885fT8l+Wc9imJkcfQKPOxc4jO5fPqGinSJAcYdOEGEmYo5IE40FpvRvz3c3VsFD2oUmVlGMHtsAweFGKlu+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ySUr6KHe; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySUr6KHe"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a63359aaaa6so772533566b.2
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jun 2024 02:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718098201; x=1718703001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDDStHJVnEvxpIADP0VNO9TR02kZEk+naFrQocyHQd8=;
        b=ySUr6KHehSVM/JSQDAKt4Nh8ytdWYocy/Zh0WmcTLxzv+lLBWIO4zSHmFd+ruO0YYp
         HxhSUvWOxE1pEWXiRJEn1yFxIy2nZ/BF2Xix53dmugbGgzqCC8T1lvo1N73UTkmPS/HF
         YBrv0s7heCJeO7BCR6jpiyJCYWJVhfkvSZm7P6ywjSUIa6ESTF8WXZAKNt6IOniSlwiD
         zga1TiAmzUFkch4amJan8tQHsYI+W0UB3zLnDkRJv/b1jKP1bTOtw0p9o7pL52+AYyuO
         2SIwsvZ+nni/3/E2RCOCDEllYRv3FB52nD2rszSLAv36/KmpQEbYe+hXJlWXKYX6+nIs
         raZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098201; x=1718703001;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDDStHJVnEvxpIADP0VNO9TR02kZEk+naFrQocyHQd8=;
        b=etp3uxhEWJmMj/e5gIfuJaSayYi5iCmOWw/oLLCPXeWQ9ielFAAd2P4Cx5Ct5SXCUm
         5km3dAY72pCRz9K5O/FQmdJqPevt55XTOGm3BxmpZo6SEivmTWXMP4jaO/MVVxUmSmNF
         PKPB1px5f8/rbmr6giEHgn1t3eAJib1rxPLK4MGybZiqV2V2Ua68mD1gP/k7nuEk46dz
         9x8FhC9AH9ttanihqCOydusv47iRnIYF+UBUcM1IiAhiJjGBUp4H+94MoB4OQuNg5j4+
         3uolJziaicEcqr8IWlv0FzI74RO/8dpRABt5m3x4JjAgzrRBbntkWmcf/oQvb2FcoCFw
         +zNA==
X-Forwarded-Encrypted: i=1; AJvYcCWpJDsJhqIrMAcurDUUqp6SPHebmo178378U4gkDQKBiWqTLY+OqBxQwH2DdWJccRKIFtkqQthyE3QPTm+LCAB/hgHf++zc1WSI2cWQr033
X-Gm-Message-State: AOJu0YzUHJz9Jg2CBDsdobReb/OnqE4sMqwxOzXCSFJlqJQbn0FvHgcV
	MELCbpbeVVq/baDcb43yxXebv+BL7klSWLSq8G7Tzwzdl3nPMzxLiqvImbSYMyI=
X-Google-Smtp-Source: AGHT+IFy7enofklQCZekReZQIgYTREHNstyvhStXcx3ghHAyAYVYwn36q+89r7o1pxmzUZJ0jiWVjw==
X-Received: by 2002:a17:906:e0cc:b0:a6f:1872:4e1f with SMTP id a640c23a62f3a-a6f18724f43mr308823766b.77.1718098201313;
        Tue, 11 Jun 2024 02:30:01 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806eaa4dsm735715966b.110.2024.06.11.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:30:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240610-md-drivers-nvmem-v1-1-c5d378597cc7@quicinc.com>
References: <20240610-md-drivers-nvmem-v1-1-c5d378597cc7@quicinc.com>
Subject: Re: [PATCH] nvmem: add missing MODULE_DESCRIPTION() macros
Message-Id: <171809820035.51273.16981931013045082641.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 10:30:00 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 10 Jun 2024 15:55:58 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem-apple-efuses.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_brcm_nvram.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-boot-env.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> [...]

Applied, thanks!

[1/1] nvmem: add missing MODULE_DESCRIPTION() macros
      commit: 43b4167fcdb91a57d6102347a6f848285aa214c1

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

