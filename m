Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699B6C43334
	for <kernel-janitors@archiver.kernel.org>; Mon, 11 Jul 2022 03:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiGKDVh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 10 Jul 2022 23:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGKDVg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 10 Jul 2022 23:21:36 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B072313F16
        for <kernel-janitors@vger.kernel.org>; Sun, 10 Jul 2022 20:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657509695; x=1689045695;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   mime-version:in-reply-to;
  bh=2qp4YipWUX/C4jVXBnzl+RaM7ZAO0S2pUK4iM5GtZHM=;
  b=HefH25yemoo43Vl2Z7PAjKgtMSs5lwZrI7AVuz+7gStEgWT/4Fd8oB0k
   +nqwviH9q9s7r7kDkoQYdqhp8Ed24BMau37UPHAD+3pETWMIrRVnepxwQ
   lFYo1zxIG6ggA5ZN2CQ87JV3vAhj6/O0hNkC04IiCUJ74f7Y88YIHxaBY
   HaSwYzoc0xIxpEc593lZZMTe0+eCc5bo5pU7KkwlNK9AnzKoy2OJWVBD8
   4js++d5tIDr8fHqoFdEKStqvVIyXpTcxaS/0gF0isJRpdwWE9Kriv9s/C
   UDdiZuGeW8rkHiTh5XRTVIkKCyMrvQoxh5NSdGcvsy3jVrXaqtJ8czsRj
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="285309889"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
   d="asc'?scan'208";a="285309889"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 20:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
   d="asc'?scan'208";a="652287059"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jul 2022 20:21:32 -0700
Date:   Mon, 11 Jul 2022 10:58:08 +0800
From:   Zhenyu Wang <zhenyuw@linux.intel.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        intel-gvt-dev@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gvt: IS_ERR() vs NULL bug in
 intel_gvt_update_reg_whitelist()
Message-ID: <20220711025808.GQ1089@zhen-hp.sh.intel.com>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <Ysftoia2BPUyqVcD@kili>
 <01c7440e-8198-878c-cfb6-b54468b1dca5@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EDT6MSV0B3GxyNyZ"
Content-Disposition: inline
In-Reply-To: <01c7440e-8198-878c-cfb6-b54468b1dca5@intel.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--EDT6MSV0B3GxyNyZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.07.08 10:55:52 +0200, Andrzej Hajda wrote:
> On 08.07.2022 10:41, Dan Carpenter wrote:
> > The shmem_pin_map() function returns NULL, it doesn't return error
> > pointers.
> >=20
> > Fixes: 97ea656521c8 ("drm/i915/gvt: Parse default state to update reg w=
hitelist")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>=20

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks! Will push to -fixes.

>=20
> > ---
> >   drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i9=
15/gvt/cmd_parser.c
> > index b9eb75a2b400..1c35a41620ae 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > @@ -3117,9 +3117,9 @@ void intel_gvt_update_reg_whitelist(struct intel_=
vgpu *vgpu)
> >   			continue;
> >   		vaddr =3D shmem_pin_map(engine->default_state);
> > -		if (IS_ERR(vaddr)) {
> > -			gvt_err("failed to map %s->default state, err:%zd\n",
> > -				engine->name, PTR_ERR(vaddr));
> > +		if (!vaddr) {
> > +			gvt_err("failed to map %s->default state\n",
> > +				engine->name);
> >   			return;
> >   		}
>=20

--EDT6MSV0B3GxyNyZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYsuRtgAKCRCxBBozTXgY
J5q6AJ9VkM3j3Eu+FNObxEPkc6ZadRVuRACgkMngUibSKyZb9TIVSM9YGpiNsqg=
=CzlW
-----END PGP SIGNATURE-----

--EDT6MSV0B3GxyNyZ--
