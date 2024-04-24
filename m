Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A0A15DBA3
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713965952; cv=none; b=qQ4zaB3jYGT2f7heivij5WtyBsTXtvGOrkjoJCADQyG6ODXmDPETeln5LzInsjbDQ0zP551vqNYOucbeuPgs6xWz/l33U64vNsbNzIB+ak1r3eAtb/QMtz7J/iwOASSOJenyWK9HQ0dC3YTsD3GHkvUdqWmKwvPa9q2NMNrqhdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713965952; c=relaxed/simple;
	bh=D9UumX0rfFAl8bODnci2/+e3JYR71o9zPa56jancOjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOPKE1rjNvGnhKcFBr7SAvSJHoN9X/2H2gabnDZV0+5txUVBk591tTyARxdunWRoy52aQVMwNJkHgdjwRcYSG2qVA8Wwn1jFMEjWJr1hXV2PfytAAwb63ukTFexkeHLrrBwnw0F1XN4rgfYLiryk5+nogmiNNzXhm2KDuNmx6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wvIuJ+ho; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wvIuJ+ho"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41aa45251eeso19800625e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713965949; x=1714570749; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIDjR8nmsolOxVRznr4LV9PEh0hWdtOUeRoonddM+RQ=;
        b=wvIuJ+hotDgKpgQEaqeldHJkkdwHIUB5oagHQgo0gPAobcnB2oG6+iLLRpW9AEtULP
         t/K1DYrXyMKb0fNsKRSkI3NAWzVsS82sTGfeB3htM5XF4QaPNj9bC90Ezc8Zlz2oKcyE
         w/Qw0D1Qp/bWo3R4qFFG7mu3dCEo5dBAk/59SvFVCpjjDQelsGDFNpJIPU8euODtLiJR
         YgiLfXtz3XP63VZbZAT/N8pvlbQo3hDxHIl8YqjyBRfiIGk7Oe/BzlNnnO1WDkkXkl9+
         yR8LmRpD6rZhzWD3xPEWay99sjPrpBzq7WFLtPImLCFfXIoLS4X7e1ED54shnFnE2uDU
         NpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713965949; x=1714570749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIDjR8nmsolOxVRznr4LV9PEh0hWdtOUeRoonddM+RQ=;
        b=miHgQP7/Slfxj7VOviAhg4ViB43lJTx51guxONK3YanlNPKKUqNuCUoKGKq17IcZe0
         s67BgrBKdUJ3BY2lys3g73PTvdZDxQ/IciF5QCTqsu6OXVkpSQolcLATtsKXG3ge6yVL
         Oo1onXx3v/4ZJFUmHtP3nnbVRzgB9yt8g8C35yreBYLUTYFcE+ino7OHIeNMnuw0Vmtn
         TMYa7/Qk2pucxV8k9GI2F+WuwWJBt/URcEPj+Qwd9aEHn6RNGjwR5pM5JG1ylhBsPll8
         t+ruuPfGUobSwhwmKFTAD3B05PwZzMnjl73FGqlcOh4Rltb0Svj9zFwWoQcij219VHjX
         DeeA==
X-Forwarded-Encrypted: i=1; AJvYcCXghREz4y7yHVA/wGYGAEfxuESQ63T7n0eot059g/v7eZYZy8OOBZH1H8MIhfuvb2ytOmW3ZtziOR1u5S20ipUiN8YQPBs9l1Psg0ftIzy9
X-Gm-Message-State: AOJu0YxCbGn+l5TkJ2kTCQiRHZaTAB0nULZbV+XxVhDUUli28vK5UtqE
	G3AvJMFgLModxDdx6ptBIGKidtZx7KcxjRT9scB2DljgGk2tVk5tHIFbaPlj3zc=
X-Google-Smtp-Source: AGHT+IGNGlL4K3RRWvrPnAS8pS+Nk+ThgYEusmDN6lyoq8bygca8tJqniABTWOqIDwkwqhh9NtmiVQ==
X-Received: by 2002:a05:600c:1c13:b0:41a:3868:d222 with SMTP id j19-20020a05600c1c1300b0041a3868d222mr1706203wms.0.1713965948935;
        Wed, 24 Apr 2024 06:39:08 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fj3-20020a05600c0c8300b00416b2cbad06sm27796791wmb.41.2024.04.24.06.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 06:39:08 -0700 (PDT)
Date: Wed, 24 Apr 2024 16:39:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>,
	Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Alvin Lee <alvin.lee2@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
	Jun Lei <jun.lei@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/amd/display: re-indent dc_power_down_on_boot()
Message-ID: <d3a49914-65de-492f-9bf4-f3daa0c9f3cb@moroto.mountain>
References: <e5f538ab-ebc8-400b-8104-4642b8089b4f@moroto.mountain>
 <bbc315ed-3482-4abb-b3f6-88c335dcf9d2@amd.com>
 <4a996c51-e101-47a0-8a89-78c6f9f01e0f@moroto.mountain>
 <f3b0e0fe-edb9-420d-b4a1-71c267246875@amd.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3b0e0fe-edb9-420d-b4a1-71c267246875@amd.com>

On Wed, Apr 24, 2024 at 03:33:11PM +0200, Christian König wrote:
> Am 24.04.24 um 15:20 schrieb Dan Carpenter:
> > On Wed, Apr 24, 2024 at 03:11:08PM +0200, Christian König wrote:
> > > Am 24.04.24 um 13:41 schrieb Dan Carpenter:
> > > > These lines are indented too far.  Clean the whitespace.
> > > > 
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/amd/display/dc/core/dc.c | 7 +++----
> > > >    1 file changed, 3 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > > > index 8eefba757da4..f64d7229eb6c 100644
> > > > --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> > > > +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > > > @@ -5043,11 +5043,10 @@ void dc_interrupt_ack(struct dc *dc, enum dc_irq_source src)
> > > >    void dc_power_down_on_boot(struct dc *dc)
> > > >    {
> > > >    	if (dc->ctx->dce_environment != DCE_ENV_VIRTUAL_HW &&
> > > > -			dc->hwss.power_down_on_boot) {
> > > > -
> > > > -			if (dc->caps.ips_support)
> > > > -				dc_exit_ips_for_hw_access(dc);
> > > > +	    dc->hwss.power_down_on_boot) {
> > > > +		if (dc->caps.ips_support)
> > > > +			dc_exit_ips_for_hw_access(dc);
> > > Well while at it can't the two ifs be merged here?
> > > 
> > > (I don't know this code to well, but it looks like it).
> > > 
> > I'm sorry, I don't see what you're saying.
> 
> The indentation was so messed up that I though the call to
> power_down_on_boot() was after both ifs, but it is still inside the first.
> 
> So your patch is actually right, sorry for the noise.

Okay, but let me send a v2 anyway to delete the extra blank line.

regards,
dan carpenter

