Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE254218ABD
	for <kernel-janitors@vger.kernel.org>; Thu,  8 May 2025 06:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746687023; cv=none; b=VSAXcQk2mHfDRk4YWnydRMyri5uP2bGpsqxd6kOV/p8F1an1+kOUbIreR9LZTIOgFkYWFu3jOHUIGUQAhNeYWv+B0WCEQLqWROPfEfWmbyuAsb4zhvX0sK8LN9GeZxE45dvkXBGxc7Qcoln3VA63Sdlo9Eq8A9eQ2lDYwIpoHZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746687023; c=relaxed/simple;
	bh=VkMWVX/SiY6jp7xQYEDQPhAzra4q9xN9l5OzXXCtRQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgshBJimvqVoyjY1n95BvahyVfJa6KTmardmElw661UIxEiFUNjX2NfmCgIrcfIWdQ4L8Xx4o3+OnrIct7LKpleEEsgCso5h7N2BP04dmf2qUWBE0K7sNf/ptPWsrRFPxgH1AvDYx26uNbtE2Heq9OVzh6ruLRMAuQOGOGUby+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvCxnK0s; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvCxnK0s"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so7165935e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 23:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746687020; x=1747291820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sswvW9Qq2pJQk2SsX4r7xkXE6gJyDJCPnoM6S1kt3zo=;
        b=zvCxnK0s6A4TMKeYk+qWdaYlOerjZgCOO1WTfcxDArPXLQ4QTIfo6XFiUKO1xJXw/B
         Juh5oMzCCqJfb+YkFGYf5QHfd0blmu/T5ORSUaAuoBYNLaDZ/3U6P7Y/2WOfQgsU9c1J
         5mgUB6O3CXfEK6PXOF1COP9fe/EdKA+Q5UPPROxrTDGmAvWQ56cvbidPXT8N6ZbJqtS7
         wV4Q3KBeq5roDP2kQpKU3LZDPUr5bNJ3kH3ArhP7zCK5dVfMQRdIqXY+TrvQrQa7Xij8
         dVEeUOU7xkhT4HZ3qv5V4krYClheMzXyfA0ZC3RBSCXHbMHI+c5L8FgiPcaX0sQn9x6N
         Z6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746687020; x=1747291820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sswvW9Qq2pJQk2SsX4r7xkXE6gJyDJCPnoM6S1kt3zo=;
        b=lho0ApO8/N/5ceLWXpgZZ3k6PjkrNbsFQs9QYYL3gCgy3Y3nnnrw/8od8tLCnUi/8w
         wYi/zVdKgcVBP6ajeHjipP709QVR+1Oc2S7zFpgc2SaAUU7XSw5xCiMmkU6LIl93Feol
         kwWfPQ3O+Wyu5Qn4pRuXdsVEJ2Xu+j1YuF3bmA+Qfn296hmdUg1rXsuhgHxcw9DZe26k
         cc3UUQ3rStf2VBaQhlc8jaM4u1+du4Wmruj0UTsaIm/7NKvxp5dlhV5nRUTdI6qJajSr
         49OVLOzAv2jdUg1SqOpChjKpN/9jDt9EDBKmdUp+yfGrP9Ma/FuYxQ8PRwO9qRaPM1A8
         pmSA==
X-Forwarded-Encrypted: i=1; AJvYcCU446w5YD7StcI7pkZNsoJjWsoU6zYTFKxCNUz7NscWQHu5IqU4/rfcoPuSYNVXfX2r0swyq05LzfmfrUUWTzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvaswhEi1ZVShNHvB0K9lej2S/Ks+VUETuPzsjaikyLlITozZp
	yt0ENBIoTMnnj/wCbQjd/gHsX6CLx/nb70JdsBu9F9XkALh/DbrRrHM9k6cglz0=
X-Gm-Gg: ASbGncuD+9F3NcQ7TPPBbN6XVMouCu82At5Ai5yWbuqrYJAXB53encrmrnJYMKVdrGa
	RgY9c3Xc/2mmuzES0KruT/zbt48Ydiuhtx6TZx/Suojdwp5rfp5bhcyvtJ1gdWe2ZHgjllBRlDH
	HKqoH+XAsJxhTyKgrd+vl9wYb0GVVqY7ZVAbS99V4rkxrNs4PxXzquyhqq5RXD0P/wv3iFD7TZ3
	Ib4WKM8lChOyXRIyYcgQVHYo/BNmEUGmNFMicHfXmkKX8NZrHF+z/ubbSfIPRU9gu+wRdyz4MaH
	9Z/QGgqoWuhh9wkEMStlTd1REkh/jxMFeQ49+1xF1bSpqg==
X-Google-Smtp-Source: AGHT+IFSnH7/hk7YsAwIfMrID1Szme78bKEZ0xLGnBiKKY6ADD+OwDpp3cph0URuF50p1QHS0OhXXw==
X-Received: by 2002:a05:600c:3d15:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-442d02eadb4mr20122025e9.14.1746687020047;
        Wed, 07 May 2025 23:50:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32f3c2sm26019325e9.15.2025.05.07.23.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:50:19 -0700 (PDT)
Date: Thu, 8 May 2025 09:50:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aBxUKEpdszTDduMk@stanley.mountain>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
 <aBxR2nnW1GZ7dN__@stanley.mountain>
 <2025050852-refined-clatter-447a@gregkh>
 <aBxTwhiMelFjvrjP@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBxTwhiMelFjvrjP@stanley.mountain>

On Thu, May 08, 2025 at 09:48:34AM +0300, Dan Carpenter wrote:
> On Thu, May 08, 2025 at 08:46:04AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, May 08, 2025 at 09:40:26AM +0300, Dan Carpenter wrote:
> > > Hi Greg,
> > > 
> > > I'm sorry I forgot to add the:
> > > 
> > > Cc: stable@vger.kernel.org
> > > 
> > > to this patch.  Could we backport it to stable, please?
> > 
> > What is the git id of it in Linus's tree?
> > 
> 
> 77feb17c950e ("rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()")
>

Ugh.  Nope.  It hasn't hit Linus's tree yet.

regards,
dan carpenter

