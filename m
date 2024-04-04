Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D57350E
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Apr 2024 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712231168; cv=none; b=fojhmqeTykYFxv7fiNJbqhs+Q/fJmu52VqocuApTGV1S/TerHSBL2EgQiSaLyRqFAk4dR0tGBVwgKusn2AkwJm/fRusSPtuV8PBLAtzpT+mlprbRap7C9Cq16JoG1zI4siTlqfUN6T7Xx7vg3goL3YkP0caaIbq3I8jmddSb5SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712231168; c=relaxed/simple;
	bh=0bAFYCn0S1dJ2yrIEz0ZS7aIjMo0R6DrZJPHkE7bWBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baX8ODKllqrpmhhpZV3q1L80oiBnkp9BYUhOMzm0AX2Ue3SLpYrZdXVbxyQUbUwhGf5DfVuYQDd83iy6Jjcmy4Dj8rEEJWs3W+HJKU/bikgvHeQyCkMp2PwJ+8c6okW1vHMGR1EJj9eczfd9uMD2YojDe7OPq9ZPi4OwWyC4yDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E/mH3OX3; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E/mH3OX3"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-607c5679842so8143697b3.2
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Apr 2024 04:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712231166; x=1712835966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bAFYCn0S1dJ2yrIEz0ZS7aIjMo0R6DrZJPHkE7bWBA=;
        b=E/mH3OX3I0ioJybT4i+Im8tS8fxJYAPYZ/RvaYq6PDJCEDh7ujMkpAd1QaNn/crAaO
         aRDi467gxpjz5m2okD9Gzh9oucXwxEQWlRJA5Z0dr8gjF8nUJOVhnVZkDGKXbx95cxgi
         s1047OsdmhN1JShDAmRFH9WZ/OQ8fI4Y8TUjzYXEUpjtEtC/zRFs6kGvyX4d0J96I/cB
         Ayrji5gvJHdvNBD/niHLLjs4dcSqxzyjs/ARKc30JUSfl+PuGCPbq69F0Gn5dwBiZLpF
         WKTuZM4PJFOQUvgTJ6vRcAkr0S9Pemnjpgx/EP8Nlhw69/XdVEwPncS8tgPj7oLaZB3F
         PpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231166; x=1712835966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bAFYCn0S1dJ2yrIEz0ZS7aIjMo0R6DrZJPHkE7bWBA=;
        b=gkpjb0u8MkBr6e+P3HAm9hUzOwwueOC/Gd8NwzHnhvVwlorSdN/LP59l+EEDDzNC/N
         bw5Z2eU+u03GCZBlln316GdIKwqpQpMb98Zcr+uNvQy/Wohv9eG6TYLBAZKDEEt++ojO
         2zeV4TW7vl8MVCBN/uYRO7fOlFK6QN2mC4N9766iLVFCUzUJl+MS2n94OcGX8MAJSaj0
         VH4WUB4g88t5H85THdt10AQ+c0CDqJZ66ocl1TGq+740a70EfMvUUJwR7cqygsFqm9Ra
         mwcU96H0MKD09V+9o54IYvtfY1s3fy6O1ATFidYw1lb4UZTXyzt85ihrj6cpiLNf5T60
         l1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVN9iAPRUCsYY9ogDjYJ6tzFDp8jFG00dW/XSCitxq8IsEVbMlCObEs6l2GyaZUMXB+ghnoTCKCZZTDw6fhWBpU7UOvr0ci9b61tajfiKNz
X-Gm-Message-State: AOJu0YyirInHZLxCEo6uE31EEiYius0+sIlTOhV+QW/75DnrzZpI56Uy
	j2fki88PmjbZA8S+I0YNNX52MIX4tUULLytmpOGT3vY4A97fXso2jdWarfLaNMbwkninL205OX3
	Y/QWD54FXXFmOIe0+0wphL3BPwOLzsPMWqh4FneXPh0k+Tb2N
X-Google-Smtp-Source: AGHT+IGu74Af53iaIgk2XgFUj5ga3mO2b15/RLozSRxzXstnfq8AhJlMB9p+lzkEfYDrX2Fvnpr0i0qNbGQS0bdtK/k=
X-Received: by 2002:a81:ab4c:0:b0:611:481:9117 with SMTP id
 d12-20020a81ab4c000000b0061104819117mr1965101ywk.1.1712231166433; Thu, 04 Apr
 2024 04:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <60af8968864ae4a83a76e589b39a2b1e1f65c9db.1711992588.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <60af8968864ae4a83a76e589b39a2b1e1f65c9db.1711992588.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:45:55 +0200
Message-ID: <CACRpkdaeMr=gKH2FSL4kkSyOirD__Pc3YYGoPga2GUvX3kjYBw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: max77620: Remove an unused fields in struct
 max77620_pin_info and max77620_pctrl_info
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 7:30=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> In "struct max77620_pin_info", the 'pull_config' field is unused.
> In "struct max77620_pctrl_info", the 'pins_current_opt' field is unused.
>
> Remove them.
>
> On my x86_64 config, with allmodconfig, this shrinks the struct
> max77620_pctrl_info from 360 bytes to 296.
>
> Found with cppcheck, unusedStructMember.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
