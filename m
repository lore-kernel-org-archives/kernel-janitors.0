Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FDA14831F;
	Tue, 24 Dec 2024 19:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735069893; cv=none; b=QyqtYI4keouF/LcVVMDqlnauqSMMkhksP2PppoGToRUfMuj0DRezBp7s7ZCodIPSsp8XtDHdofUYpLq9PAZ7/f27N2t5J9laxMR8wvNFeNnToRiOBK1xgzL7EbEzcCuMWZB3eMfYfrpf5gzMkKO0goATG0q1N1DLhZccrMTl6Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735069893; c=relaxed/simple;
	bh=I4ztf/NgcoPxs9eRxMpAbtknn3OJ46g6IaPIqUmo9dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qW1SGwTJygsVaXRug5ZfXr3771fwl5f/nrmNpu0Pf0jjizjzC4O7CMHaHilhum6MiOpF4LkEZPBhHVwWxuUYHlLWe+KfNviWAqY9mqB54sDU2m50vI15NoEFmL9S8A9+rT+ntb5EPzJQ4TmqejRqFZ5oYIOguDM4e3AH+VYkChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hELH7U0B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hELH7U0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0F8C4CED0;
	Tue, 24 Dec 2024 19:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735069893;
	bh=I4ztf/NgcoPxs9eRxMpAbtknn3OJ46g6IaPIqUmo9dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hELH7U0BAM90TgJk3d544Cb8LzzrKJUwMmdtpM214ebwgzwqY9V92i/L79GsY3+ZY
	 AqgKPcpX+eRXGcUOjgjtWpEd2zZ4IATKxSL8sCk+OaZPyh6FCM/yXuYekmi+vpXTff
	 hztClTlgQJIdH4nsrv/oGfGjyVk/1O8pisyx5g0PLNDFidB1OsADej7JfeTIcclg0J
	 rloQVgoCVolXeE8XhnFztCDhZ/a80DMHnu+q6OXPGYvjFMMO9bf4KsPYdkvgcgOLLI
	 XqPSz7u1cgaGr8PIYODy0xLlZ3ff76M3YDJdefRnj20yQSOW1baaTfcpqZPmWVK4jB
	 H3MZgv/zV7vEQ==
Date: Tue, 24 Dec 2024 09:51:31 -1000
From: Tejun Heo <tj@kernel.org>
To: Su Hui <suhui@nfschina.com>
Cc: jiangshanlai@gmail.com, matthew.brost@intel.com,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] workqueue: add printf attribute to __alloc_workqueue()
Message-ID: <Z2sQwx8JlnvF-STl@slm.duckdns.org>
References: <20241224044357.727530-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241224044357.727530-1-suhui@nfschina.com>

On Tue, Dec 24, 2024 at 12:43:58PM +0800, Su Hui wrote:
> Fix a compiler warning with W=1:
> kernel/workqueue.c: error:
> function ‘__alloc_workqueue’ might be a candidate for ‘gnu_printf’
> format attribute[-Werror=suggest-attribute=format]
>  5657 |  name_len = vsnprintf(wq->name, sizeof(wq->name), fmt, args);
>       |  ^~~~~~~~
> 
> Fixes: 9b59a85a84dc ("workqueue: Don't call va_start / va_end twice")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Applied to wq/for-6.13-fixes.

Thanks.

-- 
tejun
