Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0663C05027
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Jan 2023 14:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjATO0c (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Jan 2023 09:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjATO0R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Jan 2023 09:26:17 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9165A113D7;
        Fri, 20 Jan 2023 06:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674224740; x=1705760740;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=50m4jdU2ORkD5zN+wONLj20tBGwqVi233K0wXXFJYa0=;
  b=GA0prqutaSyc10ceKWZDo2ldopI/snL7RIOE16wq1ituVofyWaLYfOj6
   RdRSDGEBqf9N/V7divmitP+/OchmAQTqu8X7mI38aqVFbh7F/dA1NsxDV
   JwIvbYZaxfRdR/sYnH/P+Eh5PwcFAcbkb6Vu4olHnGGgKjh1//qFQhVC4
   ZYcCugBLoHplJv6TEovRnWidW19B4jWHeRY64LVAXJSi4HCh519RucTwf
   pYFxh55B9KqwjT2JuTrXLsso3dSOqLdllIq5feXiXDl/iDU+r1pXR5kaA
   qNwhQ+H1TEMDzPNwRmuHO9CHFF2K2kmcffqPgSQu13uSTpD+/Iql4z3If
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="scan'208";a="193161162"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 07:25:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 07:25:38 -0700
Received: from den-dk-m31857.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 07:25:36 -0700
Message-ID: <ebcb9a2321ea39ac5164e5df635c2eb02835f41c.camel@microchip.com>
Subject: Re: [PATCH net-next] net: microchip: sparx5: Fix uninitialized
 variable in vcap_path_exist()
From:   Steen Hegelund <steen.hegelund@microchip.com>
To:     Dan Carpenter <error27@gmail.com>
CC:     Daniel Machon <daniel.machon@microchip.com>,
        <UNGLinuxDriver@microchip.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "Paolo Abeni" <pabeni@redhat.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        <netdev@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>
Date:   Fri, 20 Jan 2023 15:25:36 +0100
In-Reply-To: <Y8qbYAb+YSXo1DgR@kili>
References: <Y8qbYAb+YSXo1DgR@kili>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for the fix.

I have not seen any CONFIG_INIT_STACK_ALL=3Dy in any of my .configs, though=
, so I
will be updating my test suite to catch this.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>

On Fri, 2023-01-20 at 16:47 +0300, Dan Carpenter wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> The "eport" variable needs to be initialized to NULL for this code to
> work.
>=20
> Fixes: 814e7693207f ("net: microchip: vcap api: Add a storage state to a =
VCAP
> rule")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Probably you had CONFIG_INIT_STACK_ALL=3Dy in your .config for this to
> pass testing.
>=20
> =C2=A0drivers/net/ethernet/microchip/vcap/vcap_api.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c
> b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> index 71f787a78295..69c026778b42 100644
> --- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
> +++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> @@ -2012,7 +2012,8 @@ static int vcap_get_next_chain(struct vcap_control
> *vctrl,
> =C2=A0static bool vcap_path_exist(struct vcap_control *vctrl, struct net_=
device
> *ndev,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 int dst_cid)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vcap_enabled_port *eport, *e=
lem;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vcap_enabled_port *eport =3D=
 NULL;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vcap_enabled_port *elem;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vcap_admin *admin;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tmp;
>=20
> --
> 2.35.1
>=20

BR
Steen
