Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8654D8CE;
	Sat,  7 Feb 2026 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770468324; cv=none; b=TxdyvxCuNoJHF9GissoxxSPqFCCVqIIprkacXMWm1NtYvIQ9pLwBIeT2TmW4cOcB8U+ulAKULT5Dx9kXFjjw4wrunwxHlrj01c0TrXwj/obFhDqaN7I9pUHpLHrqWbKOFRhcD8Bk87aRXLcp9kACVNHRIvwUYMzQLGjKiII15Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770468324; c=relaxed/simple;
	bh=TsW29D+JaZDwvKNOScs/MSfNsMva0Rh+vcVxhP4PkW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKkzOHphUUuLWTx/Mmgqp7bssR16Y/o46NVDZ1STUuYWCXdaCJCcRQfmMKjnCT/2rhQq25DJhqtn/Po9EWnI5WVn5hxRMaHtDWiA232gJBUz43sR3POEXbhPMKXL4c2F4K+lh/QKpOVWOOQvUIywiHdC+ldI9ICeJaOcsN18KZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=INa/Hu0Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="INa/Hu0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C27C116D0;
	Sat,  7 Feb 2026 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770468324;
	bh=TsW29D+JaZDwvKNOScs/MSfNsMva0Rh+vcVxhP4PkW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=INa/Hu0QHN5MIP3JYud8wRcjk8HeG/Jw7ANQAS1Y7MLxqRP/MXJuc/Q2pbbCmPnt9
	 8Q4PHvhqvTwkL/1fh17oYb1MtkAfVorMzb03vd1R3Y8HPdsbC3d1Ejzo4H5lBzhytc
	 tjGJQK5KFuc004q9vyFKcwYREi87poKAXj2k6pmg=
Date: Sat, 7 Feb 2026 13:45:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: SAJJA EASWAR SAI <eshwarsajja20@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	iryuken@duck.com, kernel-janitors@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove hardcoded dead debug code
Message-ID: <2026020737-uncork-credibly-a1ac@gregkh>
References: <20260130172632.130898-1-eshwarsajja20@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130172632.130898-1-eshwarsajja20@gmail.com>

On Fri, Jan 30, 2026 at 10:56:32PM +0530, SAJJA EASWAR SAI wrote:
> The debug code is guarded by a constant false condition and is never
> executed. Remove it to simplify the code. This also removes the now
> unused variable 'pattrib'.
> 
> Reported-by: kernel test robot <lkp@intel.com>

Did the robot report this original issue?  It just reported a problem
with your original patch.

> Closes: https://lore.kernel.org/oe-kbuild-all/202601302336.Jt5bRreu-lkp@intel.com/
> Signed-off-by: SAJJA EASWAR SAI <eshwarsajja20@gmail.com>

Please do not upper-case your full name.

> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 ----------
>  1 file changed, 10 deletions(-)

No version information?

thanks,

greg k-h
