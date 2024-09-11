Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA9CAD24
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2024 08:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726043184; cv=none; b=CPhm8PARnzpYBSXYT1lJKD8pC7pM5kcMmdlnRqTLMisRfbMg0rE9/7OjqhXYa9fjbiQFzIG9mQPoJJPxrYT89lZZiMDq3Kci5PnxxAVVc3tqybkN80nFPGNX2dX7r0z4vVD0fSqW6wM4/BrvwrplZCgvg/K6htrwn0idy65bQvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726043184; c=relaxed/simple;
	bh=AG/8RtBynRt+mEGh3AS9RZKy1USA0iGqiFfWqJqmzDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vw6EyV9PIFzL54ZOEsTJkOtSMPMGAvZLpnD5wEdkmTNqAaY8wRk4hunb7zFyd5N/ojC9/8ubufX+OtVYpgBf+qnh9/Sbg/saK7yIUKBCMqUD5Rb7pdXS95Mqv0RDm58mc4ro0oIeAajXlncdzitmDghq7SmW/IfyZ6UQ46rElU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+/B/r9p; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+/B/r9p"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f754d4a6e4so56620691fa.3
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Sep 2024 01:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726043181; x=1726647981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AG/8RtBynRt+mEGh3AS9RZKy1USA0iGqiFfWqJqmzDU=;
        b=l+/B/r9pkHmvXFCMPAHD2+7MjpS4StaVWBnqaKS7Hua6CBpT7ezSS8waIPqIrjWDsp
         Y1Ecincx+V1eu2FGEb4CVzeYOTvgSQphXfKeAoxXNtk/wl2Q+/kwp1FqkDdJEd5g+C7x
         UWS/c822jhx9Yu8DB8c0udkEZUYfED1g3FqjFAJ9cevYEkhEHWauK/N9e5LK9N4eTwQm
         QfFdfVk/ykVxhB/nDg8kVkPtbVKPLjX222G5VZvoLsW01ITCACRrUsJXEzOXOhfTmaYI
         2zoDlQRwUPQqpdeNGbf2UKqu9FSc7gn3I/Lmf5aucmx4Ww6ypR/3m2kNXsj5kDqRAH4B
         EQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726043181; x=1726647981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AG/8RtBynRt+mEGh3AS9RZKy1USA0iGqiFfWqJqmzDU=;
        b=rbUXJImyZQAS1kuQS29xOJjTZ6BFxm8kQwFuyhePkg6q2wuTPd9hwNHS4W3KxrL4ES
         iBE/uLpvuUbL3H+Kam145An/kU1dKnEQ8mAcGIDQXUPpzPdAflrgV7aWdHfVlHCwzFCZ
         1xPFQSmJZ41kVpcgcbOdx0P/YuMnob+mre4Dydu1evPEnktYc1neMT90nNwK5/DCRkgp
         rx6lKgT+3T8H2i3LwcOkn9xVUcX7Swam98+3QCWom95AVhQ+vH5qeEIpc82o2Dx3/7MS
         UKomaYRrfF4ECX0AdrO93AmwfHycalo6i2kwGRqGy1IIY/oi466UxMIkuqaLisZxgx54
         rkKA==
X-Forwarded-Encrypted: i=1; AJvYcCXWOD+yrg9N+4yEQmALN3FET+WXl9OLYgcXMTrXg/x+EKcnNpV5xykr8TuvzbGgpRh5Y3WU3oME1WdNpN3lAI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQOVTrDH3uNeNTD1GEVlWQD0fB6j8TVEiwrJ0XUSSyxuk92Jxh
	FWzFDbU1qDmh4qIUkosnihswt5l6TB5qQGugfX+PwJKtOixa818GU9V8BpFS1Ld20OCMSS4dlnw
	pbDVHTQnfFR53T4WpONWgsH9hIlShtfn42+Zn8g==
X-Google-Smtp-Source: AGHT+IEjiTjcEZy1dr3ZvMNOud/SL7eq3MhGmRuYcQFWDTE2sXgqA6CmAkpweizSlnMP5APvFB4W7TkNG6pa7ib+fuw=
X-Received: by 2002:a05:651c:1541:b0:2f7:7cc3:306 with SMTP id
 38308e7fff4ca-2f77cc30691mr9511981fa.17.1726043179612; Wed, 11 Sep 2024
 01:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909102907.9187-1-algonell@gmail.com>
In-Reply-To: <20240909102907.9187-1-algonell@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Sep 2024 10:26:07 +0200
Message-ID: <CACRpkdbbB3kMYvFTNSa_jhAw0iQHjFU+qKZZpY2goRvwL2hycA@mail.gmail.com>
Subject: Re: [PATCH] arm/mm: fix typos
To: Andrew Kreimer <algonell@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Sami Tolvanen <samitolvanen@google.com>, Peter Xu <peterx@redhat.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 12:29=E2=80=AFPM Andrew Kreimer <algonell@gmail.com>=
 wrote:

> Fix typos in comments.
>
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
