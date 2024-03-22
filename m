Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07668F6E
	for <kernel-janitors@vger.kernel.org>; Fri, 22 Mar 2024 05:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711085530; cv=none; b=riTVa0c47EOVEluAsWUJKbsJE3TKzIhgwC3MVyXtbudM6hHMw1r6Lc40RYhL/yHreRpxXDbBVWgsoIwEWZo+7qVm+FJqZydPijx4oqVe6cvBVXxTBFBp+zL+CFaxuwouhNF+GjRdPE5AmigOC0MySdLkCLv1OgLEoj7CaVADZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711085530; c=relaxed/simple;
	bh=gW3fIZf8vN6iEiqmwYK/QLqdMMMGzpIb+vf5nBRh7oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMHVuhXH/YlxV+z54HdK/Bk8yaaKo7Ar2357cLkMw8KqCmxVx+eoOd49FHE3rHjECg+gIaneeNpwXrzx4QheYXg4A1oCO9ROqHaPx4q4wry9M629HgD/GJo5bUHfReJtecQF4PXH36yErzAKozmtOpX4uyBUaECGUuR+mnMzQhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DXkAkenu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXkAkenu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-414787c73c7so4595555e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Mar 2024 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711085527; x=1711690327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+glO5iNDnOJRX1bMlWGx35LFvgqhLSy12w38sJ7h5I=;
        b=DXkAkenuMD7Dq0tSxFGZb9UuWfFh3h4GzTJcEZ+KwSTUI6OBpVtt2i4OILSAvO20wc
         dg9+NhibWifTjbapox5n/gfBfKoIWfBJ8L8mBWlgUoax3768YRVrqRjd25xhjDA1iv7Y
         gqxLn1kRI1iRX1YDDHxuPR2KzqEgjaW8y2PMv12DaypLPyyxUZJqrMsLx212XZ1Q/YKM
         Vbk9eKR2YoMlo6mpnDkNrFiOY0eI2zul2smqOGRwR+t3Dkki63suyfdfiL9EnVxABmdr
         8mZPP+p44X7PX37H5WNPj6+MMa01EcyWuMQAz9TK+6XzG1Xd6N02ABp4R8sIopen9Qke
         WB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711085527; x=1711690327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+glO5iNDnOJRX1bMlWGx35LFvgqhLSy12w38sJ7h5I=;
        b=NcmfmYDXor6W4/a7flK99fcT+hUZux7hdlnEU7kFY1M5DoPFkNvmLFBQKlj7il7ZgW
         UafexCaos2GlqH4Ce9V3KiQdyBkY5sGCCJ8qEYJB8pAK1uitgpx2DJhzudG3tAuoNm4N
         4RwEpaEPLDVK6of9MgH7L6A3YXTIhq2trFCKv5m+aTBTP+ftqMNDT3cj/6qGUKkFFbdT
         VT86AKDj9fAOcZoCAUyjzAgPmIhi6kkPdx8dZOKvFMmG+hBvpJ2kNTtK3MQv1TFDUHRq
         /UDtDx9x44QqIOFQYrjZ+hnwA7v1yh06XTNBIZD8CaHh4LTY7ZbC8ythx/Hb/i/8iTvj
         uQZQ==
X-Gm-Message-State: AOJu0YzgNAuN2bJ65VuIbuyUlKL26Y22T5l4P8HI33jUCISsFsUMxFy2
	61mNJEvPrHEGef7rNVoA7VbYBYVWBi5zGUwrENjuMcNKyFRjOkydghvKDNT+TAA=
X-Google-Smtp-Source: AGHT+IFUrNidyaL2odjdKfD+FtYadw4MHtswbb1LkvUM7SXIPYO/YUG7URif4e21XfDKyIOZxaierw==
X-Received: by 2002:a05:600c:3502:b0:414:7909:6680 with SMTP id h2-20020a05600c350200b0041479096680mr751469wmq.16.1711085527043;
        Thu, 21 Mar 2024 22:32:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d4d12000000b0033ec8f3ca9bsm1190810wrt.49.2024.03.21.22.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 22:32:06 -0700 (PDT)
Date: Fri, 22 Mar 2024 08:32:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Laight <David.Laight@aculab.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Cameron <jic23@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Kees Cook <keescook@chromium.org>,
	Lukasz Czapnik <lukasz.czapnik@intel.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com>
Subject: Re: [PATCH v2 net] ice: Fix freeing uninitialized pointers
Message-ID: <7ca4a907-2a9c-4711-a13c-22cbfec15e0e@moroto.mountain>
References: <0efe132b-b343-4438-bb00-5a4b82722ed3@moroto.mountain>
 <0d7062e1-995b-42bc-8a62-d57c8cb588ee@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d7062e1-995b-42bc-8a62-d57c8cb588ee@web.de>

Markus please don't do this.  Don't take a controversial opinion and
start trying to force it on everyone via review comments and an
automatic converstion script.

regards,
dan carpenter

