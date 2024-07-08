Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CB51D6AA
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jul 2024 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720460014; cv=none; b=SQ8wOQfouZHh9PlxCL2e3tuAF0WTRSBhsfXVx3OJyhsQijUTM6jv33h55yifZu06/iUydS2GuKCfjazwvQuMVj5J9kdvMS5kmtu24FsYsgI2M1nvce7FdTsl4Fb3bpEV7hbiDdxl0thGjNoSG3vYReSlJiQZn5EKVDc1AgAe3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720460014; c=relaxed/simple;
	bh=xMgVMxuVJ+4mDxDIZpv60LWECy5vBRGinidcROVywxQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wbpb5IEq9C2MMnSk1OZgtx4z3URO57C6LJ3HZZs9rt8w9SVwE+4y70ct6fkNz/Oeg1WCqzoxFBRwysmNrHElmsZzBxmO4mQLFIzoLTO67+/4AWX3ELIDtTlkx9G46wg3mQ2xjeyVdjSeEXsni9WTQpwDyGI0ZM9OvJ2PtoxBNfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y50tGogI; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y50tGogI"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eeb2d60efbso3270611fa.1
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jul 2024 10:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720460010; x=1721064810; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xMgVMxuVJ+4mDxDIZpv60LWECy5vBRGinidcROVywxQ=;
        b=Y50tGogIngiclh4Gts5xkP4pOWNro5ruF/OZolpDwLqRsNTA+OxfK0DtSOyKzzALe8
         OVKL3i4CpYcP4Nw6lYb0nfdhnKnrGCIR7T8t70gVVsI44HIpmtlofEaQJ7VZiPolsOn+
         f8oKytFIs7qqBmvnvOz/7XiPTT0kCMfvXKSK4hHsihxFH1QroOx7ByPSJhBvRrlN2OBQ
         HHCbi6iN1EA4jTBdC2owSX7quGRalPXVfsO/p2EtzGdUQI7zpwJqeoZ5B/RBk+ZejVeu
         Dxa9zCLntjXk/8y5NQCFO0oA/zKUgHm7SWYSeGGBjF7oYWtrqhG+0eFfPVs6+QoyFjqd
         Q5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720460010; x=1721064810;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMgVMxuVJ+4mDxDIZpv60LWECy5vBRGinidcROVywxQ=;
        b=OLY6oKHljoK9C8ezZas5czbB4LPjJyiWdGcst8h/ykPJIwEEotNyJMC2q3xH8iNXmV
         axRu/6FKIeMXly9GcjYnMRzVs4PBj1OOLF2gvHXuGpHEMcQE6qNtCN18ztESRX19Bc4u
         BiucCPFoGAdkECXSkFaWJpgm8wjdH6+t/ySUX1at+xujSPqzKMyEgk4ory84/HfO5Qkr
         +MZe51MXn6yEzmDJ9m0PqgAJgm1xo40XokEcxIRDYZowz4Xmw+x1xPdGIdtf7JtFf7NM
         tcASYhzGuo/KhdUOiIt75AMpFjw1STmW7QrGQqxSMqScSK9FmHIKz4dlRQGdejqnkEgS
         5YNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaMwHMhNdEjnMcFV4k/aYovV8OY7XGjD/ydZUk4NA9w9BbT59vnnjJjDqdc/Mt8cUG3zPEisaSaqtg2KcAjTydCm+40EsPZXVngz38Tme4
X-Gm-Message-State: AOJu0Yx1JPO1brDT3pp9TsH8Xb3jrIDv18IOtW+sfSqGJ391v2Z+rNma
	Zs0n3nSCh2c+apdOISNS2CiR39WR01E8EfXovxiVxjH8H9+iCjVNHcu363o92B8=
X-Google-Smtp-Source: AGHT+IHqm74O9XrXu8Sp/c9nwIkpH2JvcIAs+C9RT3fJBrhdSnfh3Hhhnky9bRB/8pAITn8lkJu/iQ==
X-Received: by 2002:a2e:9a92:0:b0:2ed:136b:755b with SMTP id 38308e7fff4ca-2eeb318b5e9mr2863341fa.53.1720460010540;
        Mon, 08 Jul 2024 10:33:30 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f741553sm5885805e9.40.2024.07.08.10.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:33:30 -0700 (PDT)
Message-ID: <77711848a7e7242a7445a4bccf5c93675239b838.camel@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix error code in probe()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,  Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Sam
 Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
Date: Mon, 08 Jul 2024 18:33:29 +0100
In-Reply-To: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
References: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-07-08 at 12:04 -0500, Dan Carpenter wrote:
> Return negative -ENOMEM instead of positive ENOMEM.
>=20
> Fixes: 497ddafe915e ("phy: exynos5-usbdrd: convert Vbus supplies to regul=
ator_bulk")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

