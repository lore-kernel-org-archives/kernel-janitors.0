Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2413D8A0
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2024 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706372; cv=none; b=BgnULPXzZFqlINYQlA8OFp7FG0yhTjhN+erPP3R3Vtj16xQdNj1bZDd3C+OqSVhd1vSaQ8IO9CJXhzeeoqSIVTfBv5/K4ciqRC/H9DeIqnQ/YqaEq3sfbA2xMT55Bvrt37L22SxMacQl8n6+xH8pLgcOk8iLVo/cL4LJbfgNfQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706372; c=relaxed/simple;
	bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hs1nR7d81FiguPoykeblEQ1ijWRpJMS/io66s28WEgQtjih5SrzlGgB69pqmYmCIEiGaECOStif5q3+u2CoVmzYKAOo6ot9xNbVVlej1a9XONzcF3SaAcTu31p/NJi+d/o6LToii3dYiAyUrjoQlOK8RHnnjVpTD1ExfCFVtxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rNWbZ04Q; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rNWbZ04Q"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso56316621fa.1
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jun 2024 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718706369; x=1719311169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=;
        b=rNWbZ04QzIw/BPmf5uhqo7VVRgW18RFuLxGJrgOO1VqWug30VlkJBlh9aD8PJokYQJ
         6ivZt7V27/N+3zko7Wd9jNUiN+5tn+oQQum3Izt3KLTh9uAFjzQHhHDqCiHVssTUIb4e
         y1YF5UvysUt/MZxrfDcYlz/X91mFSsin26WupPpYvjUoLx/FedpiERlOy8ERToaYesBa
         HW9Z3xOYIWA8X4wFLNmcrNCAKi/z1G9NqajCN72exvOh/79zQ1VKPbHMddvEG/YrWHot
         ZvdN+mA92onP6HvBa/Ba327QLjfdJoCaZ2hauLRBa964Xzd37rydeeZLpAf3Q0HWZgC+
         qGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706369; x=1719311169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klk6lMXdngCdVEKP7J2KBH6LljlLq0Hco77UGKsQj4g=;
        b=XHtVrmlAzF6MZDAzW280GQlVIDEqvffbB/nvX4i7L1U8zEOo6It4ekGlWaI3VhYK7+
         nOVK2xfvPEMYUFNErPa1anUzVhSfxMi8CxNdUnr5Hj70VkiPGOtOG51Z8VKCRxw4umoI
         pMhQtOtC9ytnx5VsXBRkTVtm8G5hJKjELOiDg3azJVGO8mmqk7aJ21iZBpfpF0XAllII
         cbZ+JCcrnnGOGqAvkjnUckW8E+MCpkthKxYXb8hc3g4wl9xea8AO2hqz1VgrPyFbMSOp
         IqxGsjPNkLnTlrSmkUbGFNNSscOBiXjDiXCz7EN38d2NOBse+aGGrS1tT6BkTdzAl1G3
         BiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeG9xirBwotp1pdUzD+MVtp+BR8vQwLrBE5u4bi9vPlYXE7Z0DPfjYqE+Ncg4/l6M2M24iivJZMJzNYJXv9ji2i2fWlLzR192L8AJ/loan
X-Gm-Message-State: AOJu0YzsCc45515pvEpnA2/ZQjgwcT29QrMv5mLpcx+SGhtrZ4hgAu1L
	I0KLCptWCaci7Ba6DDYfvaFBzN+D1zXfDyFZOVscRR11zR42TYBYPRwuKa/4AafdftGJ+bdr3Vt
	T1B9Oynozj3+yyex2A73Bw6bYWJrMUHZ85tiFhA==
X-Google-Smtp-Source: AGHT+IFVnhzqBoiu9GboooE5iY1zi/XLlllZteuuassl+ZmbxgbyJsQPD3pk6oFTjF6bKUOXQjAi+8CRlASoDk+Kx6o=
X-Received: by 2002:a19:6912:0:b0:52c:99c9:bef6 with SMTP id
 2adb3069b0e04-52ca6e5639fmr6700866e87.7.1718706369027; Tue, 18 Jun 2024
 03:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
In-Reply-To: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:25:57 +0200
Message-ID: <CACRpkdZdjL7Z7qY5MTtZZRKQBLWHPKoHKKyoy56mKzZfu=WfPA@mail.gmail.com>
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 7:51=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:

> With ARCH=3Dx86, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx=
8m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4=
xx-qmgr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4=
xx-npe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mt=
k-cmdq-helper.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/mes=
on-clk-measure.o
>
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
