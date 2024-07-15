Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFF818309A
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Jul 2024 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721027514; cv=none; b=jI25j/Ifoi2L9y2Xb8odwov+M6IebiibkFTU5+zzhsuMUjUkLVFupK1AFHP0S7M1Lf07mCihTt5FZh+zhwFuyK1Jp2HRaXRs+zwDJW/2ut1FopTKr1rbb63Z5A1gfNhmqD7SOvXd61b4oXovqqnr9IH/MgCuPEiRatn5vH4P7Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721027514; c=relaxed/simple;
	bh=Jl9F54gKC2HZ6RkFE/JPLXbjvDwLcSrFahwOTKM89U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fu5dE4Q2cF22OlX4Kq3DN4rvDOVTi6kSziV4uWrZwcGkQrRiGd5oN9EwgiSW0eH8nOQ38cg1e7ZpFVynbnyFCAFi+UeiqgMarm8rMFueq5nxOCkhKCW8O2PZAsKojF0//cfoqouWszdSUHsr6WsShNZO+0hDYHFl2kf+D6JyEYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sTFrr-0000ot-Hi; Mon, 15 Jul 2024 09:11:27 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sTFrq-009e7s-32; Mon, 15 Jul 2024 09:11:26 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sTFrp-000JYF-3D;
	Mon, 15 Jul 2024 09:11:26 +0200
Date: Mon, 15 Jul 2024 09:11:25 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	RD Babiera <rdbabiera@google.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpci: Fix error code in
 tcpci_check_std_output_cap()
Message-ID: <20240715071125.p5a7eidkvo2jqcvk@pengutronix.de>
References: <b0880888-6719-4614-91fc-8ee63b71d304@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0880888-6719-4614-91fc-8ee63b71d304@stanley.mountain>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org

Hi,

On 24-07-12, Dan Carpenter wrote:
> The tcpci_check_std_output_cap() function is supposed to return negative
> error codes but it's declared as type bool so the error handling doesn't
> work.  Declare it as an int instead.

sorry I missed this :/ in the first place, thank you for the fix.

> Fixes: 62ce9ef14797 ("usb: typec: tcpci: add support to set connector orientation")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
