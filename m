Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1D381B0
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718295890; cv=none; b=Hl+tpqZHupUGZwyDNCGL3vapD/L1K7rv7UIWxEGjVqFnHV9Y7NIEIayWADtYoJPrsvH6U47Zvv6y19Q/rhH1/ffrc1Co3iqZ2Ckx/kMCF381fkf++KV3sGdwmopQSQnkKMUV4ObtvKpHub5GE73dJpw6nxiC/Am9UbzDjYVpCog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718295890; c=relaxed/simple;
	bh=dBw9nOUl9fF7SB1r66qOP+3MBsu7aeGgqc4RXD6dJOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPYbAQ0UCufwJU2Mtsqqoy+ugdEhgAKAfUW1VzGhzMPYRJA4kpLcCM9H4CNsjGvKidYdiclZ5F85UivpCb38CsRlMYeIITQNwNLCX0Iwr4s43oH3keuHmSR4F79uvZCNRKhWK1O/X79fxnWxEqv6TQo87leGwpxkdsnoU7cbV1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6iF9Mjl; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6iF9Mjl"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so1585560f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718295887; x=1718900687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xm9fvtFl5M9ClXulLO7X4Jg5vRT4Wu2KsAzkRuWsuxo=;
        b=l6iF9MjloMNMalTqu4bJrNkh63RZPCb1R5TIjRuPBlINZJSC7upsx+9qirtNl7sSv5
         O8vTP9L4hmvWcVV7UA/pMK9brbYTPMnPV4PLyqKxfMvwDXsiyO4mcxcBzkbobN8JO/Sh
         a+QvisXIhJgw7O4ArHisT22shqw7OQuzTSz0krJJsDRvEBXSjM9xt8fSC7OxZ6EFwNav
         hc8tpJH6YnwquW09IddFRLQJ2fE0DQcXW6BUrbc7dpy0CxyT/JJsC2Zav3bMus3jJtGD
         DLOBx4ISE/bu05Dh5e66vQV7jdb+eA+w5jMg9wosvc87ZPO64OP7FQbzQ2XluXkeuj4u
         fNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718295887; x=1718900687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm9fvtFl5M9ClXulLO7X4Jg5vRT4Wu2KsAzkRuWsuxo=;
        b=C1i6W0wpZp3B0Q2/uJhbuKGw8iuv6JUzdtLnWQPR7B5X7L619FFYvto1gWNI/6FR1X
         D3nPqBv0x3ZhS23KFrOaFdYhar2nyHqlUeWAuultuujBz8OLZtWOEuJkZqiKfDykFS00
         k1u3RW+AVjyHV83Xd86pp/5mfLrfYL2R2Xw1IwqYtJZeTcs0sUit4T7k2FnPj1MaPqI2
         tQ6NqFS7OJmyvj9MyBmw1jfLYSkC4dnNjFGldkH2aMe4ndW99TGvyLBVfZX9aLo/UKEW
         QWznj7esDVb7URkZi3yIMnE/kZzeCY+aTk8/qARNGXJnIv2+UGZaz9vqdBcr6BqkVpUN
         iG5w==
X-Forwarded-Encrypted: i=1; AJvYcCUdwzO55kNjEM1XnEHNm2VAJC0GefBUKESONb7Zud/ir17g4Eq30SsbkrEhXKX0n3INEzajxwLPQNzcFn4LWl3vPdATeVzSQ6mFqOdYXISj
X-Gm-Message-State: AOJu0YyllUFocJxv3ctyjyZFRmhR4+sgQgFu8Pn+++BW6vmbYFB8a4Fx
	xslgDMdsRMDklQ9rGflxIzzsTwYBBqhytQBVb7SQKDs+S9b1i4hA78w+M6Pue/4=
X-Google-Smtp-Source: AGHT+IGBrxpjL2E0pgPBIEJnLIDsTzjWGoMfXeByIRcty/Uu7p3y+ZFY9bPpjqA6DX/92MrGE37OOQ==
X-Received: by 2002:adf:f88c:0:b0:360:7386:1a49 with SMTP id ffacd0b85a97d-36073861df9mr2356972f8f.32.1718295887142;
        Thu, 13 Jun 2024 09:24:47 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750ad20bsm2130332f8f.54.2024.06.13.09.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 09:24:46 -0700 (PDT)
Date: Thu, 13 Jun 2024 17:24:45 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Patrick Gansterer <paroga@paroga.com>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] backlight: lm3509_bl: Fix NULL vs IS_ERR() check in
 register() function
Message-ID: <20240613162445.GA24098@aspen.lan>
References: <187b5bc5-a010-46c2-8ead-980df9efae79@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187b5bc5-a010-46c2-8ead-980df9efae79@moroto.mountain>

On Thu, Jun 06, 2024 at 04:10:23PM +0300, Dan Carpenter wrote:
> The devm_backlight_device_register() doesn't return NULL, it returns
> error pointers.  Update the error checking to match.
>
> Fixes: b72755f5b577 ("backlight: Add new lm3509 backlight driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
