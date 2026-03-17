Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005353E557E;
	Tue, 17 Mar 2026 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756192; cv=none; b=sFD+HcRRLErgijMgnIri7eY1+ZzKc7DLLhjm9Hwro1Z5Deww3NUocwdcQcEyfyy6Vb8rtqibTUG346DqQ+1TvJohIlteZ2pmkgUKCkzNUfLtqTRF7C5xdIez0SDsA4nXoWYdUOZ8JrSB7mxypfzyTG7VZySGVwkq+Y/h3aRumms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756192; c=relaxed/simple;
	bh=2yJ60b2S8Lk96Pg4emo/hxt/fIRDy4IDj5N7w6tK+C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMP7gktDDbahPaHDPWXQIS8t8f54JwTVqM/gF/36IEXpNGWR66R/RXOMTQvrT8M+YOd1gV7aEB5XNSp+oBpCV1YOZ8h54/4sZR386dEEvlmW37BUD52Yc7SSkjIPamOGyNVf08AbOhVsHRwJ80VEygc8eLnHWM6nqTAuKn1ArSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bnh71P71; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bnh71P71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2377C2BC86;
	Tue, 17 Mar 2026 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756191;
	bh=2yJ60b2S8Lk96Pg4emo/hxt/fIRDy4IDj5N7w6tK+C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bnh71P71kX3MJoXBSUFUcTTl6CxG/COM/0aLGrdBlQzt/A09aVrNQQJ4/0YeUZn5d
	 eK6bXsw8bRpjAXGChJmKjWw0WzrTVl991QaO3WDZKL0yQd2rtlWx6mQuhDZn0Waliq
	 KvnM+PVkuFDE9P/zzENKBiYmGU52awF8Educs7zh/INZnTbuwiNiSZ1SppepTIpMH5
	 JOArD2fsqp1shykKSMRjwJzOrVtym9Z0uqKNvkv6DM/zTIzeDbfNnWtMNzw7S4IPP1
	 VasDxf+BB3AWNApmrtPbaks80qUmB/eW/Krp58AuKgh6GEodL8N+LOMxanoYTC3hpc
	 lyZEwOnaKuhMA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2V0n-0000000010r-0UkH;
	Tue, 17 Mar 2026 15:03:09 +0100
Date: Tue, 17 Mar 2026 15:03:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] staging: greybus: gbphy: Omit a redundant
 pm_runtime_mark_last_busy() call in gb_gbphy_idle()
Message-ID: <ablfHWyTEhHOZ3PZ@hovoldconsulting.com>
References: <ad901a22-7c48-41c4-a69a-2fae9ace6664@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad901a22-7c48-41c4-a69a-2fae9ace6664@web.de>

On Sat, Mar 14, 2026 at 03:40:50PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Mar 2026 15:35:09 +0100
> 
> The device's last busy timestamp was set in a wrapper function since
> the commit 18c1fe53d186867243f4cf17f4eef60737a16c4c ("PM: runtime:

nit: 12 char hash is enough and reads better

> Mark last busy stamp in pm_request_autosuspend()").
> Thus delete a pm_runtime_mark_last_busy() call before
> a pm_request_autosuspend() call.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
