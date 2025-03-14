Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D9F1DA617
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948561; cv=none; b=pVGE41tw5IljCPdvBc0G++MOXMGfstqEuJnf+nWLvirxne4N3hIvWO2e6djQp2G1NlJTep16e/nb7oNbGajXCj8WiuOKMkPcQZ0z2puOik2pVoVgNM+A/+3v3tYyB0oXr9De+RtCBLqWxEV5b1/UcSzV8y9Cfy1+7hQRW2dOIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948561; c=relaxed/simple;
	bh=oNB6/brWRYGDcdPEdCxCrOD4XLyJDxlEhSU5P3Fiuf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmTLFGA/bivRQMRxJ1t95OZgk3s/+RVTm5j1/iepmJs/BgPT2jAYp3+Fa/zuUOqlDO8ajx5zldv+MuErjMVisIILnBoiUzQzr/pfFfyAhCzoFNjl1aCsWlgt7ulOsnk8keLnYeaK1FhGyNJxtSbdfLpO+lMC7ON95fejfvilTzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=omDiJGhD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="omDiJGhD"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54996d30bfbso1684860e87.2
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Mar 2025 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948558; x=1742553358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBq11ylwu5R382gZxqzXZy+KZY3NpzkBPWG/tVivh9M=;
        b=omDiJGhDxS3+hUgKz1Y1jnh68d8j7Ok/WVf+jrxI8Ejn8Yip4r5u01KlomR63wMrOD
         pJT0cu5XpUWXcmotKerqrpMkYZwkjmD3nqb1tNPPasnPjTUmYKDMhtQ5Ov+Ay4ETGTEr
         cAHuDPoM3vwxx5nOC69sR8qf8fex88zpMk3765hQnpsjNqqI7FtYzuIk54SwWtOj+tAP
         fXGoulDMTPdlvoe6WCIwA1NWxgLjgXM8OQ86jdbGaAKiNrLvNI1iuxg0s19Vkrc54mQY
         vFT3Tag2hNGU2pKnt9jE8TbZbWpRu+LuXspJ1N1NNBK6In2S4uX3L9UbMYSiimQ7Hf8f
         ppXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948558; x=1742553358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBq11ylwu5R382gZxqzXZy+KZY3NpzkBPWG/tVivh9M=;
        b=GRXnfgYfqZGB9EcLLkGofew0v7JnwFONlbBbnBb7T7Vc1Xf5lnB6J1XghOHwNmVQw6
         mlGwJIGbclan5untWxbyrBcLmQKvaDXy8UwQEHgraDJf/FyUgsQObqhObFshUo/1goEa
         UVSw+ADiQDDDiZwamyYIpVisw/EKNeO9a1gDtOFBN6GgxsUP397kyuRWj/5UVKVIVZLM
         FdgBYTKymZO3yTR2QSHE/nzYBGI9QfVDSszEBq9aidMfSB/TdyF6tRwdJ51LFgEXla2J
         JyKfjTy5oAKbIIbL/OeTHwHMv+epUVvKjFTsK+5REklQ4lz4+yPB7rJqQ7gQ/FYLu6Ik
         LhUw==
X-Forwarded-Encrypted: i=1; AJvYcCWBc2Iv6iRl7NYuoljW1kU/9lCrYxhLODjSvsUbX+16moMIrX5IsJ8fjirLWv8jTtMhYRrL8uTDLai/U2vS6K8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/sQUOxkL5REcTul741MCkxUpmFLds5AbItbrh7fBrIUr1dCyA
	DttNtyKK30GnZjRhmfToZI/gxv1t7XqOGYO9eINxDJpLNxBw2Y3Ri2fGxVUTVALyjZc+o5WU46B
	po2W//Q+i2+909gnM8k7aj92VBRlbM3772RvFKw==
X-Gm-Gg: ASbGncvX72Kx4+BO5mBnH02Ec3GYvHK+JILm5wTwyIagWRNF4HErHXqgSDWJo8PfgBB
	EydHEgzfp2y/slvvn6d0FVFQYBXfLwRhfbCYaomCybqbikSr5I9H9cobGga9F44EJ4NhXJtCRaj
	oH3dlruCCeffSlU5/7/GtXVoA=
X-Google-Smtp-Source: AGHT+IFo7a8aP8LrtXsMzS05IJF+N+ZjJx5DRyPZKzboYtcGh7BYc7nkwi3Kg4DoP3cYib1OWjtVARzILEhT3JyV8rs=
X-Received: by 2002:a05:6512:2350:b0:545:2b24:c714 with SMTP id
 2adb3069b0e04-549c3911e6bmr755718e87.18.1741948557930; Fri, 14 Mar 2025
 03:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
In-Reply-To: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:35:45 +0100
X-Gm-Features: AQ5f1JpewYNdVReOE7yOz7Jhb_-0BXB-6RAsfqpo9dfZwpZcAV2B4PUacGG94IY
Message-ID: <CACRpkdYkvTr9ijyEVSzevHdHFDb0iJTOzCS_3gQG0eNcpR7tcw@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: bcm281xx: Add missing assignment in bcm21664_pinctrl_lock_all()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 11:48=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The next line checks if this regmap_write() failed, but it doesn't
> work because the assignment was accidentally left out.  Add the
> assignment.
>
> Fixes: 60d69769c851 ("pinctrl: bcm281xx: Add support for BCM21664 pinmux"=
)
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij
