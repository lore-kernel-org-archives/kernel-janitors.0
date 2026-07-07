Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEE63F54C6;
	Tue,  7 Jul 2026 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422427; cv=none; b=cawY0SqcAxzSCsY4JMKz8h0tfSpS8Mn/L/xnuZ4qdnz+RoTn9W+B4bdJw3o67mBUpVMWrCFUz7K4cqgzLgr7FRjDH8AcJ2MKq/+saAh7ncW5j3nlFbRakR+msf42+/d8btBdyduzHzE4KorA1ZwA137HErrLgXBqJRqXDokP2Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422427; c=relaxed/simple;
	bh=Q2BxHU+Chcy2pNXcAvXAqQ4GSijY/vUGiHC4rdywJHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pY5+iXP8kBx463tToaTtat3L1zTiJAPtKMFrRK/q9Yyb5FD1e1/bGOvJ/xNLtGgIQ11/wZVO68HyrvlLHllY9kmN5TC/9uSTgQCo3cWLelrbRnn3cc27r0zxOmQyWcokTw0qcz/a68sEcnwIWG5C53sXOsvfTfErgO5bwD+esgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rsFSJT8r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rsFSJT8r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAC51F000E9;
	Tue,  7 Jul 2026 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783422424;
	bh=oA46KZkzbHFz9M8Ztg+TbQgcKcjuTALJQXyIsDbrdag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rsFSJT8rESOSygea6lviv+AjctqtzDOqq7w6iOSzqu0x2tGaxG31uEGb7n4rQKQqr
	 jcOEuGF694bcOqwd1+0J9DATqsNrp1ZnheO0r5cW6qU/tW6meiTSSPKDpt+gdE0tKb
	 E9CRJGJyACCHdVfY/Q1eEY3A1Khdti2+aNk6ytR4=
Date: Tue, 7 Jul 2026 13:07:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Aiman Najjar <aiman@linux.com>
Cc: kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: drop GEN_CMD_CODE macro and
 capitalize labels
Message-ID: <2026070750-myself-hardhat-295f@gregkh>
References: <20260609-rtl8723bs-code-style-v1-0-daa0e85359a6@linux.com>
 <20260609-rtl8723bs-code-style-v1-1-daa0e85359a6@linux.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-rtl8723bs-code-style-v1-1-daa0e85359a6@linux.com>

On Tue, Jun 09, 2026 at 09:42:55PM -0400, Aiman Najjar wrote:
> The use of GEN_CMD_CODE macro to generate cmd enum label names is applied
> inconsistently and is confusing, it also makes it harder to make use of
> tools such as clangd when looking up symbols.
> 
> Replace them with writing the enum labels directly and adopting
> new capitalized names instead of the current camel case ones.
> 
> Signed-off-by: Aiman Najjar <aiman@linux.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c       |   4 +-
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      | 190 +++++++++++++-------------
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     |   4 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  18 +--
>  drivers/staging/rtl8723bs/include/rtw_cmd.h   | 154 ++++++++++-----------
>  5 files changed, 181 insertions(+), 189 deletions(-)

Does not apply to the latest tree :(
