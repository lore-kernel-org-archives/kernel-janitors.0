Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A54C79D1
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Nov 2023 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kv7cb5gR"
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102D4D43;
	Fri,  3 Nov 2023 01:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698999354; x=1730535354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bvVuH8PuQUV64vR22Glj7m93WZ75FEboVmfiiEOIF00=;
  b=kv7cb5gRKPLmo3mawp9RGLy0THUfNckfJHn26oqsxt9NgkF3WxVJc6Yp
   Wl4zo86urRg2OG08PWthgRWDTypXfafVhJKTipiwE+vcD1xcsyjnZSYfc
   jic2ntC5UdJfTetP37zspTAeFEGCjVMscCWfygmVmgmWd9134alJcLcWi
   x7OILzlOaJwtdZNYMN8Ox8E/+W1PtVJtLfDh3i/ABMCD1dtjArIx5Ynfk
   RCrbkU26gK6l9z9QBOP57Azx+aQPSdIx24jpuSVLq4vtFpzwbFtRDu57Y
   eAmDAlZkFKcOVmbXQwpJDVDWxy+zlEJvf48zGqJdurt7rjUyE112kUY6t
   w==;
X-IronPort-AV: E=Sophos;i="6.03,273,1694728800"; 
   d="scan'208";a="33793751"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Nov 2023 09:15:51 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A229028007F;
	Fri,  3 Nov 2023 09:15:51 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file patterns in TQ SYSTEMS BOARD & DRIVER SUPPORT
Date: Fri, 03 Nov 2023 09:15:52 +0100
Message-ID: <13490070.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <11135245.nUPlyArG6x@steina-w>
References: <20230825055821.30508-1-lukas.bulwahn@gmail.com> <11135245.nUPlyArG6x@steina-w>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Am Freitag, 25. August 2023, 08:19:32 CET schrieb Alexander Stein:
> Hi Lukas,
>=20
> Am Freitag, 25. August 2023, 07:58:21 CEST schrieb Lukas Bulwahn:
> > Commit 77da3f22b3d5 ("MAINTAINERS: Add entry for TQ-Systems device trees
> > and drivers") adds some file patterns for files in arch/arm/boot/dts/, =
but
> > those patterns do not match any files in the repository. Hence,
> > ./scripts/get_maintainer.pl --self-test=3Dpatterns complains about brok=
en
> > references. The files of interest are actually in the directory
> > arch/arm/boot/dts/nxp/imx/.
>=20
> Nice, I didn't know about --self-test=3Dpatterns. But you are right, the
> patterns do not match anymore since arch/arm dts restructuring.
> I also suggest to add the Fixes tag:
>=20
> Fixes: 77da3f22b3d54 ("MAINTAINERS: Add entry for TQ-Systems device trees
> and drivers")
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Any progress on this?
Thanks

Alexander

> > Adjust the file patterns to match the intended files.
> >=20
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > Lee, please pick this minor clean-up patch.
> >=20
> >  MAINTAINERS | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 52277ee9c1b8..f5d4058b7ff4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -21817,9 +21817,9 @@ TQ SYSTEMS BOARD & DRIVER SUPPORT
> >=20
> >  L:	linux@ew.tq-group.com
> >  S:	Supported
> >  W:	https://www.tq-group.com/en/products/tq-embedded/
> >=20
> > -F:	arch/arm/boot/dts/imx*mba*.dts*
> > -F:	arch/arm/boot/dts/imx*tqma*.dts*
> > -F:	arch/arm/boot/dts/mba*.dtsi
> > +F:	arch/arm/boot/dts/nxp/imx/imx*mba*.dts*
> > +F:	arch/arm/boot/dts/nxp/imx/imx*tqma*.dts*
> > +F:	arch/arm/boot/dts/nxp/imx/mba*.dtsi
> >=20
> >  F:	arch/arm64/boot/dts/freescale/imx*mba*.dts*
> >  F:	arch/arm64/boot/dts/freescale/imx*tqma*.dts*
> >  F:	arch/arm64/boot/dts/freescale/mba*.dtsi


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


