Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AB27CCD7
	for <kernel-janitors@vger.kernel.org>; Tue, 29 Apr 2025 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915945; cv=none; b=HP765C0HkE4uYnab1n6kx7qbM6PiwlUWpZhkMu3UKpZdkqWk/OeYfvPNBYEgRMww62TZbKgsJUX1E9vRKlifEK9ofQHLIIbO2CQFGe47M6kTQrMphjznixihMIYjaYMtM58D6iUhj3dlPw/aXtRTrpHjdtlMuds9dabOZzdHKJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915945; c=relaxed/simple;
	bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWczg8P6ruBatvNaPFrtgccy/G4Y6EjKechh5Zc6wVafcqKqyNPAxZp2CFD/idIpoXG5ZyIMLW29uvcxFfHoIu1OTeJuGWsbt0zniw0thiqpqdygUnoVd4Z08Cwe7vRQMq8R+dSZdJkxmAuQyxC+AVgaiDxypBNU00BRaSPuIKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdjReSTG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdjReSTG"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso57838081fa.3
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Apr 2025 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915941; x=1746520741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
        b=KdjReSTGBvgTpmFex89UFPtuKi0R6caIge7o2xrES9RIix3CJeOEdOZGFMcpVi6bPR
         d8brQ8PDTpRDM6cE8RVQa6TF7RxLAgPzJag29qIfiwR3Y0xs5zEO3lNpYq71Nbg28iAm
         7NsitqsynazK/p3V61iGztigWAiSMFQahcXHVlGikOI9ty0SWSyUZc7dhM/RONiM40ju
         c9EGjywhnwtNmhooGGNg+ki/eQIvRLaY8hJapLNLc59yeN/NFawHKSCQkj4CgZ3NJA9o
         OLbWwamhYtKZrCTeumQd+vildwSN/hCrdb3KFPidi/RRwBRUfVw3s52ZUzuHNEEMVYmK
         pQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915941; x=1746520741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
        b=Eqyd0Gio6nnFmfXGSaKG4uTZlQaI56zfvZGsrcjyfB+qUbE+mlKNXqsVC2+hX3LAMa
         Mks/BMFAuK03p0Omd9s56X4Ds1x+A2fWFMajIGixZwwfNu+Y01OoLXFg3J45npYN9I+V
         mFxbp9MYf6sp/wVREUb1SAmsomhNpimpULKQ5eoMf0kRb1QfEhp1lLauHh5jFJXpoj3d
         eDxkh+9cddluYwtxA1MVNXF0Iiaxjy8ZU+95Yy35hmwm5/CD9N3HbB8Re7Ic8ZDZr/Ct
         0jK3WVmzV/iKX1CO+7PLBDHYIg0adILI02wSYcNbuFf9IIq4sh+UZJg0CLujk2vARPAC
         ljeA==
X-Forwarded-Encrypted: i=1; AJvYcCVt2Ay/XysSZSaL8/5Q3arbyWBj84+Z660hd7+cDTvST5JcxScdiHEtWpBaxDrmVEJHwjCDWsXI+H+XKQzbDjc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8+IVog5MJ8MRE0/UR5PsTtL/sJZld/UJutiQ0yCE2qKlucHI0
	xAKHOX3RAxWTvfd8roEuigdFED1kloJmEqB8upFJsPrr/3OZR/MxRuMogm7E/oEfduOIkFKpfKU
	C8jQwpGtlQzd+P9f4quGj4k27Oz1dU7U/AktDlQ==
X-Gm-Gg: ASbGncuwUHjAXyaiMPg9cbPdUZuRfq2DnDYCdTe8/Iii+CPxQ679IH2v5vnn3EasW/B
	kZw+66I3LCbh1grDAvt+3PSOu0ISC/weVXBUvwvx1D83ir/IVpKC+uLWiv/t6ZaLV4xlJm9vB1h
	6snwzm2TUnQHOdAWQV/yDALg==
X-Google-Smtp-Source: AGHT+IHkuz+Fr/AzkwRns1/8PwMuipfYmUnKsBB7y+2XYRW44rUzmChg+OFPShozfJlNPd9b1oQDGXqsThys/IDroaE=
X-Received: by 2002:a2e:be88:0:b0:30b:c569:4665 with SMTP id
 38308e7fff4ca-319dd7960aemr40874831fa.29.1745915940769; Tue, 29 Apr 2025
 01:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424131201.157601-1-colin.i.king@gmail.com>
In-Reply-To: <20250424131201.157601-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:38:49 +0200
X-Gm-Features: ATxdqUGYIHeg8-bt7mFBhXIoGyjQbbgQkhokYrl1ZFztjgdxtKATBXtQXvjtsjU
Message-ID: <CACRpkdZf1KgnYKXbCWEWZA4Cd748HBHDh6Y6f2OD3Oyshoe6YA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix sizeof argument pctl->eint->base
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 3:12=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> The sizeof argument is incorrect when allocating pctl->eint->base, it
> should be *pctl->eint->base. (Generally, the size of void * is the same
> as void ** so nothing is breaking in this specific case). Fix this.
>
> Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on =
older controllers")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

The mtk eint handling has been refactored fixing this issue in the
process (AFAICT) so the patch does not apply to my devel branch.

Yours,
Linus Walleij
