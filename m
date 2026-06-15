Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0DB239E6C
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Jun 2026 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520461; cv=none; b=icjt0RQj1wcFfRFdA67hXPvYxyx3V3LS+N6A+blNnRwwF9pZaRCJTOmNb2KNMBzC5JKf3oTz1BQnVuMtfCQO+gsDl1WbkeFgAliNw+u5Um0dn84MolFR1regz2ydgSBQ+ypyZTlH6e4dbkK3HLg12UxCe60sIfX3p4DpIsQWoZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520461; c=relaxed/simple;
	bh=a6XXKQNX/IcBjOxkSTeiKErHC/eDiRukExqbkmBpiJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1t4It4xRWP3Mb3Q/6nCy3jZwzD78r3AOtRyV7czL5HT/Qbass0Y2VM0QaDjEF59ImPKWzHyfqe4B5zkeZbrAY9oHIvyPg8RRGlv87MBYnvdqceXc7WlL6oVITXsBaB1UvdbYMEd7bKZm2+WV00IILpiaoNHg/UIvPrAkExuO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZr9HbPx; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZr9HbPx"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5177b9a02bdso43461031cf.1
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Jun 2026 03:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520459; x=1782125259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M64rJJ1xZSLiHxwrl9p8ksJIU6OsymBXvzM1BXThTtw=;
        b=IZr9HbPxlC6YjpwMAL1VGszk4a8xtsrmiRm6ELanWL/8ilj6Fu84kyfNmIzj0k+GzN
         v5pgLkxVHS7sxkZF6BIKi18oAN3sKk1IP3YbFKQEKsFTTYVvSplNmWM8Z9+ozSKsMnvR
         JOkvu2XNfSTr4Fw5vE92uLd+aXitA3t8I2dTPn3le7gPv95qobioMn2aIFn58wILMHk6
         TweHNBEhmtUmGa2TftJ2SBak2eq42ee9R8J+bTxjUliYr47qE/5p71508pd4fXpiSNaO
         gICs5OCvxHO3USxWIjmFnxCSOEIEFzScUIiJXUXIG8T8YjC3qLO03wyqDc4HgFlEqwtb
         bRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520459; x=1782125259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M64rJJ1xZSLiHxwrl9p8ksJIU6OsymBXvzM1BXThTtw=;
        b=f70mnzgVshh85egK9vSMikjv2X7xg2W5/ADpieRCh0hYrezD+IaRD4udUQGbA9PFZ6
         JcYTdEs3VT9jyc2MkS63X5cejkg4/LGtw47er3jBRRd/Na0KxGFoC/OIICZtvjCQOrjk
         dj2XeA5faX14wBpXuhrKFd/GEQXXisXBZn5cLmpXjFSGXk1tNCkE/6etEZO7QBYWX3wl
         jU7hj4S09q07AoJhx7aWuClbt3eYxR1X3hp10xJM0prbJi7baQJr685Ml1XX0I5/fHjV
         rbvj9FJq4D5NH9eNulstf1qIlHUAqPNa95Gg71CrClw/u1oq7ZgBDa1iWQS+IRV/fbfc
         ZbUA==
X-Forwarded-Encrypted: i=1; AFNElJ+pa1LCxjs4hO5r0l8R9chKP0+3Rfyi9bbAUPyEIPKCqbAjYJVPVTo8tWWn6lctk/37rW19hMAmJwMEWtuhS0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJjeDxdKadAmEWOKd1Ys6faC6yL87iEbRfIzSIpWVIQT6Eqtn
	vMcz3d14qttATe6IG+L37ZcduWzd7v29aAXpUpHbll+5WNvKuUdCXvLp
X-Gm-Gg: Acq92OGGpy/CwDWAOiGNSIue77el6tOzWSnGKIic7g2sok6GfCc15moipeEPSjlWNOl
	rQZ4qQZT+hbznYEjeg8l6BzdYgOGbMc7FP0vCVSpO2AzW9rPk/Og/T2qBXpknXI4teHFTTqR3Ek
	mgrEBWiNhDsUa5+55HoFGwPwOcYs1i4nJ1HGo63IsiOk2R2j83QV2GO8+X6ci9EP1DaCvsV29Pf
	sqhzIpIpiS7KstN4xIFd+bQFMzGQx+d68dT+0QhOJ1wOQvkRAIn1geEZe20NQExqSJWy2Z9XsYQ
	MQcNGS9+uHs2uCQI7MTI1qR3jhe4E8kwZW4BLnbawpIwxZOlXTzSNhVe9uRyZ6VzkDguKWEwCxh
	4ZIYvL+Si+OLKYZHx+OY+WMg2eQS3jfez0JGamUVY9vlgjEHP7fJb/q8qvGCq/zfRNoYDnF833V
	mmF+/9rz/yIVtnqZcg
X-Received: by 2002:a05:622a:1b28:b0:517:9407:5c35 with SMTP id d75a77b69052e-519536f0741mr170037011cf.47.1781520458986;
        Mon, 15 Jun 2026 03:47:38 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb544533sm103003211cf.0.2026.06.15.03.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:47:37 -0700 (PDT)
Date: Mon, 15 Jun 2026 13:47:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-mips@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 4/4] MIPS: kernel: proc: Delete unnecessary braces in
 show_cpuinfo()
Message-ID: <ai_YQwmgIFgWj0tj@stanley.mountain>
References: <e9e46083-c250-4e12-8620-f590e9501a25@web.de>
 <7c7d97b0-37bb-4e7b-9b2e-49a7c10eb6c5@web.de>
 <ai_UUB7ouRSE1KEw@alpha.franken.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_UUB7ouRSE1KEw@alpha.franken.de>

On Mon, Jun 15, 2026 at 12:30:40PM +0200, Thomas Bogendoerfer wrote:
> On Thu, Jun 04, 2026 at 07:56:12PM +0200, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 4 Jun 2026 19:15:15 +0200
> > 
> > Do not use curly brackets at one source code place
> > where a single statement should be sufficient.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Generally, in most kernel subsystems the rule is that multi-line indents
get curly braces for readability even when they aren't required because
of the syntax.

regards,
dan carpenter

