Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9481D1F3FED
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Mar 2025 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741068998; cv=none; b=h6hQ5VVG9dhsa7cBEi4IH67oOZ1SK7REa55eblevnCHiB7i+EAvjH68EEXMe531RMDtLLQV9dyIFzepISe2mqzMCHfsiptAWUlwYPLQeJbOuq5utJCFDX76wu5j7Dovx7KpDrUIK6VUhtyYFhnHWSLOm/v7RHN1TKqqOckXF02U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741068998; c=relaxed/simple;
	bh=19X3Uwx+JKkXHVL064XwCITOPrqaO+UWsdIEHnMneuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DEyDLVvOyo4vEhEYyDZMXct2o0wwwTnggPVdp0I+Gjmv2X10Yj4/J/Vd3gpqJtkbFYa5Z/59wwESMBb6xlUjuXvpO6P90yGqL1rjjRk7nqZironXHdj0L9RQvZYsSehhw279NR8BLVdu7P8KJZ+vQEjrDuevtlTaWIOFsl45TX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XFMM4UdJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XFMM4UdJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390cf7458f5so4834055f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 22:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741068995; x=1741673795; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/nKPX6DIjshEMAUl1KOyqAjGkCUe+ICt9ye1bUSmbrI=;
        b=XFMM4UdJk1Yh3GXNa173Jt80Ie/9MKLaAq7fUdk5ctdOkVE1ydX+AU/r3cqCskssBT
         bV9VWbGh11E9ZlAz7Nho5/q8rljPYp69v0/Y4PTGNOm8ce34msCN/jRFr26vUDj2Sj3t
         v21WDEDfj8EO0FU5J7OED6HOB5C3DB+JfLqCBsndVoSTMih9ESbl1Xhqti0rNfjK7X+N
         z7nRQFeHrxawLOstauxQMRkqwJXM0Um1Jv4RF0kQb4dJMLb5PbxxRgvT+ZYc7vmiqbmj
         SXYjfxmUTBacQSzj4LbilSlhNqXsH3ttM89n7RJ1SDafIi50KE3u4xwlDgvmeAGrVoHp
         y74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741068995; x=1741673795;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/nKPX6DIjshEMAUl1KOyqAjGkCUe+ICt9ye1bUSmbrI=;
        b=To3DkAK8xoJArjOuSq7yjo/bGO2NA3VWm9TkIKR7uYMvUHRW/Is8y3gD/ulabdX0nk
         mw+bsYrbYCyjclyq8u53L3UiKMdTwSzqfH0rVSB8NFFyCw/35zarPOowdkWBjMDAncBS
         PgmlZ9rpTcCKeO5Ob3sDtHRFiqK0gN9Tlm/ESgwKIrvydPIRwU6ezLC5kf1UkafFD2LE
         pt6f9mrqzC351EEhApQNASHV5KemFmarcRj1/JUw9G3I8X8STVvkDLQUKLVQifN2Njn9
         CI8+FhnJ6e9ZhTW9kGjyA0cUVqFzm5oymGkqIiohiw/48swG7kK6knW4c3kj+s+w8hOl
         lMkw==
X-Forwarded-Encrypted: i=1; AJvYcCUSOU3Eq1gJ6uiKFN4Y4jXBPFD4742CXer05pQ3YolpRQGUh1mWirirFSfQGxMrC2FmFymTnAeZ6GQWgsRxYGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhc0zTwWKh5Bl8qluLZIa5Dwi9cngdyBqmuB0XV6g5IGPYhUR/
	hnFCPvdDl1mJPxZbX+fDt/ug64V3UJYdqKT7yOhOVwo+yhk/ooKoOdXUJrScQ1w=
X-Gm-Gg: ASbGncuAvs56TD+rxHWdwXbuCGH0c6qJ60JZpE1KpmSsR2BUTMS9Kc8lmeul5xAhZQY
	PKIHGYEgYv1a5FsEl1RMNm2l2TUPxJVjGTAXl9L2u4sZdUKe3OWtveccos2GWLdyTEU3fMe5iN3
	WgWhGDBQqPjfQ4GPKFYHD8zgA7ldE2hMRW5Cbrn50/A5yj7oImP+QTnXL8e96xQfJ6vB5+CyyAQ
	7NippEh7eCBGTJqWeqvKWNDp6w9n0HHV81a2AKBig1XDcZykQbV45TCMDj3KcShFJOhCc4TPMGH
	mIC43Q0qpFc+WYy/6kWzEOhL6x0JJ/iQVThK/BcIDy2jPxh6IA==
X-Google-Smtp-Source: AGHT+IHGIpUcpblova9lskxdumW2y8lPrejnCbvxgbQgqTl6SZZm6j7C3FFjt6dcr0CvmsmXKYeMQQ==
X-Received: by 2002:a05:6000:186d:b0:391:13ef:1b35 with SMTP id ffacd0b85a97d-39113ef1da9mr2356446f8f.29.1741068994861;
        Mon, 03 Mar 2025 22:16:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e479608fsm16819421f8f.14.2025.03.03.22.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:16:34 -0800 (PST)
Date: Tue, 4 Mar 2025 09:16:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>, Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Simona Vetter <simona@ffwll.ch>,
	cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/nouveau: Add a jump label in
 nouveau_gem_ioctl_pushbuf()
Message-ID: <bd5220d3-e2f5-4688-919c-bd65f4a41eb2@stanley.mountain>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <8f785de5-ebe2-edd9-2155-f440acacc643@web.de>
 <809905c6-73c0-75a6-1226-048d8cb8dfda@web.de>
 <684bfc0d-7e1d-40f1-b1b7-d6ed64fcd8b7@web.de>
 <Z8YF0kkYLlh1m5ys@pollux>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8YF0kkYLlh1m5ys@pollux>

On Mon, Mar 03, 2025 at 08:41:06PM +0100, Danilo Krummrich wrote:
> On Mon, Mar 03, 2025 at 06:49:07PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 5 Apr 2023 18:38:54 +0200
> > 
> > The label “out_prevalid” was used to jump to another pointer check
> > despite of the detail in the implementation of the function
> > “nouveau_gem_ioctl_pushbuf” that it was determined already in one case
> > that the corresponding variable contained an error pointer
> > because of a failed call of the function “u_memcpya”.
> > 
> > Thus use an additional label.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Fixes: 2be65641642e ("drm/nouveau: fix relocations applying logic and a double-free")
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> I'm not entirely sure, but I remember that we had this discussion already.
> 
> Can you please send patches from the same address as indicated by your SoB?

This is not a bug fix so it shouldn't have a Fixes tag.

regards,
dan carpenter
