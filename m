Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFD6134CC
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Dec 2023 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqKKm6Rq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2366012348so18796966b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Dec 2023 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702894586; x=1703499386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6T4R9okteCkjAhT9eyRdC/jbk1c6KtuDD/NaJ+LcB1s=;
        b=aqKKm6Rqq8AP1UhsVlg4K0AaN30so0Zd1LW30XR+FlqwCzhCA4W0NuCaau9K4rmKfH
         KXc7mgb7W9I5v61ejxV+MWkawJao1O6V5ZaEvk9PwU3Yc/LeiIyonZjkKn36pNRPWrat
         azYaP+1DP5G1JDjKDl4FmCwZB/OR+CTc8+zd3Btm6AiHeuUugA8Z7srzru3mj156yOmQ
         6nDjLrKfOiiYamV+Dy/h1I4Mpaq4tku1xVvoDNGMTTWFou64mcDa1WccB2+3zbYB8mBh
         bdssQaVFOs90G1aPTlh7axh6kayrsJP3kG2UPXibJAweZBMZp1UAqy+lNp3Xtf++CQr8
         M/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894586; x=1703499386;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6T4R9okteCkjAhT9eyRdC/jbk1c6KtuDD/NaJ+LcB1s=;
        b=Sx1RPdMqE+1JDwDn5AEhixxjAeFNMz7v20zfx92wuRgHccntA02l83pbnxPqP9N4DD
         Q/4fA70ErIVY/oFVpVDxFJSYOSE9YwyUwRwEx9I9lkC3LkZn3Meg6xCAZuHAeKHEjeeZ
         VxUEjyGtdaOBQDAMgq1lVycHt3OnnTxsHPZQZLUvDep85pti3dPWIqlyDNlScw8kCb0q
         f0FAF1bEyt4ulX0VYK5yp5wzg2m5KTsRmSmq2H5Ij+5h8wkjj1IEYoHUV1+kiNvtobDl
         lSztldB2UFNEpp1agUSYmobr70gBNzhLBPqsM8gU1bXRJkEnh1lil+ag4UzY4JRVoxjp
         Bqgw==
X-Gm-Message-State: AOJu0Yz2puT/sPEhJ9MezBwkQ2cul7FDvDxEgK00JKfs5XjB0Ee5ifEy
	X9sk9+Ne1coRoxOmh1WR7YF+Fy56ffFEavUmD9BthQ==
X-Google-Smtp-Source: AGHT+IHC5w0LaR0hZtZGoebFzWjvqDk4jLHPlKNUseyRe6YfHh7xV+cN4HpsENl4UBR0EZTA8NFZ8Q==
X-Received: by 2002:a17:906:54f:b0:a23:5bfc:edf6 with SMTP id k15-20020a170906054f00b00a235bfcedf6mr531086eja.73.1702894586619;
        Mon, 18 Dec 2023 02:16:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tb21-20020a1709078b9500b009ad89697c86sm14131552ejc.144.2023.12.18.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:16:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231218101225.27637-1-lukas.bulwahn@gmail.com>
References: <20231218101225.27637-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in GOOGLE TENSOR SoC
 SUPPORT
Message-Id: <170289458489.40214.4044639674573718307.b4-ty@linaro.org>
Date: Mon, 18 Dec 2023 11:16:24 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 18 Dec 2023 11:12:25 +0100, Lukas Bulwahn wrote:
> Commit 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock
> management unit bindings") adds the file google,gs101.h in
> include/dt-bindings/clock/. However, commit 9d71df3e6eb7 ("MAINTAINERS:
> add entry for Google Tensor SoC") wrongly refers to the file
> google,clk-gs101.h in that directory.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: adjust file entry in GOOGLE TENSOR SoC SUPPORT
      https://git.kernel.org/krzk/linux/c/d0da0de31e1d50ff905eb8f095628eea666f8c67

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

