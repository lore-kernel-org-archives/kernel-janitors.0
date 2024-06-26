Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161BF1662F2
	for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398326; cv=none; b=ua96rtJ4i2V/husdZgOtmpTMyQeDvXy4+tE1pvK/Df//g9q1FVqV6cZaa8RLm1nelLLLoMJ2KrY4Tu1vAI0fFm2MVikLrIPI4SUI4XDLM5ny58aoxQCJlX71+taNb8raxrjCr1JUtVnLL+OQ7Gb0loSjhRqX/DC2Mv8ZoCaPC80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398326; c=relaxed/simple;
	bh=G9Hu0rSz9odo+/555uwylOWDqs0wLoPhDnYobZDypvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rT6jsXUwreWWWFHy5Aaa4os0L33JiVdlZfCgx6kXjBW4qmjhloFlBXmD1RdyMT19D2HWG0WwP8YGMn/1sce4cUsihiufCCkDWs9Q7dY19LznCFWDXrB2fsk8PreU9KJYnHO9jWF9Zc13EaQX2LTzpXndrIxWo1VGdyR766/ROXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jOnGt8gE; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jOnGt8gE"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec52fbb50cso43019991fa.2
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719398323; x=1720003123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9Hu0rSz9odo+/555uwylOWDqs0wLoPhDnYobZDypvk=;
        b=jOnGt8gEsAWGLWSbCcrShDOTKT4LSg6fKcM5R1Hr8fUnN5IJHwb03CHsaw3W5ZPWcN
         JJgCVemxzht3383bTfpWXMMXDgb3yp4YCtd37AYEOljGqPkHaH9djdPxq20laYy75plg
         hGmdKKyPwy2ekvIzIMZwWlKmFWxuXChbYuYqqhwYIdx23wSmMWfj1fdTopPmdYe5DzUr
         RV6qumEFyRT8gZBUwMgWTbcIXkPQlUbWXFQZVyTgFRlaR9kiVXCpLsa9x/pB9CD385SE
         b8een99aJ3j0MM78pQwMds35DKvcVwpmXOVQcq2CSZR2igUrMY+M1TfurFBaS8xaPuAN
         MdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398323; x=1720003123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9Hu0rSz9odo+/555uwylOWDqs0wLoPhDnYobZDypvk=;
        b=SnI4uP3R0uvwC4HX0YBDn+i6TOWWKUnZK6NnmW/Wtehu+kLOqFbnlHosfekCvmHWwa
         xyt6mQZO0C9Aj45IguO7uZNYukcn5VkBXkVt4VBo29RKURqtO8vFqQfbFrTqkWScLg9Y
         ZCVbiUI7/fgSp+3zsBv076Iui6NCPDy2KpyKkKg/yzZSVHZtXjv4eFskTrEGgf6ny/07
         FiwhPne4i1rgjaCG+XKPXk7J0UmGiNETueJ8OlNel+26U3OeQTJ4HYiVGR4BlqzdvRFe
         0VLSPqKMb+MGYobZuWylvzwqreKcerIWiva+PDVqNwdzxKDFYaINFlkEpmA+dKpvA/yH
         gO1A==
X-Forwarded-Encrypted: i=1; AJvYcCXf/lYtuRpHN5m5kGRS0owFmXDCezo8JRr7RewsC3Fmf1LaSpf/I7vYl0CXzEr4oxHWogg/BP6YTtwlJcs9BPj7q5bpMb5fRHrfhnz27GdW
X-Gm-Message-State: AOJu0YyvX2bP9CnkCM5BtdHLIAkFxx4v0WhZM0P+KWdkEu6jOoE3u6M1
	BkO1NZsK0nUp+umkcpdNzDa5/pu9Wr9KC3fhOdj8d/FImOmMabVc8plC+3Mv1L9o0hlH2LwlrRX
	+3MIH6XcMDkDHA4tKN/FdZVLa3qY5IY5fYliH5Z65W+TDeBUxTsg=
X-Google-Smtp-Source: AGHT+IGeb9kRMk63OmPcq4hGusevLEvgTC/3rjFDSFhwI2qkWS4cL5PyLdwWxtexrTyhWm4WxjddDCl/NOIRPCwB5GU=
X-Received: by 2002:ac2:5f09:0:b0:52c:8fe4:b153 with SMTP id
 2adb3069b0e04-52ce1839751mr5615327e87.32.1719398323287; Wed, 26 Jun 2024
 03:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1719037737.git.christophe.jaillet@wanadoo.fr> <f9f65642331c9e40aaebb888589db043db80b7eb.1719037737.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <f9f65642331c9e40aaebb888589db043db80b7eb.1719037737.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:38:32 +0200
Message-ID: <CACRpkdbWMO__y+_xYkt0-h5gGTE67LVygwr8m0_Tt20HnD1+Bg@mail.gmail.com>
Subject: Re: [PATCH 1/3] power: supply: ab8500: Fix error handling when
 calling iio_read_channel_processed()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: sre@kernel.org, jic23@kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 9:05=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> The ab8500_charger_get_[ac|vbus]_[current|voltage]() functions should
> return an error code on error.
>
> Up to now, an un-initialized value is returned.
> This makes the error handling of the callers un-reliable.
>
> Return the error code instead, to fix the issue.
>
> Fixes: 97ab78bac5d0 ("power: supply: ab8500_charger: Convert to IIO ADC")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
