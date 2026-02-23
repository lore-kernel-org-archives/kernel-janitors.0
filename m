Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8B280317;
	Mon, 23 Feb 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857531; cv=none; b=nWDTIoBRKwjLw/gtmd3muobAA4Emj8AslDKBoba5BpTxb0Lqmr4SyxCq3Qf7yoFh1ArI2X9WHSAwsXiPu3x7CTrxAFxdxZHF3Tzau0fjX37avMvjB/7ESRd3hfLL8TIahoV0nwVY4WwdPPQN+HUtChVp21M7pRMH0Eq4uAX/BPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857531; c=relaxed/simple;
	bh=NUfhfvaiA9qRt5CvEPEE6G/9RvGVWqop7hq7ygoGb4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWXB7yBkvpvzPff19bnKuO6osYK2NrZjXGJgnrvhiADCZA9kQrBeYZMHPxkwfv80egKd9KPEPzRzevZDtBfMlpC97oVqu9L+1PiQRMvxem5MQfDpyD1yEgXKQEVOFbrAciBEMYiTEiSQE/iBDOYvsM6Y6GW2I3v3s5+CWXXY+2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yRmS5c10; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yRmS5c10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB204C116C6;
	Mon, 23 Feb 2026 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771857531;
	bh=NUfhfvaiA9qRt5CvEPEE6G/9RvGVWqop7hq7ygoGb4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yRmS5c10xGdAzuo478QraLhe5b+cqE0iI3J+x5IJQShkWIIp8R2AlUrtGGZuVSKxs
	 dHc763i72k5JSh4yq4jKyInyRmFdAxjuY0oLh/pwSaXVDyAYsVtCzvTv1s49BV3lvi
	 pk5IkAoQB0fcZ+XHtieGDB70K3/tEG+D69Ur4PvE=
Date: Mon, 23 Feb 2026 15:37:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sajja Easwar Sai <eshwarsajja20@gmail.com>
Cc: ethantidmore06@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, iryuken@duck.com,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: remove hardcoded dead debug code
Message-ID: <2026022350-armband-mannish-5480@gregkh>
References: <20260207180934.73593-1-eshwarsajja20@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207180934.73593-1-eshwarsajja20@gmail.com>

On Sat, Feb 07, 2026 at 11:39:34PM +0530, Sajja Easwar Sai wrote:
> The debug code is guarded by a constant false condition and is never
> executed. Remove it to simplify the code. This also removes the now
> unused variable 'pattrib'.
> 
> Signed-off-by: Sajja Easwar Sai <eshwarsajja20@gmail.com>

Does not apply to 7.0-rc1 :(
