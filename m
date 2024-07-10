Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774AE84A31
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jul 2024 06:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592636; cv=none; b=Vnq5XkHnK/0iDGd75Gj0MVZNcW9LXERnCYJbUWGSwh09dpCSDfxI+eYZmxElGIsE12p7/Y2t4VUxspSip6QpDQ+X2harlcg+fT5rxb+A/ti/3YdSTnloJs/Vo3CHLDLtlp/ll3LlFz6TQ6ONSaHKwr0ggPVPsHAooilXsjEarKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592636; c=relaxed/simple;
	bh=6s7so5c7HOknihvumh3Haewm4qizE8uH5cVOjlcBNW4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EA1vZwNZgjB0kixUYy3yTqxE30pCz4wC4K8pVEJF27q24ICg1JWNB4zH8GclzjOS5yGBpVyljPAwdfjl+t5M4650g+DomUCzdNfuKwIF+Tqy8npRAMLQj4VGAaYwTRX5LfoqbkotgyBIF/6G7Dtq9+0h+BLsG9Oi99txJIh31zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=cAoOEajs; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="cAoOEajs"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ee9d099009so3197591fa.0
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Jul 2024 23:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1720592632; x=1721197432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=assg/spa4cOMqEpYiqy3ecAcAwnhbvPRfb3jWzWA0iQ=;
        b=cAoOEajsdhDU8va5s4PHGyPaNulXDepCAefXzmlZnAWnst8moQ5y7AQaqh1jXiBNp2
         7FOQa29N26sqz2xs3H5NgHjg2EPhZQ5rCO/UDgkpEAoRG2+BH+9K3bMd+qwXNIWgENDq
         9VLav8cwsJSYX/99U7eQ5qR7feS374tthDGjz2/mRzqy+mADE83nrHuBgDu+zurQH8SG
         sopn9KeaOoqC7O1fxdYOJvnz/D/dakD+NPrUeDkxMvF36yLdSEKWZGBHbldggjgbEPWO
         BCmofiytZC/E2Aqy7eoGb7rispIIIHC/XO/N+yi041IBqCLujFD3+1Llrn+ZI/mJ1A0R
         nH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720592632; x=1721197432;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=assg/spa4cOMqEpYiqy3ecAcAwnhbvPRfb3jWzWA0iQ=;
        b=n36tsSq4ce7nreZSgi6x9JXH1VfGdS2GkHPEc5s5W3HsT1IYIt+CTgicQV++uImhjn
         o6kyygWNOLT6o3IZzOWmiCetLBsV4ULBdukEJg3yip4zfVSxLsezxmHzz1+059o4wJWc
         55i87rdc5QHmF1jcTEtpQ1RxLiO6BT2miZPMMqCWNYxm32DZzqonaHQNcZDgxepCp0rn
         ttbQrSWBngjbePiA9JzIJRR5mVJWjUFVQZOQZU4Uy5LiCj+Td6wTMM4OMGv0SE+OMWkL
         4Y8T2/JXFNy9VCWDMdH1hLBgYTqmN/zOLtWjApdjIKuodIInsUmNz3vgkT3rcVaAfY1I
         3v0g==
X-Forwarded-Encrypted: i=1; AJvYcCWA4VfQyrwky3IlIHe4p37mwPcePdYncoy6Ar8nxGX/tFymf0PTpHU15BW+djVq+ESv6qkGX/4IfCH6Mvp0gKX58qXKnpYHtPTDU1G9BxeO
X-Gm-Message-State: AOJu0Yx1VKMvX21Pzc1bU3OmDjjw0RZ9wWUZel0B+srr4gCAYHjCAOBC
	xc9vwt+oocn2vXvzcFoiKQtr1xt2pHz0trxiVCMMBN2FOjrhzq3r80giqbFipikBDxNWTa6BHIW
	9hA+ZlKmM
X-Google-Smtp-Source: AGHT+IFrolNW5lOMuUJhl618lI6yjdNOR6K82mCSLOdcX6udq8FJVW5dASBzQo09mgslsZx9YSpn/g==
X-Received: by 2002:a05:6512:31cc:b0:52c:dd58:1a97 with SMTP id 2adb3069b0e04-52eb9a0498bmr3119303e87.5.1720592632042;
        Tue, 09 Jul 2024 23:23:52 -0700 (PDT)
Received: from [127.0.0.1] (87-52-80-167-dynamic.dk.customer.tdc.net. [87.52.80.167])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb90670b6sm463892e87.197.2024.07.09.23.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:23:50 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Denis Efremov <efremov@linux.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240602-md-block-floppy-v1-1-bc628ea5eb84@quicinc.com>
References: <20240602-md-block-floppy-v1-1-bc628ea5eb84@quicinc.com>
Subject: Re: [PATCH] floppy: add missing MODULE_DESCRIPTION() macro
Message-Id: <172059263066.380385.1122582379768544116.b4-ty@kernel.dk>
Date: Wed, 10 Jul 2024 00:23:50 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Sun, 02 Jun 2024 17:05:31 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/floppy.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied, thanks!

[1/1] floppy: add missing MODULE_DESCRIPTION() macro
      commit: 3c1743a685b19bc17cf65af4a2eb149fd3b15c50

Best regards,
-- 
Jens Axboe



