Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3519D26FA4E
	for <kernel-janitors@vger.kernel.org>; Tue,  1 Jul 2025 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751362105; cv=none; b=gYYGI7zeE8bWN1dDr3RKoL8C6blM5HLw7aGIMHe1JqgXDW2rsz0UbJQgaPtPsJ7jS/MIEo2+iznSIBnQUPXQ9ry3HJJrycokXrl5yHf+XGzF+R+5MMfUPdm1if1z3lGYky+Ol0HLDKsWPL9f3SJs27/cGR/SE/0Bn68M7vxdq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751362105; c=relaxed/simple;
	bh=xU+kDdU0gwzb9LPPDqkZf5rUekFrGYUlG52+CjTps7A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNFSgsRfKTqPAJnBfD400CXAoyM46Z+Fr1t5/wV+5hUmU2Fme8EXfm5Dysv6KI8LxaLqR84jtmICNNc7LGh6mMuJtplAoLb3VcKzUe9NHG9loJMOFJs0RCLaPtFWSzprs0urR20sxloE7TT8HizFXpIDjhpNdewy1qFsjA1SG7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z8s/K30a; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z8s/K30a"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae3a604b43bso197698766b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jul 2025 02:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751362101; x=1751966901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vW8tXWZC+/EOEMWh/X8OhS7IFKfYxgh/KBq6rDgPsK4=;
        b=Z8s/K30aun/xPgKGqAjd0fMnXCDU3mgK0OgZbHXARIBxjPzOL3aQ60RPO7OmD0ETKn
         Rfe4sLdiiP8HTDHybRwu2slNwtUM204NfDhAeCqMl8q6DME2aEFWaIr5Btak2+Odytpm
         M1U25VIpmqsW43umLqsTK5jVNv9x4iXFCiJkA0assksKUv/WB90O2JqNfRx6zkXRIbJb
         pCijUpnNDCc9pVw36K7nrSkXGkZsYwnrVTGTNvJ++/x943jGME9P/7zqcVO3dOeYKQLm
         DBfa1royiNE+C6c9QTGYw4dZrHriapjZRAGwdbw/rs5MOV0RpEkn/lekzvfK5MNyDgEp
         vF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751362101; x=1751966901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vW8tXWZC+/EOEMWh/X8OhS7IFKfYxgh/KBq6rDgPsK4=;
        b=lysa32hCqFUjcgORn0u4uIXlVUrAjZ1f1JGUEfYAZ7PsHInSOB3Abb6uSt5SYsi+TV
         V5HMQTcgYQKxyjpOemyQd8lPuKCGOAebzNJ1isQ0I7gTb3gYgP0ok/OGIoZR+Cfdjuj5
         7Et5CHf2nsAbF7yDxE3WQBDva42Lh6qb9N9UhOLPMCuJYwa+939kSngjqVw9RgJ89WMP
         QgNqOn2zu6s/KhH1kwEtabmB4npuuiMFTUGCkiHi70ZHCsVMRXr/XZLlKBIcZ6RceFG3
         Utl27zS2qlFtbLQmQNdVtwgwR2pYCu0AJnTcKPn6cJQn0se9Nk/xvEStbpTUiPRCEoSX
         ndsw==
X-Forwarded-Encrypted: i=1; AJvYcCWTipGwnOgba2VpssN/8InmnzkB1gvLQDNTvybHkpIqLwogTgHUOWSfVKdXdNg663zRWdisW45WAbKqHDL5K6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSw60XuKKNHGr1ArWnVeMXtpRj+X/aAvKxwnNx+TOmvaJebfDj
	oEM5EnbQMyqaoOcVLPfdq86mFw5uX3Ef+aKOQXsjoFJlG+NopFneKNZalw6I+WTGE4s=
X-Gm-Gg: ASbGnctueKSfJlBSHXNsmDnsZmlSoYLgrhQtOkTZ6O95CgVidB2WBzhe7KNXQdMeJlI
	nX0nEKMgATNp5hLxM6kRng0S78FsMzRIRyqL546ogVJZCu1xIr8nJ/jzZJ9aoof7TLKLl2/akc2
	Hx+K1QYmuDlCRsBa9xXH6DB1G7KLRfRpNXgc8mmCejfqb8yei4kBi2MfEfuw4kzHOHX1KPYPg3L
	UrCK9/eZDG7YewMZCZDG5BmGAM9xlnLE7t72lCuJgGujpySzuOJ2u1lD8gT0Fw/92T12gvcMGUG
	WI6T/cW0t8YNyKCpb/TBue7uOR+4MMk12b2lsijgAegD94v5cCYeeto3n54RMm/lsbDNwA4nQfe
	KMlHvS61SS8Uhmx7KOYU6X9+XfaIbDlUP
X-Google-Smtp-Source: AGHT+IHbFo4CW/gWO5mfmqvdr8G+K+m/vpRfFZfo55Xt83CarSb1cUQYS0Vzv+Vrkh5sEZMITIneQQ==
X-Received: by 2002:a17:907:a4e:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae35016b435mr1478913866b.51.1751362101509;
        Tue, 01 Jul 2025 02:28:21 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e2a743d53sm1292386a12.28.2025.07.01.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:28:21 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 1 Jul 2025 11:30:01 +0200
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rp1: silence uninitialized variable warning
Message-ID: <aGOqmd5cvCeBjWMI@apocalypse>
References: <748d256a-dc9d-4f85-aaa4-d480b7c4fd22@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <748d256a-dc9d-4f85-aaa4-d480b7c4fd22@sabinyo.mountain>

Hi Dan,

On 14:35 Mon 30 Jun     , Dan Carpenter wrote:
> This default path could probably can't be reached but Smatch can't
> verify it so it complains that "arg" isn't initialized on this path.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for your patch!

> ---
> I didn't add a Fixes tag because this likely isn't a real bug.  Plus this
> code is very new so it doesn't need to be backported anyway.
> 
> Also checkpatch complains:
> 
> 	WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> 
> But I left it that way so it's consistent with the other return in
> the function.  Maybe we should change both?

We really can't get rid of that warning by replacing ENOTSUPP with
EOPNOTSUPP because the core pinctrl code still rely on the 'wrong'
define, like this excerpt from drivers/pinctrl/pinconf-generic.c:

...
	if (gname)
		ret = pin_config_group_get(dev_name(pctldev->dev),
					   gname, &config);
	else
		ret = pin_config_get_for_pin(pctldev, pin, &config);
	/* These are legal errors */
	if (ret == -EINVAL || ret == -ENOTSUPP)
		continue;
...

Also, many drivers still rely on ENOTSUPP. Maybe a patch that will
fix all of them at once (drivers and core code) is in order, I have
it in my todo list, indeed.
Besides that,

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Many thanks,
Andrea

> 
>  drivers/pinctrl/pinctrl-rp1.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
> index d300f28c52cd..f9cc6b28994c 100644
> --- a/drivers/pinctrl/pinctrl-rp1.c
> +++ b/drivers/pinctrl/pinctrl-rp1.c
> @@ -1524,6 +1524,8 @@ static int rp1_pinconf_get(struct pinctrl_dev *pctldev, unsigned int offset,
>  		case RP1_PAD_DRIVE_12MA:
>  			arg = 12;
>  			break;
> +		default:
> +			return -ENOTSUPP;
>  		}
>  		break;
>  	case PIN_CONFIG_BIAS_DISABLE:
> -- 
> 2.47.2
> 
