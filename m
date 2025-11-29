Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B510227144E
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424012; cv=none; b=oJow9zl7x/8dE68AkKCHNc0pXwdOB02KEeDrE1b6ffYIRxqoDHiAj7VFVZshWdsfHBZOkXDLG8hiOs0ceyYv/P41zpaZOjTT1HhP7kUGdEK00BgrRv6yvNPcjGrRCMdNRZyIGRyBM3n9eoPw260rFDyjBo85udU2626BuyOx47c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424012; c=relaxed/simple;
	bh=VSsMkG9UYEpqdmWleMYeETEBraLCrRYnJUjtmcHK1bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uCG7M1wIGyMdJVi9d2+NlN2kuVXdknTfNo+QOudvmkco/jK/1OvrE3sbnkOobtI9/sqfR/APU2tKPJmc4UEHygQjN6N+pquzXd4fMqdG0Ye8LOuEtiuSuelQ/y+5lsXFFg2DV9+l+h7rR2vhoi7qg9/advQIALxg8X43VW6qkrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiZMWO0u; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiZMWO0u"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7277324054so411607666b.0
        for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 05:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764424008; x=1765028808; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VSsMkG9UYEpqdmWleMYeETEBraLCrRYnJUjtmcHK1bk=;
        b=DiZMWO0u1141yLbmIozWA/lB4opMj8YJ3BbKlsaoDhSVSrFnVJ35WCx7U3JjFge4hM
         vxvuXIdPK9hMv1EJnDdFOQXbPXXqQFWCDnrJwbsDJ/ByQjJZmBenjSxNad9NwMZACthP
         w6pvEnCl/CrwfkQO7B80+w2WxzqCisjwMuu8Bf+Yqv2woyi/VeYPsn2uln/WPPULeqA4
         0yhYrbQnFma5mxT2akyDl5j++mZq/sV8tckkiGbCD84nRNmVG/afO5bUqM8zUXCHeikK
         e1GEyrm9AFagcIr76PGsK2eoXsnBXhMUmpFOMm243D6K2qRFsl/qW3oO44q+I+A4f33Y
         kX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424008; x=1765028808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSsMkG9UYEpqdmWleMYeETEBraLCrRYnJUjtmcHK1bk=;
        b=Dv+jQrAhMgOHpklU+nkFMXy5YCN6RYRk1bRnEU7xSqgZwbg+P6lDBQuleKJE3Lvu8V
         z8cesB/h05VsLqZjJWGRsr99MOvZPqJeFgQNa8pR4nHjDvt47IoGHRM5aiNp5qJD7x7/
         BB4ort8lz87aJ8jO5XWOOFg5+GVtzIK0m95J6nNuqbeCzNSnMZ6r8BA1G0w15/pgfuDA
         D8/kam/7HQ9PjkDUnITHlCNBWU8jAWN7LSYzUy1gn5PANRr0H5htWbk648gWibIqrujJ
         DsbTIn2Jpqhj2FwbuKqALJq+b5JN0J1mRYVFs2TEI4fVm+Z/syK6SjCPHiiTSykoHA17
         ELsg==
X-Forwarded-Encrypted: i=1; AJvYcCW+VuDsUDb4BQOLtwGi7Ex7jcy4w9V+XqkgfqTlqGvv6wDMV5wPihgluHbCpToiH+24oLuSbm741vi45Oqx1nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCFVW22P6Ae23ftXMYvtdnI0oE5F61LQsuzxn+33eQoBtLFTf1
	bTyerrsM0dVgIpKSmR5Cbqx3zf2KXwtmnvHwgUyynsIHqjtjydEQUpSG3HQZNV5NyyCq40mdTns
	suHjeyRuPg0R99HjUB3rJ0f7WNk7/HR9Dbw==
X-Gm-Gg: ASbGncsa37d/pw9hETSKbLY7nKhVvC+tF2mNtAHyTsXctU/KewiyZsx25NqJQKCGBuS
	Y8Ncr009fCvMfdufuiwl8uJ/JeJwLJ5r6uX7BgBNmRApwWDpJA5aIIKdiaBQXE9z9RwTY3qqTk3
	TehgBeEt483nnaTc5KBumS5PKvuB3vu4tQHXQ2wAHglrPPZSCpuTlboG1IVtOHCGJy3olUM81dS
	YLpRBP+MwyLPXUpNR1FNF+eY62Fh5sAC984KT+c+Dnn3PumaLB5T1oglKDblHTYx4VcX4FO
X-Google-Smtp-Source: AGHT+IFQzotMKnKF6S5xOQGEVLPx+z06hUAWeouedMM80Lhw1e8Oe0nJp7dPP+ppJ5y1fLzg8zL27RS7ZXjtE7Z5vnU=
X-Received: by 2002:a17:906:478a:b0:b73:42df:29a with SMTP id
 a640c23a62f3a-b76719ec80fmr3319982466b.59.1764424008043; Sat, 29 Nov 2025
 05:46:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1605dd43-5e95-46eb-a0c6-78ff8b4d51b3@web.de>
In-Reply-To: <1605dd43-5e95-46eb-a0c6-78ff8b4d51b3@web.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 29 Nov 2025 14:46:36 +0100
X-Gm-Features: AWmQ_blLVCEqWLZoU6eFtO2PZjCzcgNR2IRrusHQCtc7tE9S42G7VcDZ-VTUPug
Message-ID: <CA+=Fv5RDbA-=WFf1bdekhheZfYScbu8J1Eud-sEgTqUGnk00qg@mail.gmail.com>
Subject: Re: [PATCH] alpha: Use pointers from memcpy() calls for assignments
 in two functions
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-alpha@vger.kernel.org, Chen Gang <gang.chen@asianux.com>, 
	Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

I noticed that the kernel test bot complained about some build issues,
are you planning on putting out a v2 of this patch?

Regards

Magnus
