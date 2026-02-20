Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D433F28FFFB
	for <kernel-janitors@vger.kernel.org>; Fri, 20 Feb 2026 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771575345; cv=none; b=pPPsPmfJYa3d0q2xGyjEgdo1TP6gWbt5y+dcVAuO/fK/zv7cvb2y1FUi0ogRt6D/m3QQkiobInYTHWifgj8mFL6j61pfjoFmAOUld3Fu+LuatiKdvlLQeJRA616W3Wh2l0uyGOlQPxuZ70w5rLdIMx+HgSgzULaclXB5Sexp3YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771575345; c=relaxed/simple;
	bh=FKhGBpiyLq7iYhtU9Wgi5Tw1/8FCnHKGhbem5mrEZfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+clR4laQCuuknu1K6edA+pGYUW3YDBzGREqhxLCqucqdEDMUI9K0x+OCPeqC2kyhgng6Pw3dCHOEPwgtMuitkDPPPMiAH+eJu/rHfxmFLvozuWGv7b03awPKInzBhASBPWPSDAfsm4IMjQe7yP0jn+JjPFeQyEWgFHRpZ1Fyug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CssbhH8P; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CssbhH8P"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48336a6e932so11354635e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Feb 2026 00:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771575342; x=1772180142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2c4yw4McqVKYbNEiWy1ExzWWDHyzo4nCpO/gtFeWbBA=;
        b=CssbhH8PmrgNV6wqrsTEwjb9DB8DX6zS/mVU2Paik/MQWTkz/Lu4XpKJsGOf+7Z9iy
         dZzdvjaYyDkg7GGfuKd1dgviEkpb5C5J4M+qwOKPxflKdOAQYFqE+iCm4WjecXeA79+a
         y0ud8Q6+LTSJDdt8zCbCbzBWPh0tWRKivAD/qQDKcfzWdXyiNEOeo61D22RacQPzAN4p
         FohSWg37WOfe0KiYcn0vGyXpXBPOqG0VJrUCTbYMQ24UsHzJyKwCUKq95M3HanG+r5w1
         AGEbuQACnatQaSPO+Gwk725Q9KhCJc/6tE8hTiSJOdAcwqDTk11u8AnCYvHpZ2p3ecGP
         OYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771575342; x=1772180142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2c4yw4McqVKYbNEiWy1ExzWWDHyzo4nCpO/gtFeWbBA=;
        b=SU2yczdSz9I43ugCyG01wLwHBnv8GK2oEozVqe4IOBD35iNsS77MkAYyFZwTp+sKAr
         Fd8tHYMTbD1dssSOe8MCtVmSZNOwneY/dADHPCU123jcVwGqfUMC1BHd1FJz9wj/YVh4
         LfNDY7bjH8f6J7sbn5Hta02k74KbpNQqpPYliW6kuVv45ocHV8NfBE8S3MYhnGNoyceh
         8rJwDhUDbbA97VnhK1tOGk+DKV76uxq9YcGxopaV0PsC6ZXyDHwVeAU/0eAKXeg4MwuD
         NX1TDDJ4euupK5QkYKngqjzhebJHS2IFp5Q4iL5LYe9dWX3qFeKQ8MlBpy7GCcc61Pxz
         Edsg==
X-Forwarded-Encrypted: i=1; AJvYcCVHHkoLIgmL/VhSinKEBuiomRuFNrQnOzl78UokeVwWrCCFjqYiAgq71L/wmcdS7dDlCQKAiEGnlrkDyaPzc2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBzbGfTCvyZwViEY9yq6fWMB+3mOpf07c+cwLrAawHpYpa2zeE
	jl9Zm94IpB+5s11Fjn4cbAN4F9G5uRokJZA5/GQefJ894pxYK5QAtjqI/+8c+Qx/57w=
X-Gm-Gg: AZuq6aJMeEWNl96mZZMmQrGjnM1k1+d3cayqCQlt7lt32uIA4VkATLASsDE8OwQRCe8
	CVhVwOPhmNIAYQDAHc+CIFI4nxk5Bd8XPInHrPy36LZzUcSlWagW/BO7upDsTRfRJN8brgtXvW1
	tU9EV/oioQEbB36+31DTPZ8med3oX96bRxDwGeDTASsCT8WoAxf712Dp6271I/M6quqd77UuqTq
	WlXHVcyOWd4St1LK8pHplpLOFEvj2UKYze6iKMJBfcx3VSZn+hUzqtpmNZlbmthtvt8jcj2dNJW
	XOxQ/AbpQ1KUgu1Qdbcr6Ey9IDimV4i3ZicMuTD//OIvCe/kssA3sJxXUrcD0N4HoP1skFH532r
	4x86tLNC3kujTxUhZ05eSXq6IyzYquWCiECgI+NBbVjBlRixxM/KRQ7w5SijQGp12/jNRKeLx52
	PNV8I+Jhcm0DYI0gcakuWFUOyIK3M5
X-Received: by 2002:a05:600c:1c19:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-48379be817cmr389032125e9.20.1771575341935;
        Fri, 20 Feb 2026 00:15:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31d7b18sm59076645e9.14.2026.02.20.00.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:15:41 -0800 (PST)
Date: Fri, 20 Feb 2026 11:15:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Message-ID: <aZgYKin2nP19CZyL@stanley.mountain>
References: <20260218110121.10185-1-zeeshanahmad022019@gmail.com>
 <20260219225528.m2gklrxtqqt5ztk6@synopsys.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219225528.m2gklrxtqqt5ztk6@synopsys.com>

On Thu, Feb 19, 2026 at 10:55:29PM +0000, Thinh Nguyen wrote:
> On Wed, Feb 18, 2026, Zeeshan Ahmad wrote:
> > diff --git a/drivers/usb/dwc3/dwc3-qcom-legacy.c b/drivers/usb/dwc3/dwc3-qcom-legacy.c
> > index d3fad0fcfdac..34c578309802 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom-legacy.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom-legacy.c
> > @@ -620,14 +620,14 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
> >  	int irq;
> >  
> >  	irq = platform_get_irq_byname_optional(pdev, "dp_hs_phy_1");
> > -	if (irq <= 0)
> > +	if (irq < 0)
> >  		return 1;
> >  
> >  	for (port_num = 2; port_num <= DWC3_QCOM_MAX_PORTS; port_num++) {
> >  		sprintf(irq_name, "dp_hs_phy_%d", port_num);
> >  
> >  		irq = platform_get_irq_byname_optional(pdev, irq_name);
> > -		if (irq <= 0)
> > +		if (irq < 0)
> >  			return port_num - 1;
> >  	}
> >  
> > -- 
> > 2.43.0
> > 
> 
> Since this is not a fix, I prefer new development to be on the dwc3-qcom
> and not the dwc3-qcom-legacy glue.

There might be some static checker warnings for these?  Smatch only
warns if people do an explicit zero check since
platform_get_irq_byname_optional() can never return zero.

regards,
dan carpenter

