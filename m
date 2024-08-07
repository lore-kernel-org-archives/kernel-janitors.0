Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19D43A1C4
	for <kernel-janitors@vger.kernel.org>; Wed,  7 Aug 2024 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723040048; cv=none; b=T/JvjWQ59v9tP7toNZ2+hcR2NwMbDFDTB5MdpiHgQ8ggWf9ZUXLc+//gzUyu+I1in15GdtlB826ET3trz6GoRM8gNNqNbFijgLkM8V+tsb8qkMDsLIeOl8/JDb5rAqqFyR0q1FSw8snFbuAhqljSAa5nLvHrxe5P4HafL9hSGJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723040048; c=relaxed/simple;
	bh=8U6pF6oteZB3sbXc3seOXknJplxg/i1fuxIfbblSw1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SRVrOm8gjEpFWlfXNcrjOlielzirUNQ9ZNjZHJaAd+MdIoC2Sb6lNuqGN8/x5pRhnv1pSOp9pHEx+t58sJE0T5migohwCFcJ4tdbm8Ep5/WWSx2FtqMrBFsHSG5+EakAL/JnBt/nBnw1hXqaLURDK/9a0GDo0+SunKle8nL76Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OwD2h9d8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OwD2h9d8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so17740015e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Aug 2024 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723040045; x=1723644845; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8U6pF6oteZB3sbXc3seOXknJplxg/i1fuxIfbblSw1M=;
        b=OwD2h9d8Fq+AxxtD6Eqc/1OmqeQCR2VFt/qMzg2llFEecWOqAuZEat40KAIubrtN43
         fTjPpCxt6g4SIf1ENA+Yp3152uMi7wSp6cdL5sfWb5dTfEzZIy3JdNeE7/qYX9/YiMZf
         GFfvIEjyqygrX5TpFSbIKaqXqkr/5WFoZH+OmgViQNpV24Q0c4guDT3jFUNqVhjeDAsQ
         ASpgvrxr3wpjfs6AsVB4V220UiOfslfrjCT4zSHQJDCSgH+mkKuj0l3/9llIeO8S4jyg
         zWW79zCnWONI1eV2ymqvLhFVwnxS8LjWGvU0DJ+NcdEu6wu35c++N2FmgeEsC5nQrpUq
         EwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723040045; x=1723644845;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8U6pF6oteZB3sbXc3seOXknJplxg/i1fuxIfbblSw1M=;
        b=aQgHbvL9hFndqpILcAUYVLKf1VUj6hJzqSa8Ft8xdZWpCtiYd4SpMEbaIe040vjK3N
         68saLt+J7nzEkGHR1vLmw9X1pz90JQ7dCFRq8WMfb4jklalxa8PB6F77XeFaxC+Br3bP
         0C599fBYRSHl9Ggw4COlhkKFgX21CQ3LyyzGPLyW47PFXzP7WVDbfT9iea2EPxf0V9zd
         sjrb3tE5Iyp+reVEurWdkShG1CiH7lTLsjP2tQX3xDR5dvX+gIuHXwsxSEHtQD+2aZ5y
         lLmQIAh7/mfmZhHH4vWx9Qu5PmmU0SrfHa2rZHHXxWRdkDDih2dZ8xUKylQvpG/zehoq
         6fOA==
X-Forwarded-Encrypted: i=1; AJvYcCUL0sg5eQxNqvzjFGxySnIx/v701VvIoi9siFaknYLKv3fdrm/FKgoGP9qPCBvgnVyYyVLnXPO7WxZHRT6bKCYOrU1Wspq4pjf7cTbTWKr4
X-Gm-Message-State: AOJu0YyfohePRkdP33WRNbfJPOVEZo9u5rJ+FmFqpPmm4QGsVIEaCtHe
	ZktNd0MuomS0+cAqvIZyNahckxy8gGIjjAKDuMrPhf7ThsOuICy+5NTaFk2/HZU=
X-Google-Smtp-Source: AGHT+IHFS+8FxIsgPDMxXI2119/zXQ32Pp05XpEgQOQyCV3S6/MHUfyYDHMpWs/M91Kr6YsvZoGl1g==
X-Received: by 2002:a05:600c:4853:b0:428:fcb:962 with SMTP id 5b1f17b1804b1-428f06c44cemr111691625e9.36.1723040045344;
        Wed, 07 Aug 2024 07:14:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm32100245e9.14.2024.08.07.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 07:14:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linus.walleij@linaro.org,  neil.armstrong@linaro.org,
  khilman@baylibre.com,  martin.blumenstingl@googlemail.com,
  linux-gpio@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/3] pinctrl: meson: Constify some structure
In-Reply-To: <cover.1723022467.git.christophe.jaillet@wanadoo.fr> (Christophe
	JAILLET's message of "Wed, 7 Aug 2024 11:30:54 +0200")
References: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
Date: Wed, 07 Aug 2024 16:14:04 +0200
Message-ID: <1jy158xvwz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 07 Aug 2024 at 11:30, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> These 3 patches constify some structures in order to move some data to a
> read-only section, so increase overall security.
>
> It is splitted in 3 to ease review.

I'm not entirely sure it eases review in this case.
If a v2 is necessary, I think a single patch would be better.

> Patch 1: struct meson_pmx_group and meson_pmx_func
> patch 2: struct meson_bank
> patch 3: struct meson_pmx_bank

Is there any reason for leaving out 'struct meson_pinctrl_data' and
'struct meson_axg_pmx_data' ? I don't think they get modified but maybe
I missed it.

>
> All patches are only compile tested.

Looks good anyway
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

On the vim3l:
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
