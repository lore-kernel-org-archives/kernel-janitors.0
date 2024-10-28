Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950701E48A
	for <kernel-janitors@vger.kernel.org>; Mon, 28 Oct 2024 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730120083; cv=none; b=T3ldZHE9EVO0w12kjY2JgU3DftTTAOk0/PGCykjkYdM+Ll5QoFMoSpXUhl7z4vF324A0adXqHV33iF5Fcf7FLsEIDbk75TyQSCLGCBk6zRn31nEoogxXAjGXwEtWJ1dR7XvqAJiYoNmouMApFDvclyjuL30eBV8OLku2oK6X41M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730120083; c=relaxed/simple;
	bh=seI8UO8liH/MjIwO0BVJ3zPmW5DvN1lsIKmmEv7NXaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqvLSsPl2Av3xMjpWg1bpAm89C2ccZeYax0TCJo1sLVB1INtfuKH8T4HrdofiVzkX8v+L3fyWWHx2AfGfrh95Lfha7v5+tbN2H3e1RzpMi8cMVTpVsyswZ0hn3788tDFovaX0z3XyFPiWgBA0VA1CxCZ5vhQh3IuqKUJtVOYhZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cCgtsLct; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cCgtsLct"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb49510250so40949631fa.0
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Oct 2024 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730120078; x=1730724878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umup54zPr/YxS1kzJqH2Mzz16zItuDuoZj7kmVQKCCM=;
        b=cCgtsLctISLLOVkD2JfHx3DXEAKRHbBvGVz2c3+v4KfWascqOPvaLBpS6DHQ4uWQBB
         CHNn8/f7SxNrEqCV5zhHdRGrvaiUd6VxT5k8o5hI/kAx0ebEHRud7SorqlMSieIpNfQt
         VeqZ2oaHDKQM4UojFdMIHlgDwSMmvXYWnczte2kKdZTUVGapjSL5z1LDSqVHBFs0fcj+
         J4fFuYyp3kVoocZ35CIDJKa6cGuSbnmltDC3Q7Puu8vepXzTHJ4ZDw3L5gHlSAAeguwv
         f1tqeNoOALR1Dm4jqdG8fehR6Yv4LB2G9Ar9I1UQxIN7ODeXwZvRAa26vzae/xhQGzjD
         PJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730120078; x=1730724878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umup54zPr/YxS1kzJqH2Mzz16zItuDuoZj7kmVQKCCM=;
        b=HD0EhuQlz25Mibw3igcw4LJQ6bZA0TST9Ge22JB5JGnxrYE8aVTlSUdOGaKCh8HvEj
         tXB/9pD7CFqfW7SfA917VewCjLOIspb9/fSzOrIgYK8HKq2xIs5MD9pGAkRlCpcrST2c
         tPJKb5dKI8pq1IfonJ1Ye/DE0TJtkATVDgGXfQSgxN7z9fN/DQu43wBRFQNQhQQcxZA/
         9hmhFP0RdUQjU00HF7Gb245R72wND7kLhsSyCLAmR+sLawEYfzQRd9omLenmiqTmlAsL
         QFtPUBvKnTEd1eJu5WCH+pGfc8kqG25D+qd5do1ZBC0xz6RVgRC1ftN1pVwiC0w0oTmE
         ko5g==
X-Forwarded-Encrypted: i=1; AJvYcCURmByI1R2sorLASahh/UjGCl3SvrUEIUD5dOat2uXQRnEBrTOD6tTV0EnI8E7aEhbPHx6p53LO4tmudyUJZuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxATc5zvmsfVx01+e5vREoCyBJ+pggRhrx+lp2Sb8nlyX+UY4EM
	1o6NiCO67YINyO4txCLd926vSGHnwCJCZkvbTZVHZjVgui9C6erjiXw2iHFuH+cR1BgUn1mXJgB
	bkfVcQTJjvwPj1NS9i/ucruTrBUtqi27m6h2EXA==
X-Google-Smtp-Source: AGHT+IE0RFORu2qhCHVTzNL8EmTHxZvAv0CpOPcLoW/ThHRI1Ejo/uY+Ar9l2qfXZiVTY6d//qDHWFdO9TE8RAOq4Ro=
X-Received: by 2002:a05:6512:3b98:b0:539:f51e:2465 with SMTP id
 2adb3069b0e04-53b348cad03mr3726018e87.22.1730120077585; Mon, 28 Oct 2024
 05:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4b5f1306-dc01-4edc-96d3-b232b930ddf2@stanley.mountain>
In-Reply-To: <4b5f1306-dc01-4edc-96d3-b232b930ddf2@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 13:54:26 +0100
Message-ID: <CACRpkda=5rSCjoW0ScNg3pFFOjgSQEv8v+0ZkAw-d0pkF5CaZw@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: spacemit: fix double free of map
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 10:39=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The map pointer is freed by pinctrl_utils_free_map().  It must not be a
> devm_ pointer or it leads to a double free when the device is unloaded.
>
> This is similar to a couple bugs Harshit Mogalapalli fixed earlier in
> commits 3fd976afe974 ("pinctrl: nuvoton: fix a double free in
> ma35_pinctrl_dt_node_to_map_func()") and 4575962aeed6 ("pinctrl: sophgo:
> fix double free in cv1800_pctrl_dt_node_to_map()").
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC"=
)
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied!

Yours,
Linus Walleij
