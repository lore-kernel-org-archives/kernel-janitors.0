Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3952C2E06CD
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 18:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876861; cv=none; b=gnoi667LhqJ4rObMGQaL5aDi7cNuulzhhECkJoHkn3jlD8U3i48AIlJCzgIDpyUxwUzoBMX7wzJ+yrvTdANRPVAciebPo8yPTHqkB28AOpn08HC3F2UFa5O96c9FjN/wh+P0fLKq7w+iXdbY781pJmv9yUs0QKFY4D6msbUht5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876861; c=relaxed/simple;
	bh=N1GrLsO5rn46Kd+qcM63O/s4L2k9YjjCFe0dE2dULaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5gHYc0KBlQUrVWhb7t9Za/FxEYSy/Drn1ZH2hpSLrsgjK57FgxS/4y1dIPSzrbL3b0oa4EXPwPPBXyd83UIIRvxdyJpEnZrQlbJ01u1LoJwrpjJNq0+Yo1zeFvlooBgK2PTnvFbGyKjO9jRFU/35gN9WRLB8DvsPUlO4iXpLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+vlhtDq; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+vlhtDq"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60ef07eb7f4so105313eaf.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 11:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750876859; x=1751481659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kb/xkqJYQLzIZ67OSg3QEbtD8orcI+NoBMOMxQAdNnU=;
        b=h+vlhtDqwBMBdZ3GGagXoA12jRQPy5RmdQZ9h/wCF5TPLzd+CB3ucvNtVQhE1fzsx2
         psTfFcQolc1oYKpqof5UfBznbCvjDfDH1l/0YzMeDr6x0JiJhmF9tTxApa0Eprl5C8XC
         74l7BIpdjxsf5ro1TGlZWq+8VXgrcVQqusnDX+jbwry3+MUGhtL+NPOxj9JONmpodWrZ
         b7CBxNTZZDlD4hpTvOQSMRYwAsbrjJVYrQebp+bdVICAN555le4ZlZQRJbk9ULGkABX4
         /yxZeCm/BQkCxAKIdYrmAKv4i4xQMllQIJxeuvuMyAjhy1hmyXUOAF6vQF2CKzfv/Eq+
         hkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750876859; x=1751481659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kb/xkqJYQLzIZ67OSg3QEbtD8orcI+NoBMOMxQAdNnU=;
        b=h7bF6oHiQwP58EQrvN/ZehrhX0+TYryiL80/LFH5Lq5If36dnVOEm1+0nLK8rX7J27
         d2Io9TI0ve1UpL2rdGTJ27VKpB8Zw+Jaf4Zhmr+IQPgHosEbcepUD4HikggyxlUBEwgU
         XgzGE5H6R+ut84iPNH+tiqnw2IZ0arcmgp4lGADyLaGaDsVybCQR56ySMmWVhrv/PHrA
         2DqUGlIYbwBJ3VRmz67AmEBVzCtquwof30KwrGUlJFHfLq6FAtrwzQo1h3Qs7QFEoWJX
         9qvBEho60sMQymG4Xbf5PMhzDCqo4s3qZTp61kAjtPL9MfqkrLZ7oTjzBP9pVkz8L8XQ
         KdaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuvQK7x7riGBRB/3J9fVMlcB+jZfxJCmmf/tAl4ZxtmIwtqK+SF5K5G6xFjv/8q5ym4RuNrPhZrTJm8TElubw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/14ap7OyAsV1JPXo8FWPw/kFe3/LwjwV294ZFjM57oBUSSgct
	wS5LuK7e6SrXS41oXzK5Kn3+gp4wbtlAuH3UFY8WYzLwuRGMoVMNejygUpdSPhkgc0E=
X-Gm-Gg: ASbGncusLr2va2FBal4apj74xmGyqR0aiD9XZrAXp4IMZ4SLReHoQZGWFvGUklcbbsG
	kDtY/hpt59L20Y0+3nHacVFxuR0t9zCgZ97vRHnyJ49Bc1+6axN+sVCNS3jLRR0t42qe4t9Fe2e
	rB4IGZ5bfefVrR8mplLlmPLBOjkpBY4mZUmBeBnRSZ45nFAg3U54i0OYbJpyxFZ7TfdGjMSx9S4
	gMvaMeVVRwt0p0WxNsjBL/wqcZLjXgA7txCke2+C5pjXxPmVWHeuqlbIB10DApbnyk3lBr//Rkt
	/jQRJv72bHY5t/BSGoX3wg88DFYLx9a6Z4oB3IqgKYJrFDAbaaIkgTfPhebh0kR7hCpBMrxnHTl
	sHA==
X-Google-Smtp-Source: AGHT+IG+FodkH8YjDqJZ084eAzz89kwRqhC0U0FmJInHRKqb6H43Svn4QKtYMZJI20MCcSldmzryog==
X-Received: by 2002:a05:6871:e488:b0:296:a67c:d239 with SMTP id 586e51a60fabf-2efb21af511mr3039710fac.12.1750876859338;
        Wed, 25 Jun 2025 11:40:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee66559db2sm2665582fac.11.2025.06.25.11.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:40:58 -0700 (PDT)
Date: Wed, 25 Jun 2025 21:40:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Zaid Alali <zaidal@os.amperecomputing.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Borislav Petkov <bp@alien8.de>, "Weiny, Ira" <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2 next] ACPI: APEI: EINJ: prevent memory corruption in
 error_type_set()
Message-ID: <be2b886f-4de7-46b5-9cc6-cc5299b1af02@suswa.mountain>
References: <c71e7ba6-f127-4f49-acbf-20063dd26553@sabinyo.mountain>
 <ks34mfmv2vhwojpxlzv7tyordcjdo6zclcflplvs2wsl6gkbn5@3v5kguelmita>
 <757b5117-a865-4d31-b566-248048f87b29@suswa.mountain>
 <SJ1PR11MB6083603821632C25DA5D8EEBFC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083603821632C25DA5D8EEBFC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Wed, Jun 25, 2025 at 06:22:57PM +0000, Luck, Tony wrote:
> > > +	if (count > sizeof(einj_buf))
> 
> Why not:
> 	/* Leave the last character for the NUL terminator */
> 	if (count > sizeof(einj_buf) - 1)
> 		return -EINVAL;
> 
> here. Then skip the min(...) addition below.

Yeah.  You're right.  That's a better fix.

regards,
dan carpenter

