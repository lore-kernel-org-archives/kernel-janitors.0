Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C5524A
	for <kernel-janitors@vger.kernel.org>; Sat, 10 Feb 2024 06:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707546671; cv=none; b=o+/RFgGa8KPTknELdr4d9G78fbt5qAsHXNu8m7oPoOaQ/WSIo2CzqmH243ysBlucjxNLasS1wkWFsP+aNYCFoj/WvkhLteXCOuT0BH54S0AjX+xbkIXHwaVDmBL35lECqP5dd+TYw6SsnZD3Ytve3XUijzuoImCFRMrjcankxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707546671; c=relaxed/simple;
	bh=oEFPGDlqXEyocwhoWKRMJ4ziIc3upKjM4O5Rg/7Y5HQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jg0uzP8UoMNQIMhwV7gVFlGfcLrn+bgP7yoYJTpZbH/EGCpSKNGcK6LCSGBiNjAM0krvP/9zYGVB3swhqa0qMuf7Gt2O5G1XQwK50ZmHWBy3N0T4be8b0/kffGDcE650EGNT7H3fIAcxFCQxRBumy0/s9nGeYkMIilq7GDSGLqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jzAg3/bs; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jzAg3/bs"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso896586b3a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Feb 2024 22:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707546668; x=1708151468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xoLZGjYDgNhuH6I83/DOtjfO4FsY/e01Dj2umhInvU=;
        b=jzAg3/bsxEdFZwBOTEDYPTRa296mXeJf8leYMbASt09CTEjWBCAgCCQY0owH40d/3Z
         MOHcAK0MHp+SBtfPFJYGxl0Ytx7zOeSspk4V/V44Gk3PG43iCaLoLk5sL1v7Kp1JnZwm
         5oGNK6U7RhvoGGmD8NrJ89XjzOecSM6E9LycU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707546668; x=1708151468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xoLZGjYDgNhuH6I83/DOtjfO4FsY/e01Dj2umhInvU=;
        b=U89ZEeEF4QqtxVwkAmwSRPVcGNJeVGn+xybrokSbdJDCIZUQLcYgqOhSKyQ3H5dGlq
         iJav/Ov57tIKi1Yc36pI18eJqSPy1oUpmz36/PYR5k+z9pwdYLg1Atn8+x6ff2MSxWCZ
         NgJ+0C1IJxDB/N8jOzc2twQ5b63XzPAC6jtkrFH9ifxUM1LHtoJydWeeL6Ek2NWMpxOn
         gjBYodJQ5mQ3AKIkYi15hDrK9jroO+1wyOWVrENUCEbG7gowHYUKtmlS8ehrJ10dTAoz
         BijthA4cHxiawnnaPx+4gmVlPdJjU4zYtf6ISy7zq9zvcGNSLG4eoPCMgwgCgZmRksE/
         Uthg==
X-Gm-Message-State: AOJu0Yzrao8RUvnvRCPvE+ps4CB+v654Cgz6DcnGxCm4JVxQO6u5DSJP
	rChTy6YGQVEJ48cS2bjUcg6w5M7TFkQihzQtIv8ad8pN9yRDsLeW/GX0YOROzg==
X-Google-Smtp-Source: AGHT+IGIjsMjH28pAXwc+S4f0NGXsC9lvIPOn1ZKQThtlNQlz7+q0LVvVrnSA61E2r3dygZ2dIbtIg==
X-Received: by 2002:a05:6a00:2d04:b0:6e0:4b81:907b with SMTP id fa4-20020a056a002d0400b006e04b81907bmr4279382pfb.10.1707546668009;
        Fri, 09 Feb 2024 22:31:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVeR16fEjgRofT9DwwK4x/w7h70DzSFIY/iXLACRlUQdayJfSewmuJCc/Zyfwu4iS0RIK7MTqZ9DCo5WgFTvLgmHg8s7QMnseCkRupMh/7UQf0sM2oHIrucsVlB3TOT2EQVLQxirszeZNbEx09S7juFayaiRnl1Y8lJ2wwNNmVxHOsG0MTwbnQ3vRvQeYcAKxKiAut/9d02yoPayF23AUefe8pdwlBdcg==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z5-20020a62d105000000b006e08437d2c6sm1705037pfg.12.2024.02.09.22.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 22:31:07 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Drop obsolete configs from hardening.config
Date: Fri,  9 Feb 2024 22:31:04 -0800
Message-Id: <170754666057.1708532.12818016531447895933.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208091045.9219-1-lukas.bulwahn@gmail.com>
References: <20240208091045.9219-1-lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 08 Feb 2024 10:10:43 +0100, Lukas Bulwahn wrote:
> here are two patches cleaning up the hardening config fragment from obsolete
> config options.
> 
> Feel free to squash them if you think they should not be two separate commits.
> 
> Lukas
> 
> [...]

Applied to for-next/hardening, thanks!

[1/2] hardening: drop obsolete UBSAN_SANITIZE_ALL from config fragment
      https://git.kernel.org/kees/c/8ab2b5398287
[2/2] hardening: drop obsolete DRM_LEGACY from config fragment
      https://git.kernel.org/kees/c/8dafd56868ef

Take care,

-- 
Kees Cook

