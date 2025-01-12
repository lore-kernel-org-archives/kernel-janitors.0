Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3B115278E;
	Sun, 12 Jan 2025 13:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736688060; cv=none; b=AuKt1mrbmWX95u2c0EunhYwOnmCzk1Mfd9YnfO5MY80cjMIDxTHyj/XcMgf2j37XgXS4cn0x8M/ugrelSsu1QTQdskTuYWcRYukmt85HFGaheqsfY3bI0rOgBbyzMnSqU058y8ceWnFUbBstLKkPd71nt0XxqSHT+Gr+9wC8gqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736688060; c=relaxed/simple;
	bh=gfW4f4O+Bmrzj66HCwbr++Qh8kXEyMYJTqa5rIt2S3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geK+bKtQiHTLx+sZJivEhoAzT0yJInDM7w+sq9YPSYBOtduYbJ7Lz5q7rzmbiw0TOsRYQRivWNaCgqFkJaoq3lMcn/yjji836cq3m1DsgA4JZPFwvuI6sJ5z8qkhu+E1rjgciqonL/S9o57GvIETudqZ5TS0nwhnSa2hGa8u1pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nQpLjnmz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nQpLjnmz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C34C4CEDF;
	Sun, 12 Jan 2025 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736688059;
	bh=gfW4f4O+Bmrzj66HCwbr++Qh8kXEyMYJTqa5rIt2S3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQpLjnmzGYHJSmss6QNHCVTkqYS0onDVl5q9Lshj7O0DYm3WRuDId1aGb27WDO9DW
	 qMe0svQC9wPZaH64ewMDHUDZQSVDIpZ4oUErVe1l/uVHSJ9nvnJzFARZtkUmPAGpFL
	 ZIdyjFd+STWej/Pd2KtPWFcT0ig5vpwN1tm3IwkQ=
Date: Sun, 12 Jan 2025 14:20:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Cc: akpm@linux-foundation.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	anupnewsmail@gmail.com
Subject: Re: [PATCH] CREDITS: fix spelling mistakes
Message-ID: <2025011239-gents-drinkable-2b65@gregkh>
References: <20250111194709.51133-1-tanyaagarwal25699@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111194709.51133-1-tanyaagarwal25699@gmail.com>

On Sun, Jan 12, 2025 at 01:17:10AM +0530, Tanya Agarwal wrote:
> From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> 
> Fix spelling errors identified using codespell tool.

There are not "errors", but rather a single "error" here :(

