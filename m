Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8201B87F0
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 20:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751314781; cv=none; b=iBL1QWNIGsUS5HFmg39gtyxvbInHWAlQP1Cs/j+w9+DVL0io/Ns5/+WSTVdfkq+a1odFuIVvB/uP5yWrizgaltE2k19WDOPZcsWFbhwkPxLsFQACt1Y45rwW1EmRZWqoeyxhpKJr/lrYyvfoRHTV3g8vqv8hDRv0en8qStEfa5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751314781; c=relaxed/simple;
	bh=yxYAOdHuUjJ7OCPW8jO+iUuFfvd3q45XoamAHGfFMiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUNZj6NM2uo7TGYCKUZ7MkxhhFGwubzASIdeHXPABRB3CufgJM/MHfzGrFpTNCUQPrafs9SFBe/sBrmlO1uOKWJ+ZZV0FzUInfQUDN9Ysm+61SI6OGeBitbwXMx4YxQTfNn78WpeCqKR1XR41bLQSQuDi5LNke8wblvgAnztf9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpIS4rv5; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IpIS4rv5"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c09f8369cso1431426a34.3
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751314777; x=1751919577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eu9q9jAleEqjkU9aG17JxIXNZmKufj2Xt5hkop1caTI=;
        b=IpIS4rv5A2v0h/7dIaM921u8H68RnoMBkrpEZtB8buzDo9uVbYrONB3umwY/psTVbY
         54DK0roXlpXCDhriS/7KGTzhqUCkBitbuI+ewmcLZrTBPdHCUa+oj+rRQxAJb/Ze+eUU
         8VwwX1PfWJrvfwVJImMsf3+fYh2Ju0oAEhgg0lExJyTWIBq9C0X1uA6zmTJR94iyvwyM
         6eCgcg5oCvmU5oHoUvl4kFPGm79f0QL+/LV++3DBqltVtJ565GV0i3242vGeJtZDIC3a
         puN20umTLFMRX57AJYoidBa4ez3iPqMrFXSTve6y1xmVdGlv5qNMsCMCwFA6wfdlgruV
         72wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751314777; x=1751919577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eu9q9jAleEqjkU9aG17JxIXNZmKufj2Xt5hkop1caTI=;
        b=n7JGlvzzx1wylIgdmgnnGaa1pMJth5fTbAOQBj4RMiU9IY/6+GPO0OyHF4NxGYbhzt
         uqAJJo6TnzulFliwMiEyAap4IHVKTIi9I61J29nZqulTtgSfzANuGxYeg7dmu8qMQaNT
         5O16CztQ0ZxVmJ9jRHrpkbYQaUiATqCeUp09KbuPMFixK/w2/Nm2Toemzou8eqjnWgxl
         +pDGGGhBlKftY6AslDO/d3yo02tK3trDKOcTILQoOUqyq7ZedfCHWWfXqKbiL9Pac4IU
         bRsy943RDqSrCHa2l9f309bsXtRPpdhVaEqqvbvvYGQxzyKyNkr78U6YAy9s1Mqhg0yT
         m0nA==
X-Gm-Message-State: AOJu0Yz5IRg6ePQ+EuNQlzoN8vx44HyZPcVWXBOPG7L4kYD+cTx079Qj
	69Equz+2G28cLJ4p9V1vxIMQAnNq8wHO0eXF6j/dpbDYitobc6mxBFf8OYzMAOWJoc4kKtdYhgU
	dOLkK5C4=
X-Gm-Gg: ASbGncvW9fGizuM248cOfQQb7FCUyQX0cyUQovEN62D8YCGa1PMhlVcdv4dxrHSZoI1
	PpyJAsic1uYHEry3OwLn+SxsBPdy2qLI0xAE0z2lUBlai+FUT4vmGIPDr2QxGz5HcWnMKyDGadb
	rIC/jDse+gl7JEMQQRf+cpnegF2qrt0R244hmcdBvQEfS0G48sHd10uUcruKtiKLggWn4sc7YjI
	QpPX9EIfgaxHTrgT3m6rGV8ChKrKlEXmN8mXf0vCrbGl6ijH2XQGRkvGIGdJAfg/3SpIroKhfP2
	hvu3qIt8LbdyA4SdTFX88zqX4COkjmCodQsrOeFqtiijDZvMWUZEux1PetHayZbHcEGk
X-Google-Smtp-Source: AGHT+IGfd+10/nApbZFV5xZuXb4dmIe44Yr6HsWu75OW0OPr2Dw6kD5QOnngBD3NgRLZgzelP8RLNA==
X-Received: by 2002:a05:6830:b93:b0:72f:ff8b:e123 with SMTP id 46e09a7af769-73afc569535mr9555758a34.12.1751314776806;
        Mon, 30 Jun 2025 13:19:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0069f4sm1801371a34.19.2025.06.30.13.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 13:19:36 -0700 (PDT)
Date: Mon, 30 Jun 2025 23:19:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Kernel Janitors List <kernel-janitors@vger.kernel.org>,
	Lukas Bulwahn <lbulwahn@redhat.com>
Subject: Re: First pass at janitorial kernel cleanup scripts
Message-ID: <bc14c7e7-1188-4330-bc0b-cb0a60568cc1@suswa.mountain>
References: <8c4e5d62-7980-bd16-df17-caf76862d4f5@crashcourse.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c4e5d62-7980-bd16-df17-caf76862d4f5@crashcourse.ca>

On Mon, Jun 30, 2025 at 02:02:25PM -0400, Robert P. J. Day wrote:
> 
>   As promised, I have the first small number of kernel cleanup scripts
> that should inspire some obvious janitorial work:
> 
>   https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup
> 
> There will be more scripts coming, and a lot of them will address some
> rather obvious cleanup that relates to identifying leftover cruft that
> was overlooked when something was removed from the kernel -- things
> like:
> 
>   - are there things being #defined and never referenced?

Quite often people publish these deliberately.  They sort of function
as documentation.  At one company every time they expose anything
about the hardware interface it has to be approved by the legal dept
so they publish every single define that they can possibly think of
as early as possible so they don't have to go back and forth with
legal later on.

>   - are there things defined in Kconfig files that are never used,
>     or vice versa?

Lukas Bulwahn does a lot of this work already.  It will be interesting
to see if there is anything his scripts miss.

>   - are there header files that are never included anymore?

That's a good idea.

regards,
dan carpenter

