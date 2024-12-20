Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34932046A3
	for <kernel-janitors@vger.kernel.org>; Fri, 20 Dec 2024 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698957; cv=none; b=VwVaN7cgWG4d8ePCeTRVrRDUbbycCsIlzq2fIGYRJvt8AH+iRkPY0+rtlkH55sDHABHgpmB9z+U/UOZDXh0ubXt/fQ1vHAhPernsi2NOkGk58NG1L1vXJ3xfLfOV3VNcOFlPCX+lm3eokGJ2mh8P11a0jPKDDCVU6rmf0yjRITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698957; c=relaxed/simple;
	bh=atR16LH/ktDR9gBRth9rDJLJVpZpJk8L4PJ7O8vNhPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAe7etztBmkdV9rcgAVKqGTDwkKseSr3GY6A55IYVURCCo9bcpZYYg8H7KbAET/SrJcr414NksZq/8cy4c596gOPapfaNl3PzEysBk7F2rS3Arzb3SqF5pMjMvFv5zX1WLdOA6Kmf5haaqDMf+aXB3R4Aru4N5NKSF2gi0R6Wsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=licQdtxO; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="licQdtxO"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e3c47434eso1954927e87.3
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Dec 2024 04:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698954; x=1735303754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atR16LH/ktDR9gBRth9rDJLJVpZpJk8L4PJ7O8vNhPs=;
        b=licQdtxOOc+kFe/m8lay1punT8+uyghc1PolqeEVDjM2vxYtJH4omyvoeT1SoG4d2v
         dXJ7bXN789ZeATaxNFqJ8pT5as3QMTxBksYSfYv45T3K0jPae668LMScxM0p1xVdv2TH
         PpC878DacD2ZAx2D/b6aZWU+le+Ce1l6JJ0lTR+w3/CwNydSsMpPjeiZyHdujlwz3kQN
         JGoXyWHrcVVMBnpDkL6wRvyLl8id1I1HgIyw0dCLZfCTaZ57LC56H1Wrh90fpEDtB+tb
         tk5WDnBDAKMNkr93GGpVrhgiT+kBc6XCa5TyzcsRkl7iFutqZk1lXhsBJdoG1TINn1TA
         BDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698954; x=1735303754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atR16LH/ktDR9gBRth9rDJLJVpZpJk8L4PJ7O8vNhPs=;
        b=wmNQVMoBahX7/Ssir2Xr10TZtJA4M8ga9Vc2IShUivoh58PG1H8bA22HKH7JPyOX4y
         C51wXTcK+wqC4aGbj9/Tek6f1veVef3Jj7KuwYUsGM0Kvh67cxXTv9MlmlNhvBrXrrTs
         N3EKc6no/dk+RaTrRnCvn+pzJ3/VXlt7Ft0HI5+fbf4SqTRxunMiOM1Qx07nlKqtTPi8
         P3HMtDCKuIWGW8emPQFSetKptZO8Wh7xzKX/h60ZQ6A9r6CWc/Rpg2DJsOOuZ22tE8L6
         bDtjcCVAgHWoDQ2lGjgvQjn9qLOmgB8/dCbYgtvhgwsPLHEnBecQlvci9UIqZG+xxbN8
         x9cg==
X-Forwarded-Encrypted: i=1; AJvYcCUo8Ox2EX1igdKOm6noz1nQ3Yyz4sV7GHdhJjCv4GQtetVd4KYT/xVsVLXOnxKZSM1lIo+qPvdcLaYuHRw93F4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqPHTO0TEv0B/IRnWjxoI53OTeqZCa3g04BCviLKzCFkQP2MKI
	H8gsMjF8so9KM+9V6Yb24oPRnVRbeL5hmkbwKYgtNcrWwvZ2lX8buJ4AFLipf391u7kpv4HpJiU
	yM7VqSMKghysPOtMw6LQlTAOYiD1AiyfpTmRFpg==
X-Gm-Gg: ASbGncv3Jdzs5XxF/2Wd9TH6/4zIDdeI689vHaib8MRLNd1GD8tfJzeLepslKCRz8nL
	+B6WT/WMVJNlIN2v9xOvTJJwVhXNkkXEAj5gCWw==
X-Google-Smtp-Source: AGHT+IH24FkYw9KreZvkgwUIPynsrrdQBE5v4LbCqrkZlmC/e2aLoJH4ZrC2A8G4zSF2SlfwIJpm2yYPtgwqVc9gPJw=
X-Received: by 2002:a05:6512:1592:b0:542:28e3:2156 with SMTP id
 2adb3069b0e04-5422953feccmr725270e87.25.1734698953857; Fri, 20 Dec 2024
 04:49:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <32edcf0567fffd0b1a219e7e2dad7e0bd8c5aaf4.1734023550.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <32edcf0567fffd0b1a219e7e2dad7e0bd8c5aaf4.1734023550.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:49:02 +0100
Message-ID: <CACRpkdYvrXm62u1L3Bc3RYramBD081GSfZBqYPamxMSKq5H7gw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ocelot: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 6:13=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> 'struct ocelot_match_data and 'struct irq_chip' are not modified in this
> driver.
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers.
>
> On a x86_64, with allmodconfig:

Patch applied!

Yours,
Linus Walleij
