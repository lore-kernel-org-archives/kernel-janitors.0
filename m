Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E974F26AAB2
	for <kernel-janitors@vger.kernel.org>; Tue, 24 Jun 2025 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793908; cv=none; b=lPkLaRtdF1cJOhEVj6e/nw7xWM7mmJoqwADuIetpMkUEvH2EmHV54TDUQdSer6a2huefy2Fm6KcOxufo1AItznFZaiA3UiOzm0lInmzg+W0Zbw+4A6HG7iNrJxOUqJkCeHu0AZe1Heiz4g54gHv91vXQ7buAKx6NOrYULOW1bt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793908; c=relaxed/simple;
	bh=PARCicHmYXXJJvSHq7BdmF6uTuIvXzj1nSeDATa3plI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZHLrZDE3d6mXVNj7Vrsp4Fsbree8SSYo+BjWp1X6o6rz6Xy/rKVGMDwCty1BUkUpk1bsiCh/6hxQj9ddNhNude3Ev84cmNHjjSbMwVq/K+vULGK4QluLFm0WQSRE7LMPX9pEN+udzSoiW8gMknT/A1BtJNM8CgGLg0sUc4pmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aki1tteR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aki1tteR"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b16a0e38so889592e87.1
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Jun 2025 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793905; x=1751398705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PARCicHmYXXJJvSHq7BdmF6uTuIvXzj1nSeDATa3plI=;
        b=aki1tteRXCS+F5x8LBFn8t48QV6TeIWhTzl8CGRqkDZ9AaX+uqHJGOaGAEHgb5EGQU
         K3SVB+IOVEX8gCmQTuNp2U9O5/HE0SvltTb5PP6xUYkkfjCrdFAe3ATvVrZ3BI27sWJc
         yJx+tzSVHz8qpKs3PyPQALkxf4pQvLALyuGQL4ubf4EXsVFjFeewg+bPcnXwUUO7LWH8
         IyhhGdJsNpFJ2/I5x1cw7tar42Qj+dDCqV1YH6XOn+h7OhIsXhraxYoZe/SivoxxPjfI
         eIfaVqxpOO4HVRIJtG4DUN4+1Dd+xte04tPs1Kv68xTtM1LWA5gCgKIplEnoAdefp2Pp
         Pi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793905; x=1751398705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PARCicHmYXXJJvSHq7BdmF6uTuIvXzj1nSeDATa3plI=;
        b=CAkoRt5ZIpVPavgmEnnRy4cPGrAcUD4oe0/IcUhwTmMKVER2DCJG1r8IzEM51R/Y0C
         +myaEskTFPFvpjb5qEK8CoC0WvIQrB6yk7/aG/4SJKgE8TP0g8x/pTXI4snSXZGmqUya
         T+mEzYkpsItf7Ypszguh/ftXIr9QiviO4oVq5nO1pFjoH+soPgBcysRYcA77Ax00b+oz
         qBEoD2IMjNhxMsPcNq90IxWH0nQQw/+cx0B5rd3QNqy5zSKVIaEMbVAJvvK1rBOwJo5r
         rhGeSUEndTUMW7+LK24ivjtXc7GZn4oHmKq8DAMN0QvymhMIqMICXw1mnXt8a/3c7f6d
         l1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCW2EVkVROeyRU//haR6VUJhI5aa8aF6+LG7vdsOlCQHtWY+LNv/LMyH9ADGMMIo+ZOYV4zu4Fq48SrNGxv4EJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFS2PgZ6pirivZJkeI/1pNISUCDYUidb2tpojwms4z6WdQRKfK
	3l0/wKMoW3zZfaAvUlgZg7HyKbK8mHBb8FDjzez5lqcc6wETrUCf6+ZbcQc92sxuw04+UOsgvRf
	cCEn9/1FGaEjxAFgHHVkIXjAjB6VogBzWEWUh5LLkpQ==
X-Gm-Gg: ASbGncvOJUFuLVaQFntaYQtfhM6/eNnfs+9auBseQDoxsI/GQytmPGUwiyT/8DHs4+t
	R4QbtECYM3nKjUavIvti/i9eV8GJy/gP4cHgjK8R65SaLvfpF/coCQSpehLRMynaUC8Na2Eihi6
	1m4tUtbS2hkjvFCv6HUeOf2qDTXz1/HS9G2DMpFwVShMc=
X-Google-Smtp-Source: AGHT+IF8PpIrRaMkAe8YKe+Ia199YgjdboowW+LWa9jRIpq65y+WGtSchVD5OIWSHr98VSpp70vsXSL+42eeml7U0lk=
X-Received: by 2002:a05:6512:124a:b0:553:a456:a0d4 with SMTP id
 2adb3069b0e04-554fdcfba1fmr47355e87.15.1750793905089; Tue, 24 Jun 2025
 12:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623222004.280928-1-colin.i.king@gmail.com>
In-Reply-To: <20250623222004.280928-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:38:13 +0200
X-Gm-Features: AX0GCFtcDtI8whG-VjAJ07P3Ge7S8tTBWu6b5QMCPPumR2NvUwbFL-CwyFKH6Iw
Message-ID: <CACRpkdb1voqurnhj7TX8h1GPDO9ER_3JyZkDusJ8hz45YzYzHQ@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: eswin: Fix unsigned comparison to less
 than zero issue
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 12:20=E2=80=AFAM Colin Ian King <colin.i.king@gmail=
.com> wrote:

> The u32 variable voltage is being compared to less than zero and
> this can never be true. Fix this by making voltage an int type which
> is the same type as the return from the call to regulator_get_voltage.
>
> Fixes: 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Patch applied!

Yours,
Linus Walleij
