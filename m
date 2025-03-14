Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207901DA617
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948485; cv=none; b=G6mAgBiYJZJ/IM4aZB7jeNmfzFZ3ZuH+1YgDrWYRL0HV/l4LtbWzB3nqKsgbEIhFrGNx27pUpgl0qSsFzUCT4URaw7BThC9OmO6YGZRLOOLcUcUjPzRiuFSOmlpgRDPsASyNBoQaEjw83lPLbS3PODcIQi5n2arKfozLnCLNvU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948485; c=relaxed/simple;
	bh=aL0gXB6mSCGXve79f+GXoCVzELUaAGFZyR3q5Z30UuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2Hb3TybPMH4wMqd1RXsATd0RZRohYawqEFdYkisdAaqJbfYcHaDIMeAvLJlHtAEK7k9RZifRDMFxiQZy/F0bamd0pjn/JOYMzvtLofddu/RT+aFCYbofCDOiM4QUyB455jTTH3j7IxoSsE05YbRCqqil2ASXnxyHReHm/wLlps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L/8FmuL3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L/8FmuL3"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so2125549e87.1
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948482; x=1742553282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXFlL4FEs/n/rX4YOPitVgbikcIXGJdQJLDY1EsOF8w=;
        b=L/8FmuL3f1IHAid3EGYNfElweO601ecHo+1Xs6kAHjAqDaMrX8RnRwhJHnRkW1u4T7
         1bF3g9xNOYrP7h9Ku07UmrBhNuZDp10f1xLsOTRlSmMGgf12qGno7CZatu2NousSrdl5
         yNh5PSJ7FoGDYymPiJeLnEQB7M7PicuOwQD+CIqrT6rII4dgBAgam/EaC3qxArCON+av
         J686h58ZpUUcLYHRyNdgSdmzYEhCB08ETmwCaIs1fBoJ7IxviU0HFF0qtSKBdhzz6rGx
         DUwGpcals95bLPjjY1du+n0B0XECrl9vvA4bH38+slQwu+mF6/4fzccPAPZSL77OWSZf
         ZSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948482; x=1742553282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXFlL4FEs/n/rX4YOPitVgbikcIXGJdQJLDY1EsOF8w=;
        b=OWcQV65NwN0rOTDcnKKDR2uWB+pQa+a5ccZCw0zd5ngSal8ghU31w3SGYWHXEYi4kL
         jYnjOdZJk59cZG6z+FfCcM/W255UBF/36rGTyCtNypJy7QoPpqB1vQ73JzJMC4nQBP47
         nS89t6s+83jRPjvrvIsjJk1/fdct5kkJNLD4FpPViysppc8h9WL86dz6FqQveSJduHfs
         lA7F92JBBLgzoXBiXvuBVKc284SQ114m+glfchq7wcFuI8FZ5VBI+0NDpRiZe15ztw3G
         Dhb9/n8mkJjQ9/1I9JTrlOlllyJ2LdVhSpOhGfKI99X+48yXcU+Sjx6ca17HKKgYV5/9
         Ym3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV93JwZlW4MVCDKHQf1Xu+srWtDjPCtVwB0Rj/Kf1uYWye+5pQATh42MxkAHE3jL+dLtgsCYjj03Y1RvRHgb/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx6TA5JYqpFpCAHXRxuAu+PpNop45v/inFpp3zkkbw7hFZy5Zv
	SXQYF/59fIyLHR0OCMAnzhdAEHdiphfVXZj+8ZM9lYhTZEmS5weZGSaadl2oKF1n9sCb44HhWi1
	MRKwozYNRK1ibCTRGy6dBPMShqWanrEd6xyaYuA==
X-Gm-Gg: ASbGncucIv16f5NFx9JwBz2bujuQWdYr0duiPCAn1i7nEmQ4t39ODDGsVVV7M3iXqje
	DHLfOaCxxWMcyrdU7FMcHLeW4vlhEd7/FGnoa3zZOVKaXHoZpC5OMymJAcacqnl9LJP1gJjqg3q
	XY7M65embw+8CMxNZWJW0YTLQ=
X-Google-Smtp-Source: AGHT+IH59Nam3QzVYLK/m6Rs0Q0Qn2HE9pRubALNnpoj2NMRzj++gf0khsat6J38n/8gCO1y3XF2MUrlrRs2zD0uS3w=
X-Received: by 2002:a05:6512:398c:b0:549:31e4:9ea with SMTP id
 2adb3069b0e04-549c3c9897amr675717e87.52.1741948482182; Fri, 14 Mar 2025
 03:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <617f4c77-7837-4e24-9f4d-620ecfedf924@stanley.mountain>
In-Reply-To: <617f4c77-7837-4e24-9f4d-620ecfedf924@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:34:30 +0100
X-Gm-Features: AQ5f1JqMDr8pDqL2jIXtFwweqNigXKcsgGd2oHbNPaqU9RFqX-TDqejST3Ot0yI
Message-ID: <CACRpkdZkpJR--x=qgzXVmRsSexobBV9eRyQ0BecGZ4+dNBcXQg@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: amd: isp411: Fix IS_ERR() vs NULL check in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 11:52=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The platform_get_resource() returns NULL on error.  It doesn't
> return error pointers.  Fix the error checking to match.
>
> Fixes: e97435ab09f3 ("pinctrl: amd: isp411: Add amdisp GPIO pinctrl")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij
