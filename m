Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FBAC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  5 Oct 2021 19:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C541A61371
	for <kernel-janitors@archiver.kernel.org>; Tue,  5 Oct 2021 19:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235224AbhJETwx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 5 Oct 2021 15:52:53 -0400
Received: from mga05.intel.com ([192.55.52.43]:23709 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230333AbhJETwx (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Oct 2021 15:52:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="312041786"
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; 
   d="scan'208";a="312041786"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2021 12:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; 
   d="scan'208";a="458176402"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by orsmga002.jf.intel.com with SMTP; 05 Oct 2021 12:26:56 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 05 Oct 2021 22:26:55 +0300
Date:   Tue, 5 Oct 2021 22:26:55 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        =?iso-8859-1?Q?Jos=E9?= Roberto de Souza 
        <jose.souza@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
        Dave Airlie <airlied@redhat.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/tc: Delete bogus NULL check in
 intel_ddi_encoder_destroy()
Message-ID: <YVym/wi1xCuyntvY@intel.com>
References: <20211004103737.GC25015@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004103737.GC25015@kili>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 04, 2021 at 01:37:37PM +0300, Dan Carpenter wrote:
> The "digi_port" pointer can't be NULL and we have already dereferenced
> it so checking for NULL is not necessary.  Delete the check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks. Applied to drm-intel-next.

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 51d07e9af9f3..b9c6eb13804f 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4025,8 +4025,7 @@ static void intel_ddi_encoder_destroy(struct drm_encoder *encoder)
>  	intel_display_power_flush_work(i915);
>  
>  	drm_encoder_cleanup(encoder);
> -	if (dig_port)
> -		kfree(dig_port->hdcp_port_data.streams);
> +	kfree(dig_port->hdcp_port_data.streams);
>  	kfree(dig_port);
>  }
>  
> -- 
> 2.20.1

-- 
Ville Syrjälä
Intel
