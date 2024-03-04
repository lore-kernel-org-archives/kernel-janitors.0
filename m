Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D8A224DF
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709547081; cv=none; b=SWLpbHXh7gw28mw6Vdqgyj+BweZGcMPZpbpSV38dtTQXG5E/oZpBaSkqJLnr4L3z7xNn0rDBj9hZJRWmmb+XcXbfjN+zeBblGiszZ4RlUZipZ51JffXtsK18O1iHMGH+eIQXCN8RORlR4uTc7suv7tUGGXylDy8Jo3vELt6L/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709547081; c=relaxed/simple;
	bh=QsoSw7nIsKdCbrB08TRB5MwF9IW2XROJQ40mzxo9EQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lC+D2NwWW7O8ryl/fI+VGOY0X2ZXDi3K7dFRdv4nOAj3i5f7uUCID34z6aXP3jSrtIU0MPED8yUr4GxAE9MZVg8K48434bTaWg9zDpPbUHNO+SkkZVPdNWW2sDBmQPaiq23zN7u/CMMrR5u2vk+6rXDCwhe1iRBJlc0ux5MYA+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t1vKMRHA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t1vKMRHA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33da51fd636so2102006f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Mar 2024 02:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709547076; x=1710151876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=apfVynKdMHWt/84gIfAXsivA2/2+KZh2cujSEqljhTk=;
        b=t1vKMRHAekQqK4ihSgzLQ0FhGEG+pptJ/XdfGmAHmEWyO1JrVm+uK1CZMFUrfprRzG
         gf6jEqW78w/oAIFcbCZ+LkFHwxDmwS1r/fMxHXWs8ZH9DgJMXj+Sx1W9L83Y7jkWzHgk
         skMXS2K+FfWGLDswauoZJhbC7Psq5sjmdqXaF8bamDlx9yElMHxKJLqEJmAHaOU2ZN1z
         X7wPUEL+TPmJ+gN78sPaOg5IACtXSGRRLlnB7HEZ+BDm+Yt6eOHIHZxx5GP3g2dowHaP
         pNenXNllbzML3GB8v50NzHdDtVwOnsl3SnlVHJP8EZwa3G8+CZ2BLVmpmTqmmPmpu+Hm
         vEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709547076; x=1710151876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apfVynKdMHWt/84gIfAXsivA2/2+KZh2cujSEqljhTk=;
        b=d5CvOCGLI7YbPb+HmyzH1FVA5A8siNRPR9R8qfCGRbfVMqqpqGyuvScdFECsAzVhlD
         cvc9KnSzUNViz0pBJ6Hi2J421ITl0vRV2KUfSioPh011IJK9X0wgbXeA9j9tD9lZxR5q
         UXrL80h28E7v9PVlgH4556zBHAeNsWPZsdPnBE6UJyVXE3VMf/iaIglHBQ2pHgK+qcqV
         lJQlu5xP2HKYUsXpGj7e1IwZWRvWAr/WWL5vYXVxzjWE+C5dNbgfFwiHqhvy4Fl6WPHI
         NDu1n/p0VubriHEtsUv0DpCTGC5Eo+YbzJmoX3f5NUfWoWgKTIg8fs4gW1ptkpMXU2Lr
         jh/A==
X-Forwarded-Encrypted: i=1; AJvYcCXvtwQwJ7XRn+tM9WkJLsjTt94YwgrNYENpWCreAtiSPyby/VWUh5rLcZ68Um04Gh847Mew3c7j5ntl0wBrGf7RgQQBMR9//vzU2EHxourb
X-Gm-Message-State: AOJu0YyTmAZAyctWHo7B1/J3bvmCVp7wkUUdJyFJJIVz+qXhOsU46Q7h
	QTCLFOUKZCFkn9bjh4OPkVby3uJbXVC5qW8JUEhkMFwdne7jB2yKWpvHAYwADlY=
X-Google-Smtp-Source: AGHT+IHNn7sU3K7fVrmKdjcX18dvKktXyRnPZAwnYOUoT0D0zKIFokCLkKqap2Bkk/sWa6rTyu9UnQ==
X-Received: by 2002:a5d:5ccb:0:b0:33e:1627:4682 with SMTP id cg11-20020a5d5ccb000000b0033e16274682mr5193040wrb.29.1709547076459;
        Mon, 04 Mar 2024 02:11:16 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d58ea000000b0033d4cf751b2sm11722955wrd.33.2024.03.04.02.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 02:11:15 -0800 (PST)
Date: Mon, 4 Mar 2024 13:11:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	kernel@collabora.com, kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
Message-ID: <7a42984f-34cc-494e-b8f3-83596621d31a@moroto.mountain>
References: <20240304090103.818092-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304090103.818092-1-usama.anjum@collabora.com>

On Mon, Mar 04, 2024 at 02:01:03PM +0500, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite. Make its type to be
> int.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since v1:
> - Make i int instead of u8

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

