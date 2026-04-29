Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224492BFC85;
	Wed, 29 Apr 2026 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462346; cv=none; b=ax7L4lPTD/KWasjA4Vd4gpZGr1ycklE2I1A1ZiGc9zFtzG5qqPzHSasJtxkDSO9QfGlsRlI0WpO64mNIBRK54BfI96FiARM0OrjbsEtf7L3zivtEn/RNn0oUTAeMRSgAvPUFan43ZLxNcOQFGv9fTfwNmEeMEMJS1Yh0g7PQIek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462346; c=relaxed/simple;
	bh=q2UXf1utRHj1IN6GtFXfGhRrDTzbNaFyMndiO4xdcDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgIZhJOB59DQbcYqIaHJtTIf7PvKLy1aOegm0LTy+x8ycb4naZywNouSKGRsHRiU0wJsWP7g5zcGuqWx0gaVvdgqIH0xTOEc2e0lHZGYLe5xuXJGJ+6hCJi74piHKEZw4z/3io0hQoxUOUcPBFnFd1wr3ci1niRSgvtBoS07Cw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PSQaZ0ya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PSQaZ0ya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247B6C19425;
	Wed, 29 Apr 2026 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777462345;
	bh=q2UXf1utRHj1IN6GtFXfGhRrDTzbNaFyMndiO4xdcDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSQaZ0yazynx0Ln3UfMVZhor4I8fh5GPHqc3nRu7eNkGKWKo0xomJfq5VyovR41ho
	 UyQ7ixspIBeZBTRne/vSxmrQx3bYmTy79AsrCO9HbXlrB6ApXdEeMBLpiMDabV3SQt
	 Kxip/XcnUTlwf6eG/wnMQNGAbdv+nkiZyYubr/xg=
Date: Wed, 29 Apr 2026 13:31:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Probert <linus.probert@gmail.com>
Cc: error27@gmail.com, kernel-janitors@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix potential speculative cpu oob
 read
Message-ID: <2026042959-discourse-favorable-edc5@gregkh>
References: <20260429111016.1260295-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429111016.1260295-1-linus.probert@gmail.com>

On Wed, Apr 29, 2026 at 01:10:16PM +0200, Linus Probert wrote:
> Fixes potential speculative cpu oob read in os_intfs.c by guarding the
> index with array_index_nospec.
> 
> Fixes smatch warning:
> warn: potential spectre issue 'rtw_1d_to_queue' [r]

Is this value controlled by a user?  Or is it just a normal operation
that happens that is not controlled?  In other words, can a user
manipulate this directly to be out of range?

thanks,

greg k-h
