Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9190D18F2C2
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718614949; cv=none; b=Zx0yl+Qu82P7jIaSjjodBXMAIkx0FN6YSe0af22fLlmNr5i8XorAkJ07QDwoVjuN3Pfj2hawb9+ECUaOGv631SFw393/4CtpONzs3Eq1gbu9wV/O/RTvpH8Wb5FZ12QMaEdo7jTRCoausEYCPjnb5GTqayOr+ZNyzK5wOD3kLPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718614949; c=relaxed/simple;
	bh=1qnOahOGBH471qmFiN5a9Hm4ejehkHAVCb/42SLIrHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oeWC3iZIz6rPEaeMA8on5Iyl9iny/Pd1+Ey/GsT/VWcBr7ylom9bcGPrzEC9JiHpybaDF7k9xXl7ud+qHdJ2wC1bLYPLqHf6P6gAlLs2bZdQg6eFUnWKtIkTiUobsnfxhrKZwgxD+9hG4FWRnLoE4qi37En/5wvFfHUDN3LLiTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cfiY+/ix; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cfiY+/ix"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c85a7f834so5342231e87.0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718614946; x=1719219746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZKVXz9zFkYiCdmxjX5crpO8a9wB/5gYIUl8nRld108=;
        b=cfiY+/ixGJ+iQAdvoVwfqYlZJQlI5kQoCced6EYqKJ5ASiVL60wsk4NsuDg0mAF4pn
         OINwZ+nqcpjbl/UMpEOareooi9AwSvXDSCO4dUVYXU5KlTieod7LuSXtUbXdFWgDftjx
         46G1WFCD0g3PgMc2tCCPNlsLJNOqqwnOuiwb1DHX0D2ITV9dTl0onnwe/G8M/QezAHYo
         Kr4EIgDK5BRadyChTYGSk/snTgEm/SwH/6cRtU4WmjAgNbMdxDz6jAKWprXMvzss7cSo
         5sHvdczUdDPyuRHqsnyl8JqGM3Uxmr7NKJSfaFJ9mxWD5xt5Vmj8ueUYwlngtXd/7ZZ7
         JLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718614946; x=1719219746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZKVXz9zFkYiCdmxjX5crpO8a9wB/5gYIUl8nRld108=;
        b=Xza3xozbIyFFY8kU8dEC9wnEo7eAvETb7nHbeckpTozB8kUxejFPuJ5kuQ0w3xlAkg
         OVeDm7TrGnpYXVyhafA4pE5CKlansObceMvn3aVP3W0fVkbSIMRpZMDYpzampKytGTUA
         Mh7qJJ8Vp2NNYPGv6EDpXbyoZphczsTE/UuLoEAsbzrenuBdlNBMcwl4WpKy+Cb8tETo
         niziy2zSUTqt2FL9c5AP4tXKPhBGn66QJEvRuryPNVYteweZNHtKhiPPi30ALBdMGCyO
         w2rDwNZkS6i0c3w5sAO0mfzt4rExR6uP+IVAZUJdd3oUNt0hXF46UlC3m1FsiPQ68mSJ
         UozA==
X-Forwarded-Encrypted: i=1; AJvYcCWCRFZGBiP3AkNpMXZzDdAh6djvgNipUS2NpHYzRMcFqnk5XlbjnmYT0DnfGhFbLrnEZ5Shf5LuOnPkpCP+XkZ4YQYaIiHDhPjBEDV4pVOV
X-Gm-Message-State: AOJu0YwCbV9aCmg59sKV48zmmvF/pMzk663ormvr03VcJk+S2seNJHEs
	Zmwr3SLQx46MAnjFp9x43d0HKZ1JmdvYYaMcZVi+qlfNS+cOPTsAOeGZ2o7L+ltsNj2iCWGYQqN
	vlBxclCTs3GkTVFbq6Alv2jOFVNnbNInrkYVFEg==
X-Google-Smtp-Source: AGHT+IEDbmeeJPP/Lzk+VO4Yf74aqIdgheOGoGFca2Xhj3pvQTusqNkXyG4ZYxSQcu+BAqajvjPvlTSvRaLNcm3T7P0=
X-Received: by 2002:a05:6512:4015:b0:52c:b11a:bfb3 with SMTP id
 2adb3069b0e04-52cb11ac093mr4656348e87.57.1718614945752; Mon, 17 Jun 2024
 02:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <840152f9-d3bb-410e-8164-4c5043e1983e@moroto.mountain>
In-Reply-To: <840152f9-d3bb-410e-8164-4c5043e1983e@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 11:02:14 +0200
Message-ID: <CACRpkdakxbw=A+ri56t=-AF1mr6Y711ouFRfPgPj=qrSfRtZ8w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: ma35d1: Fix an IS_ERR() vs NULL check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 12:43=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The fwnode_iomap() function doesn't return error pointers, it returns
> NULL.  It's the same as of_iomap() in that way.  Update the check
> accordingly.
>
> Fixes: ecc5bf868673 ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO drive=
r")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied, thanks Dan!

Yours,
Linus Walleij
