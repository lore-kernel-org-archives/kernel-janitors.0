Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7456E3DB996;
	Mon,  8 Jun 2026 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930781; cv=none; b=XOUMGLd0y0qrGpjEJMzzV96NJkbZMcUiJsHrbpU2vJ+XKtLm7mQhtGmokJqi1KtKHg5IvjWVs7NLeSULJ6H2wM7eCidfPSL8H4onFK/+3W6iv6G3A9qgTy5lSU4d/ikUN7IYwrXvq3++28rm+7uybPuXoMXw98n85KFFhBtKEcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930781; c=relaxed/simple;
	bh=HNuQMWtTH8I7HREUnYAxUHrsAV8Qj0L/yCKcneQ87UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fn6TBvHNzvI7a1S2QeIroiuccSEcRHT9aYlG6u0BbzUa8ym0ZNI9ukJ7lrkK9hm7xHcQcvHIuuDe8aMv2w/f2zjGl/SpjhNIqKyIxlpa0RYDvEwcKhG7kvMN/5cI3oigb3BRQW3wrzbXokloaSQ7S247VMLTfzln/NRHfIbm0DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcQhYvly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcQhYvly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214C71F00898;
	Mon,  8 Jun 2026 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930778;
	bh=9xcJJLQGjNHKxDNQ6OdTAnQwJICYlDNs1yT7Dw2C5sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bcQhYvlyoEiQ46/5M3tuKz52YyGtT2bHHP5IRa5lCTRj/1G8Hdcu5dfkIFcRNlvnD
	 m720bfKG3VV5EV/qJckzWKVZ0vxVyyP+rb00n186PuIr81WmPW56WvonRzCKni7Xa+
	 OgyRIDc/AC130fY8ietEBZFIU8CxW5fvwdxjpsPPQhWaFtHnTRlhplW4oBRjM6kMDG
	 YtoxA3l68/nPAUIQC+CzT9bXNYysP+JbhWi2sWckrhZdQeuYHkA+7hksO1+nZRjXpW
	 rVtMvRCpJ8J0fnrzmEFgl+1LMz/sY3V34OZeyv22VDEDVyMeDJOpGh6+H+7ZDzUa/F
	 FZI+IPBV2Mo/w==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wWbRw-00000000I6V-0Bwm;
	Mon, 08 Jun 2026 16:59:36 +0200
Date: Mon, 8 Jun 2026 16:59:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-usb@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: ulpi: Use common error handling code in
 ulpi_register()
Message-ID: <aibY2OHBDJh5tyso@hovoldconsulting.com>
References: <a65ed0db-6519-4665-bafc-1bb15752ff2f@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a65ed0db-6519-4665-bafc-1bb15752ff2f@web.de>

On Mon, Jun 08, 2026 at 02:35:11PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 Jun 2026 14:17:57 +0200
> 
> Use an additional label so that a bit of exception handling can be better
> reused at the end of this function implementation.
> 
> Cc: stable@vger.kernel.org

This is not a bug fix and clearly not stable material.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

A closer look at the code reveals that the device name is still being
leaking on errors however (despite the recent flurry of related fixes).

I've just sent a fix here:

	https://lore.kernel.org/r/20260608145803.69360-1-johan@kernel.org
	
Johan
