Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB97F155A32
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Jul 2024 10:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522289; cv=none; b=hWRJd27hXivIHj24njWYe9y1pS1LrCZ04oZz/1yzEpvOzao4ES00FBtrDeh199oogLLkqqap5rvguIURnwIH5p2gqUJ02w9Vs6mDVzhFvdwE4ygX5RYANXoREuYWp6CJl1I4mU4KJ0d+KmhPE8dH9A08vt3eYpdca06f33OEzhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522289; c=relaxed/simple;
	bh=GuE84+tYe3IliZz36W/xwOvWAw5aen9f9pO/jTu9YLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EzpYgqxXfAJI32ELiF8iY/bfgqTmmWYFsNFvs54qgLJVBoCX1SWoJPRgLlZioiUlut0IlaQnJtd03yvtRMqNmFzGH0gIoJ4slhOOSFtOBekbfy2OycOBEete5EnQ88Q0yDD1USEMgR32QVIx8kAM8qrbJsBJ9ntv3tFjjRI5Bis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZid57NG; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZid57NG"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7036ab4a2acso1411652a34.2
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Jul 2024 03:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720522286; x=1721127086; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ne6sGKGQF4GM9jaPTveT7Fc90CaEuMuRCImmXptQf6Y=;
        b=KZid57NGukekwIq+9YW7ovSClgvK3OT5wht0YGeLtLx6issn2BPNVKA9xWfqya3Q4D
         rgrpdVUYupPbXsRQKFg2NaXugCsUps1748fntbGScIdOfZ15uvJ5Euqd4UtPVQ7yAUUY
         fjG95ovi6Q0xR5807E7E0kr3k48JR/wihioYOzF83ahwNXcc1OEwMjglQkvns7fNdSRp
         JCDaSRSkXEo1i4ly9PEOaZf+BHZoDgqPtGmbwqpOQ8WHtygCA8Z1Op3KmvADVJyx2eDC
         LSycppoCDueVOLW48W7qUbmnhLISHmwsqMKQ5G6aksqXlhaaTZbfkBpG8l941JaMmZsK
         6fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720522286; x=1721127086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ne6sGKGQF4GM9jaPTveT7Fc90CaEuMuRCImmXptQf6Y=;
        b=Yvb0E+CJBI1AYFZkFF3O5gQYojYgAYcG1YJVPEClO3zt5sOsNvDrDn/r+Qt7HwSeBT
         0WZXt4KchC7KXER6oMKM43Vyu2FAEcds2Tg8oFDt45KwQH3jOpgiTzu8dY+h+FYhJwuL
         rpr7qOSXxSOP4GRMx/CSrtcIpZQ4lMoSS7yLFZ+fk7GyaUiujTE53RNCz+CwWEg5Pt+n
         lkKaPHMe9GqhCxX6mcc1PQjXsRAt1zFC2C8wmnWxFJEllFzpyiTNLMga4ZKpMzAHUAI/
         Kj8RsAT5tsBSrSmGGi7qfqgdx+rZuMv28rVci0AmMMGjBx4pBp23dpNTBhn5WgFf8NMQ
         x+fA==
X-Forwarded-Encrypted: i=1; AJvYcCVHzd0IWHP48qbg+7DFsvE9IJ/U1HRGY5/A1Ln1NDANC1TJ+rGyx3ifKAQm7OMuCxKliXbU+djvg2RYQ0WFbiGbO8IBdjQoqer0znh+oDKn
X-Gm-Message-State: AOJu0Yz30bf48nbdgZMbPP0RVyXPArvDi8P3erqjaYdboVP5lM2Nunyj
	ArDx4t8/BBztEIfqpWh7DshUcENjZlK/0DqGECib9boTsOVfCni7ZnspevFHNPp6rZeQ82xR+hA
	nGewYQtUNCo2czRw3wqswSvrRCbHQ8qWDGVI3hg==
X-Google-Smtp-Source: AGHT+IG+y2y1lYDjW0w074p6b32KN/SNBfuH66xZOYYfG/aQ33OHnDDWnfHU1jSQkLv7VHnBWB5U5y0xOdhTHcklAQw=
X-Received: by 2002:a05:6870:ec87:b0:254:ccac:134d with SMTP id
 586e51a60fabf-25eae7575dcmr1763592fac.2.1720522285808; Tue, 09 Jul 2024
 03:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
In-Reply-To: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 9 Jul 2024 11:51:14 +0100
Message-ID: <CADrjBPq13+k6LM=Xs3Eof9jXJwOHmcMoJUXAR18aHfp7fEeLcw@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jul 2024 at 18:04, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Return negative -ENOMEM instead of positive ENOMEM.
>
> Fixes: 497ddafe915e ("phy: exynos5-usbdrd: convert Vbus supplies to regulator_bulk")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>
