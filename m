Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EBE23ED7F
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Jan 2025 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778363; cv=none; b=CDwKoGQ4NMQM5jBi1wMeiP79ANStxhQGgwCVLpnzm+BshsuiV/T67XdkKUAHcBTCYfs+D3rMf0/5poy7HqhihaTHTojoHdELGCozdtN+jLARu6zi30ASw+amRyBM5O6r+HzhzptFA5qfk26Xw7Dzo49KG9B8oCJtgQMvGbZ12O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778363; c=relaxed/simple;
	bh=vtjFb22sOyYN0URjnHGpdOp2r+nchub7kCKSAjg8r1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HB0/OqkRC2sAb4DV9ADWH8OaxMyITUDRT3YgMpqZkALDY0XEha72Hgd2PNYOTtVz/akA0e9V+KBIBXaqi5bbgSNu/QaxLqFfXfVtOkzOQMhW5yiK2C9jgq59Yqve8cTtzcSQ+7O73wdjF7E6om99u118zGA7yRdy6/ke+KAM2zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dcU3KHsC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dcU3KHsC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab322ecd75dso110643166b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Jan 2025 06:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736778360; x=1737383160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HbGS74CoYRC6HITNgfJj5iVQRYRBtTPZjkH5gxrs3J4=;
        b=dcU3KHsCK26bfVBwmKb5enz2JpzCdaFmKMItbdbUBSYvuJjJvZqG2hW0fbPAJ4QyBd
         HkXOTLgMy7taud/WK1KF4M7tjdZziXae9m55/eSkWQfbNSvodfDiiLCECB3FWCmLgpAs
         W52UmvpwPKYGE8vghrsiu0LucyMdqnesK9qXjtG35qbx9G6dAGGs1U4lUuPLbTNt1PXv
         2reNL8ShgecaYOGhTNfP/Ul48ay4OCao9VCtzPdiQ5seayguoCRx8i1BTASFY8DOuCdw
         jP2q0HUIORfgt7n357W2MIQ2RXEzthszujR3Hc5VJUv6VMqWK4YP0WbiJnXGkHbm46Hx
         oimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778360; x=1737383160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbGS74CoYRC6HITNgfJj5iVQRYRBtTPZjkH5gxrs3J4=;
        b=csq4i2OhEKd7qOmFeS7sqBOcrDk8smeXiHnm6Va6F38XVggjI+HPXsjX4PNSwB5MKU
         bLJqpRViz7P9quWTHTFrr3pm7Cv06o/ZwcioTKn6j+EdZWgI6BObOzrixnvyFxH/YDjc
         noBwdJlZDMnTwNkvJhjaG2kyGfMS561dO2+SKic/bFedrvzFYGeIUZpPhTxA5p8nFioQ
         ZiaqF2ekb2jBwuE0Hmb9zJdYosfSBE1bR/w2KD3h4Nrnzag5juZmX1PJUQaP6vCxMBNu
         aghh4AQ0OvxKAEF43ZLl/dWnpfVBgB/rCXooqJsFBYawgBph5218ktTYQO9g17y4bBBx
         ZNPA==
X-Forwarded-Encrypted: i=1; AJvYcCW1FA/vASrRg8zvHn5lINr9rwrdzNrbexOCPfTg16r2ZR+PAuL7Ovf1LbrEBzf906Bcf5d0XSSEwcQ+Cr05BSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXYZRIxds6smanYxc2VKn4VYQOM0IToKNXVPSfedKyisyxnsKw
	hDL5TxOyGLXyYDVHwVxSgnHVHmPxhbtS1ryEJWjJDYlBWhiHbfAh6aUQddVTfhU=
X-Gm-Gg: ASbGncsE+Ohy9pAjzH8t9wayEnJeUH2TiDPYWgvE+UMRusOd+DevFHfraLyCDA5hWz+
	FK2gkk/5RSNH1rKDapORKOtJOz/O+e39rfyLqAFW70WpzQ1jIpeXS9C+cWUoezQUapOE/BFjBcs
	DGf9M9Z+tqETe0/UJuructjSQTFLv0TNaOrsfaCIHjaqBQ9baRr9SHrtoz2qABilYEb7GPSZwur
	PTBcqOnVTthum18M5BjrvtbGoBws3Ti1Ots8bTkjWO84P76ezIHkwqQ0QFp0g==
X-Google-Smtp-Source: AGHT+IEnKdGkClwyG7opxWkRcljwnKOVs7IVEdnY2tiY4md2d2c+zHEDMbTCN2pklGV0IVCxeDqfqg==
X-Received: by 2002:a17:907:3d91:b0:aa6:7ff9:d248 with SMTP id a640c23a62f3a-ab2c3c452c8mr1603204866b.8.1736778360297;
        Mon, 13 Jan 2025 06:26:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060bccsm503321866b.22.2025.01.13.06.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:25:59 -0800 (PST)
Date: Mon, 13 Jan 2025 17:25:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jeremy Kerr <jk@ozlabs.org>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] efivarfs: Fix a NULL vs IS_ERR() bug
Message-ID: <68a5cabb-c5b3-4090-b9be-bdb34ea5a35e@stanley.mountain>
References: <7f7565d8-ef9f-4e5f-834b-9735db01835a@stanley.mountain>
 <CAMj1kXEt6DJufw7Jv+nWYzt=SrBsiTmRrXeRZFYdA5zC+3M6kA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEt6DJufw7Jv+nWYzt=SrBsiTmRrXeRZFYdA5zC+3M6kA@mail.gmail.com>

On Mon, Jan 13, 2025 at 03:18:05PM +0100, Ard Biesheuvel wrote:
> On Mon, 13 Jan 2025 at 07:16, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The kernel_file_open() function doesn't return NULL, it retursn error
> > pointers.  Fix the error checking to match.
> >
> > Fixes: eb11e99adef8 ("efivarfs: add variable resync after hibernation")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  fs/efivarfs/super.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> 
> Thanks - I'll fold this in rather than apply it on top though.

Sure.  No worries.

regards,
dan carpenter

