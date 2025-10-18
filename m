Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09C228C014
	for <kernel-janitors@vger.kernel.org>; Sat, 18 Oct 2025 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760778351; cv=none; b=L7UJXFw3uUBm3fmyat8G574PUPg6jZpJwasyGfJM3TeULZRKSNf1pQ+hZRFKqUApVKtwtJ5D5lPDdZqAwtHrkcu23J1U2fCTIddhs7C8Vt14QfmIG6JmauivHQjzMAgHUMrLK02b6QgjpEeTAsGBiQKlqONpZJBxuC9Kre0SRkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760778351; c=relaxed/simple;
	bh=zMwAxL4eSaShVuEFgCEzSnNitMi745qrXYTua1HCAfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYtk5Te1piuTyxpMaQzGmaRvQuBuaMExdKnk2IcU7528PhErYhajdIIlL/QjT5MH0eSYjiJV3cEVwBBx0uIW9mg638pfYfiWhVEUbyp2FGdlJFP5mMaS4JYUNOQj2SrboXUXD3HmqAFxSFBjL3M8W622M0D70EUug/k6ivjh1mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQNVCMjD; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQNVCMjD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so1931910a12.3
        for <kernel-janitors@vger.kernel.org>; Sat, 18 Oct 2025 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760778348; x=1761383148; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6z6CG4Bzykdg3VlQO62kpKPKIN5Ed0HvWERMlLp9z1M=;
        b=AQNVCMjDhsiMoRIEKbUiUuY5x8HbHETJfFUQFW7ffMMjMMH6J3P8lSaLnq5BMl1KKv
         ZQ4+nEzo4c6k4ZqZOiMlv/Ny1uEu/X9+iMZRP6ty7FkO/zDjxld+kXKsI9uZj2MvKOfO
         HO88bI9cIiSyrh1ID7Aq48qiNvTN+le63qtRpTUDuhrK1eCBMpKiP9Ke+nY4TXSqKB4C
         OxPrQsnEeQaKZ9Tu+ztOOgTqF+/jAZcx6w72uXOJ0eQH45FdR3zcSMiDnXJRtRpnjYK+
         p7P62puVSFz4MMU2y7L3tK1Z/LiVdylPqvF76S9dZL9KLJL0mAyizcyUMEsStEXPRkcb
         c/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760778348; x=1761383148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6z6CG4Bzykdg3VlQO62kpKPKIN5Ed0HvWERMlLp9z1M=;
        b=c25/TCcLxD6KRwlnVIOljlC/UX+JI06QdvpT8pax+IqQ2RMm6HaZbCUnzU7EwP6Vvx
         90sORW5tEEFOoHYkNOQOQVjLU3ChTPYJu7xUvEskYgjT2EO7YIPVjaW5IblM1mzrZsEa
         J8Ov7RudJfzdWl/xWhrAM6ASiwX5Dt8oG28Ew2YSRbJo26qliQ9SRo9CMaCGbzGgeeUH
         OTPkkQRmsrlz4in3wsmRP4dYqDv9CyozYfxUX7TZJ/iYDdM4NkVnx97rOaOmcqCEYsGg
         vynnnQZVRYwx9q5HHJmYr+YN4M8+8HmtfTjdlJKoPvOkPb8HUxbVLOnsNtQlg8jP8BNJ
         7stw==
X-Forwarded-Encrypted: i=1; AJvYcCVXAQN3lLCvXfcT8cdTY8PP1czR+/wiGi8GiQ0AxT/BUTeSk7/pHVwIGB5cBRZtB3GY3SkkqBMLueMT/YlZi9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0jQQM575jzGzvxb4sE/2JgL6dMKiYCJ+83+wYL0Fhym6I4TYz
	nJ/nw9pTwMPweQHzWoyB9XyrFNa6knfni/b+Y+HWxafWM7M2ZEWlAQH9/hageJ762y2AEFWOcM+
	5OEfQV90tbMKwlQWInQR4DmcyFxj6FvY=
X-Gm-Gg: ASbGncsSlMhWmBWFf82wxVZ8jruVDlDs8rOZW3n590Q3TAaXDb3qHNHKjbYUxmLhE/+
	o4YLO4v2vV4elNboel7/UN9De+R8jyISdSCCN5o304rnsBjNJ7g/VG03ZDlhtLjioWkggoFWvtl
	S7aMJZuKzMFOLbf1e3sRudkAp2WgMj8e2YFdWB7eRCBMhrtfoHiVPzsHiLpgxuoQimbVUcfa6j1
	42vLzvoRyaeiDl6IFvdRJXWNL9grBtFmpGeuB4NbElY/YIZYy7XYi8t1So=
X-Google-Smtp-Source: AGHT+IEhR89+OlZnqrJ1xToJ35S4hHteVi05MGdBYp0FB9E+H5DwaPu0w+LV/8y6BXwE5xnOmNRU6JE04b6xtGtpRL0=
X-Received: by 2002:a05:6402:4504:b0:63b:f48d:cf4a with SMTP id
 4fb4d7f45d1cf-63c1f578eaamr5362961a12.0.1760778348106; Sat, 18 Oct 2025
 02:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018061127.7352-1-linux.amoon@gmail.com> <071f563c-6d09-46ea-870b-a51e0522bfad@web.de>
In-Reply-To: <071f563c-6d09-46ea-870b-a51e0522bfad@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 18 Oct 2025 14:35:31 +0530
X-Gm-Features: AS18NWDj5t4J8Su9s5gXUOjbXZcv8D1D0shD_oUkWVHtMigAOGJ_VaoJUxZoA-o
Message-ID: <CANAwSgQEqv2a1MGkGtj8CpXSKOXv=_wV3afOgn=iri7uqnj1bw@mail.gmail.com>
Subject: Re: [PATCH] PCI: rockchip: Propagate dev_err_probe return value
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

On Sat, 18 Oct 2025 at 13:09, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Ensure that the return value from dev_err_probe() is consistently assigned
> > back to return in all error paths within rockchip_pcie_init_port()
> > function. This ensures the original error code are propagation for
> > debugging.
>
> I find the change description improvable.
>
Ok, is this ok?

When using the dev_err_probe() helper function in rockchip_pcie_init_port(),
ensure its return value is consistently assigned to the return variable. This
guarantees that the original error code, whether it's a specific error
or -EPROBE_DEFER,
is correctly propagated up the call stack for proper error handling
and debugging.

>
> Would an other source code variant become more desirable?
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/core.c#L5031-L5075
>
>         err = dev_err_probe(dev,
>                             reset_control_bulk_assert(ROCKCHIP_NUM_CORE_RSTS, rockchip->core_rsts),
>                             "Couldn't assert Core resets\n");
>         if (err)
>                 goto err_exit_phy;
No, the correct code ensures that dev_err_probe() is only called when
an actual error has
occurred, providing a clear and accurate log entry. For deferred probe
(-EPROBE_DEFER),
it will correctly log at a debug level, as intended for that scenario.
For other errors, it will provide
a standard error message.
>
>
> Regards,
> Markus

Thanks
-Anand
