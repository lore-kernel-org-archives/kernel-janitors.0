Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119E1F9F72
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Mar 2025 10:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999227; cv=none; b=Sd3eaT/HZXYrPbbxJfrhICPBf5YMRs2lOirFUkAr4gWYHBaoorwDG3IH+qZdycviRRVJKK58w4K5ckyu94iwJNYHpaLE2XFcRMd4c4AWb7cr7yeMhAP5CIGDCivAVcLdTMwBdWxFRnTNMqCJ/oHxK+/F7sITdSjxDRKsIkev70A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999227; c=relaxed/simple;
	bh=Kj3rTWIoDmPt+SLfBxnJONe1BtBMU+vHFup+WxsAQuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E00wejY6/WFym9yPOnwkX+mzIRyobMUrB0r29QAi1u6DmMwbQVKRA1QSjpHEE4+GlBIkC76udrbBTeXty+OXY4U0g7xd8JFtWUOEgNlDc8LOqV7FwJyBv5x4m7cRgJWb3akh8lf+PCbTjfETh9HP6cAKKcFSnz5TS+TN9Vl4ESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wMw6IyjF; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wMw6IyjF"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso6723468a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 02:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740999223; x=1741604023; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gSR1fSju11GwT3CmV4RSTFrBeqMpZeqjsL4Nu+lUL6I=;
        b=wMw6IyjF1vxftNpwe3TiSYPJorx0sH1PenG75GdY8cZ3SGYvNdyoY65gyx1fwqGgq3
         ccKosqU9GeKwLs+tn7feTXe96ARw33I00otRm55hQYokhl3hnMLdUfivY1aOkLFLD6C/
         0arSEXxWRvqwl6ZcAqiwNrkYyv1GJlBtLo9obA/ntCpDrZ6/r53LPK8BK2UaiNa50v+c
         irXlpOwMkmZtoWawPh/0Ur8DAdwXZg9mJ2Yi1X7G0tGFa+yNjFqq8Qm4O8FmUTT+mX7t
         umnUJw43gjFW+5eEvl7ftYizOoaLde7Yzc4cMOp5NA3gb0avHVW+ceQlfxsaB8ncnaBZ
         0W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740999223; x=1741604023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSR1fSju11GwT3CmV4RSTFrBeqMpZeqjsL4Nu+lUL6I=;
        b=qMQOwwW5rPbFhpk10SysokDN9fsvwpFueZstlOWh7+eHRToMzh4zR6OyS7c2lvqVzf
         t+N2htrlXpZ9LiQmoXlTNvCKisg6uR2kUOi+jp1MeZgNH+/AmxYTgruzoDkUyqXvjokl
         Uwh91b+RSOlMuVjYH5yF0ug9MAF3Njbt58wvIFmuc53Y5P1vb3nmIQVIc550Nc/fZaq4
         6KOUYlAtyZoWzPZzYQSpA4Rgkls+bbKwJVAE4EeteLv7FZIrInPcUguO9JF2he1ze2xj
         UTZgGTP95ClVvlyisX+RYVO7UVeuEo3cJmSX4iCKZpZZjH+U4xyqmALr93LpwGqPEpBe
         2WvA==
X-Forwarded-Encrypted: i=1; AJvYcCWoZfCD6YJSFpIYmXj1B3/1dAzVcmkuWDJdyzdzxWnothboxRqead1w3NXO5FhWB/M+3ZBNAnuyYOJAoT9RIT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytpi3xu52B8EuvJacLkymYoJSqHQOWCSQ0TqRy9BF+QvvTn9VK
	PK2XgmbNz6uJQABn7zpu+u6bWxh9puQG8xJ5vf+BwfFksV1WqyQXTUeVGKLYuNM=
X-Gm-Gg: ASbGnctXL6bzV9drqYVOIGQ87rbftARqwQCkNfqmEESjVGp02R1eSE+UYPwx2C5rciN
	4df04FY5HiyTQ89k2iHxkkLWEk5dG5awRIG/2LmaLyETvsa4n4N05tOkV9wQQt4mP536mQGJuZ/
	wS9Wc/eAcZzI9tweqImeFNP7USoaDjRTMrkFowPQT1RuGyrSsOzcfIvcZgftBvBcw5Z+aahNzuS
	ivoNU7p4z7JTYkbafjvI1DQ2M85YR3rpJi9koizYWUHY10vpnWRQS/FopTMJmnM7drHrzYEJmJ0
	dtbbZroHAt0VednWOssTXBYY6DRlXqMIrz+04bnp3z7+qPaUkA==
X-Google-Smtp-Source: AGHT+IF878WM4Ac0lwU3U8jWhqiDwhdQ1OhLRZrdD2ubBpWef4yPS0ciLaeLOsRMTVQEjBD/4tiTTg==
X-Received: by 2002:a17:906:7310:b0:abf:13cb:c411 with SMTP id a640c23a62f3a-abf25fabbaemr1560894766b.18.1740999223509;
        Mon, 03 Mar 2025 02:53:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf55e88748sm421511766b.54.2025.03.03.02.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:53:43 -0800 (PST)
Date: Mon, 3 Mar 2025 13:53:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Antonino Daplas <adaplas@pol.net>, Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Yihao Han <hanyihao@vivo.com>, cocci@inria.fr,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment
 behind a null pointer check in au1100fb_setmode()
Message-ID: <47c37d1a-5740-4f48-ac0f-635d8b6f51b2@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
 <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
 <hwk2nf62owdo3olxrwt5tu7nwfpjkrr3yawizfpb3xn6ydeekx@xwz7nh5ece2c>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hwk2nf62owdo3olxrwt5tu7nwfpjkrr3yawizfpb3xn6ydeekx@xwz7nh5ece2c>

On Mon, Mar 03, 2025 at 11:30:46AM +0100, Uwe Kleine-König wrote:
> On Mon, Mar 03, 2025 at 01:08:29PM +0300, Dan Carpenter wrote:
> > On Mon, Mar 03, 2025 at 10:19:06AM +0100, Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > On Sun, Mar 02, 2025 at 07:02:12PM +0100, Markus Elfring wrote:
> > > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > > Date: Thu, 13 Apr 2023 21:35:36 +0200
> > > > 
> > > > The address of a data structure member was determined before
> > > > a corresponding null pointer check in the implementation of
> > > > the function “au1100fb_setmode”.
> > > > 
> > > > Thus avoid the risk for undefined behaviour by moving the assignment
> > > > for the variable “info” behind the null pointer check.
> > > > 
> > > > This issue was detected by using the Coccinelle software.
> > > > 
> > > > Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
> > > > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > > 
> > > Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> > > 
> > > Should also get
> > > 
> > > Cc: stable@vger.kernel.org
> > > 
> > > to ensure this is backported to stable.
> > 
> > It's not a bugfix, it's a cleanup.  That's not a dereference, it's
> > just pointer math.  It shouldn't have a Fixes tag.
> > 
> > Real bugs where we dereference a pointer and then check for NULL don't
> > last long in the kernel.  Most of the stuff Markus is sending is false
> > positives like this.
> 
> I thought a compiler translating the code
> 
> 	struct fb_info *info = &fbdev->info;
> 
> 	if (!fbdev)
> 		return -EINVAL;
> 
> is free (and expected) to just drop the if block.

If you dereference a pointer then it doesn't make sense to have a NULL
check after that because the kernel would already have crashed.

In 2009, we had the famous tun.c bug where there was a dereference
followed by a NULL check and the compiler deleted it as you say.
And then, it turned out that you could remap the NULL pointer to and so
the NULL dereference didn't lead to a crash and the missing NULL meant
the kernel kept running happily.  The remapped memory was full of
function pointers to get root.

We changed min_mmap_addr so that we can't remap the NULL pointer and
we started using the -fno-delete-null-pointer-checks compiler option so
that it wouldn't remove the NULL check even in places where it didn't
make sense.  We also started doing more static analysis.  We've also
tried to randomize where functions are in the memory so it's trickier
to hardcode function pointers.

A couple years later we had another bug where it turned out you could
still remap NULL.  I forget how the details.  No one wrote an exploit
and it wasn't publicized as much.

Anyway, none of that applies here, because this is just pointer math.

regards,
dan carpenter
