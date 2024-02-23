Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687D8125C8
	for <kernel-janitors@vger.kernel.org>; Fri, 23 Feb 2024 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708669381; cv=none; b=W9v60t2YKf8ZeGq83S+zWPU5eArCdb1iDf7m28aMg9IARBTg5/LFYFlwrFaQHcfGPueN8A3oarobHs66+Ft/dN8SJQhnkY50F3rSIrtxN92TeuOg9MeMYcvKhcEFRJ16AglCke/3+VNgsZlrj4OsPmYtfqpmk9l5gTWWmZmhZiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708669381; c=relaxed/simple;
	bh=AX9oxt6B9wMaBuLFUI8N5oFAyPd6rbG9n52f94vBke0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQVM8xli4qQJCwKwzEIRGwzz2nu0nFauHlP2VD3Oywxs/En/pNwKNV2ky+Fd4UHV62EerPjbJMErQU2MIrKu/eBQWxyOuEwB4pH2xjgFsibqShFPAPSAX5hjqxbzB4Xqn3w9sdzwJV+eQ9l4yR1e+leeeMXERByjuKSI4i78/Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nMpXSkZb; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nMpXSkZb"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d269b2ff48so6565641fa.3
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Feb 2024 22:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708669377; x=1709274177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=268DV9U7LcwPINqCZdWz9PHiwRjH/TLr0CgKKPfJL0o=;
        b=nMpXSkZbWi7n2taePZ4gWG6l9jgC31xdKgsQXmMbP1o8q7T/NVWNpsGDH2TOY8wKT+
         dILNEiupQvzVPp2ooIM1sr/Qz58ID2tjKcUJnovMtgTJS1lnauouNk5D/scbebIn08HD
         ucpQfArnSLQpDnq1TXT0UUUuYQUhBVDlMtrJr6xI/iew5p2a5Sr63IPQBqM/F3xFl6MF
         yskSvKPBm9tXim0uVS3E7+KOHFAI+90PGUxr//SS26j6400mY4JZ9dQBj3oE2uxgyek3
         Xjot9wikCOAhAN26iXZy9sce07vETI1Nm5Lb+2iDDo4pOeNt5HxdMhQMAqUyx/mcMz8L
         6DZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708669377; x=1709274177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=268DV9U7LcwPINqCZdWz9PHiwRjH/TLr0CgKKPfJL0o=;
        b=olw9urIxcCw/ti/32rS9iwCr4oFqDGAfRt7kAotpIjb9m3ralRCtiAA9ygqiC5/OBA
         +WmTpIkzaB18yV/jBCf6nJKYPLUKwXXr6DXYFiE0ofZG1YRh0NY64mZTlGS8kBISNr9p
         kowZuq0p7nbyBcnZXN7xtKSYRpHar8b4WJq0ruEiUW9iasrXYf7jZnSwQ3cSAX6ZLFXz
         6ZqDgxgpwrM8Lat471SpbKq6c7vkFPgY/UrHX6+pFtCFx3f72v0OCkAPyczeoJugsbUl
         cQ5c6/X9LSpxWm4dd8/OjETDwhwE3chMsVJ3vpIs6Kk+54l8QCvYwD00Aqyr3MXFixzL
         ZvlA==
X-Forwarded-Encrypted: i=1; AJvYcCU5AH+2M+HrCid3j2ySlFgaI5Vzx2O2R/h5ldpmgMnyaixXmGNqXgcu0kU/d+nC4YurSASLIb3ZYMTEK0OuKEcaRygXJJzTp4VRFCIJFH6H
X-Gm-Message-State: AOJu0YyNgjAgD8vWc+K32VkC8vQnjBYtL2mtgB0rKaxmTEtwVnX756dg
	wD5YCVxPCvJi4gWfmiDErSXlr1x1OiBx/D963bDrRPbZZj0/W7FBXy+ekZUYyAE=
X-Google-Smtp-Source: AGHT+IFyTnL0l0ijk9ot6bjJRlJaw4cxX8QzduZn74vp/3O4XImIGhmYsfJkk7NTa9kEBpp3BPQBkQ==
X-Received: by 2002:a2e:2281:0:b0:2d2:6ed8:9f72 with SMTP id i123-20020a2e2281000000b002d26ed89f72mr488285lji.0.1708669377405;
        Thu, 22 Feb 2024 22:22:57 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bd7-20020a05600c1f0700b0041249ea88b9sm1091968wmb.16.2024.02.22.22.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 22:22:57 -0800 (PST)
Date: Fri, 23 Feb 2024 09:22:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: hubcap@omnibond.com, martin@omnibond.com, xiyuyang19@fudan.edu.cn,
	cymi20@fudan.edu.cn, tanxin.ctf@gmail.com, devel@lists.orangefs.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] orangefs: Fix possible NULL deference in orangefs_mount
Message-ID: <c4bf77fb-c289-4f5d-9f20-e0861a543d91@moroto.mountain>
References: <3e4e23ca-5e00-43b3-91a7-690e690279e1@moroto.mountain>
 <dc2d05ab-2a56-bf9d-8500-858466ab68e6@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc2d05ab-2a56-bf9d-8500-858466ab68e6@nfschina.com>

On Fri, Feb 23, 2024 at 10:11:03AM +0800, Su Hui wrote:
> On 2024/2/22 18:45, Dan Carpenter wrote:
> 
> > This was already fixed in commit:
> > 9bf93dcfc453 ("Julia Lawall reported this null pointer dereference, this
> > should fix it.")
> > 
> > Amusing subject...  :P
> 
> Oh, really sorry for this. I forgot to check the linux-next git.
> 
> I'm not sure if commit 9bf93dcfc453 will lead to sb refcount leak which was
> previously fixed
> by ac2c63757f4f ("orangefs: Fix sb refcount leak when allocate sb info
> failed.").
> 

Yeah, you're right.  Do you want to re-fix that?

regards,
dan carpenter

