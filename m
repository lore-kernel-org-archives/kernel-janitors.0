Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407320B7F9
	for <kernel-janitors@vger.kernel.org>; Thu, 20 Mar 2025 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458416; cv=none; b=HdD51EUGiLQq56obEPJm/X5Ua/Jv/Kh3BOtgkEvvV4eWqFUaLp4KcVOUTWgEtfrrcseEOkjuBleKHanPby8AJvTWqkGqe29gb4GE1B0SQQKfTZ27wvwF26B94CcrD5yXnZTWN3CSkyB1Ibt5crE3GvYIecYC4xCe7f0ZLaZuW88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458416; c=relaxed/simple;
	bh=6Ji1RBIOpRF3KKxjONADrWSLZ8hGYxB9lOHKQd1SPN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvSl8xU2+TjWUgUrSbyIKTlPAVITkU7U1HbbTdyemz2AXKJgjgXbbo3+vp1OQTh6Y37y6xFdp9fpJ1FAu0UTozQjdGVwFPw2LFfohoAihooypBPrUUmKmhEZ/GrQbX0lyflBR4VQJSYkBMqwP3UvfNA6QOyPRk+KMK0r7t5RsbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWhxWzso; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWhxWzso"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54acc0cd458so683371e87.0
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Mar 2025 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742458413; x=1743063213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH/3f5Dac1JZ7PB6fCTYluQ28FDUu14YKXsBxY9FGQg=;
        b=nWhxWzsobggiluwJCxbDVfDnPmsDCfvAABhSrHVU5Iw1vBbjUXA1W/RkeIUwka7q0N
         i37OH3tnLf1Na42ip7whz+23z+xpuTwg0QViQMQwueWsGXdEWqesVJxYMqg+TJdEVK2I
         5G0wFEosfn1XtAEaq7eRrnQPdXuUE00Uhqhr3tGOZgfcTOKv2Ew2yHN5BudbFdfaAwaa
         NdTs6KcEJNc9SB6rTscuRJwz4pfJ8tHKnYRvx1+n98L8LOa35gjHvGaFZOMYrA2xQpbJ
         n/RbxVB+RmoqP9WaTzEpBCtVho8h9QnZmSRDU8/VtvbnKWUWA1ynSRyBGrAvJ1QkgRaB
         AcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458413; x=1743063213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH/3f5Dac1JZ7PB6fCTYluQ28FDUu14YKXsBxY9FGQg=;
        b=uyRGF1NCS1WA1SiHNHYiYtW0hT2kTj/cnmSm4b8G7tgCo57t0pbvmRpt7zZbgqdLk+
         PGEbcxoYULY/Ls2H3XVuNAYp3ZIRlRjitk9Fgd/Tkys2aYnKOiaRoRs47PafYnSQ0Uas
         Tu/Bo9WDOh4AHm53P+hOD2S8JCyixpTpDmw3U9XzQ8ah6599I45O7tMGoMrFU717HCBF
         Zm7sLze2icYXwpvh2nFkbgZSTS1XlwmoBGP3EmXGI2e5RfTU7o0tGND7VpcqnL+nTC3O
         2LRlvreFDImLeKw2ViG/VX1UFptPneY6lo+EVGkYeMypD9pK3QUYkqvkhhKKirJfq2NY
         HWJw==
X-Forwarded-Encrypted: i=1; AJvYcCUq2XPkKUyOVUKY8MYS9zUzQShB4lElJzoEj35GKN5gSG9ZQJEY9W+F9L1W+zSJfExgVIh/lGO5ertKAvlfkks=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg45eORLIjHi5LXNT8WiBXr2qro2GLh7JhOTWw0K0rJ2bwpO2Y
	WvfU9wmRn5Myrf/zC+R7oklSkCJQBjxSg74xHtG51UsC/UDaDUhVZuKZXWqCZxt1XKsyhulByvj
	fwM2oXtVb0qnXMOtEr+fFr5/yfbCqkA0VcSBPQw==
X-Gm-Gg: ASbGnct4AFGyEz9DPRerCOI+a5Bzv59g5aOs11Tvcr4hIco25peYtFNKIlL3FyzBKZW
	HyfI/kCdte/61Imc/GNuzl4/7T4d+A4RQYnLcUv/ihec/VtzK7OcKbPTDlWqKguJLzy/8TcNbvQ
	hpVKXsB4tTz8wfZ5TA5zkfhN8=
X-Google-Smtp-Source: AGHT+IHlRAMm6DHFmGnX4O6qtM7WU7UfemcO1DW0vJWDefpFUiW/wKer02pkqfNiLKCodEdnMprWlIdw9ApK2Vl4254=
X-Received: by 2002:a05:6512:3d27:b0:549:b0fa:6733 with SMTP id
 2adb3069b0e04-54acb1fc7f6mr2205401e87.37.1742458412840; Thu, 20 Mar 2025
 01:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <82b40d9d-b437-42a9-9eb3-2328aa6877ac@stanley.mountain>
In-Reply-To: <82b40d9d-b437-42a9-9eb3-2328aa6877ac@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Mar 2025 09:13:42 +0100
X-Gm-Features: AQ5f1JrO8Xfjg5ntIWbaCB7qZbTiTVkH-WMLNIyd4WNCkBTjqRZTBB1zv4h7_O8
Message-ID: <CACRpkdY1NhHQ43L+pAoC6EC_ydJKY2u+P=nhNAgo_Gw9McNngw@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: tegra: Fix off by one in tegra_pinctrl_get_group()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Prathamesh Shete <pshete@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:05=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> This should be >=3D pmx->soc->ngroups instead of > to avoid an out of
> bounds access.  The pmx->soc->groups[] array is allocated in
> tegra_pinctrl_probe().
>
> Fixes: c12bfa0fee65 ("pinctrl-tegra: Restore SFSEL bit when freeing pins"=
)
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks Dan, excellent find.

Patch applied!

Yours,
Linus Walleij
