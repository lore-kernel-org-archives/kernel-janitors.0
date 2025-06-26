Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C3B287252
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944106; cv=none; b=CsPK8u621vmm9SAqM5v5sdunv+bqTEp87ZsfkQMjteqeUHhCnymIgZmES0CLQOMT9OeW3W68E/kLkaf70keDjn1G0AN//Lj/xUfTN7pwzXSpD/Uxmex7pLpGfDjVaQybau3O+d/9z3z4fFQ8s9LR3noWYmvdqfvtp3FfBUKiT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944106; c=relaxed/simple;
	bh=d2ynvgpLC9KJpAzvF0WB5ZbHDMmgOpXwsY5NyyE8fxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GA98eiLYJjRZrGyYhVid6wmjDIOoyX54mWlS0hJarq/wUx3eu/X+vnIzLqNu3Bs/51cN5c89CQvhjCpZZGj2VmkFwP3NXuZEVAb7zpDtwJKN2Jbc4maUfV6Qgm8UAD22MB5FSgY/2s9ydO7sntJBq4PpsOwwsKWM97cPZ5XpBDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HD4GuiAG; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HD4GuiAG"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-400fa6eafa9so663338b6e.1
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750944103; x=1751548903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bOFVRCcBUw+mWK+/Dekm7KTQk+bIykTI3bUscdv9A2w=;
        b=HD4GuiAGNq49KvM6T83C885B0zipbqFxxEVGRMbmbuW6qRSuaLdgmlAP7faMJKpYny
         1ngzXEK4y90dAAWM+rDQxjP8eDVRUx9W7FScg6GTd300gZzJoo7qV5DszmTPiNQwQt9G
         S/L5XQdfgHcSfv2ALF5LvX1B9DDd6+lc8dVejfw4SBYkzJOGE7bwQLMS+bsUpge2tXQE
         o23rVZ2cIGoZciTTw+t9316b+MFiOVCazdL4csVh5YIAeAIi82BxGuR63XtUcjEoJ27y
         aEFCX8DUCxa2gSq+6mMAfXar5EEb3pudqylUCz3aqcS25R7oH7EpAJ/mHMO5efUTnIFW
         CtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944103; x=1751548903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOFVRCcBUw+mWK+/Dekm7KTQk+bIykTI3bUscdv9A2w=;
        b=nz2Qo5sFye2zNvUzcc/uAdxKlFh2eQOiwH6sambX45eo5hXv09kCx9MXBkYXHo2CfU
         6rQ3wJGog9hJFkr8S/v6RydrqJWvEcdiFtxUW5Vjhpnd2f3Zt+VK6DXcBBkrB6fSYV2H
         FvWjpCKu52/3GJxrJtaz4E8AUxVF29eOpSHmRvbSqHHDgTW5mO7/ZTYVXOJd7AYSv3wJ
         mklg5vpaBGB6CTQ41k0IHESjRgHLBKN2Plh0VyZ/H+47gsmS/LqYYIgSwAy+h8dWgse0
         aGIoYrgPwWAXTxjtua+ogg9soK/mk86mDnR0wdu1tQzoksgly9Sh2v5FAAYogD34XdPx
         M8FA==
X-Forwarded-Encrypted: i=1; AJvYcCX1sCyX0vkVXJeV77LeX44A2L9G7QFla5lCJna0XrZk3E5OHx1O/k0ABfMnRXC3P0lG+PGF7cXZBmLiCwRb6GM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtGEVVdVG2Nk5mvgcg6jhI9c5bDThKNl7+Bt/orVeAscBBOHkG
	9mYBHut2Ix4sxjdIqTmoJGxkHckqEDnyd31jmhGtIBlzmyrSZrgOjYjiCwZiqSaK6o8=
X-Gm-Gg: ASbGnctxe5bkPxaZ6Jlj0aR2r3m/Yu0Ioq0HN598wur9fWPRqV8b75heEcDgWPFv0+v
	YeNnMrVexZeAullA01vu1n8ZsVXnrMgQkva3hRk7QvCt3g0dquuBZPagWha7uQ0SeDEihalIup/
	486QwzXdiiYcBxmY0f3ntNljyEk+dpQ5kc77bHycaX7CPLAsoEcDeeGis8AMNjiXuX6INK2RXeN
	ujbZca0aqsR2wlTBMdpnx9peYNeTNhJxpFnV+aSAY1G2wO4C1Drre4eT5BkCPCUrwERa/aKfw2n
	CLIeqeUGAYByCKfEeAo/JOmbf+XzPUU48QzcuM6NnKdLcQ7O70NNGyPqmukunYZ6R0Q=
X-Google-Smtp-Source: AGHT+IGvz6gUhA5u66fVOK5ErmCf+/tRiLHCvux4O1ovgU9jkUorXeS90Wph1Qw856JXzjrMzzPw4w==
X-Received: by 2002:a05:6808:ec3:b0:406:6669:f4c8 with SMTP id 5614622812f47-40b1c3bdc99mr2599256b6e.36.1750944103075;
        Thu, 26 Jun 2025 06:21:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c327c3sm2588372b6e.19.2025.06.26.06.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:21:41 -0700 (PDT)
Date: Thu, 26 Jun 2025 16:21:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lianqin Hu <hulianqin@vivo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Michael Walle <mwalle@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_serial: remove some dead code
Message-ID: <81a704b2-56c4-4ea7-bcce-831ad2e4d070@suswa.mountain>
References: <685c1413.050a0220.1a8223.d0b9@mx.google.com>
 <fde57cbf-4367-4741-8d67-b569ecb9dc61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fde57cbf-4367-4741-8d67-b569ecb9dc61@oss.qualcomm.com>

On Thu, Jun 26, 2025 at 11:53:05AM +0530, Prashanth K wrote:
> 
> 
> On 6/25/2025 8:51 PM, Dan Carpenter wrote:
> > There is no need to check if "port" is NULL.  We already verified that it
> > is non-NULL.  It's a stack variable and can't be modified by a different
> > thread.  Delete this dead code.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> Perhaps you could add Closes and Fixes tag, but its up to you.

Fixes is only for bugs.  If I put a Closes tag, then I'd have to give
myself reported by credit as well which is just being greedy for tags. :P

regards,
dan carpenter

