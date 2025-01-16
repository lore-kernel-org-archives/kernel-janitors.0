Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3FB1DD0E7;
	Thu, 16 Jan 2025 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737021244; cv=none; b=Oz9x6jN0PHS5dKNMNzfZ3zoJ5lBXV/cxXQI/LvtBK1V+hsQ+KjNHbD6XLp5m3nBO7LGpSbO0OhWVftaW0v+nA2iRg/Dm4kT7qhg3y/HkoGdR95OfkkuDmIiACyqmiClfvoKPFyVHM2hmWgNCvZXa+KnanUuFDY68mxc2zQc76cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737021244; c=relaxed/simple;
	bh=Z7+Um9qsH6Pgnb5XgeAIc95XFy7K1bNDOKFKc0GvOOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qadvH7iLia8WN7JCcLLM1iMGjq3E6SHKKVk296KC+SukeJYeTCHIsy6dp+ZVtIVO0wT2MWsiHyVG+T2GT7luZW9R7g9fErmboCFzWEBcniDvNAr6pDXNB2d7GessgCY8CFT4VJo74I2pvk999wm+y1P5DbgnKeVu/cYMopEvHr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XB1RFGLb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XB1RFGLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195A2C4CEE3;
	Thu, 16 Jan 2025 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737021243;
	bh=Z7+Um9qsH6Pgnb5XgeAIc95XFy7K1bNDOKFKc0GvOOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XB1RFGLb8mxnmW20/Cu6TFbchml2RWaPa+HTJoWOCDcTRVGscUJykRXQ+Js7Be+tD
	 1n29lDO6wdmqVlIjDpSa1EOx6yaZlcfX5PETx2OhIdJG+jaUid3xcHhdHSLUlmcQlN
	 DR6CJa6e5EWBAjRcWTp1QBLmNBTl9oqH7RL5kkQY=
Date: Thu, 16 Jan 2025 10:54:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Su Hui <suhui@nfschina.com>
Cc: tj@kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] kernfs: Convert idr to xarray
Message-ID: <2025011629-lilac-prozac-1023@gregkh>
References: <20250116084801.260460-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116084801.260460-1-suhui@nfschina.com>

On Thu, Jan 16, 2025 at 04:48:02PM +0800, Su Hui wrote:
> IDR is deprecated. Use xarray instead.

Why?  What helped by doing this?  Is it faster?  Slower?  Less memory?
More memory?  Where did the lock go?

You need to provide so much more information here than you provided in
order for us to be able to even consider reviewing this change.  Please
read the documentation for how to write a good changelog text, that is
very important, ESPECIALLY when dealing with core kernel bits.

thanks,

greg k-h
