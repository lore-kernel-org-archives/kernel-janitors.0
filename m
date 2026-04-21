Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD5B3D171A
	for <kernel-janitors@vger.kernel.org>; Tue, 21 Apr 2026 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776780687; cv=none; b=EzIdaIq2vkai3jj3qqEln5NYhH36ZBF6kqE2lXIkxoVW27OdU9Eu7q+av0IDlonOEbrVz1fM/dZ/9dAM7hZbEgowQbbK/prHfl3vSECgPMgAdM8iKEmRG+/kJghY81hXGLUijGuZEjLoV1gZf8VN77iG1EPN8Cu7m6VB4Oou0nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776780687; c=relaxed/simple;
	bh=oWhBQi0dVg9q9iWH6aPKcW6xEEJauwkpkT98oz1lMCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYs691B4UauEbMcJnc1WtJQue4yh0LobCUzK1hdir/llaxbaJCj5pGEBrraNsqKTcVydvREOEW4plMQ6ohyXaobL+U7xnsGDKBntT3nloDBOMcjqWWs7YIFHXPjE6anfPaIX+ZprBLt5AgCkHb1EURLXlovuhTCguIgap+F0s7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHuu3LiF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHuu3LiF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso58466115e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Apr 2026 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776780684; x=1777385484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7etYbCYxuIPhBEjwc0o2zhfDIbslFF/VqaAfxZBW2j4=;
        b=UHuu3LiFI0FrqSl2o8AdH9+Wbs1im8ccwRBe/3edDzcIKSujUKE+5uJ7ts2Qwwb1wj
         Fx1chwJNONn2A9XLzO/nt3m5p/V2/j/cvwSiSp9UKg7vEN7wWssTmHhvQeN4L8dyEJqO
         kQHN00Ycofkva8MsT4qTrjLz1S1k3vo5plR+7ZrsbRfOP/eie3KEbBgTbD1ucg6nfhI3
         f9XvbuWrAnjsmRTLkJ66/vPk6EC27ng8sU8kUmKCeY6dCQujBy732enaS9xtp2FORRrS
         MXKptB7KbVdogeoofCU50bHYoO1TTmyyQVANyYXZpdoBgj06Gq47lHjosz8YsCLD9gnH
         dGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776780684; x=1777385484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7etYbCYxuIPhBEjwc0o2zhfDIbslFF/VqaAfxZBW2j4=;
        b=JACk/j93kPqE/xH2sQ6AM2aCkNdEFzb3KaoOno0p9VhoP+ozojJGcE7pRZgsRMm8L4
         cGBJ5n0O4wJCYgks1DDaWZYjxjrwiyzQzxN8C6hHKve/v1GJsAtd0Ikj1TisLgDR1mtT
         3RpxC+Xqsy+HNfVKIyi9vgtDHFHSmdk0xgKI/XJQOhJO+dA3zEDT7VbDRi/mk0+bACu7
         ODSMSyrHJD4WNEB4Ar14mfr9CwDmhSWpM5HA7HqYSbuqnWzMeogtSp5fb/4cnAsEw+v+
         2/3nIEBGgsCPGYIjsnV+9fZ6iC2HMWv3gHRMDrw3PZjF44PTOI0pHjnEXu5eJu4ZoD/w
         Sa7w==
X-Forwarded-Encrypted: i=1; AFNElJ9EDW9OeCfYyJt2Pagb06mU3mpm+D2E07XDSqPQeX2W0JMcnwPpLliOQVPApHGEJcXzNN4YjVattCYFYU42uxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7tRjX5I86dvG0t92faSa+5E0ZHfohnra6o4uEaI0cWrs8U4fJ
	bkrWk1eYxUtThfG0NL4mfbAqjtMkFP+V2D9MC6igG5vSG7p2PP9g2x50
X-Gm-Gg: AeBDieuNm2J2MF80cKjUvBLFS0BaNm2+h7z266w9NqwssUjBGPzI2UthawMG8Kwm203
	t3srALlnmSb0A8YnFzguvUP2OD9caRsUVmUGZUg1saA4F0hLmYd8si/LT5dkI28cYZHa+Z2YQFv
	cQfea1C87PqjzwAn7tq5s8P8/LL8wKKyk7glCvLUaWZRh55puZSXZPpcKPyFsbyV3n4LGjV3GpU
	WpzFV+0o71XG1Hik9qvpQuGd4eJAC64n8vE5Y+fkNaYH//0F/jsreYCydK0QwgS29TkjRoHZxaT
	mpC8XctBVj7Q4eucHQj7mQWaZf8Vpx7M+7G5YCmu0RvRj2DbW6xrQQF/3doJ1jkgZK0/cJ8VAzQ
	yC4Dd4t9euh3fTIT4En8WwzS/kpq1bI8d8lrNo57gaTkwZ4TUbwA/GkZqtoP/OidPK/ArIWWuyc
	rzcU/QtJpKPgQtKx6M/HAEZtbbNu6o5A==
X-Received: by 2002:a05:600c:4e4f:b0:488:a2ac:a34c with SMTP id 5b1f17b1804b1-488fb7433ddmr262988925e9.12.1776780683861;
        Tue, 21 Apr 2026 07:11:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb767961sm112173145e9.16.2026.04.21.07.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:11:22 -0700 (PDT)
Date: Tue, 21 Apr 2026 17:11:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, przemyslaw.kitszel@intel.com,
	anthony.l.nguyen@intel.com, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] net/intel: Replace manual array size calculation with
 ARRAY_SIZE
Message-ID: <aeeFh1zQqhVysvxI@stanley.mountain>
References: <CGME20260421114034eucas1p1d746ffe32b49aeb57f10e729d1331124@eucas1p1.samsung.com>
 <20260421114029.2689961-1-j.raczynski@samsung.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421114029.2689961-1-j.raczynski@samsung.com>

On Tue, Apr 21, 2026 at 01:40:29PM +0200, Jakub Raczynski wrote:
> There are still places in the code where manual calculation of array size
> exist, but it is good to enforce usage of single macro through the whole
> code as it makes code bit more readable.
> 
> Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
> ---
>  drivers/net/ethernet/intel/i40e/i40e_adminq.h | 2 +-
>  drivers/net/ethernet/intel/iavf/iavf_adminq.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/i40e/i40e_adminq.h b/drivers/net/ethernet/intel/i40e/i40e_adminq.h
> index 1be97a3a86ce..0e7cecd00169 100644
> --- a/drivers/net/ethernet/intel/i40e/i40e_adminq.h
> +++ b/drivers/net/ethernet/intel/i40e/i40e_adminq.h
> @@ -109,7 +109,7 @@ static inline int i40e_aq_rc_to_posix(int aq_ret, int aq_rc)
>  		-EFBIG,      /* I40E_AQ_RC_EFBIG */
>  	};
>  
> -	if (!((u32)aq_rc < (sizeof(aq_to_posix) / sizeof((aq_to_posix)[0]))))
> +	if (!((u32)aq_rc < ARRAY_SIZE(aq_to_posix)))

This still isn't beautiful.  There are so many parens.  The !(foo < size)
formulation is weird.  The cast is unnnecessary.  Better to write it as:

	if (aq_rc >= ARRAY_SIZE(aq_to_posix))
		return -ERANGE;

>  		return -ERANGE;
>  
>  	return aq_to_posix[aq_rc];

regards,
dan carpenter
