Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA97B222596
	for <kernel-janitors@vger.kernel.org>; Thu,  8 May 2025 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700500; cv=none; b=RyGKUATAIYI7CbPnqlpKBvYrxcYgcXnQem+gg6PNUG3J3Dt/q6hlfDaZHBHSCvMZO6qKR4g8LDeGdWn5xIxjykomo6Z5uG22heZVLiVEB0QEHoinh0Hy+1TUkx3PuPK/uqsf7U7DISrLibGeRGQaGPG3TkGUcjH9TYz84rKwLOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700500; c=relaxed/simple;
	bh=XshUOr28r6ZZkb+yL1lgKFOURqljAiLtgGQWw8Tj5Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5OjFwtRJBXhHS9NDguqReH+GixKinwEDUxkcw0Aha1zf952PkUle5drV9VCyctJPKiNKGYoBJVWn+02AuxXoJEEqEMU4gHHJg5oSPn9TeXN5yQxiInyiOWGI39zep4a/Y8NPkVjD6qZ5/6xW/g6M5j1bwA5Lg7rfjoRktrFDQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rqfpSduV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rqfpSduV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441c99459e9so5679985e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 08 May 2025 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746700497; x=1747305297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCD/xrhh7lmsv0m28M2TFBr3CCN+yhJ+7aC75XpUxc0=;
        b=rqfpSduVzIwxiGLRblAFbGJW7jqAYmbz35uTd2AeMJQZop9AhUKFA6Jqa378MBVG54
         4oatq5qVgG3iy/VKnzPePzWqXsqp0XipJO4L3LjsDTzVeapyGTTYLSIkNUT/N9zfJ8/U
         iVl3B5KAfOUeOTRrB0Q7GExtmqAL/Zn1OT1GyCaN29r8T4rG/u1MRXyVWO6kY86NB3yu
         bkTqycFGaiQSjxLb68scBicX+norFVYZl2K2CK+vqIsvIm+Lkl4rkkXWkhDAZ1ZkmWY1
         RVp5/i1e2R9ylc8lT7R8MRAhQO78TlI4or0crPQdSRKJillRpwjsupFgIkZyBpBxkH4u
         PDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746700497; x=1747305297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCD/xrhh7lmsv0m28M2TFBr3CCN+yhJ+7aC75XpUxc0=;
        b=ARRJ5ho7ghFULCG9oIHbmXeCv4ViaPuBcvO0qbmRWhGU4nj8jIoswNKnvOj0Lmjvax
         KyEGFLzvCO7OmttB//lGczsp5OpadGUiRWuV1ahV+KrUuIYHKyhXq19tYVja6/x9ozTa
         2pKbLzaspY2tcqy9FOW3VwFCCAaTEdHZYl4Yzcu37wBAyrd1wjJlGVXFbNygF5vUF2k/
         mF1nl5m1KiUEqHazeIS36/oZd9kuyKGxfQpP8FFLp3XidQqz98MEJuTF1p6Ml28praA7
         KCo5Vy5ueoTMAD8CUdy4rYjSQTYcr7JOOgsGe3gU8qnozxAJwsTzzIddPAQNiVwLDHIB
         tURQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/RIkF/1yWaUWChvtVgpAhq36k5XhW9syCR9oz/VKOhukyRClLv4adgETMGBrTb8rM2gCzFA5RtLSk1mehFTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkAhUEiG0NaI5u6r3THw5aF1h0rSCMiYsYOAjC4Xz/Z0MUStVu
	fo0Ux28hQC8dF7emphHD0W4NO3AyCp4iGaS8RW7mdjsrlkgA3U0Kb4Bhy+xL1ZM=
X-Gm-Gg: ASbGnctp25qm4dJFs4sNDbKDy0OAGuwmLfeIqQG3KiDdFEX4EKqeZJvYBm/gmP6RLEi
	v01BSA1savLeJOx0R9ZOfU3aabEsJ80Dj81LuWwb1uIz/MWozEErKl+bdn+0h9sbRc6+F2aQAGJ
	3x51KVcM7jpjiwRarmcCtqGY3LUCll9WmLyjwKZuJuORK51BNlBXR6sjVvBBJSSVsEM2uo2ZnRz
	7xUCAuDj2Jf8cYhSnrwRRotx9rjCy+2qfTwl+GYf00kX3dwULBV+ds605HWMqaCoHe2mx9Onb1Z
	caRLx3xnQny+DFYOvDDDRMh3HBkjktq50o0iX7ZcBIK0+g==
X-Google-Smtp-Source: AGHT+IE2ZwRPPmNDwrBPPnDKpNkj/SmmhYpil9fT1HsszQFc0vAn/mcedhnk142mhnL007orG1uNYg==
X-Received: by 2002:a05:600c:3483:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-441d44c4428mr58842365e9.9.1746700497085;
        Thu, 08 May 2025 03:34:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32835dsm32673715e9.6.2025.05.08.03.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:34:56 -0700 (PDT)
Date: Thu, 8 May 2025 13:34:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pmdomain: core: Fix error checking in
 genpd_dev_pm_attach_by_id()
Message-ID: <aByIzTj2t1I9Wrzw@stanley.mountain>
References: <aBxPQ8AI8N5v-7rL@stanley.mountain>
 <CAPDyKFoZiEAn8yT8a9VZqayR1=HPnMn+a51O3zUAUR3L6RXH=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFoZiEAn8yT8a9VZqayR1=HPnMn+a51O3zUAUR3L6RXH=Q@mail.gmail.com>

On Thu, May 08, 2025 at 12:14:41PM +0200, Ulf Hansson wrote:
> On Thu, 8 May 2025 at 08:29, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The error checking for of_count_phandle_with_args() does not handle
> > negative error codes correctly.  The problem is that "index" is a u32 so
> > in the condition "if (index >= num_domains)" negative error codes stored
> > in "num_domains" are type promoted to very high positive values and
> > "index" is always going to be valid.
> >
> > Test for negative error codes first and then test if "index" is valid.
> >
> > Fixes: 3ccf3f0cd197 ("PM / Domains: Enable genpd_dev_pm_attach_by_id|name() for single PM domain")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Thanks for the fix! It looks correct to me!
> 
> What puzzles me though, if this is a real problem I am sure we would
> have been receiving bug reports, don't you think?
> 

I think it would only cause an issue for invalid devicetrees?  So it's
probably not an issue people often see in real life.

regards,
dan carpenter

