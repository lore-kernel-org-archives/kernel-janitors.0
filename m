Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DBA56455
	for <kernel-janitors@vger.kernel.org>; Mon, 27 May 2024 07:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716795952; cv=none; b=KtAEUQMMTg6GmVF+Tl0qolcscC8+rpmaPYqjohmC+vo+hMnA9YGXsXOcR42sB7vC0xJu+AFhkzYuj8UcFoXgzaQYI+wsgNf1UXjgVvrO0bkiS1pHEKfWZ2eSuo6TLgryQndiuxNY4K3Sv/xs/YMSeeXES84c3dEMjVztzCgXLNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716795952; c=relaxed/simple;
	bh=rsglEd/1cQrGClGb99f0Yh/5eHoYMTgN5rWyrMVnVlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dB4BQGXKaOjJkSsD+vfkTp2Iu3Efww/tQvLHhMMpKorwcVbAbaCUzfC3MRVAe+0Us2mP8u98iZKfoMmA79Uwc/oEV0mQrZUIfsBdj8jgq0D64cAEbT8vLjpxK4IZzwbEUyoRo3EX3tU9jIhGQPGuefv5pDWd28zBp+jpumvD/Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DBMAPLwb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DBMAPLwb"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6268034cf8so138299566b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 27 May 2024 00:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716795949; x=1717400749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pY8x2EQTdA7TG0e/tmdje4rTa6D6mFSzBG9suzFAvUk=;
        b=DBMAPLwbwW/mCyKqm1ZNBZLS22LEDwuUurfwqXbcRQroO4/5y2hr83HEkS2NMfCp8V
         EVP5/8AIrcoJF0tgTMhcrp38pQH4mRRtM4YNyyF8U8l6dQZk9Cpgh9KKe2EmiHPmflrz
         7OGncIF+GiS0kDkPhRZG2KaXE8Vy77gr6ENMkWLMQTQCMQn3G4Ji9eMZcer5kvEC0nGc
         EzPyloMcrlXxrRbchvnFXGpv63/Ah6+moiqCokZTZVLUgLe1GOvpf40hGIMq/MiCXiKA
         tkYrtr+58p+9vo6ob0Zd6ar1eMzX6PMvhPibDQTlnVfQVMMaloxp1gJI5JE0rlA/d+/d
         sEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716795949; x=1717400749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY8x2EQTdA7TG0e/tmdje4rTa6D6mFSzBG9suzFAvUk=;
        b=vrzX+zXGFkc5RG4DUFUxdJBk6GnzNFxt7mbRNUxqlfuKBvqkeZmxpbeOGDHlFGliDO
         zGSHieikF5VsYtvWozqiJqszTZM4nD61ATXnawQ0bWWn0Ghf5M+dt6rdM6ekcujzT184
         Pu9pLONKHnq8k5q4HG/Mb8v3/T8uHRTWtTYElXoliOvuhRTmbpj/7kJU81K45hwv4K2D
         +jTAcRokox2JoRiR9/0iZ8FWDhRMkPv/bJ4w9aNWhTTvZcbBXNP3ewrXNiGLRX0mxvwt
         vhEthDG+Ht8Yo+TSJhg688HZlS4ykTGKUJCNEqj04Pze4d+nlYSUnyK65pSwqgH+xDz1
         GBPw==
X-Forwarded-Encrypted: i=1; AJvYcCXFtW0ega2X6ARVIjX/xatCQovfXhSaq4Yo+s7BYV2fvhE6o6pclCxMoY8WjtQ/0Sn3qV6mLs4Fsy76CeqQTSXdoijU97tlF/Kbuf3MtXFj
X-Gm-Message-State: AOJu0YxDAw9o/z6V+9hkEwnNmZf8tbU2eSws/Uynqu9S8kVsEm546zPe
	ng3hEejNEjJGSnALy0xnZIaO3g5j6amJEZQmyU+upbydxMw25bQKX9RF4pjOJ10=
X-Google-Smtp-Source: AGHT+IGOLWmuoL5V61qq6yIe06iRrLzFVSufNu9VlnQaGgErF5e3ddzjoxltAPsVk4RBUGzDG50I9Q==
X-Received: by 2002:a50:cdde:0:b0:578:5cbb:7296 with SMTP id 4fb4d7f45d1cf-5785cbb7531mr6093102a12.36.1716795949131;
        Mon, 27 May 2024 00:45:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524bb5ddsm5408491a12.93.2024.05.27.00.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:45:48 -0700 (PDT)
Date: Mon, 27 May 2024 10:45:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr,
	kernel-janitors@vger.kernel.org
Subject: Re: [cocci] Increasing usage of mutex guards (with SmPL)?
Message-ID: <75137a20-aef6-4a40-85ce-879983decb83@moroto.mountain>
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2405261847380.16852@hadrien>

On Sun, May 26, 2024 at 06:49:11PM +0200, Julia Lawall wrote:
> I'm not the one to decide whether we should use cleanup for mutex locks.
> Intuitively, my opinion would be that we should not.  Something that can
> have so much impact on the execution of the system should be visible. But
> that's just my opinion.

Different subsystems are taking different approaches to the cleanup.h
code.  Sound adopted it.  Networking is taking it slow.  Some GPIO
cleanup.h code was merged and some wasn't.

It really does change how you review code, so mass conversion patches
probably aren't welcome.

regards,
dan carpenter

