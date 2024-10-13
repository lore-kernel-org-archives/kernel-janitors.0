Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D61231CA8
	for <kernel-janitors@vger.kernel.org>; Sun, 13 Oct 2024 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728826876; cv=none; b=fi8jTOyFJdNxDHu76xi5Ir5IPKgoL1WcadatBz/b/Aa8VsL+ElkUFTVhrt1l//JRD984TNGi6lKbjDfpYzxzZ2D/BvGVUDhDOVaNzdAXSwPNRbivrZFrJqqhIsCkT4VqyK04xjcrYqB7a55+ls8iGCrg9XIy3iqYDUdM1COX8pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728826876; c=relaxed/simple;
	bh=BSsnnOfdhmDaVaOr5JfKQ4veB20AKY2gMhI35W1IDcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3DENJDkUCVHqaC5lNxMN0dWKjp/dgboCC4xFPEmnsCO4PJvr3JgQ8ju3V17LG1SUhH3+h5UyY0KrPqVohySFYH/XFYpjF5we1QhUiId6/5PYrf6LVxcE9+OB+OGOZe5v6ZitwYuQo2B+NdtbvI7eOcdZVKob5+G33/sva4Hd1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opCJ1633; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opCJ1633"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so6598050a12.0
        for <kernel-janitors@vger.kernel.org>; Sun, 13 Oct 2024 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728826873; x=1729431673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDIoBQ9YvQk/WPHiA1xukRw9F4LXWDJBsa2YUNZUMcA=;
        b=opCJ1633q1U/FPqoRXlGcHR4J3kVEHTakkdwaWB1HefjDe+11fTZ5r4KoLpMmF0bX2
         hjcGI8GcJxPO/k8/5lPJL0zRqNRV8Qsola6L3umnvAKhQqj/8P3BKUqPdpOCvE2XKyMF
         SInGpL4UAULJFLhu89wUMmtMOBrEN+VbcOVlg6j1Djya/SpzIvDQVwc0WZw0dlZXgxIS
         shXMi0PVfODQWYkFcU3DWAfi7FUA+5hz+1FD5If9lD2B6TM4b8Y/i2yT9wt7TW6fqXI5
         wIjsPT0c8KS4O/8uX8hRom+04nhDVFeCm3iEeI7WfsNXvkNU6kImLZ1IS9/GgQ4mEQy9
         z5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728826873; x=1729431673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDIoBQ9YvQk/WPHiA1xukRw9F4LXWDJBsa2YUNZUMcA=;
        b=pubzhw3ICEEKm0xb2DgZ4x4mqCBEfIbW27mqNCkkdwG4D2ab098kFU7HzDe74GuqVS
         AGaUPb3j8puj6iNnn25oHISZ9Xg0GuIS9FuvtjaO1EkDh4leVhbvq/fC+0kfnkjFN9S+
         O3QpR3TGVibjvQdLMti5BPV9kuBTzF6BCyC7sL3Aj6WKpuWWwrgkDTH7Iwn9y1R/DXur
         +LDiWNF/S6FNrlpdSRLkfp5vBw5CeGbqkn+d9x+CuVIdkr6yYPIEfT8N1NNuHdF6LPqZ
         3pidDxBcOaT7pW1Flo3gk3Q4HT8v1+4o6nPNy7wdePEfyhsMJEBlTJfoso5vcp36HQAS
         CBAw==
X-Forwarded-Encrypted: i=1; AJvYcCW3T20aAp6ziMAEoH6sGZi9PLnpM+4x65Mo3Qa4wxhiFkB/bkDycGZlRAZizd015O8wqDHCnSdKzzoA1rXf0mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlX2yF9QpacXTfEjvq3lbHZGbYAYrlwE2O5YKm20SJLqeZ3zrK
	xDZ8/tc2Y2yZRyaElsIUZIRz70B2g2+WxihIrzni4ee/umDdkaczhyNph1m3sJc=
X-Google-Smtp-Source: AGHT+IFwr5789q2rbkowSIKm0Pi3d3HKo85MzqqbcL5zX+y8/Sv/FkZN0o1+dV1o6r6DNh6wikURkg==
X-Received: by 2002:a05:6402:2688:b0:5c8:88f2:adf6 with SMTP id 4fb4d7f45d1cf-5c94754c124mr7916665a12.13.1728826872833;
        Sun, 13 Oct 2024 06:41:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9370d273fsm3931876a12.16.2024.10.13.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 06:41:12 -0700 (PDT)
Date: Sun, 13 Oct 2024 16:41:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
	Jani Nikula <jani.nikula@intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Mackerras <paulus@samba.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] powermac: Use of_property_match_string() in
 pmac_has_backlight_type()
Message-ID: <e50907a9-6df7-4cbf-97a6-47acd5d8ce01@stanley.mountain>
References: <b7e69e04-e15c-41ec-b62b-37253debc654@web.de>
 <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
 <ede25e03-7a14-4787-ae1b-4fc9290add5a@web.de>
 <c629e544-f768-4063-bd2c-f72382bdf69b@csgroup.eu>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c629e544-f768-4063-bd2c-f72382bdf69b@csgroup.eu>

On Fri, Oct 11, 2024 at 06:25:45PM +0200, Christophe Leroy wrote:
> > diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
> > index 12bc01353bd3..79741370c40c 100644
> > --- a/arch/powerpc/platforms/powermac/backlight.c
> > +++ b/arch/powerpc/platforms/powermac/backlight.c
> > @@ -57,18 +57,10 @@ struct backlight_device *pmac_backlight;
> >   int pmac_has_backlight_type(const char *type)
> >   {
> >   	struct device_node* bk_node = of_find_node_by_name(NULL, "backlight");
> > +	int i = of_property_match_string(bk_node, "backlight-control", type);
> > 
> > -	if (bk_node) {
> > -		const char *prop = of_get_property(bk_node,
> > -				"backlight-control", NULL);
> > -		if (prop && strncmp(prop, type, strlen(type)) == 0) {
> > -			of_node_put(bk_node);
> > -			return 1;
> > -		}
> > -		of_node_put(bk_node);
> > -	}
> > -
> > -	return 0;
> > +	of_node_put(bk_node);
> > +	return i >= 0;
> 
> Could have been:
> 
> 	return !IS_ERR_VALUE(i);
> 

IS_ERR_VALUE() macro should only be used when you're dealing with memory
addresses.  What I mean is there places in mm/ where we pass addresses as
unsigned long values instead of pointers.  For example, get_unmapped_area()
returns unsigned long.  The IS_ERR_VALUE() macro is necessary for that.

For regular error codes, we can just check for negatives.  we don't have do
anything fancy.

Of course, you can find counter examples, like msm_iommu_attach_dev() or
st_fdma_of_xlate().  <small joke>But in those cases, it's done to deliberately
to ensure that the code will never accidentally get built on 64bit systems.
</small joke>

regards,
dan carpenter

