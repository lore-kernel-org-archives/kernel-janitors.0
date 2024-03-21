Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9C433D5
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Mar 2024 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711017297; cv=none; b=R3OVrSGOMOHHInN/qKy2IVwsrtGMtsiw+Fo2JF9GxkDYMOeUEhhqcAMq1oadeDeX7apxqAH5s6tJvL92cqUu3JNHNPzxEU7/PnYTvQElADTB3HTlzt+hTzQlOHYRY6cyz1rg/h88hq7aPTsrxwrohOfpvM7sR3BbSrNCkKAg8UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711017297; c=relaxed/simple;
	bh=y4emFXGGAZffpUX9wn8XGyawcIby/7BxyXLMzGwuUlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvece5Gf+Or1C+6iMkJfqJBpD9v+z0B5XQNJz6CxaaGBgMUmCm8HleEsRHSETzW3bC2phlldrqa+WHey3gStrZmx1YYo2L5VCS6TqZyeAhpQLPnJYytM/8JAs3JRffB3WnGSugQzb/OAT7+9I8RlDZ7IkFQtJ67fmDE36tNJd/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F+bdIDkG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F+bdIDkG"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513c8b72b24so888784e87.3
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Mar 2024 03:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711017294; x=1711622094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3XNkgAQnQ6LBfF2NFDRpA/pvI0NsrzPvIEpAHL8Ayt0=;
        b=F+bdIDkGzDaBLrdVKjtUiTAA/Dz/rG/yZGAAhu9b6bZyDlDxnqHH/dnruulUpT+v9U
         R3k8FXVXkP5Vq0vtxbabSaL+XA0fAnef5O1D9JX08rrjYnvo84uNaVDZBdQYIMM5jokC
         YznDdInJHUrbrEbKHBeOXvKRF9lEfTLkRcGHaQaxi5egEiWqt7h89143Lvlujrqlh+dE
         X+T/LB0p+6GND7LVAf3d1BkYxUAegyQs65YCKSP4815PMQefPb3OW/Rujv3nY4KGuNWy
         OzTCtUB0OCifQdV4X5hnlscNLyoGHMwOluJ9eJzeI+AmbiQ3GHtiqogejqO2TjiZwhCB
         0RzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711017294; x=1711622094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XNkgAQnQ6LBfF2NFDRpA/pvI0NsrzPvIEpAHL8Ayt0=;
        b=dNrXIO3k9pyOpcz90fO/04sDK1MHVxH60TZUaxE0s/UEezZp91b7OZ48OhQairJF/I
         RC+VGgkqjuOb4rSJQ4OHb442/xr3ulL5RmkVFkQ4unTpw0WOUuliLDYr2/Mz7Q7C2om8
         h6TvsY76a68UaleRZFvAQDrX+jeK9RGUxm4+mSeWkvJyZToMBaXH/+UambKIy79Bp70J
         S1xK6IlDd64GbjAeX3qgvxQd99MuOGSv00g9meBfXLbI9mdsEfq8/g+QCSl9rjQsFulr
         O4QEX+QINYmg4QlvDNkgqHowJgqrNlU4NJ5/hKkIBNuNTFnHYZbSEcDtQhfvwoIB1vsR
         BFhw==
X-Forwarded-Encrypted: i=1; AJvYcCXIosd/PzUcg15y49YDlUmeIonqTuM3UA41Whrrq/z4kW8Xb+aJEIYlnUE+zXb71SdfX2DD6FK3DNrJXVmZcJ6WedJxJblYMfwWsY4uYsQF
X-Gm-Message-State: AOJu0YxFKo39E1l6LXWBGlI7p+2xhkrKbZy1aO5eu59wGEAhJkz8EQJK
	hrKiLJTUbJFNCMKvW+AV0pYnTkU8iLWN7xE2Y/IJ4yQPXXOpd/skrd4ThTSIEZQ=
X-Google-Smtp-Source: AGHT+IHcrMw9qmrRmKJ+2QA1uL5wiYGSUSyvOjThedDZOBU+nrthRuPB8s9XAlNO95sJ+RIlSU9Jkw==
X-Received: by 2002:ac2:5b8f:0:b0:513:ec32:aa8a with SMTP id o15-20020ac25b8f000000b00513ec32aa8amr5682658lfn.11.1711017293674;
        Thu, 21 Mar 2024 03:34:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id iv20-20020a05600c549400b004146bce65f4sm5064318wmb.13.2024.03.21.03.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 03:34:53 -0700 (PDT)
Date: Thu, 21 Mar 2024 13:34:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <keescook@chromium.org>,
	David Laight <David.Laight@aculab.com>,
	"Czapnik, Lukasz" <lukasz.czapnik@intel.com>
Subject: Re: [PATCH net] ice: Fix freeing uninitialized pointers
Message-ID: <22ba28d7-e8ed-4b5a-9b6f-42d944d2f67d@moroto.mountain>
References: <77145930-e3df-4e77-a22d-04851cf3a426@moroto.mountain>
 <20240319124317.3c3f16cd@kernel.org>
 <facf5615-d7ac-4167-b23c-6bab7c123138@moroto.mountain>
 <20240320202916.2f2bda73@kernel.org>
 <6266c75a-c02a-431f-a4f2-43b51586ffb4@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6266c75a-c02a-431f-a4f2-43b51586ffb4@intel.com>

On Thu, Mar 21, 2024 at 10:59:42AM +0100, Przemek Kitszel wrote:
> Simplest solution would be to add a macro wrapper, especially that there
> are only a few deallocation methods.
> 
> in cleanup.h:
> +#define auto_kfree __free(kfree) = NULL
> 
> and similar macros for auto vfree(), etc.
> 
> then in the drivers:
> -struct ice_aqc_get_phy_caps_data *pcaps __free(kfree) = NULL,
> 				  *othercaps __free(kfree) = NULL;
> +struct ice_aqc_get_phy_caps_data *pcaps auto_kfree,
> 				  *othercaps auto_kfree;

The auto_kfree looks like a variable to my eyes.  I'd prefer something
like:

#define __FREE(p) p __free(kfree) = NULL

	struct ice_aqc_get_phy_caps_data *__FREE(pcaps);

regards,
dan carpenter

