Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F4312FF69
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043976; cv=none; b=FiRAxs0qoFb6NfeyThJR2CHUm1Y56hTLGuv5qwEpVABTIXShyH3mGXmsFY6SrzLQJkhFOjsf69GtTyGoWSHqMgLKUrH5eqjWMHpVM8AIXTjn5GB9nRKxew5gq2uyTBYrQbX+K5dW8bSpNEZpjPpXvIeMauaoahAV+DPHYiqoXmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043976; c=relaxed/simple;
	bh=Fp3HYrbb7PdOhzMKQ5EfcrzRnU05kLPwbocKk8hhCgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtxV4J8hZLoY5WHpdRoqgANoNSryo5Yf4eL5gEq3KsGddpItBCQgohka4JUyvo/PCHYri9GUj9AZ1WoTXSkHjB9nllorhAb7VUJ/86PAPgkUdzGwM6HG9+vgxy+IHXcinFaT9WlbdUO2AB1nFeahnNLmCTIBrCVIvlu0NVwQRHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntUfFjiW; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntUfFjiW"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb61bbeb25so642131a34.1
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784043974; x=1784648774; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNt4aFBQBTeC6gh7XjshPB2bRqBQHmW7ChcRLsTBtjU=;
        b=ntUfFjiWVhAYvidHnS8lcRjsP87CDHFdpdKF950ToE8Y1ymr5Qq8zt3af/1UHkPC+3
         vSVViRBmo5/ehzwRE+P5NiDqY9Wk7ZoeFGyucOj5o4fefCw7LDh3uvtXSWxy5eYyJ14L
         FZKX4I5WGQfEFeIOX7Ggtw4xIHZX09BsWoae+hecQbczKTzaY3QMU5BMpTwzyP4pYYxL
         2CQFkPdsqNMOFRqJeQr4Ay2NqVfPmvylj+MQFQXjTgyCl6+0qdd7nAl4T9ENMABaNXga
         JPBF00Se1bY0bBf+jqpk9A/ZluX0JDtJCcmmj1v0ScyCXXdnTVE0QPc484mn19yuNnCs
         8WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043974; x=1784648774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nNt4aFBQBTeC6gh7XjshPB2bRqBQHmW7ChcRLsTBtjU=;
        b=MOVFxyXeX9VPvKbeQ+bmW8aILdGNgnDbbAJSHJT7wUSxx7GcFj8w/nuT16yaMKIWKW
         biQ4OkVT4+YeskCS+H+6NPsaYeTVfjtqwHMbsI5nt3n94cFve8jimyvHhQP2Bw2syH7R
         AB4jpCSDuf9WaNybHHubGMdCzAmSiKBiu2+Jd+tUrlX9OnkrVgo0Yoyw6kPqwORPxygU
         fO61d30x0mJTBuqXnVJE0bN34/APwaUKTbvDRGrCs7FmJdkSoMZoSv6Zy0WjPGbsVSUX
         mV5tAdwLCmvVMnV9tKl6rm562qydxsfL1mQsBAO2odOcGsW3d7YJguqoEiVNYd30QkPr
         4XUw==
X-Forwarded-Encrypted: i=1; AFNElJ9Q1zkiGc+dm7loe0AhYG4LEpxqWBei19sxjBvcCJFnjUpbjMEM9hD3yyN8y59I6rfnKP20uUCbIGpoIrS3WqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpCAgFg76e7NDQHySSrV7Dlpnqe/YH/fg2C9+14Xtr9ICZLMea
	zDpklEkCt/yYpGN6fsHXNfUi8MdgyUkO3lJ99Cr4h97TfsDYB4eRs1Zq
X-Gm-Gg: AfdE7cmbmL8YKkhCSbaojWgOvxrV4Hn8f5xEhFFlCXbjHqD4NcwZXzvnGaAW/Gqr7d5
	0be1+qB8LwaOQMNkolnawzOUMcc9ejRU/CP3BhGE38EfnPiyD8ZJFtPCKlhuTEYLfpBfyxJ8s1L
	MeGEZD2lr4tu/tjmnA+8n5KTpS3ZRDKdYLU39jO19vLOEcyw0RnyDlEPdkMsACL+YuummsiuakA
	NWePMiC0TUG2n3L+y7THgPZG2G8j86ocNCvaaQ+ztlyvn3omA4YPHqzgo/RCsZkgSJhVjzu/90Q
	RVQd2FULpILULAr4Lk8Z3IkopJia9l00cQQAWuLtDYLz1Y+TuznW2WkSxjyNIQcUR+kV2y9YICY
	WN4UvFFYPlHQ3JXWc+xEZ5k078yVqR59rAIKPqGudtMc00Afztj9wHNABv1+yPI3EHVS1u+7Ar3
	ylh0NAJLGhQCuxCB8=
X-Received: by 2002:a05:6830:3108:b0:7e9:c76c:abe3 with SMTP id 46e09a7af769-7ec096027a7mr9375213a34.6.1784043974139;
        Tue, 14 Jul 2026 08:46:14 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb2bc241sm15641928a34.20.2026.07.14.08.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 08:46:12 -0700 (PDT)
Date: Tue, 14 Jul 2026 18:46:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/bios: Move a variable assignment behind a null
 pointer check in intel_bios_encoder_supports_dp_dual_mode()
Message-ID: <alZZviFT2jfABiZq@stanley.mountain>
References: <e81277a0-93f8-45e9-9fa4-7c2c2df9c311@web.de>
 <alZVl0o7uBoncUos@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alZVl0o7uBoncUos@intel.com>

On Tue, Jul 14, 2026 at 11:28:23AM -0400, Rodrigo Vivi wrote:
> On Mon, Jul 13, 2026 at 04:05:53PM +0200, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Mon, 13 Jul 2026 15:56:46 +0200
> > 
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the function “intel_bios_encoder_supports_dp_dual_mode”.
> > 
> > Thus avoid the risk for undefined behaviour by reducing the scope for
> > the variable “child” behind condition checks.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Fixes: 044cbc7a74c136f12a80c855cadd1b085084aef1 ("drm/i915/bios: Nuke DEVICE_TYPE_DP_DUAL_MODE_BITS")
> > Cc: stable@vger.kernel.org

Please stop adding Fixes tags to these and talking about "undefined
behavior" in the commit message.  Pointer math is defined...  It's
just a style preference on your part.

regards,
dan carpenter

