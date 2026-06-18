Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5053F0A87;
	Thu, 18 Jun 2026 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781029; cv=none; b=ApHtneSn5IiWwMFX8bAIueyopeVeqyPiCz4/1Ym4DiytHy5NWbxqxkfiLK86zeal1QMVU5ILm55BaAQO+ZC0BwjEE6oRN7/8q/fqCbQ/115xw1RCjy4g+VjQNIrRL5rFCUW/ivgDk2AOrAwebfaKqbcINwHIg8UL7P4bsuG37q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781029; c=relaxed/simple;
	bh=XAi4LQz68mwbO06PgjspXhNjInqENaay3fnNGiXT14c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WegUsNE4pthsggL4K0ifwc/y2zLWcDAcoAz5Hibbfwea3l1eOEMkjafD10EKDYz+XzJfW7l4bYOLFllYzTv0UMJyb7Vv9T2CGN/OiFVSgPDO47soJzqy0n2Qi66NzR3Qgo/VouTpJHZSFwDD9b11KU7UHHu7QbCQCYPCBYlG3Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etyVOmPe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etyVOmPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781781028; x=1813317028;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=XAi4LQz68mwbO06PgjspXhNjInqENaay3fnNGiXT14c=;
  b=etyVOmPeohye6Vg1gzPkcTuNSusY1FmRtx/OyvphXg3ooOBah6F88rMx
   XU23R0ENmMbH0vUtB89JTlqXO18J3+oW94uqN3+lM3kCsTrm6mX8NzPEp
   pCbddauWXOYkzzFJDK6KmldWx80HdusNWOY31MFTu+sasX4XSS9yJ9Ta1
   8rR9s3uEQPNKt8nNo9g75mpq3tMeBYRI7nC/LMhmfMasMkDiW+0jxGSLh
   YHi0dARjEMPYmpjLmTsvW8wuWzidxZP5YDiVPS98e7WOm2Q2p4VpkCpA7
   ahBGvbgB8z5VhGXuvyR3C2k0Nt4zQdv/8NeSAuvRhcrERv/gqos1WUVdA
   A==;
X-CSE-ConnectionGUID: zYOLfa5VT3qKO4NqE4sWEg==
X-CSE-MsgGUID: 8oLAI4VRTcu6/kHHwqToug==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="108157649"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="108157649"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:10:28 -0700
X-CSE-ConnectionGUID: De7huVCkSCexAOq+Mqo4Cg==
X-CSE-MsgGUID: GAWHosKLSwW4vyQYKfskeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="241962087"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:10:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/i915/display: make read-only array rates
 static const
In-Reply-To: <20260608122427.48375-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260608122427.48375-1-colin.i.king@gmail.com>
Date: Thu, 18 Jun 2026 14:10:22 +0300
Message-ID: <9714acffb335c9cc4ce6d6f2c0ce6fd7c5570b8c@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 08 Jun 2026, Colin Ian King <colin.i.king@gmail.com> wrote:
> Don't populate the read-only array rates the stack at run time,
> instead make it static const.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks for the patch, pushed to drm-intel-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 9076c2b176ec..351a62654a8d 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -71,7 +71,7 @@
>  
>  bool intel_hdmi_is_frl(u32 clock)
>  {
> -	u32 rates[] = { 300000, 600000, 800000, 1000000, 1200000 };
> +	static const u32 rates[] = { 300000, 600000, 800000, 1000000, 1200000 };
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(rates); i++)

-- 
Jani Nikula, Intel
