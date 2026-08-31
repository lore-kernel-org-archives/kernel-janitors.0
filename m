Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566583CAA2E
	for <kernel-janitors@vger.kernel.org>; Mon, 31 Aug 2026 07:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161906; cv=none; b=LeP0GjTJ4XidtQbPpVITzRkig2cTS2ycZHW9IXRn1Sm1B0QTU7/IjGGhulr2+FRA3wVLKNe/wVQXJN7qosTC8eOCae7M0SXzkg0/FZcxwa6FegQ3qEcbpoS/yu3j3/3TOHUdPznFjDfwmGUs0d0dHsHKNm0r6++x9z1m0f1lAGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161906; c=relaxed/simple;
	bh=5GrRjcaI03gjaXtG0ojiV5JyfTxjAwxYCZIcBdozizs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZ38iygFxDXkzhBYMA8VeVxYsYlDJqfrjqvYcIQnCqZ+TMIlfZVFDl0j44Vqb9vzfekYzpFmexows3Nizihj5KFzWUKR5QFaQMIHWUsCvEbHaOVwYc2peU0Uu2r3WsREyce6QAtCcrrSz/SQw6zVAbeB4Cqjr6sIBhiOHm16Nko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=RgzrKENU; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="RgzrKENU"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c207cb16cf5so503011566b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Aug 2026 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788161902; x=1788766702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwC1H5E6QITqrCXuXOQp3c3SXNsKMl+a0m0u7ImLlsA=;
        b=RgzrKENUwvrnjjexpy+WBcsj29+rT7OtZGpgxcj4ZJlPZ9KeXDw6khod1VjOH3lYJH
         84Iv67PLlQwGrr/Liq5obNplSuoSOG/YxzwgrnpVNHl/dT+jffBNhPZ10djbw/9aAMhF
         gX74psnY4Q7sT2S3TcGNlJX0srfgCYWojFnzc1Vu7s2k7E5CdO+nZGp+mVx2oiD0Inxb
         buzAZ2Ag1EjbXAsoYfJhrd9+ttRRTs74+i0+ngIQpU6TbskwW3HcsNJYMi+Oef9IMwK5
         4OgpxGOAStSZxcVwhf9o0CjftxD64hbuyrL5K7V7N/0O7FUzPum5fyJI2AA6GqZTm9ys
         SS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161902; x=1788766702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwC1H5E6QITqrCXuXOQp3c3SXNsKMl+a0m0u7ImLlsA=;
        b=VjhilKyg5xf4FUz948BvN7UUjiUMt8aa+urPHbkftwzvkPJvJwVLcdgTj5Kwz36D9H
         uHY6xzlCWQqUdhwU2uBe0chycfU4EM79l9BA3Fa9vZ6KGkQq+nR8cvGls1NI4TqTzZRe
         Vv++IY2/G9VTUrP51gsINFZ2QNyL9iI0Yo6auqMxn/ghBjYF11xbn2sVM3mI2G1wzjTE
         g3OlS/2xoLAnaVZjlQXXtGyntb4orh5Puzv6+u48BjztuZ9t0dbriGAwgKTv16ymlrCC
         izAzN1pNO6Tpz+iNXFyRljS7TzLN1yfMTZZrDI/eiXNlqo21wKCi8vTEBEYxyiyCxedo
         dK4A==
X-Gm-Message-State: AFuF++lRSPuEPYKBk5GFjD/t1OTumK3/rRJDTjPmGhjgbdmnmryjROZo
	00SNNsq0xwSqUxSheAt1YQrc0VrMlSrEbnbZytC/yk+M+DqRn1nxgt1ApF1Xu7odEQ==
X-Gm-Gg: AR+sD12z/ratLvRw4xuML5Jejf4lQSTdemBRrGnqfKG/HLJ/ZsKnzSEwhKvMsgP+y0w
	XWFRNsJqfWzZEaZBt5uweNMgDtLr/aySI4GlexBzds9z7Pk/v1+kN+az/ZiWgGsH0pg85XIJQ/x
	cYpySr3Em9p/+SWCCS38xYqZ7twKd69vcNz/0ZbArD+jNrUY8UeLpnpoT/MVYcGzYLInljXo34v
	QG4X+XiE18tngvZXf2MKiphNEIy7K3j2Hxe+SQW34VRz2ApU7Pcv9PYolLTgJ7CgdUjzNscl30S
	Sj9G2gm36fMOP5dJ5OgioxlD4CqYItbGyNnbiQWHXQJ2JDuh2XSeZxcoGddJC2/aWmxGCoUT3t4
	5a6AFVw5T5CipDLllXgyGaJOyDWkiUyjgz74mZ3kYlrXuUrgBqceHBA/E3snorL/Otci88eO2ll
	Z/s6+Lrd5JcnztvBLQ4UzlOHjf8chUARpjo6wIqqI+GuD56yMJ5IXu7UtwRKmI59FGw5WXopzN3
	c9wEwktjqA6w6dKIOj1rzB4YR2fUY59A86uTw==
X-Received: by 2002:a17:907:1b07:b0:c12:5a0e:3e0 with SMTP id a640c23a62f3a-c25571a8fb4mr1559731766b.19.1788161902399;
        Mon, 31 Aug 2026 00:38:22 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b28f6sm368630966b.39.2026.08.31.00.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:38:21 -0700 (PDT)
Message-ID: <4b70d099-b8f6-4e96-a946-6333b1d64bd4@monstr.eu>
Date: Mon, 31 Aug 2026 09:38:21 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: drop unneeded semicolon
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801191002.1383835-2-Julia.Lawall@inria.fr>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260801191002.1383835-2-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/1/26 21:09, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.  All uses have been verified to
> have their own semicolons.
> 
> This was found using the following Coccinelle semantic patch:
> 
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i = i };
> expression e;
> @@
> 
> *#define i(...) e;
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>   arch/microblaze/kernel/cpu/cpuinfo-pvr-full.c |    2 +-
>   arch/microblaze/kernel/cpu/cpuinfo-static.c   |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Applied.
M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

