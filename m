Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7632CCA6C
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 08:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QzvNQaAi"
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7A7A7
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 01:01:04 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso57864831fa.2
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 01:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698652862; x=1699257662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hbEsVZloBKDJVfZ06YyJZ36O1TQO3SiJssr4ux4hSA=;
        b=QzvNQaAiJu+aWAXGxuywlvIK+av/woUJxKA4ibDxbKTBa/EqvQPjBR/U6jI/9IZm0S
         n0TtwAopAUgJTEwnP2r7fMR3qrd1kD00cxjFnGoFafKH7gjyYD9cY5kjCovkJHpJQGiG
         S88wmpnlWYdZrzEi1SGX3RmvIYrsDL4VQlJRWC+gd9uKDc/6H6amuesdu9y7CPORrvq8
         3QvhcpvLTDK6OKn2dbGuylPLUaT2FjQrVV+n8nqzMQIlFf4h7NdV0MtiZKF6J/Haogyq
         iiv+rDwJ5f0/JAwtdM3UWc16Ue/GKGRbdCI86o2HhZN8gNDlXrHa6/Moo9JDkCYIfvwl
         zPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698652862; x=1699257662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hbEsVZloBKDJVfZ06YyJZ36O1TQO3SiJssr4ux4hSA=;
        b=TiAiL5fRfRB7i0AhbcWGEeqhO/aCKCWYbGWDgtjdEZOTDq0MTnCmwWME3tqDx+B+xh
         1xuSN7QCR9EL2gRI/G3xKOvNjeMrue1EIUYx8IQSUA76EgefaybSFPc6FzhKRhuj/MkK
         EMYgyRQTJFdDblFwE3PcYR+3JxX73GzPnX5guqXReNjQZqi69IOm+WK8Dl4+C52ugKnD
         XWogi3m4HPbIzZoQh6iIuzAeeRTk9cQAl9hJWEeQe59jGFNgA6JfE8NCPJPz/uvHR4EH
         8Z+ItlCR2I8ArwQyJpta4/Ju+sOaf9QYhjp/KNsubJQR2QSZeZ8TKkaynqsXaKT43H3L
         T88Q==
X-Gm-Message-State: AOJu0Ywz4WghdW+FtHTx/Ubnt7gzS2UfGYP4t16vVPi18xg8eY/pi3NO
	GzuvU1dvrN+8dVJffbXSrcs6Bw==
X-Google-Smtp-Source: AGHT+IFi8eKhOYLqIIwKZfwvbJG+2VeCGiU8fe7jnQB5TpLBBKB0L2OFKAFmTGfMOmF4SaDJZ4T8Xg==
X-Received: by 2002:a2e:731a:0:b0:2c5:6d8:8dfc with SMTP id o26-20020a2e731a000000b002c506d88dfcmr6554965ljc.13.1698652862384;
        Mon, 30 Oct 2023 01:01:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o38-20020a05600c512600b00407752f5ab6sm8605325wms.6.2023.10.30.01.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 01:01:01 -0700 (PDT)
Date: Mon, 30 Oct 2023 11:00:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware: ti_sci: Fix an off-by-one in
 ti_sci_debugfs_create()
Message-ID: <6fa05bc4-55ad-4173-9af0-9db713b4d148@kadam.mountain>
References: <880aeea52f3bdde5e3e8843bbedb7fd068a58be2.1698565938.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <880aeea52f3bdde5e3e8843bbedb7fd068a58be2.1698565938.git.christophe.jaillet@wanadoo.fr>

On Sun, Oct 29, 2023 at 08:52:36AM +0100, Christophe JAILLET wrote:
> The ending NULL is not taken into account by strncat(), so switch to
> strlcat() to correctly compute the size of the available memory when
> building 'debug_name'.
> 
> Because of the difference in the return type between strncat() and
> strlcat(), some code shuffling is needed.
> 
> Fixes: aa276781a64a ("firmware: Add basic support for TI System Control Interface (TI-SCI) protocol")

The fixes tag isn't really required.

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/firmware/ti_sci.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index 7041befc756a..1036c6b0f3eb 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -181,10 +181,9 @@ static int ti_sci_debugfs_create(struct platform_device *pdev,
>  	/* Setup NULL termination */
>  	info->debug_buffer[info->debug_region_size] = 0;
>  
> -	info->d = debugfs_create_file(strncat(debug_name, dev_name(dev),
> -					      sizeof(debug_name) -
> -					      sizeof("ti_sci_debug@")),
> -				      0444, NULL, info, &ti_sci_debug_fops);
> +	strlcat(debug_name, dev_name(dev), sizeof(debug_name));

Eventually we are going to want to get rid for the strlcat() as well,
right?  Everyone hates strl* functions because they do a strlen() on
the src string.  It's fine if the src string is a string constant, I
suppose.  Here we basically trust dev_name() to be reasonable so either
strncat and strlcpy() are fine I guess...

But it's is more readable if the we use snprintf().

        snprintf(debug_name, sizeof(debug_name),
                 "ti_sci_debug@%s", dev_name(dev));

regards,
dan carpenter

> +	info->d = debugfs_create_file(debug_name, 0444, NULL, info,
> +				      &ti_sci_debug_fops);
>  	if (IS_ERR(info->d))
>  		return PTR_ERR(info->d);
>  
> -- 
> 2.34.1
> 
