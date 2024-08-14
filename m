Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B371B3748
	for <kernel-janitors@vger.kernel.org>; Wed, 14 Aug 2024 18:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723659183; cv=none; b=rop4oDg8MmLCGoBGbCzxDcAAp53WzXHTVY1sdwf1I+nYM+KBNrb/IkzjIJsXR223ghNf9fFm76wkbhYUzFl6AFq8VVdtCt2Sl047Z4zbe6xK2wnOgO9QTRpJsWdqz6cJ7+lxB+c6ra0psPwQACY9WEfN1fkgpj2YLSu7SgUYeEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723659183; c=relaxed/simple;
	bh=YI5N+mtJ/H+BnmIBb2YDCx4YaQZcZE045gxSMKjZwpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyuKoyYtmQoB9EDFmIKV6gCYtDp3SlEoWiPXYtX5pfGhmqSu8oF6o5u/OkT27zm64SuWzV2QKU8Tr69cUGAzXItUYVP4/k05AvwqEiiytQDw6BwfaCWwHQ1K8FabJLblmy4zZSaenfBRBGq6/PoJwX5no/ixsh7U1Tqr9aaN1k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kiLQx9WG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kiLQx9WG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso541695e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Aug 2024 11:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723659180; x=1724263980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQK4WIFJlg0Pr3bgPWFxyO1pMRbjS6HS/s5fZNGBJFI=;
        b=kiLQx9WG3yNdW5+TTje9dLgJk/phU8DHvr2BohfRLaTwjdgn+QJ0I/kUKFdKaXiW1B
         +cv6uvXfL2URlOEEb/Gszpx9/YIEIOKrfBkEx2u0DiJ0sKHpX4vUebfyrOa/TXnIq1ta
         5nFnoHFsuKEZdJ0h/1D00yRoimghB3x6jwlgnYAvcgmtwhIVrH+Th4poowq9AMNOz9ag
         7MHGBjuzRWaH9RA4qwkUgG4iaiTj9zhOftY3MrUsbZyo3MgKQeC0EXC9FBnLSx47aw49
         KMPUTxYIgJrLS72Rd/xXLOTITgQ5VJtbS9ssHW3S4aWcDrp6uW8FzXV7USsE4r1kSDkK
         i8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723659180; x=1724263980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQK4WIFJlg0Pr3bgPWFxyO1pMRbjS6HS/s5fZNGBJFI=;
        b=NaBola9GTybZz1vQ/E/udcI8XnuiVacFHHoyhxNa6BhUxzsKg2x91ir7cse5l2lOlB
         gU5G+aoA3p1JORW7roYb5Q4nrcaJDAh4iP90Ahk6hI9t3nIqFMq9TazcPBw1mlkXCirV
         yCJocgTsbt5DEghf/Sxt/5ZPrC3ow6KAObQCZ6d5fFleMU+vNO/mP9bz/lL+f6VGw9j1
         NdM/gWGasli7haV8BpPGPs6c8exHiCMdT/Fg/UgA54Vx4VjYkb5B9GNSfGJoncRMHPJd
         cbyI4zpFnw1zSBssrhpUTlNcyOujWoAlFPrj3kt21eY+TV7CjdHkdbULMoWDEsJuTAhG
         jjZA==
X-Forwarded-Encrypted: i=1; AJvYcCVTFxw9RGI4y5xtAqkJST5NNRtug3pVfTekMhktHGuOJJn0zPwcz6JPJgAsDc7eJxTJ6xtxAwBH8vjGJNq+FTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywni4LJmDdWFAXgtm9s6UF+lsaUYz4l3KS+uc8Lg7kkflU2p+Pf
	V2ksfxNp1wVlI3AraS45rjv1gP0mZZEq7X+dJUtDdTb+61Gc9dxRPoGKTvxBgtg=
X-Google-Smtp-Source: AGHT+IEOjDl/BhuqBsL5bqiwHpll0ReohyKa3GDN2uua1LW4Bqs1iUfsJncFiEThEd6hW0yeN/pgNg==
X-Received: by 2002:a05:600c:4593:b0:426:5dd0:a1ee with SMTP id 5b1f17b1804b1-429dd22f3c0mr28925845e9.2.1723659180036;
        Wed, 14 Aug 2024 11:13:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3d4d9sm27292645e9.27.2024.08.14.11.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 11:12:59 -0700 (PDT)
Date: Wed, 14 Aug 2024 21:12:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Enno Onneken <ennoonneken@outlook.de>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] reboot: add missing break to switch statement for
 LINUX_REBOOT_CMD_HALT
Message-ID: <7bb6e1c5-8ab3-4d1f-9e34-d231f0684572@stanley.mountain>
References: <FRZP193MB2563F43FFC350926C0B7EEB1DC872@FRZP193MB2563.EURP193.PROD.OUTLOOK.COM>
 <750452a3-ac8a-4af5-849f-3db83158a1e5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <750452a3-ac8a-4af5-849f-3db83158a1e5@stanley.mountain>

Please don't drop the lists from the CC.

To be honest, I wouldn't bother with this patch but lots of people send lots of
patches that I probably wouldn't send and I send patches that they wouldn't
send.

If you want to resend it that's fine, but the commit message should say
something like, "The break statement isn't required for after a do_exit() call,
because it is a __noreturn function.  However, other do_exit() paths in this
switch() statement have a break statement so it looks weird.  Let's make this
consistent.  This change has no effect on runtime."

regards,
dan carpenter

