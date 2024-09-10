Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BAA194132
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Sep 2024 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982147; cv=none; b=tldvCkWt+tOd1YxDKWHIrxpubW9FtIHt0fyH7FGy13MSewUToEqdcD3/2ieBmST2iZyVtVpC68ibxVcvRL54M8T+naPtlRQjLOek4eLCHRAsvMk0RVHcXqUI/O/Dh8GuiU2Mo3ro3n6rv7MNwDx2jCqxIlY04uBOuIH6wC/Q6Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982147; c=relaxed/simple;
	bh=bYKKDH1pcTzczLC911ccBgziQmQOZ7SdfO/eF7GVhHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GO2shJLHGlDdCFDTsoTasA5M8D5lW3nC1HtmNVKtuVGDSZ6N9o4YXYuxjeUQq27YkRJ3tGvfE2jPqzk4jiwkavsP00dFW3HNX37+dnYCn2xr3ToIhS88ivOj9ALD+yPDABFJXf1V/gWfKy1gBn9oaUAU+jNmVZBR+cOaNbklYT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YDOW4hSY; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YDOW4hSY"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e0402a98caso385187b6e.3
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Sep 2024 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725982145; x=1726586945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dtCCy/Lr6nar/YEsY1Qs666TLKhgRo30yNScB/fYqd8=;
        b=YDOW4hSYXmoYNEkq9dKIQMukDnNOtf4YvUQxdopXuGmxVmJG8w5SyDozOPkiLTOy4Q
         L0qrlfphm4Z9gsAs5+Uazg0g3IdEJzbLcFyRmNI+jGWlcEIuycCWlvvn1eaCnCYbNTFE
         ypSoVfYqLs4IYkXtKBPa5SPTflXvWeiwAvJrZbDH9qaS4fZXPKcmYYzOkAxbsfiFt7L/
         Wog1FGz7eP/Wjo0roqnZh5xBKW9xl5ucW1nGfCI0FCQT1sS5A6KNazjX18VVBLmkJqch
         bBqVSxqOXZ+T7xUrfYazo4N9CvehMLgq70JUzQBNc0pUcu3oJv3tRIGGzLlXSv0kQ8Ex
         t/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725982145; x=1726586945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtCCy/Lr6nar/YEsY1Qs666TLKhgRo30yNScB/fYqd8=;
        b=HTMfedMOlWTNqT7w0JSXJnwKwPvsR0BGdmP17tyqYVtlwdhXXtfLZs0fZyj2/TZLki
         fCIeqqJzwIcD+z+HHwBsV400IoF9sNih4ctUZxUtahKUeGZPB3xhv8xaQrRWGrok1c12
         UbquuzmrvnGhdqsGh/+0vV4gforz/cgcL2zpn3MGYwffrTFHNH7jt0UxWEADCaOkHowJ
         txb3CaNYLWQO4mGWgsUUzkgHxiUB0Zs3RtD1x8Z9orp3zU6tBiq9yhKi3iro7pphiyCY
         ZV/+BlmYkQZpEHwymlTpTr8kZZh95WEkmWVVFqCKVqUdzVziWYdta+8VAoG5gmC0vX80
         XJ3g==
X-Forwarded-Encrypted: i=1; AJvYcCUqXpQDaMtVYLjkSd5Ft6eYkeLp41C+UWMjmczRWvFb9GCbuNaBd2mjf2IZ4byCKzCZAgNzbkz4eoOWk7b7KBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXG+u+sO9vI30WhlKmjVoG67TDHYIFoG6wywgkLHuUabZ/rWOe
	26tkZ/NA6z4enaTh8NX6A/1hCH/UX9fGCabngzPQv39SWe2GLgUed02xHfiQfGM=
X-Google-Smtp-Source: AGHT+IErRAQeZ0Hl/JEzF5IWPZ6vJR6FZdIf6CsVCDWAFI8dDPPPNQ20QdqyaZ+vsooRQe4sBsvW+Q==
X-Received: by 2002:a05:6808:648f:b0:3d9:3a2f:959e with SMTP id 5614622812f47-3e0680b508amr122683b6e.0.1725982145032;
        Tue, 10 Sep 2024 08:29:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b385:464:5921:35eb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8255dc130sm5764644a12.72.2024.09.10.08.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 08:29:04 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:29:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, Beleswar Padhi <b-padhi@ti.com>,
	Andrew Davis <afd@ti.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: k3-dsp: Fix an error handling path in
 k3_dsp_rproc_probe()
Message-ID: <ZuBlvhf5AszNHV1e@p14s>
References: <9485e427a9041cc76cfd3dbcc34874af495e160a.1725653543.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9485e427a9041cc76cfd3dbcc34874af495e160a.1725653543.git.christophe.jaillet@wanadoo.fr>

On Sat, Sep 07, 2024 at 08:33:36AM +0200, Christophe JAILLET wrote:
> If an error occurs after the k3_dsp_rproc_request_mbox() call,
> mbox_free_channel() must be called, as already done in the remove function.
> 
> Instead of adding an error handling path in the probe and changing all
> error handling in the function, add a new devm_add_action_or_reset() and
> simplify the .remove() function.
> 
> Fixes: ea1d6fb5b571 ("remoteproc: k3-dsp: Acquire mailbox handle during probe routine")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Andrew Davis <afd@ti.com>
> ---
> Compile tested only
> 
> Change in v2:
>   - fix the subject (cut'n'paste issue)   [Andrew Davis]
>   - add R-b tag
>   
> v1: https://lore.kernel.org/all/9485e127a00419c76cf13dbccf4874af395ef6ba.1725653543.git.christophe.jaillet@wanadoo.fr/
> ---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 8be3f631c192..f29780de37a5 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -610,6 +610,13 @@ static void k3_dsp_release_tsp(void *data)
>  	ti_sci_proc_release(tsp);
>  }
>  
> +static void k3_dsp_free_channel(void *data)
> +{
> +	struct k3_dsp_rproc *kproc = data;

How did the struct rproc from devm_add_action_or_reset() got turned into a
struct k3_dsp_rproc?

> +
> +	mbox_free_channel(kproc->mbox);
> +}
> +
>  static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -649,6 +656,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = devm_add_action_or_reset(dev, k3_dsp_free_channel, rproc);
> +	if (ret)
> +		return ret;
> +
>  	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
>  	if (IS_ERR(kproc->ti_sci))
>  		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
> @@ -741,8 +752,6 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
>  		if (ret)
>  			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
>  	}
> -
> -	mbox_free_channel(kproc->mbox);
>  }
>  
>  static const struct k3_dsp_mem_data c66_mems[] = {
> -- 
> 2.46.0
> 
