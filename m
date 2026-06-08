Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CFD2E5429;
	Mon,  8 Jun 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780933027; cv=none; b=c+YJ99bWioaOw4R72S4ZrCrvBdf1LzhNxd+fwWiKB4SQeHez8/CpNUGHzml2UfksnNYGlNJrKOuMvdgeEG5VhbtzYY2ZFIJxezkOmNj+dqAgKAhLIhC9PPPYLOMK0TPT4ccuUuVLVJjRa7APZJ5pmmf9mUtan/fA/UsjLuiyt5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780933027; c=relaxed/simple;
	bh=0KKBDQgert2u3ABwV1uDRRoW5BHEgPPRUlcMDOqFgFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RB82J5WMhx8Sy30PsQ2mUGWadNNli0dO0maDa2mNhAUbZf0MW9MT/pfI19jdf6eu0X0njj6vdCCorsdtvVqL2B1oOdpsYa66aMiIFuGcAEkUML0Yyw4URoW1Zt5dOPS10pf8pUckTxj6vNkZIXWI8M1NEh5HZn3579r36FQgAqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JagcOl6f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JagcOl6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C301F00893;
	Mon,  8 Jun 2026 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780933025;
	bh=TduAWH0lx1v2Ni8WlfRncToYv5MFhRHrj+LnCYa3GpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JagcOl6fXFMHP6LzfnliaLN/Z2ukmP7Ymq/mlu2O1MWpl2SbeN3k2c9gUZQ0oGfc0
	 gWwdeUi9717LQuUogoyG/MVYxXyB1zj8Dec8HY6xEFV5QDUW/1Me06SXvB/ChEodKT
	 GpZiTBNWwaHkNaarfhN83bGxDSoq8/LnXgBhYTpo=
Date: Mon, 8 Jun 2026 17:36:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-usb@vger.kernel.org,
	Felix Gu <ustc.gu@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: ulpi: Use common error handling code in
 ulpi_register()
Message-ID: <2026060822-liver-unjustly-be7a@gregkh>
References: <a65ed0db-6519-4665-bafc-1bb15752ff2f@web.de>
 <aibY2OHBDJh5tyso@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aibY2OHBDJh5tyso@hovoldconsulting.com>

On Mon, Jun 08, 2026 at 04:59:36PM +0200, Johan Hovold wrote:
> On Mon, Jun 08, 2026 at 02:35:11PM +0200, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Mon, 8 Jun 2026 14:17:57 +0200
> > 
> > Use an additional label so that a bit of exception handling can be better
> > reused at the end of this function implementation.
> > 
> > Cc: stable@vger.kernel.org
> 
> This is not a bug fix and clearly not stable material.
> 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Ah, this person's emails go to /dev/null for me, so I've not even
considered it, so nothing to worry about :)

thanks,

greg k-h
