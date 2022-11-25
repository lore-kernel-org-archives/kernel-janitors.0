Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1583C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 25 Nov 2022 06:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbiKYGWl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 25 Nov 2022 01:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKYGWj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Nov 2022 01:22:39 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2FC18347
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Nov 2022 22:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669357357; x=1700893357;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   mime-version:in-reply-to;
  bh=3zbPZdfWL5MZZQT9oYk6fSqU6L8kRa1eQ+IO13BEki0=;
  b=ZvMpWvedxNJBTw26NmRDCU5EGjZZPplLFsN5pJmLtj+4yFjGRYM2qdw6
   W4PQduPG32zGMiHUIVVzsFeKRPljBGUiHIeDbhRlMKwHihT2TrC8zHuiI
   jQ9sJOdBp6ikNps35Jv5cmMmQaZDR3SGY9zNV/1QVXDsXRiFlzFRP/9BP
   xOecFq4Ovjii+nVb1RDMq0Z37B8vL7KKitMdDw1zmkgtM6uctPnycgVCe
   WDhDwp3W78F+3a+pWv5Cou6aGxXpKCAHeF2qYOWXqXaIfC2QlNuLhptIk
   2/umTCMXuw5GJQ8Vx6vjHdZDwxowyz/IqTuEFguAiNNMH7aVBHIyj1iNt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="376563262"
X-IronPort-AV: E=Sophos;i="5.96,192,1665471600"; 
   d="asc'?scan'208";a="376563262"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 22:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="705969604"
X-IronPort-AV: E=Sophos;i="5.96,192,1665471600"; 
   d="asc'?scan'208";a="705969604"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
  by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2022 22:22:34 -0800
Date:   Fri, 25 Nov 2022 14:21:31 +0800
From:   Zhenyu Wang <zhenyuw@linux.intel.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Colin Xu <colin.xu@intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()
Message-ID: <20221125062131.GX30028@zhen-hp.sh.intel.com>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <Y3OQ5tgZIVxyQ/WV@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PY8tzLeNxmyMVNR3"
Content-Disposition: inline
In-Reply-To: <Y3OQ5tgZIVxyQ/WV@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--PY8tzLeNxmyMVNR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.11.15 16:15:18 +0300, Dan Carpenter wrote:
> Call intel_vgpu_unpin_mm() on this error path.
>=20
> Fixes: 418741480809 ("drm/i915/gvt: Adding ppgtt to GVT GEM context after=
 shadow pdps settled.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index d6fe94cd0fdb..8342d95f56cb 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -696,6 +696,7 @@ intel_vgpu_shadow_mm_pin(struct intel_vgpu_workload *=
workload)
> =20
>  	if (workload->shadow_mm->type !=3D INTEL_GVT_MM_PPGTT ||
>  	    !workload->shadow_mm->ppgtt_mm.shadowed) {
> +		intel_vgpu_unpin_mm(workload->shadow_mm);
>  		gvt_vgpu_err("workload shadow ppgtt isn't ready\n");
>  		return -EINVAL;
>  	}
> --=20

Thanks, Dan. Looks fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--PY8tzLeNxmyMVNR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY4Be5gAKCRCxBBozTXgY
J+KDAJ9OgoK2gPxiD4iC1tHtw062lS/dPQCfW+n2gbnAT/A+7NGPcUEQZQBssB0=
=bFGR
-----END PGP SIGNATURE-----

--PY8tzLeNxmyMVNR3--
