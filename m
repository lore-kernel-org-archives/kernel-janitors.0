Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA5D1DF252
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Oct 2025 06:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760163040; cv=none; b=H2n/FNmItaI9yKA6+m+4C61UuMOR0aZUNqSn90mSHhYWP74b5LT3e4JjH3sDPhY2Wt0N8wUeVnOwagYFe3GX7jvXRkDuoHTXIQmM65iYYiaYemA8a2dlgySNIOH3WAveC6RyTm12nQoFGyGS5Dzm8wclO7iTsYJG4huFEGaA4bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760163040; c=relaxed/simple;
	bh=2p+amGVVgrGjR7T5iXx7r5yyISJ2EeCii+Sp44vNGMw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WIpMvOcPER/5AnCkeBdoGx8owN05WmSr/3iV4KnKQU2y2iW3jcWRBrym1Es/vQBu75xO5KK7OpY5PnrRRyijxqOMbFC8MlSdDb8pNQkx0S8dC1FN7p6O4/c8dp0g8z+G+ezWYo3tcUO9MFPwfC/I70NfEOV8YF4XghTYM5oYoxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJ5HdD3a; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJ5HdD3a"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so495110266b.3
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Oct 2025 23:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760163036; x=1760767836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ys56ihfHd4N+YA1C7C0dMZozeal+vxhpAq3e/Yrq9co=;
        b=OJ5HdD3a0fZZbpKyoqZxKNa6Ma2r3Pob7qKsFdh8d9h4YwLQwBmAuO1Z7s9b59eATF
         UqtFE2ex4OmU5/My2yvAibC/DJbcWj++bfav5eSanGpfnOzw4CVs8cUSYQCLfreFQV3J
         DbZ0A4XkJxrIw1UfkdlKulH7Y/5UsdU7L9BhO/B3wlWTgFuBs7CPe6Q0OxyPhtWVHgCZ
         m83yPRZnENQSUajgeQAiWQMUzMleS9/BZ885dJ2AdKL4w0zRSiSgFdwLoowo71YZFDp2
         Qz7tNGWidUyYgVY+S5X8ZOUsWvdonY26Wi4rfrsYspamLMedZF8JOXVmrsgnu6pxmv2U
         K0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760163036; x=1760767836;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ys56ihfHd4N+YA1C7C0dMZozeal+vxhpAq3e/Yrq9co=;
        b=Zwngw4QPRHloVE1G47sgKMfhaKUnvEY/0XFwQaIEi/fT+Qf0+Gx8GTL42DGp3GMs3T
         wU+CiBCEH1kgf6D5h9f6oFqFXNjRDmt2/FR2PtiekwBtz90Bor2lecNfph3EoaXXjeC8
         zF9EgWLw5prp0TYP2ytvB9Ur4fFud5WZtZIcXt+6f9WEC2v9DUYsfYBy9MzTdAjvST1N
         4CKFbQht9dXjqEJDch8ScQDVG8AWkPvmiHfOydnIeMIXEhgubks8rkq0l++cFrFqr42L
         OnUVmLLf02agoAqM5IJgDi27rct1Za1Kn0KZF8z8Ph8vUdeYbSGwqhhDz3YMz1YsnDTV
         80Vw==
X-Gm-Message-State: AOJu0YyT2wWEP1ZrnrzIJYF3d3itwBH2WNGA/Tnlct1XhXdjNj3VjrRZ
	p0M3oJHfKB5eC6QPGrfiPCZHBiYfB3t4VPFZu1nwMx8+wByK2Vc9Z7gL
X-Gm-Gg: ASbGncuGbwXWOjsgdIbIj3WN4yaPZpknkdPv1C4H3gytDbZdWCF34JitsVVUrHbWKz2
	torNlDI9RY6PKvkmjBLlX7oJV4xGBytldIBsPqt6F+WwWPqqa8K0vl/MeVsUAheuTmUHLv/VmKj
	gzAAZjx9YUAwRWzaiGP5K+lLhQR3TIemTh45gV4va31faIKu+Il905XAokt5QfH5Gqtxkauekbm
	WTOhR8uL9RDXEddDWjNb6g8JaXApvXjHA4QgnrmDL701ztEq5HukGHsC9WaHdDrjcLfoJrNz32c
	ouBNh4XAr6F+t81OjlkMpLpdA3IB6jV9cixQBLi0aU8AUz+N/JiLy6g35K2rB2ShN+33HvoBNd/
	Dsd0koc57Bvp9EPghK5FWYznGaS48Tpu80kXdI7AAZAaMf0fXSRWpCWgdbhqmmICsq/+BbNP6
X-Google-Smtp-Source: AGHT+IFlXvGm/JVkQJIR7wHjuMbbVNDorvAS5E7Ic1ASbNZlryaphTiSRh+vYp+gWuP/x6lbjhiQOg==
X-Received: by 2002:a17:906:730a:b0:b0b:20e5:89f6 with SMTP id a640c23a62f3a-b50ac5d07b5mr1353198566b.60.1760163036070;
        Fri, 10 Oct 2025 23:10:36 -0700 (PDT)
Received: from ehlo.thunderbird.net ([91.187.204.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900cb5esm403487166b.61.2025.10.10.23.10.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Oct 2025 23:10:35 -0700 (PDT)
Date: Sat, 11 Oct 2025 08:10:33 +0200
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Lukasz Majewski <lukma@denx.de>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Arnd Bergmann <arnd@arndb.de>
CC: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_MAINTAINERS=3A_update_entries?=
 =?US-ASCII?Q?_in_ARM/CIRRUS_LOGIC_BK3_MACHINE_SUPPORT?=
User-Agent: Thunderbird for Android
In-Reply-To: <20251008095112.104995-1-lukas.bulwahn@redhat.com>
References: <20251008095112.104995-1-lukas.bulwahn@redhat.com>
Message-ID: <ECE2E37B-5A1A-493E-872F-B3543B40142B@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8 October 2025 11:51:12 CEST, Lukas Bulwahn <lbulwahn@redhat=2Ecom> wrot=
e:
>From: Lukas Bulwahn <lukas=2Ebulwahn@redhat=2Ecom>
>
>Commit e5ef574dda70 ("ARM: ep93xx: delete all boardfiles") removes
>ts72xx=2Ec, but misses to adjust the ARM/CIRRUS LOGIC BK3 MACHINE SUPPORT
>section, which is referring to this file=2E
>The BK3 machine support is now provided by the device tree source files i=
n
>arch/arm/boot/dts/cirrus/, as pointed out by Arnd Bergmann (see Link)=2E
>Update the file entries accordingly=2E Also add Nikita Shubin as maintain=
er,
>which is proposed in that mail thread as well=2E
>
>Link: https://lore=2Ekernel=2Eorg/lkml/d125b5a5-8118-48ec-8af4-243a217170=
df@app=2Efastmail=2Ecom/
>Signed-off-by: Lukas Bulwahn <lukas=2Ebulwahn@redhat=2Ecom>
>---
>Arnd, please pick this quick administrative fix=2E Thanks=2E
>
>I noted a year ago, I will sent a quick v2, but this got onto a pile of w=
ork
>and I only now got back to this=2E Sorry=2E
>
> MAINTAINERS | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index f41dbfecec91=2E=2Ee6e615954c6a 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -2558,9 +2558,11 @@ F:	drivers/net/ethernet/cavium/thunder/
>=20
> ARM/CIRRUS LOGIC BK3 MACHINE SUPPORT
> M:	Lukasz Majewski <lukma@denx=2Ede>
>+M:	Nikita Shubin <nikita=2Eshubin@maquefel=2Eme>
> L:	linux-arm-kernel@lists=2Einfradead=2Eorg (moderated for non-subscribe=
rs)
> S:	Maintained
>-F:	arch/arm/mach-ep93xx/ts72xx=2Ec
>+F:	arch/arm/boot/dts/cirrus/ep93xx-bk3=2Edts
>+F:	arch/arm/boot/dts/cirrus/ep93xx-ts7250=2Edts
>=20
> ARM/CIRRUS LOGIC EP93XX ARM ARCHITECTURE
> M:	Hartley Sweeten <hsweeten@visionengravers=2Ecom>

Acked-by: Alexander Sverdlin <alexander=2Esverdlin@gmail=2Ecom>
