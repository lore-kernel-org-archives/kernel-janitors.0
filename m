Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9B89D1A0731;
	Thu, 16 Jan 2025 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022331; cv=none; b=Gg0ig4yeUgjqVvVin4pDLQWBvCmtKw3b03TuoOl9brxOIoLCGa+0t2CzTsFE7ZplePONd1zccUbb0LYzNRceOLnurv0FtkoQdgIBezEYYjJ1ym2jVtT7thfYs7X9vZKPWADkFhgy7x6v9Vb+ATUbtuWzOb5WVwtv1giscaA3Jag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022331; c=relaxed/simple;
	bh=Aj15eT8VTROmP9QRJHpzkDiaO+yvdgYkUY8vrBr3n4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=FPUcdBtxJDRYoztMiIvzr++pZeS9qELh+Zmn5psMlVd3V+s2OiSle8xGqoRZHd5fcnQLgQCYr2cjZhd8awMFqk7bhh+Jc9F5HnXgjbjxY0/qBAJXIQxLBstydyCVUkfJ5+U5qEHHG7hrCXJ2807UukW9NZmU4GxLeG1BI+XPUGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 2C0CA60820F2A;
	Thu, 16 Jan 2025 18:12:03 +0800 (CST)
Message-ID: <f0c1aa0f-1b2d-7237-5ee4-de5961364cec@nfschina.com>
Date: Thu, 16 Jan 2025 18:12:02 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] kernfs: Convert idr to xarray
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tj@kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <2025011629-lilac-prozac-1023@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2025/1/16 17:54, Greg KH wrote:
> On Thu, Jan 16, 2025 at 04:48:02PM +0800, Su Hui wrote:
>> IDR is deprecated. Use xarray instead.
> Why?  What helped by doing this?  Is it faster?  Slower?  Less memory?
> More memory?  Where did the lock go?
>
> You need to provide so much more information here than you provided in
> order for us to be able to even consider reviewing this change.  Please
> read the documentation for how to write a good changelog text, that is
> very important, ESPECIALLY when dealing with core kernel bits.
Sorry for the poor information, I will collect more information and data 
later.
Thanks for your suggestion.

Su Hui

