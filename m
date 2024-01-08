Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F399D12B6F
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jan 2024 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="IqYHjkSE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1704706866; x=1736242866;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=B77iXMJW1CLRnpZR2rSQ4vLoortrd1RkPBCNF8M3kFw=;
  b=IqYHjkSENKAIAl0mgNgGI5BB0DWS+INJeYqE+u9tvyCQ+66THGRLIMjF
   TYVHTnrYUw8ryX1HPeunmeR4LohKRkujQ69hJIOUTtbpUFTbpt2hWFdOi
   Q3exFg4Aw3+nsVFkHuzNWgbrml/wQWfhbVrYwskG3TpOmyKBuxFAEY+8f
   keyB85zUDfeOEZtvvoaiYIezihyppJkHHJt09gdlB+bosB4WGOd0RybU3
   yoKFISs+efFiMXwuo9QamhahFfPzUWCZIP4LvQnbn8+fNzTy0txYdf9lN
   4LMy++4BXVofsMiojBv7YcrKlMZFnm/Kzuv1+gs4mrxHvJWrqlqOo6xWn
   g==;
X-IronPort-AV: E=Sophos;i="6.04,340,1695679200"; 
   d="scan'208";a="34781965"
Subject: Re: [PATCH] MAINTAINERS: correct file entry for TQ SYSTEMS BOARD
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 08 Jan 2024 10:39:55 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E887D280075;
	Mon,  8 Jan 2024 10:39:54 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, Amit Dhingra <mechanicalamit@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, Rob Herring <robh@kernel.org>, linux-imx@nxp.com, linux@ew.tq-group.com, kernel-janitors@vger.kernel.org
Date: Mon, 08 Jan 2024 10:39:54 +0100
Message-ID: <5245165.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAO=gReFGZV92mj8cz7Y=uZayYpoJBiLig9-p-G6UUNp7mH4Dxg@mail.gmail.com>
References: <CAO=gReFGZV92mj8cz7Y=uZayYpoJBiLig9-p-G6UUNp7mH4Dxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

thanks for the patch.

Am Sonntag, 7. Januar 2024, 12:19:50 CET schrieb Amit Dhingra:
> Commit 7564efb37346 ("MAINTAINERS: Add entry for TQ-Systems device trees
> and drivers") adds MAINTAINERS entries for TQ Systems Board, but these
> files were moved to vendor specific directories in Commit 724ba6751532
> ("ARM: dts: Move .dts files to vendor sub-directories")
>=20
> Fix the entries.
>=20
> Found by ./scripts/get_maintainer.pl --self-test=3Dpatterns
>=20
> Fixes : 7564efb37346 ("MAINTAINERS: Add entry for TQ-Systems device
> trees and drivers")
> Signed-off-by: Amit Dhingra <mechanicalamit@gmail.com>

There is already a pending patch at [1]. Unfortunately there is no feedback=
=20
yet :(

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230825055821.30508-1-lukas.bulwahn@gmail.=
com/#t

> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a7c4cf8201e0..a62c40cf24cd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21983,9 +21983,9 @@ TQ SYSTEMS BOARD & DRIVER SUPPORT
>  L:	linux@ew.tq-group.com
>  S:	Supported
>  W:	https://www.tq-group.com/en/products/tq-embedded/
> -F:	arch/arm/boot/dts/imx*mba*.dts*
> -F:	arch/arm/boot/dts/imx*tqma*.dts*
> -F:	arch/arm/boot/dts/mba*.dtsi
> +F:	arch/arm/boot/dts/nxp/imx*mba*.dts*
> +F:	arch/arm/boot/dts/nxp/imx*mba*.dtsi
> +F:	arch/arm/boot/dts/nxp/imx*tqma*.dts*
>  F:	arch/arm64/boot/dts/freescale/fsl-*tqml*.dts*
>  F:	arch/arm64/boot/dts/freescale/imx*mba*.dts*
>  F:	arch/arm64/boot/dts/freescale/imx*tqma*.dts*


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


