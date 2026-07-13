Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28743396572
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Jul 2026 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929403; cv=none; b=YzZsHQx0NsWbZNAkbE88lRKY5P4MmLcwgi1S1aXmOChxS9UbdANnTGkPL7WTiWxq/8Wmvg+fQxyS/Y/HwAvkOZjMxKitTfbB2aI2IMAZA8cUAaNptBa8V6icTrhar4tJ/Euat/GtOTRZcbv0tUknS8awUWJg8vixskxRECLcfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929403; c=relaxed/simple;
	bh=aL01UCz5oQh/DomQ8SNmfwxRa+JNQ30Xd1UyAslLPSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOgD5I70eL2xivfmYema2ZxFIx3XXe+Bl/zlEiwArLejunhVRoAmPeMl4Q14qU3eNEkq9oCAeCqZizfa066Sm6a55FWZQb1rsdeayEB6iNWPo3M8Yau/WQHjTnGqo3ju2U+nl/heIh3wG/1xDcLHNjvua9CVqAaxxi3qYTKVSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkfhlj//; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkfhlj//"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-45133d2974fso1587971fac.1
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Jul 2026 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783929401; x=1784534201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0vsxLxBBBbTIPap5RklVXU/DWovFUXWDEGWzYh+JAg=;
        b=rkfhlj//bq8xeZLTAfDB4hi63m6A6b25LrvI3ntebpF08NUAcoej8os5A0wttRhkGZ
         klv8rwwOuon9OQP08oaHw2mRgl10kEBe045PvtfCRm9DpdRXnIBIBpQTEcrr2RjWGVWX
         TTNEV2Iu7vv3kWnPpJQ9EI3lRRilY+ARQv5VUbnYM5nNVh8sb8ccs6k6kyQw1xVLocZi
         Lb0FfP3v0zDQnPyMs26d/fItBkIFJordkrPTxnW+4jtelLGvglVmEHEHfJTvaH3WQChe
         /bPoRYriCDd+TW6m6++TJ3nPyA/FkEWWEU9aln8FFAWN2bJOJzu6RhOV9mC9+NNSwArT
         5WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929401; x=1784534201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0vsxLxBBBbTIPap5RklVXU/DWovFUXWDEGWzYh+JAg=;
        b=EZhzFoxLqZYVF8kDJUsAxRsYt/ua/O9NGAQFxQXgNfIEJy07n1QAYdDXUpaTKJX5DW
         bACsSzhOzncNpnaK+kQGuwV7v7cwtn0AATGHvWjupXQO0/nAY1uvsZN6m7gllihwwwqA
         8EFaM9tTb3lxRpUZBb6Bau0KMIbxsaWKmrc3c2VI4iuxNz8vH4li4hosQ3vloW3m/HEd
         QtlUW4quiX/HQkq1qY8l7d0+2Trn5cw7e3STiXPBngg3D4b+/iGKcD05yDrzi5p/1HtQ
         rIBynGU19WrKEZs3q6g1QMoiFeMQ4gRpN3pUIsjw14i0g/0Ab/YayP4lgH7PcAEX6av0
         CL+A==
X-Forwarded-Encrypted: i=1; AFNElJ+PnphHGMbHNz3Z13/AZnWrZuNq3rSYvJqxLANcsoMD/0x78LUHqtEZJnxfrPVAN9FP1Szm1yRrK7ZDXZ/C7oc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7zbf3WAg46uF/vrR4sF7vl58o28ji7vCOetcptZRgaSdMsMhy
	E7c60iyylCQ+7oflXy/ObPAyW38G2aDr5rfqP+HoJnpDUj580h7u0Dng
X-Gm-Gg: AfdE7cl7nYymEqRinf4fOCKdlHrRVIYMjYLkmUMoFfeYsY8wW7gEa7k2k7DUEsUpcMk
	cKjECh0qmgYURT0TvNLEuZMcpT+20CLISOR6pAv8C93DUTGiFfdNmkrjZGEfF1M/3Ty8rZAGhhZ
	hESkj/yElonnO+cVY0Eu19fOevWZ2ZN9FVDxhpvrQYgvWqhaNSBp5UZYGR96xiiOn/f35muStgw
	mOCKRcWFQTL2Ex8QTJ9Wu7SBUq4Qtm7/6Taf1mvscZVMu5kUDt1WUsD4nI5oDEPaCxs4I4mCD3w
	kNxayg8dLfhEZJg67nPVVu4lRnW9hABB6IvqQuIULYiCxDWGJwIAcG3tySrTXe8iKQt+s3HVjfD
	4bKtAJ2un2SZ/A32pUcxQEGoAua0hKea1OUgrPR8M92+0/F6ogFYvBkQ4BY1huPrfqJgFgVeNuA
	a8yeQ3
X-Received: by 2002:a05:6871:780b:b0:44a:e523:aff2 with SMTP id 586e51a60fabf-451f12a69a9mr4363394fac.23.1783929401136;
        Mon, 13 Jul 2026 00:56:41 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451a7c8fe33sm11393098fac.0.2026.07.13.00.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:56:38 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:56:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Deepak Sikri <deepak.sikri@st.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Fix an IS_ERR() vs NULL bug in
 spear1340_set_cpu_rate()
Message-ID: <alSaMG3ZNOFJz08F@stanley.mountain>
References: <alFJNUllC3JOKv6z@stanley.mountain>
 <c0800c49-3435-4e89-87b2-21dfa20ae58b@oss.qualcomm.com>
 <sejbfcic3gey5p4uxgituyizdttimxhlrl4kwer27b4g7j5i6o@yvjnioeplypl>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sejbfcic3gey5p4uxgituyizdttimxhlrl4kwer27b4g7j5i6o@yvjnioeplypl>

On Mon, Jul 13, 2026 at 09:31:12AM +0530, Viresh Kumar wrote:
> On 12-07-26, 21:30, Zhongqiu Han wrote:
> > On 7/11/2026 3:34 AM, Dan Carpenter wrote:
> > > The clk_get_parent() function doesn't return error pointers, it returns
> > > NULL on error.  Update the error checking to match.
> 
> origin/master:include/linux/clk.h
> 
> /**
>  * clk_get_parent - get the parent clock source for this clock
>  * @clk: clock source
>  *
>  * Returns struct clk corresponding to parent clock source, or
>  * valid IS_ERR() condition containing errno.
>  */
> struct clk *clk_get_parent(struct clk *clk);
> 
> I think this is the source of the confusion.
> 

I'll send a separate patch to update that documentation.

regards,
dan carpenter

