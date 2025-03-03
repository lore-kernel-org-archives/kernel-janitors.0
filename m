Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7C1EB1B5
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Mar 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990274; cv=none; b=OGZmR8o2kEWcE61O/GOJURSncE0hpmmrcjAvNIaOG4q2cHypBvLsrnxNK6SN1TDLPEcTn3TmkqSgSbUwTr+HsxtPMuKsvVIlhU0oSfYmuuBtp9pU82/Y7E3unypzbLz4dL87AccmW9gAHFoGhsi76owUeCK1wQi8tzOxt+kIRCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990274; c=relaxed/simple;
	bh=hSBIYLscn2H9J+MqRxZlM/7jQNfEuoPNFDdWWYwe6ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEXOBSOV3AFkmiDbEOsb6kkT8Ll1QJ+DZuY+1VGKKgIP7tf+Q0IUuPU52qH0QYtV8sg5BZpWZg/a+WN5rqzVyI4UxxW59FXxvW6LQSvI/hE8uaFFAwZtLqXFKzjUlqQ9/Sv+zO68KTfD1Mig5J/dluDQGJU1MYBo3YJ1kpOCgTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQ1W/RQ5; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQ1W/RQ5"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e538388dd1so1262322a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 00:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740990270; x=1741595070; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RaZ/CcmeFoBTR8ddNDuQVJv3AT8EACnAOxQQ2V8mS5A=;
        b=ZQ1W/RQ5pKHe6TuSfXOOT8Y1/PkFTG7ziIuqCfIBuPCyOp5tNnH1ufGf9RtfhRcTGh
         1M76XPwwFhZLx3vuuIWLTXaC0F+nLB4dwcXcIwomg6E9VBPNJdyKw251zXFlkxJOIK0g
         aSzJrZlR7Eanw6I82ZLVXkksb3VXsx8SCU30MNrIJMrV9chLYs3a2wzboY5gTtRsZBTy
         iqxnfXUG89mZwhF9E0Q8mPMSA2CdkWuM5nK67He+MWYzkm47y2wGu28LBrnKFi73Wrlz
         OMXrXhBsJHaIjUsvI08nypKwfYvs0Ze0r676YLdW/ELE8/11cd/B4x8WI1swGZOFjZMV
         ndgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990270; x=1741595070;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaZ/CcmeFoBTR8ddNDuQVJv3AT8EACnAOxQQ2V8mS5A=;
        b=AAP9FLK65N+CII+1aC7REb0VKV/TqzBQzehkff8IUh3Crdg/4EYN8ZzrGLg4cC92uu
         KeKNRIGzMFyIGrGRN/K3Kyd8BBBmRV4XvwMbymHw7eXKYwhoUS+FgpKi9cmUAIDThNFR
         DvfLp0X+TtVPGnkg4SxfeFa5d0feSd09tYUr43Ud6JWQCyCkWyVAbiosGbU5MTVpryY3
         34VYuWT5Kiht10sSdMSMy7oF5ScWbkaqgAn/9X1G5fr7+TBi7KU17u1Eb/s1B9w5IGAe
         +9gnJDGki40xorykpCzX+MZgwE7lZecLGNE3YATGX+Kna61peiZM+83/uvcdELkBjZUp
         JrvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc+ujketbNPmyF+ovxJSbcka0328rjDCEV86+UMzUe3F2Iq0zutOCgosJP07XpmHfeM7sTOP/8roceJsechb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9HKBuVWoNzkZgMQqpF6drbsXgvEF55OuridIq9Osof3hD/DYb
	jXbaDftd2ScsywGwjXseeEkHO/i/U5nTJKF1dULBiNFNHquv02shCN1KEbmCAbY=
X-Gm-Gg: ASbGncur7Z9aIybdKnwacchDHQ6HFftUdjU7XJ70gBTA0yhjagmuiKxf73+L/RCa0mM
	nfC4V0N1+varv6DDgbMH4qDo6xXimEEROiMu4TrbiXJwFLgaKUsdQBqm4zpHAcJctDA1qMcHD78
	rnxTXISD5LmKlxg0GLrqi41BwUcgTaDpuBdkx0HqxHU0cctHUURx1JQxp6X7/LrgpFXmEdkyAxZ
	p3ZyIpVYtF5H+FWst0EXeFoiiSqaspyhpQFfyA0fPnVRQcQbMefqFL8geVnK1dJNGGLb/SozNvN
	IqwLiBxmuE/ylbdW3l2sYlZ/+Sm7fnLCN1MUPO10MOqMbetb0A==
X-Google-Smtp-Source: AGHT+IFy4o0lL4wbVfv25BbUZiZprY5pePIQkrVcMtYcd0n6ALHYFSnKECFQ/9k22YMwYBQpC08ZKg==
X-Received: by 2002:a17:907:6d0c:b0:ac1:791c:1526 with SMTP id a640c23a62f3a-ac1791c1cd3mr169820066b.56.1740990270586;
        Mon, 03 Mar 2025 00:24:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf3f3bbfb3sm525674166b.77.2025.03.03.00.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:24:30 -0800 (PST)
Date: Mon, 3 Mar 2025 11:24:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Archit Taneja <architt@codeaurora.org>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
	cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND] drm/msm/dpu: Delete a variable initialisation before a
 null pointer check in two functions
Message-ID: <ce9599fb-a798-4f22-b51a-3341e690f8bc@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>

On Mon, Mar 03, 2025 at 09:15:14AM +0100, Markus Elfring wrote:
> >>> The address of a data structure member was determined before
> >>> a corresponding null pointer check in the implementation of
> >>> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> >>>
> >>> Thus avoid the risk for undefined behaviour by removing extra
> >>> initialisations for the variable “c” (also because it was already
> >>> reassigned with the same value behind this pointer check).
> >
> > There is no undefined behavior here.
> Will any software development concerns evolve further also according to
> undesirable null pointer dereferences?
> https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+null+pointers
> 

It's not a NULL pointer dereference.  It's just pointer math.  It was
a common way to implement offsetof() before we had a builtin for that.

samples/bpf/test_lru_dist.c
# define offsetof(TYPE, MEMBER) ((size_t)&((TYPE *)0)->MEMBER)

regards,
dan carpenter
