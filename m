Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E9B1F5850
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Mar 2025 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164726; cv=none; b=B7I0wZiFrJ6CDBXD+CzTr1FnpmzJdvDWyQdpSvWuLid+BPDHuKO/N5m9H+ehV6/RE5aYkXZ8ILiipEBpt31Q40exzpWBfLF/H70SALCvULj82J0xrQz8OxErX9YqvL/fsyfvH/BZbOqZJ7cTVcNhrX+NcbuJLhF1ZDT5lfFqSEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164726; c=relaxed/simple;
	bh=O0QRoKZcDQVvvwhI9GzXiPZKl6x9HLIATyWqGNzkV8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XV+qL3BIw3YJ42S8UTZYrgsTYA+uyrZEACQGE/QwNRUkDwgUqOh/VvuAXy99h/TmVFrBAdJIdusI9II8tgT/dh9nSxmk6SmG+g9lvLJ2nMd9vqAUD9r8YDxRcZ38m6yBQwe8Tt5j3FKR6v/JWSWJ4VKFDuZ8FxaQvJdXrdmXrWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJz61KAk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJz61KAk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bccfa7b89so11891825e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Mar 2025 00:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741164723; x=1741769523; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZC/qen37fd4vBSgLI91hwOumJ/Sl+TjsYB6y5Vr5M7A=;
        b=fJz61KAk5QIfT3g1TNA8cOON4DTmwuPinelHzOFbOxLyLgYwZpce6FgeFI0kPu96pM
         Tr1Bp6PAbemGQwbsuuNnwZCFVOgC9jt7r5/8+0C4UaeMiC8ggcZa0rBiIlgNSLWmenPt
         SxPTIaR0BapUUEPHUawxQ8ilxodTcHYXMdYTcu5dHMt7nXXvCsq2zh16CGk461XFo93E
         S9cuVAgCRs9I00uN6pOcMeSN4SW6OjC10c9aHLEIgiVFjX0SHcRqK13Dgvhuu86MQSeu
         vhLZwjtyx0glU7AL13xGJe3C6v1/gFz4Zi8MwK4gKMCOloI34AO9jv7wg4UtnAzQYsSd
         Vgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164723; x=1741769523;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC/qen37fd4vBSgLI91hwOumJ/Sl+TjsYB6y5Vr5M7A=;
        b=Le0M01wLptAlM+boAoa6qBERSrULnC/th3UZ0GxzUS3OAhYLWhxXyeHIQdILx7KMsC
         KSjKlca65EufzBC3wYEnX5jNiq3FnPNN7bDS9pDI/IXhr8fRBJdtGjbTCh+EhSB4CqzH
         LSdpByR0MT2LGMt+2D/a6LfWrafzaoEYefprPC6KJ+SQj9bJnrp6ILazPlj3w9mZ9Pgs
         rNHW4RZ0pzPE0fkrjH4Eggjpru3kIfTWaAdwlHLO7SjFuy2NvZKm5J2WziTco/KNmbhn
         2IbcGY3O3jIrL+UzU3LRx6GsnBIdHjNpM7GiVBzwPxGciniQalMIzE8DY0CbuLxsQdvC
         /s8g==
X-Forwarded-Encrypted: i=1; AJvYcCV57HqhcRKgLO9BuPk90rseempfKYWkljWzyOt29FT7eTD0Wk/7SU7mhK2pZStQS3gtx7qomemSzim7WqVWRac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8+4dN3ZRaqGyMUtjDD0qPzJrLrcfUNzNkuVQzjnUq+OWHNvmn
	hTkJpy5gLI+EN7EPfhU7ZoA9SPHVc28tTZF7ZGZHWNhwj/Zh/TYyfT8dQaNuFbQ=
X-Gm-Gg: ASbGncsa2VwQanm6cNyy8S8wvE9JgGZyVeD9bWxwhQf6sxCIKqFisML0JDhxYA6GUq4
	6J4Y3llKZgz2zXl2M6Zvc82+TEAZLPc+huXLlzWbf7Z7+shaNV3X//b9ads4KFEZIuGaL93Pd15
	FmtLIlTa5WQ7gh5PgwKk8o9unrVU94+Vr+dtwNVlIuADvBMz38eerpqsK/GyfnKj62AutGM8K+N
	GjgG1jDlpJDiXXHe4evVLN0Q+wB1g94JVnyK5r6shLneIA8vCn5+czUWkVp2Pu5WtLUfLB94hgQ
	LPjMmc8/hQDElPHB7ydUoUjcm+RfvmddsDVtQjhmoP8oIAz8uw==
X-Google-Smtp-Source: AGHT+IEnll5wrK+ucj99FN5wPB9IJR42RFtfAed9YIQq8iwKwZ5zCrl027CguxNQpWhglI/cbwh/2Q==
X-Received: by 2002:a05:600c:548c:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-43bd28a3847mr16238155e9.0.1741164722999;
        Wed, 05 Mar 2025 00:52:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e485d8e4sm19946896f8f.85.2025.03.05.00.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:52:02 -0800 (PST)
Date: Wed, 5 Mar 2025 11:51:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Archit Taneja <architt@codeaurora.org>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
	cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Clarification for =?utf-8?B?4oCc?=
 =?utf-8?Q?undefined_behaviour=E2=80=9D=3F?=
Message-ID: <4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e665514b-5a62-4afb-b267-7c320e4872af@web.de>

On Wed, Mar 05, 2025 at 09:40:43AM +0100, Markus Elfring wrote:
> >>> The address of a data structure member was determined before
> >>> a corresponding null pointer check in the implementation of
> >>> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> >>>
> >>> Thus avoid the risk for undefined behaviour by removing extra
> >>> initialisations for the variable “c” (also because it was already
> >>> reassigned with the same value behind this pointer check).
> > There is no undefined behavior here.
> 
> Is there a need to improve the wording precision?
> 
> There are words which denote a special meaning according to aspects of
> the programming language “C”.
> https://en.cppreference.com/w/c/language/behavior
> 
> Dereferences of null pointers are treated in special ways.

This not a dereference.  It's just pointer math.

regards,
dan carpenter

