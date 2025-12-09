Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A2A2FE053
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Dec 2025 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765291295; cv=none; b=ZvObfaddiBOYsFD2Mv55tKNAK9VeOCvDfUmFNc6dJN97gOxq3Q0vcikovEDLZd7YY9BXL3azg19fxhAIkbxwugWYafK18pgQ8Oxi1Pp8IBrvrEgDyijlalSYH6sVEagef6TMGtOvMlI/TQwSXVycEX7rK1oGaynFaGTbp0lhkUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765291295; c=relaxed/simple;
	bh=rLipDWHp/1XqeYQ/MbPAtnNwpSFTzKkZ5pd6/sTziaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvOeRZzG07fXjByeb8FV0vRtqnUYf5aQW/F2zy1Ft89gB2rytGAoHO9uVmWlkL8dALHASS7PVcZRhMW4hxyyE1wSMTeTyEOjUw8t6C6A4b/fJo/10LX9Gvhglq+iNxEvxUrUwWLi4dleg4zHkuUrqyHQdZFJEm7Xw9JJFMHaB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uwDLjaam; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uwDLjaam"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so3891434f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Dec 2025 06:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765291291; x=1765896091; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tV7fC4Q3GnUl3jRisPYENdBV/quWBBgj8sbTSTRlyOk=;
        b=uwDLjaamc07QNh/a86lMjEysHUCCRVpOSJz10SDoJ4FIKfX/gXVUdt+cL5Sday9t0I
         xEGipdWOf5BJwwG0qJoTzvuOorHfZE4MZ1ZhYw6Snxv2D4Nx6n2dTa5SWLePkbaD1yYe
         YwiU3uyooNw95NSi76fPzYxS9MM1T48qvszC1rS1oFHXUaJGQUONOE6guL3Gtr9w4hua
         SSP1vFip/0LlT/mDOFfIL/iWL7M/Ng3FNq6HU20wjjDB26m2df1R0Kgg2/iOaUpnAQK1
         S8+SYjjLXcyz6rd7OyNN5FTOyuRwHsOIjyXCgf5XG9JJyqLoamFBjy7MFfMeGTt8Fsny
         QdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765291291; x=1765896091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV7fC4Q3GnUl3jRisPYENdBV/quWBBgj8sbTSTRlyOk=;
        b=uWcGxUTXYj+O+Einti/UAkhGOo4qLKaX2e3bHur8PBrA06S2vFqBYXOST4H9GlkTir
         LUuTkk73LfI4oIS0XZ5QU68TnocnLYzTSuB3QBhg+ZZOUE33AWb0e+Nsc/eq1RL60s89
         H9wPt4pg/iWDEJKZmm4kGHAYeoqkcyJt3imsFTu3zxerZ/Su5KzSbcm/RRNgBidCqerh
         pvFxYzPzRllFHfyuJEFEY0TAFykf6IrhdicNUbWNCmz0ADePGD3D9lF9LqDT3FpZrymI
         uLk8Udjr7CAqTjiFay5PD7voOrfHmIXLl206NNXo3NGEY0kjAUdIf2a+Q9vhmhJhj4Cm
         TNpw==
X-Forwarded-Encrypted: i=1; AJvYcCUvASZq6du/PVTfpJDGAgOMRzpu0uQx28wcVHTN9N2juzDh/LY5iGzA3cWQ/V5sbFDO+ThDF8/7F40S8fm1src=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcgtU/tdb3QOOaHJaHP/9IrM/xn1hl3An1AOEmSgxGY7S05z3g
	R2RqrRNhnjuJhBZozW+6P/sZJF95sYHrL9foqiRlc2AZ7ugmAoqPJ/88kCI+VfpOigo=
X-Gm-Gg: AY/fxX6RnDk+dFcmp4tuQ+fizhA1d6oIsqwOUWBY01oVY+iYTlI31lffqTnpviajzlz
	T41N9xnTvlGZx96s+E8HkjnAK7m6lM9cZOxBnZNm/uwMd0/KFfsyrFK8MvcTs9escak5/3TI2h8
	fgr9uJUCrwgt7EfALnSae2mp390UU2NFGMb8xnCTHcvly5N+MOhEwNKtW1FKKhDg7whiGWX0Ln3
	KSD+Wm+gOh0Jp3mkofnud/DdAhthDKnhADjlpgEtnihRkWUPQLrzdx3u8Tzz1uUpjneiwIW1lcP
	KBOcWIdQcky9kkOMgBMJ0lDefkMy58Biwak4f31ikdcHERiTMyrNLxg5OPTDD1BQfmGspg9kZfF
	49Ay5t0i5m+XhqOygeDDSvLlGlBU47z47szm7oJLiejiC9bLNjZcsOHzOZYkZ2Bm61GZ8CHzYCQ
	lXusmS+2QNy6ZzZRRS
X-Google-Smtp-Source: AGHT+IFNmhiLCQWwj1z9cR6s7v/7qEeyW/OZMxAhr3E7hvdIj5qnKl1ZekpnOu4e977AVVxvtEYp1Q==
X-Received: by 2002:a05:6000:208a:b0:42b:4858:752 with SMTP id ffacd0b85a97d-42f89f0fb5fmr13180134f8f.27.1765291291413;
        Tue, 09 Dec 2025 06:41:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee5bsm31889015f8f.16.2025.12.09.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 06:41:31 -0800 (PST)
Date: Tue, 9 Dec 2025 17:41:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kate Hsuan <hpa@redhat.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-ktd202x: Fix error code in
 ktd202x_setup_led_rgb()
Message-ID: <aTg1F1MH5qnmUkaG@stanley.mountain>
References: <aTfIHE_2-iKIrwqv@stanley.mountain>
 <CAHp75VdHEVsj9o1UPSS1ikJYofDuiA7KwUaj8v79cJ3Xs=N5xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdHEVsj9o1UPSS1ikJYofDuiA7KwUaj8v79cJ3Xs=N5xw@mail.gmail.com>

On Tue, Dec 09, 2025 at 04:14:03PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 9, 2025 at 8:56 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Return -EINVAL if the "reg" value is invalid.  This is unlikely to
> > happen in real life because it comes from the firmware, whether from
> > device tree or ACPI.
> 
> ...
> 
> >                 if (ret != 0 || reg >= chip->num_leds) {
> >                         dev_err(chip->dev, "invalid 'reg' of %pfw\n", child);
> >                         fwnode_handle_put(child);
> > -                       return ret;
> > +                       return ret ?: -EINVAL;
> >                 }
> 
> I think the better fix is to split the original conditional to two.
> 
> And make the message something like
> "can't retrieve 'reg' property of %pfw\n'
> for the case if (ret).
> 

These are never going to show up for users, the messages are only for
developers bringing up a board...

regards,
dan carpenter
