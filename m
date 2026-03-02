Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17E6430B86;
	Mon,  2 Mar 2026 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465108; cv=none; b=SCn3vW0vG1CAWG/wxl9SKRmKdn0WHyHhCFTieIF5Xwzc7KWnPRH8gb2KnALiZVSa4Njtx8XsP/nooskxxfo5xgbI1NdvUMYAXhfzd2OW2KP637ZbMI2WI07MSRB0tsLpZ/ygS9mE1F+uMFjl2eYSI7OqPhWxJMob1NrUG/pLHEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465108; c=relaxed/simple;
	bh=KDS54Jtq3lVG4x9aqolR/LQUP5DZIasw4oTgubvMrlg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lhtHRTlDaol+5lH/u8uJDUI57qPRNaPJ92XW2x9m9Osm2hMAEt7LO709LNn7YnFdMUbxlTqJRNPQJqsWf0TSjobKRlrpWVa5kNsCMZmIPrjLj+4NBRTKXEu8n2SnPIqDWle/bvNOWveOSeB/6vprrQaRb0PL4ouWW5iZbBOFNPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2BZl40p1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2BZl40p1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 32C75C40F86;
	Mon,  2 Mar 2026 15:25:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E632A5FE89;
	Mon,  2 Mar 2026 15:25:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D5DF10369562;
	Mon,  2 Mar 2026 16:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772465104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I/tAMTzIOE7bFqndq4kXm1Iott5bt/Erb8taVDtOhVM=;
	b=2BZl40p1clVD9RsScsSKOR4NzroGtwRaIRwje2dQZpJLdoNWZ1C5lQdSItQ8aotpExfs7M
	lKJ3IEjclt8EZEArNys5PFihZpgwgnGYMW7IcQL51837tlcJZZ9G/hszE+6msTdkzzVGYy
	S6rSR9slyAkCyg0069Laeqqlgvo0GHOGO2270j6xt0biR8YkuFHFd6nXgK5lCpXp6Qud9A
	UmPjRdUD90QCRjCt921q5NThgvHNZ4RPd9GuVOhZlOijNwHNxW3n71WCXKRuO0zfWSmfxB
	pQ/Y0V9kPsiWkS2Q9LePEeRpdrSKCAAc5YifkFma/yRvcDIqmsO3Q6EBjmikjA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Elad Nachman
 <enachman@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: drop file entry in Marvell Kirkwood and
 Armada SOC support
In-Reply-To: <20260203083842.347391-1-lukas.bulwahn@redhat.com>
References: <20260203083842.347391-1-lukas.bulwahn@redhat.com>
Date: Mon, 02 Mar 2026 16:25:00 +0100
Message-ID: <87seaife43.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Lukas Bulwahn <lbulwahn@redhat.com> writes:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit fcaf733ca526 ("MAINTAINERS: Add Falcon DB") adds a new file entry
> referring to non-existing files arch/arm/boot/dts/marvell/db-falcon*.
> Checking with 'find . -name db-falcon*' and the files actually added with
> the commit b3370479a5f7 ("arm64: dts: a7k: add COM Express boards"), which
> was part of the same patch series, the files intended to refer to are
> actually arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dts and
> arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi.
>
> Note though that there is already a file entry for
> arch/arm64/boot/dts/marvell/ in the ARM/Marvell Kirkwood and Armada SOC
> support section. So, the added files were already covered by the
> existing MAINTAINERS file and no further file entry is required at all.
>
> Drop the unneeded file entry, essentially reverting the commit
> fcaf733ca526 ("MAINTAINERS: Add Falcon DB").
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d6c1df42bf5..0c474d8f62ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2989,7 +2989,6 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git
>  F:	Documentation/devicetree/bindings/arm/marvell/
>  F:	arch/arm/boot/dts/marvell/armada*
> -F:	arch/arm/boot/dts/marvell/db-falcon*
>  F:	arch/arm/boot/dts/marvell/kirkwood*
>  F:	arch/arm/configs/mvebu_*_defconfig
>  F:	arch/arm/mach-mvebu/
> --=20
> 2.52.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
