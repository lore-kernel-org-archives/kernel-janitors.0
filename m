Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964B1D14FF
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728985722; cv=none; b=W9Md3B1FHahTiaX8XGQ7GBzfKFLp97oJVJSNjDC3/p3BmTWujVA5Xb3PYD8qvXaD9xbRRNyztFSPdtsQdxzm8oGyCSi9zxwPb/gWC+3jqK3YoYHFlNo+mXcLKoGvPzdecsgMjnggQHP8xQdi+Di+POPiAF0R9gwvbahakzn/fYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728985722; c=relaxed/simple;
	bh=yYb9sb5AxiXLVlD3bVkK64FKKxtA8VrXUNvbw1gtuts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jarius+8/B5YIrXR9nahzWEcQUBvk6mjvh9zBum2DjycSq+XT5nc9rMGh8fbjjPjcyE4FYB2iSCz0l4xp8bbw4v5tt9lxskgd/UVDCx+9i3Gv+ODZRdkOrwj07vvZDXNFdUUcNiY3osuuU08MgraWWEi8Agh0EdJO4UAs+u4Cjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwDMg2Qt; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwDMg2Qt"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a99c0beaaa2so671749666b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728985718; x=1729590518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1teDS0JJcna/90ckTpcvCS/IaGCA4XWx1Jz7qyJi5jg=;
        b=iwDMg2QteR0yvQQM8Nr9teOoWqzj45RezjE8fzK0xcJK1mpdZzVBOXiw5YrjND2Gn2
         Mqo4KoPBtdmjzEThnKdagd4ypoBC1COy25D+624kMRHZ1ld7KlairyjXLUxkrFDxUPtS
         vruKcjH7YHyLWQxFtKOHarjn1uv6vBJw8+vdesNq4GN6ZPXgB79JKynZt3eVoYBO8PhR
         09kKyjNo2F9CjbYkdI7+/hYOWMLeZ0Trn1zpeYwX31stqr7HpVxhHMnw1nmRAsDhkXzn
         By/WZbBBG8VJglj34kTh+hry6tBMoV00Lz4x0fwIiqPvW8kgqApwOMdzap/i6WjR2+Gf
         hytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728985718; x=1729590518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1teDS0JJcna/90ckTpcvCS/IaGCA4XWx1Jz7qyJi5jg=;
        b=P6RS0kwayB82a5tykdBJfriqn0x2dFwuOJ7tI+QcIPoboDv+6GDEYKbXU3VEutm/vw
         wkwFAumnR67LkmR1uixGwZL0JUgHgSZB6bHkxNfAHumtq0eYfjQ/SCiECxKEgnic4lNU
         AZl1LQIriaGSXhAT7goAB8UNZ22dLZxgXt1LIc+IGoIqfbBahqO6TuDCykrfkkeOh6Jt
         5rrZ572B2uWEwDnOwfbfhlwNOnNHbllROqZeygy5Gua96QrexDFb9DuDIvb9zX2YOZEG
         Z6Sbubt4aMIWxA5TsghLinzrD43zwBvru/Dfv139BJv+qpQ6WEdGrokfwqaJsj0zWcpc
         bg1A==
X-Forwarded-Encrypted: i=1; AJvYcCW5mv6JdXE3Dc8NeYVtQcZsAXUaPZXDTwmHwU6qHpvRFGLkEkL+vFew0tcpbMbwsfxLfTD7pQ++lYeguBoZnnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXtkjpW68OOZZsCG+xOxCXeMuxVv8EAZ5+9n/Zb0LTVpgnYFMl
	haXuyAhTdDe98eyNRJZJsXQIjCx/FI+U1mdcKVIDhFgLUwji2XMf+chEQxnB3p0=
X-Google-Smtp-Source: AGHT+IHVV5gB4sO2s8rG8UOt0XzDKS6ScXRIKX4PKjbNf6jNN37IksWraaka1Knc+QX36AetoAcjJg==
X-Received: by 2002:a17:907:869f:b0:a99:fc3d:7c76 with SMTP id a640c23a62f3a-a99fc3d7e78mr723129666b.37.1728985718522;
        Tue, 15 Oct 2024 02:48:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29850a36sm49903666b.181.2024.10.15.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 02:48:38 -0700 (PDT)
Date: Tue, 15 Oct 2024 12:48:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, skhan@linuxfoundation.org,
	kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2][next] Bluetooth: btintel_pcie: Remove structually
 deadcode
Message-ID: <8a4a8915-d59a-407d-9f93-f047370cca62@stanley.mountain>
References: <20241015045843.20134-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015045843.20134-1-everestkc@everestkc.com.np>

The subject has a typo.  s/structually/structurally/

> The intel bluetooth module was successfully built after the change
> without any errors.
> 

Delete this sentence.  It should just be assumed that changes don't break the
build.  You can put that code isn't tested under the --- cut off line, if you
want to put a warning message.  But we don't need this in the permanent git log.


> This issue was reported by Coverity Scan.
> https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600709
> 
> Fixes: 5ea625845b0f ("Bluetooth: btintel_pcie: Add handshake between driver and firmware")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
  ^^^
Cut off line.

regards,
dan carpenter

