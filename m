Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5B7134B5;
	Sun,  7 Jan 2024 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdVm5ub/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28be024282bso479790a91.3;
        Sun, 07 Jan 2024 07:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704639857; x=1705244657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9DFtOnYcuYLbthZu8GyH/yWr9rDVB4FldI//OpySZM=;
        b=KdVm5ub/bDSgjo2RcTI/W5OWlEA/Uvi6NkVkWsLc9PGzw8Tee6wzXnkV2Jqsey/4pO
         5QRZct2LwJI+GAFBH5ogkrqPbcZJAMlMAeDlR8mcJeq6UH3UE50Ej+SvJT8eMQdrt9AJ
         mEm6jBOijbnTnzLWSsHIlORdegFTA5q+h1CRpsqNn874+W2ynxyR/G0+mIB5bSkpJXrc
         dehmq4lqnenP+Jha/h/RajCNNM4BQBZo0igG7W9g4pTrT7Z3HdYCciMQAO2YnMYTSlZv
         dtpfRlOROrCgUZA5Vf4FBP2et6VfPMY9Fjn4XEQrPiHTuSF/EBMGFho18yZH8KcT8Kgt
         cpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704639857; x=1705244657;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9DFtOnYcuYLbthZu8GyH/yWr9rDVB4FldI//OpySZM=;
        b=sw+2ipyb9C6ygykGO8wPY967fyQjOXtU4XfzdPgHEfJbFLxVBeLPamD7vbeUTZ8Ljm
         N+2wlW6RRT5ZixVYThqqgaohKb3mvHBAgcfYf/jIzL7wLZmrSHtxx9APjZk99o+z0uSH
         QrUY14HTLgq2SikLZujn6J0qesmT5WT82A6A49C3geEbayDzLGOa55s4/HC/+PH6EzTG
         p2PH+1ETIlaDi+9pcsXCXES+9OHGmfvdLF/JZf/kPIB3WASD4BUb8dnm+nQNbXzWtNbH
         e6rt5Gobigq75nMwPQcUQDTQoUo+5XVpG43yuX7NrlX6F1UflhlTOb3YTXcBSe3oahze
         e6rw==
X-Gm-Message-State: AOJu0YwwyjInv6G2uwI5RgRtduohAWPlGcXBSLrEKcoN1t2YmXiG1gyr
	mQJcQdLsjHUrFK75pwiRTTgTS8DuD13YpOvMdt0=
X-Google-Smtp-Source: AGHT+IEL3+CQwidPkJAtFRVwwztI/bLaVkekxlNulT3EdHSdaC3VJm9hek03kju1FI52ClY9FmszrgkbqfJoTX37rNA=
X-Received: by 2002:a17:90a:560e:b0:28c:2cd8:583a with SMTP id
 r14-20020a17090a560e00b0028c2cd8583amr526390pjf.9.1704639857278; Sun, 07 Jan
 2024 07:04:17 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 7 Jan 2024 07:04:16 -0800
From: Amit Dhingra <mechanicalamit@gmail.com>
References: <CAO=gReHEWnw0fnktH0Ka-bvJdy82HHsoyAuZXyPoEzMDzNu1qQ@mail.gmail.com>
 <1d214914-9ff1-4756-a9a9-564410013681@linaro.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1d214914-9ff1-4756-a9a9-564410013681@linaro.org>
Date: Sun, 7 Jan 2024 07:04:16 -0800
Message-ID: <CAO=gReGp+e9S6UAc+-qLkKa5W7OdwFZuT_Dkn1iVu+gNFR8kCQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS : Correct entry for da90??-watchdog in DIALOG SEMICONDUCTOR
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Nik Bune <n2h9z4@gmail.com>, Steve Twiss <stwiss.opensource@diasemi.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	wim@linux-watchdog.org, Support Opensource <support.opensource@diasemi.com>, 
	kernel-janitors@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 07, 2024 at 01:11:52PM +0100, Krzysztof Kozlowski wrote:
> Already sent:
> https://lore.kernel.org/all/20231203113159.92316-2-biju.das.jz@bp.renesas.com/
>
> and here:
>
> https://lore.kernel.org/all/20231106095349.9564-1-lukas.bulwahn@gmail.com/

The more the merrier?

Note to self: Search lore before working on a patch!!

- Amit

>
> Best regards,
> Krzysztof
>
