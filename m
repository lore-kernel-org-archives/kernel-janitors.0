Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCEE3DB639
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Aug 2026 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785628416; cv=none; b=nhoxYjtsA6n62QG+lGPmWVlQ8JyH912IipQhVsmlsVi62X5FLwvHwo8yrpVwHI0wP87s/xIMZJVWgR3vq/Kc092zqhfLLZbUEV+K9EgR0WneMd4k60QBmj8WXTyvh8aSh0ZxI+h7oWMCe3QWrZu+W4TbC2twAvuPym8AseQxIWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785628416; c=relaxed/simple;
	bh=e+rsG9MzxhJaJV6c5SXSPxe8Yy3+bJkISODYZAFNwUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwG89YBAw97eFVku/nkYSs9bVPT2vryUQTPZ7PAWR/y5f3ch6BzNcrP3Yb6LWwUfCncprtl1rXtuSfVQfMYwIaCHHiGAQruoWwrJS32Wwj+7HERN12MBZoylBZuboGowGk/dypGeI1gcOZOtTocXDBJ334CQZl/ZxJ3McWUnU64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Gkp8fGCM; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Gkp8fGCM"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5218927884fso19952121cf.3
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Aug 2026 16:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785628411; x=1786233211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vqUPPgydAt2IIqwdqtZaZWjZ8UlIgUm3LT5nWMNn7s=;
        b=Gkp8fGCMQccqkOYBoJX5lsGmFMl+M/HtU1P51HuHBbcFRNpka8MkUPcktsItslyonL
         KzdF8EzhVFwBnbn6NMGMyBj6i2ACdSQ3ZkcgfFsj6PrxHROBgpFLNF0rf9mm8HeqSMNf
         NFYhYzolOlQAvgd0NlY6mXdN2dMmlcmGh5etBo7KdCQ7HUOv0HWbLW4STF3IJRq9T1LJ
         G9Rtjo3TBPsBfPVmhca8U2Vp6JNIxguWWnzix2JFFWd12IeYUHNx0yaMrl8azoFv7OPI
         K4oEvNwzqHDFdQr75RBd7hGFWcNUpNAMv2ZxyrN9eceRoUplhvb15PIGCVY0R8S8olkw
         IAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785628411; x=1786233211;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vqUPPgydAt2IIqwdqtZaZWjZ8UlIgUm3LT5nWMNn7s=;
        b=ImrDsoTDAIbfSecA9jE0F96cm2PnP4X4Hl/jqks509Vi+Uxl5H4SlIYS7nUMZojJcA
         J6hxuBmBj2L323nGRn3hsQzN9sLJUZdmOnfCvHICzmzF8ci3srP20q7ZqoaSeKA/bJqG
         Dp4Turq2xOQPc7M/sCuhcwyKflXYgvWo0KAiFvrtYieJmxL0PtkMJl1BHCLn9nqL77Hs
         VGnw2d4+hk3BwV/ujP/z9jKhM1TGncQK9Bvlb4L6rV/JKvlGZ55TUZnQrjgQLkjl3aL7
         m+X43K2EZKZ8DNP+YUBO9MiVlzSFXt6Yhed5zGr5Jc3urIhcsTCkbtBjPrYWkYo5Ud0s
         Abig==
X-Gm-Message-State: AOJu0YyaF/bw5lUxParMGDtqkXTws8vcxk/6hyFwpY0jDbnoEZNYauIb
	X7RHkuLxxdTIZCy1Usc8smyfXUsWh0F/v/gZapCnICPrdmkEoyPtdVn8DstZzrqq8Q==
X-Gm-Gg: AR+sD13amdHDD0pN7HawNg6KgXAJTFDAJAM8W7CHhWlJKlWinOXFE6uZym/uEH7nbcx
	yzbUCpYvT0Zv6enWLsetad6ig+mwksCsg3DVTywU+vK5wZirAGXxdkJGILRL8OJcHXvFCw41hjf
	Vmw0xKL/+/2+jD5xTfO6pb5AL2DYoO7B2uKVe+ndJ862J4GZVOd0x1OyqrfuwO3iqPdBypMl702
	x4e0O9fVjJDU0CLHEwWjej5MCAmKwbHcBp8/NbJbEP/mlEJ7NPVNa1bYq5kon2OU3CTKea60jn+
	+wWAisZLJAjUfTV825yG9ZrZOwVTvrBp4Yfx5XD+PuO533atd+XwF6gIa+1Gz2NX1wZRSwZVVTu
	8gHWP+B3jp3s5+Nlvs5T/qg0XwTAeC7UzDPmaJgFSXK/Bvzp4c6f2F9pdw3YL+w6ibHAn0m2+7U
	105OEfyOUOgO0OqaAwKkNQD/inTk2kfIsPmFPxQmrxwb/islzPlF+F3IABy8uFyg==
X-Received: by 2002:ac8:5955:0:b0:517:87df:d8ec with SMTP id d75a77b69052e-52b5666c4e5mr98606391cf.9.1785628410965;
        Sat, 01 Aug 2026 16:53:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4ebc1f13sm34825811cf.25.2026.08.01.16.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 16:53:29 -0700 (PDT)
Date: Sat, 1 Aug 2026 19:53:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: OHCI: drop unneeded semicolon
Message-ID: <45cdfa3c-4ea8-4e51-99fa-e0444e7b2454@rowland.harvard.edu>
References: <20260801191002.1383835-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801191002.1383835-1-Julia.Lawall@inria.fr>

On Sat, Aug 01, 2026 at 09:09:47PM +0200, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.  All uses have been verified to
> have their own semicolons.
> 
> This was found using the following Coccinelle semantic patch:
> 
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i = i };
> expression e;
> @@
> 
> *#define i(...) e;
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-dbg.c |    2 +-
>  drivers/usb/host/ohci-hub.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-dbg.c b/drivers/usb/host/ohci-dbg.c
> index 9e0e06bbc..4c83a1686 100644
> --- a/drivers/usb/host/ohci-dbg.c
> +++ b/drivers/usb/host/ohci-dbg.c
> @@ -184,7 +184,7 @@ ohci_dump_status (struct ohci_hcd *controller, char **next, unsigned *size)
>  		\
>  		(temp & RH_PS_PES) ? " PES" : "", \
>  		(temp & RH_PS_CCS) ? " CCS" : "" \
> -		);
> +		)
>  
>  
>  static void
> diff --git a/drivers/usb/host/ohci-hub.c b/drivers/usb/host/ohci-hub.c
> index b3d734ab6..84d10a932 100644
> --- a/drivers/usb/host/ohci-hub.c
> +++ b/drivers/usb/host/ohci-hub.c
> @@ -33,7 +33,7 @@
>  		\
>  		(value & RH_PS_PES) ? " PES" : "", \
>  		(value & RH_PS_CCS) ? " CCS" : "" \
> -		);
> +		)
>  
>  /*-------------------------------------------------------------------------*/
>  
> 
