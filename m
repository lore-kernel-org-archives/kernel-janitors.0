Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397A91B87F2
	for <kernel-janitors@vger.kernel.org>; Thu, 31 Jul 2025 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753977529; cv=none; b=jOHvJmDekip95j9QEVy/hlu8sBx6QNf61RlJDx1dvbh583S7XCfwxi8/twM7nJgDnhC13LztE5zA+1WQ7YF+d05Szlr71G9OvL9JryItIyZ89Vyb9QAk3OL09fPhsaSidJFmEbms9FnIIu7SYmUQkb6uctrohIMIgrfAjnVGcGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753977529; c=relaxed/simple;
	bh=46dKdG+aZDW+qpAv1rqLDC/pwg2hGavXZ7hqkKz3nYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBYvxeG2m13/LcD26BriSIvaH3L6LhyaYXRzkpFL+r5I0GlWx+g+ph4oW1YLM/Se+NXWMOXC7vXPEwSncOtlXIYA0bAGo/6W8gRo+JPm6PoqyofBWLN4U/Ykn+fDmgKZy1CWWhhgO41k0WkFfepSJLLHWB106ZHkP8RFmiZ1IcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NOcWYbjw; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOcWYbjw"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4fc02633f5aso417743137.1
        for <kernel-janitors@vger.kernel.org>; Thu, 31 Jul 2025 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753977527; x=1754582327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=awhIJS7cdjgUxEct8Phfjco6UcYl0OeJVp0tQ8Q8jkM=;
        b=NOcWYbjw8sddr5gem9Za8F+fHETEneaiM7myBOErYUsyHEmHheA9LkrieQSLEJC3aP
         frbU1wvE0U1fRPCETh9hAYdFO8Xx8ePHh+/5AiMy2D0aVnv4z0dLfJRcnAfKjRUa+Au5
         qazPA2DdURR67OL7e/0m5/VSkHssEKi6Flc4cwREogWXuPUZS1G49lNW9A8sG+HgwX+e
         +yms3262iOiWJlCDv756qjKRYVjlEZk1tcOHh26rNsDbJdC2MlzekOl7qfqn6R/2BZMe
         cyw8p/tzuBEBPkS4TWx1JBS5GwGOf1MLJuDQFF8mn4GZGRq/3nCdNepiyLOcKWCknGFh
         ivZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977527; x=1754582327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awhIJS7cdjgUxEct8Phfjco6UcYl0OeJVp0tQ8Q8jkM=;
        b=n/3On37wPUEQsvkBQN6/DiI9+8+ZiWvlKmy42YYCUJAT83SYQwDrMH/hD/3FjA/wnZ
         1pn+iJ+gffm1zrrCQ0tiN8FJCkHOsd9VkvMrEb+RzDe7QbmSNVCwXBHond2PI5i+skp5
         QbEzgobgfmcu0ewbjx0pwChm7i/TE1DaJya+KZNfpKcoa4UK6ZxpeXvNX7humGX5X/Ki
         ytUR3qOW1QBxaDT0i0jmiqUxGilNOVgSmvhN8h/OQSFBauF/at17bQhsxDZcsvqMTRva
         hymtMBJydWKa48mHFZx8/F2LHwdY+TEe1pbo1vtn/r9Z7M028mvO4xGd6YZNDjRJo4IR
         a3Og==
X-Forwarded-Encrypted: i=1; AJvYcCUF8EEk7mw2kbU67j/Mwm4h7UkvDBHoOMEQ6wO9w9TUzDDHIquC/mowByYUDoKh6d7fSGmKtXaZ8GV11bUTcGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtDHuQ6w+gAL5Ym7z+SaYU8kV2og3FnengHL0qzP3pj+5y+42j
	2LW+sZJmZvdpSmM3855StOMaVCs4yEGdxuQOmTzoH816IdRfSDQHUhC0evXot9gB6G0=
X-Gm-Gg: ASbGncv6/2pEIwZwHV1+RVTSGknd++V6/BWxUxoz17wOMakW+MmnGid9+h861MQ7GIw
	zFYaWSGmyv4jANa6tUGCxgmmBSc+T6XNYSv/PE2BKBgcJlltWU1eJH8KvwHgut3F/tpJcE20G0T
	kVg/ZDXO7wcIvCWmDe/L7m/pmU47EXjzqDPaPMHP7FaA4iD9EoizDWYwAwisWAK1o7K3t86YhXE
	g/YBH2ujtc0gbd3jGd8X4UvYy2sNVTsHLiZni8zwi+5Wbj/7t1aZjvoYXAfeAR+k5YOuYPny4kx
	JGU5/2dZv6685gEuCbuW10w26ePMHNwfnLYT3vziHspaiW/qMa1XtnR0z+k/O2hQNJGs6TJW778
	mGjSn/92NwN/X7iffNSQd5XUAtDOswwQbm+FKWA==
X-Google-Smtp-Source: AGHT+IFaTZ7Nhu+be4TDEAEfweuDLzckzke57mSUiLDaG292YOCBw+NN54Llzx5T9jpZDMDjLrT77w==
X-Received: by 2002:a05:6102:b13:b0:4e6:fb90:1e21 with SMTP id ada2fe7eead31-4fbe7f1af52mr5076369137.2.1753977526996;
        Thu, 31 Jul 2025 08:58:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d1c4b98sm376631137.3.2025.07.31.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:58:45 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:58:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: lpddr: Remove space before newline
Message-ID: <d7f12483-4710-4c6d-bd9f-1abcdecc9b36@suswa.mountain>
References: <20250731095247.2165158-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731095247.2165158-1-colin.i.king@gmail.com>

On Thu, Jul 31, 2025 at 10:52:47AM +0100, Colin Ian King wrote:
> @@ -321,7 +321,7 @@ static int chip_ready(struct map_info *map, struct flchip *chip, int mode)
>  			/* Resume and pretend we weren't here.  */
>  			put_chip(map, chip);
>  			printk(KERN_ERR "%s: suspend operation failed."
> -					"State may be wrong \n", map->name);
> +					"State may be wrong\n", map->name);

Not related to your patch, but ideally there would be a space after
the period.

regards,
dan carpenter

>  			return -EIO;
>  		}
>  		chip->erase_suspended = 1;

