Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024F216C685
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189554; cv=none; b=n3i0iOvHmMA3U53xX7rJ4/mmcTk3Yrvi/fQd4aAcOsJ/VT2WEAA65XX44SJdDRuAcoKJu81y9FE4a5DOjpXkfFwT/K5Xo8PbgRwY5vSJQO23r6BgbpUaXQVolcNrx2UlAQm+xRfWIErXRA6tJWKrzp0oALijosdE8JmpyefDUPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189554; c=relaxed/simple;
	bh=hfca2HZsexdSmcR2L0VarVPDzv56VOL6tv9ZzVNhWgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHYiKO1aZIeeLnw/5FV5Sv/5QkBrihRc4zZeIXhk9vvAxzqIPUp0a8uVyzMvp8qeJ0OWOmIn+KnsyPq7dv/uqdu0pm/kS5pPZEAM/tPyU7QcaPhUIeKazIGw21uWchchSGMvLIFVSpIpII1XrHcyN0H6rkZrwIdqeA2vxfj/o1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=re8qN6q0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="re8qN6q0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42172ed3487so39086425e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 03:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718189551; x=1718794351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPi9QkdS95dkNdofAqCFmLTLe43Jm537m7bw1KQ0ItY=;
        b=re8qN6q0jAzkaIlLcbrQD6yb62C0s1p099HEKNJKNUFhfCdsivQdXyLRpFvZo3s1Dq
         jth8zdP5iL2an0vn6WGN4a8rwYdyqrVpm2BrmxzkVKBoQfDve7A6TTNEkeiSPrJXXqp/
         qBhfPCXjH7aN+xIkKr/zGO2V7K6GRY6l9TXg+B6aXccVuLDgEXs6VWupxL0SP8HCOGRC
         nmB5WOf+RFx8htebdViPH5gsR99FMjV+mlJWWZ7w9RlycQPhwczAgVRcWtScdFxk907G
         M7jTbvRuToRzpP8HoJAw82YMC9FoPiuKLpZoLSycT0WVdu/E0Fsgl0DaQFoE+oBAyHIG
         Mlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189551; x=1718794351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPi9QkdS95dkNdofAqCFmLTLe43Jm537m7bw1KQ0ItY=;
        b=AY3mhX6kaZY4BG4X8OttkjJm3pcFDI8WFa4bub10vmBOI3iyiFAgDHzC9tr3lBAXtH
         BeVyY3Ej+8dHSv/9SgLWV2Ey4O3SMZLFGNo+gynRX1WB0p1R3yJomp30HKHoYvGIoiXr
         1gpx/GN+lS771BUExkqtq3N7eyeNxNBJc8UG2aFIuCCtsE35NgvL9B7sijWy3bgzHexa
         8IsFul1h5PooiAh/0Rovlw3XyJYl9UIsYpwjbNwjs3ZtszPmOu0a1gMyWyr3N99ApczI
         0X+71xFzMH6X0O800VY4nLdSkbXhRIA1wbjmxT5gyUVvma5sv0Ulu4rdHjGvJ7ZU8fae
         WQyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAy+XJtUhFYZoh/FOzO219+TkuZpRXCHZWLoGGgI0tf8V9vAD78mIgpitK70mzeajFpqxC3g6jxlsiX2GZIFxCsGTf190XOvvBAoYAiTIV
X-Gm-Message-State: AOJu0YwCctthQYZgFZA1vN+s6HGnCx1vdd+2/fMdtv2QLUux5gdMxy+7
	V+8rFkiHCh9nu29ApHBnyig7S8hEkc/wS0SSmgaNEnHebYhxE5HEXwZODU2eb2s=
X-Google-Smtp-Source: AGHT+IESwYJf6CJnIPpXgk18wMsSx3pKvDvFlcyAWNgt77NIwpqGQS3CGPJBRqxbG2fIpZ5+AFV1zA==
X-Received: by 2002:a05:600c:74a:b0:422:8557:3c5a with SMTP id 5b1f17b1804b1-422864af026mr11662165e9.19.1718189551298;
        Wed, 12 Jun 2024 03:52:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870f05edsm22074695e9.24.2024.06.12.03.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:52:30 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:52:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
	Sasha Levin <sashal@kernel.org>, Tom Gall <tom.gall@linaro.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v5] checkpatch: check for missing Fixes tags
Message-ID: <386af0a6-b15d-4be2-a0e7-0375e822031d@moroto.mountain>
References: <ZmhUgZBKeF_8ixA6@moroto>
 <20240611113855.b63a6015b26a0dad49d9f2a7@linux-foundation.org>
 <b3baa059-b433-42da-96c0-588312b5a4ac@leemhuis.info>
 <6825db9f-be27-4096-9723-6ad65342a59e@moroto.mountain>
 <390652ca-a383-4953-aa39-8c4ac92f2e3d@leemhuis.info>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <390652ca-a383-4953-aa39-8c4ac92f2e3d@leemhuis.info>

On Wed, Jun 12, 2024 at 11:15:45AM +0200, Thorsten Leemhuis wrote:
> I see your point and agree that it would be nice to have. At the same
> time I've seen people on the lists that don't like to use the Fixes: tag
> when nothing is "fixed".

That's correct.  Checkpatch stuff, clean ups, and patches which silence
*harmless* static checker warnings shouldn't get a Fixes tag.  This
checkpatch warning doesn't affect that.  If you look at the patches
which were flagged it's mostly because of CCing stable or syzbot.

> And it would be an additional burden for
> developers to look the commit-id up. So it could contribute to the
> "checkpatch is asking too much here and not worth the trouble" stance
> I've seen a few times (to which I contributed myself... :-/ ).

Someone's got to do it.  It might as well be the person who writes the
patch.

There are times where you're working across function boundaries or even
subsystem boundaries and in those cases finding the correct Fixes tag is
difficult.  The other case where it's annoying is when the code has
moved between files.  But it's generally a worthwhile exercise.  It
helps to look at what the original author was trying to do when they
introduced the bug.  And when you add a Fixes tag then checkpatch will
CC the original author so the review is better as well.

regards,
dan carpenter
