Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FFB13DDAF
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Jun 2024 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718805261; cv=none; b=e7wZYrRV4meMswjKvUMSXs8tlwEN/16J+8qGlqY3VbY4LXMQTXbziRrrNarA0UI/jfI0QiHK74kqn2m04MqMGIKxEZe14kh4ncHoglRtMPXN0UOpkp9FzHfOudkP9NCkd5yveOYj1Udsg3dwZgtebtkwRZY+NGsr4BXK5FJtcSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718805261; c=relaxed/simple;
	bh=xpkqazG6++afbEk83vkpLmSWnTiOgnZWcv/jTUALrv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S5+36f4K6kml7ln9G2M8WC1N95bio8JTg3cvlBJ2yCXSAsUcjYu89xpI5d6PAas4mzh2ygzA9sOomCVQkpMKOg/Useq3ZIGUHfZ7GYFUGFqBUI3fDqprcSKkfZK8VMcakci8xxr8fxKl2op0FmgTnVesypc5cBacqrJIdMUIbsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=MaRiY4d1; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MaRiY4d1"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-6fed6e899cfso75166a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jun 2024 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718805260; x=1719410060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkDHd790kWmtvQ6UF8dcb7gjO3oHpCPMgBhaS8+VJfk=;
        b=MaRiY4d1qds/DjlSUOL5kNPU06HRjIVvMI2X3c0KSILjOdFvT1tgkbo9kqnO66OMtE
         yULRsb5fu8+FCt3qk5SLifHsNRkSAB9wRXhzd3JPr6lXAJ5s21REzaw244JLdgcHPREF
         oXKs0LuggaEzWFkIjKtEfXSxGpFI44z/5fzbvITZpTdP+h+7OXKbWIsspd35nYywlPb7
         HHwrtjyiJfT6AAZlRbOptU0djRGrL3ewLfyW38z6IDmCwYGfIVke8yj9Wv9NluUApu7D
         VtGNFHhVxvM5EKMApXwTmdVugBQZ6C4+iqUTAxiiztkoKSn3gqoYpk5A/nLVhG+HMa3y
         tmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718805260; x=1719410060;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkDHd790kWmtvQ6UF8dcb7gjO3oHpCPMgBhaS8+VJfk=;
        b=sX4cQ39hGLKJ3NT2lTiTbBAN+G3J37FyJ5Gm80nUP4lQfM0pGr0DBHc9e0FAfepXWw
         Pdh5Ey6+evuciNYJtGivJ+9hD/9lGQ0zFS3fAzKOCEbbeDJe8geKGhOUKWk2fNZEUT0A
         eH/Qp/Jr2vL2qkdEQiwscdBBUmzPo72HHF2xKIOpTI8F0yye2gL40sUbmrucnBxXztuv
         AzoTOC9qiymj98BpJZDzIeW8heGsjziTFFcfqgf8TH75RkVRQuR3qyLCkSB2DHK4B77b
         1XmF5ewoqjW11AwIUAwXQ0GsYkfmJ4MwcKn1EEfaQ+q6PyZhedjuF44d5agjNjGNYDUf
         xp3g==
X-Forwarded-Encrypted: i=1; AJvYcCXubS1SEH+3ER1IBLSkkaa1m/luuyO968VkQAOEECa4KF8bqlgGLcNwY0Fv0T2/PbzXQ11/3IOSVfIXSHSHbwVELU8U2oerN4MeiPqLMOhq
X-Gm-Message-State: AOJu0Yxs7W5vfK+RcC9qfnbU4yErEwmd6UT0L3huH5retfGotw0cyuym
	eamf73i12L1R+avbHmBv8ki0o7EkWz99VTV/gFZHdIozpFLEOIyQaXD/A05un0k=
X-Google-Smtp-Source: AGHT+IHa5lmBL3cTRn8I7U6f9EAY1cpzPJyppZPZB1ibCn7ith2thKtjx5wQNTrWrGQBB2QxHoKaeg==
X-Received: by 2002:a05:6a21:99a0:b0:1b6:d2e7:160 with SMTP id adf61e73a8af0-1bcbb151a6cmr2662623637.0.1718805259647;
        Wed, 19 Jun 2024 06:54:19 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e56183sm116843765ad.28.2024.06.19.06.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:54:19 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240617-md-m68k-drivers-block-v1-0-b200599a315e@quicinc.com>
References: <20240617-md-m68k-drivers-block-v1-0-b200599a315e@quicinc.com>
Subject: Re: [PATCH 0/3] block: m68k: add missing MODULE_DESCRIPTION()
 macros
Message-Id: <171880525880.107379.10461906104688825511.b4-ty@kernel.dk>
Date: Wed, 19 Jun 2024 07:54:18 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Mon, 17 Jun 2024 18:13:31 -0700, Jeff Johnson wrote:
> With ARCH=m68k, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/amiflop.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/ataflop.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/z2ram.o
> 
> Since these have traditionally had different commit prefixes, I
> submitted individual patches. Let me know if you want me to squash
> them.
> 
> [...]

Applied, thanks!

[1/3] amiflop: add missing MODULE_DESCRIPTION() macro
      commit: 28d8c13830cc530996157e22ecf22def90cb7f35
[2/3] ataflop: add missing MODULE_DESCRIPTION() macro
      commit: ba8df22e25e7e906254f4f490d7bcfbe637152aa
[3/3] z2ram: add missing MODULE_DESCRIPTION() macro
      commit: 465478bb00168a7620788990b1679c5067d421f2

Best regards,
-- 
Jens Axboe



