Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920572E7370
	for <kernel-janitors@vger.kernel.org>; Mon, 31 Aug 2026 06:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156295; cv=none; b=N7Szuib3l0P+BGjAvzc2OJ6jY+xaDMdYW1KxYYUJpgHzEaN9+Gm+XRo5FoSJyBHy5WW3j2NnvAKP9vG0veLkKJH2g6UI7o042QEZuAGYsW1Sf/SuT8ZQHqrlPwQlBQgeF2+jUYQgNo0MzQlSicoE3kc+ZEodeV/nmcU6CEPEj08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156295; c=relaxed/simple;
	bh=5cyvu/196NUJ+2V0psX9wZ9QOGyNYgCM/yD+0cVP05U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvGP7uTpQBjBjhdCV2riUZwght51U6TtOo0Nbmn6XG+/qJSlw5AswL3RKgTFtKMfPFSruMFGljAPQeNzo+sEXlkK91fIwefD68fhQndsHq/RjW6miS1Ry3L8jdrD9rZqNQX5rDlspyprxWJYxSeuH3mO3yHNvQS8a7a4ikA6WOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LXsqiBii; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LXsqiBii"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398b3d66515so1546642a91.0
        for <kernel-janitors@vger.kernel.org>; Sun, 30 Aug 2026 23:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788156294; x=1788761094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0PJ2y/FfJS/eSstN+8fj99mvu+UkmdEPeEPTUdQQoxo=;
        b=LXsqiBiisdP49HQeTm2gbM6aguyg860Y1iH+4pxr1vNtsYgocw+MTOZbinR7Fq9wxg
         hcuSsCwFTpNaVk+iXobSpUlwPi96FMpqrd8BLTmJ/kWfH47XK6O4rASIjcFdnkkO/xww
         UzQO7jU3TC6c2fw7TPKIFbx5PqJ1ZQxc96uWpSBYSz6E4JV6kxtk2Rynms/AUpR99Xa7
         NRa5wTcFef2me4bIUG/pa9QZKvqqHi4b7Xsbz1hwV2Jyrmh3QTLYPBo2IQuT2BKuHlQN
         2ac93bs+66AjNkRHsJg6ozEaajNlib6QZ58+g65XbnXFKOdapZOeLm85RI4Ntf+QVSMo
         ui5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788156294; x=1788761094;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PJ2y/FfJS/eSstN+8fj99mvu+UkmdEPeEPTUdQQoxo=;
        b=H3rc8jC8o6KXwYRhn3ScXaoAQCd2NM6naDJqthT7HqBvR8WfRjzLHPHQw/HXwf5A0k
         jT2LxVkXSvpyEAUB42efnxieMBfp9MC9O51opOs1YlCTVuxKl5ZKNrkXia3EC8jJz0iF
         /D5dFZpes7MpRRgB2l0NjMsd4Ovze5jSn8iGzI8FyZRYQQvv8I6e9YMEXyFmYtOa67zW
         tfVN7yGmWJaBP/UQJ1jS091WZkT0i6YFn00FoPPdFK8xzeP8HzDcMgG5ttF85B3KOBnP
         BwJzFCOGMENJ0a2rLdOqIdCF22wRDVkAPNwWwx1zzMOEqY1Ih+l5W4wV11Xw/ew+UfEu
         flTA==
X-Forwarded-Encrypted: i=1; AKwUvBzynF6Q9mdXcaKQiLf9a1RsD2hiDFfXt+f1CyzRL20HfR7gejWrhihOM6trrt65xlVBIq0LE6nwSVl8NTjHKUs=@vger.kernel.org
X-Gm-Message-State: AFuF++mKNjc5/WfneELkkfAYeYqticUbU0R3rdHwT+LFMGTGEo0Gn8cC
	D3S8/Z54eusbMNlCnMLKqkUoZPVzytSa0le25f4+PNO2gPBm5ujOthp2yIGtXPsjPLo=
X-Gm-Gg: AYBFou2apcaAHEZ7+uPNgGUdQEZuDo8uzgocDGXbclrtF6jDX4vGz08bDF/miqYMmPW
	Jt2d64wv/mdezNl54rBfd3Q2uUGVt+kIy1YfCpgfBDNzt4jCgOWxNyT34zXrGW7GQEonf/7ENo7
	bpbLNETWmUGNKYkGiLoueJH3T/ofUdFyTDTgGl9Wg1lP3ucX7+JUfc2XowoYKiwXNQ7bFF3r1tb
	bk7E6An2y3FBQ4lj/M4PrZ1O9ZDddIWEhtRNJvDBD60D7huDBtJNc3iEpk6AT7lPMUlOdTxqbop
	hG07amLdq7DplN4GeTHn91WH2cV6o1MU8lc4iCSW4d+ychrcr2NnM0usE32l/8PNYkJAILCYd0M
	bOq8gcFY/oNeyhnjbaP8dw0HxfWLxXxvH1zlxUk1K2r5S4ADME/KpiNOgirJqR6+ofKWII8BBUI
	i1D8KZfuoV4Z+W97yy89fz287FpHvz7xa8PypOCgGXqW2SwJxS45NmKBuQVnttXQg=
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr37395830a91.14.1788156293562;
        Sun, 30 Aug 2026 23:04:53 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm22805738c88.11.2026.08.30.23.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:04:52 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:34:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <rob.herring@calxeda.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eli Gurvitz <egurvitz@nvidia.com>
Subject: Re: [PATCH] OPP: of: Fix potential multiplication overflow when
 calculating freq
Message-ID: <apUZgrCjLxN-T031@vireshk-B250M-D3H>
References: <20260826131957.1063765-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826131957.1063765-1-colin.i.king@gmail.com>

On 26-08-26, 14:19, Colin Ian King wrote:
> The multiplication be32_to_cpup(val++) * 1000 is performed using 32 bit
> unsigned integers and hence uses a 32 bit multiplication; this will
> overflow if be32_to_cpup(val++) is greater than 4294967 (which is
> very unlikely at present). The result is assigned to an unsigned long
> (which is a 64 bit value on 64 bit systems), so fix this potential
> overflow by casting the first operand of the multiplication to
> an unsigned int.
> 
> Fixes: b496dfbc94ab ("PM / OPP: Initialize OPP table from device tree")
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/opp/of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
