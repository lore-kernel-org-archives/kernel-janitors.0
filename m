Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D581A3E7167;
	Tue, 17 Mar 2026 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756259; cv=none; b=piOLA8A/qlaJEXjw1fRiH0ndUtvrvneP1UIXJGn0LO7bOr8XH9NMZ8S8Vvt8GcQQGcruXbRq3dpLVM/4nBYCBfIZR0llSElQntjoNZ0mIqEi4vU9tvoIvtkT661S1LA56pUEfTSiwBCrSvPLo7yLvhpfi5UvVMu6OjhgToO+c6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756259; c=relaxed/simple;
	bh=WSMrHeA7v6TncmzeDTIFtykB5hNRm5aobkhygNs37eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqHRIrmbcgSuGs/OehEFv+uH57k7MOCWh2LBGF8P+zKpfor/wJgWCuIyUXQ1sgLjZJDplqKL2N6A+fN1+t92poUqdTmpJL7vHTj4RsOZHpjVugyslk/1CoiN4AYufbmUHRx/Ei3AeFbrhGHHN6b1MiSlSmBBLsLhOthWfag3XQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwRpm8q4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwRpm8q4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7364CC4CEF7;
	Tue, 17 Mar 2026 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756259;
	bh=WSMrHeA7v6TncmzeDTIFtykB5hNRm5aobkhygNs37eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UwRpm8q4RYhEqLjc35fsqkEvklLdeJ3eLm8W18bvsbnXB7UfNaXW2AnrwkAkRri5+
	 3J3T7isHIlKqHjLAMiU4kkX+N/RJoia5zZD9A4uyrc6FyCkK2NYIrIxTzZX+8hk0EA
	 YHrnARB7blDIltj+9Fsk6suqCoZzli7OjkiNF4v9mseHSUa3ZYIL5NzHfsnQYRMcbi
	 ZMBSB7/Lm3dhwAVNkYn6Q28/i5x4C5/0wynHUB6dmCRWrS6wrncBJfPsCo3kssZ+EG
	 Joy5b8ISBfTrlIywV+liIfHGiboWPSk1aw4YBiqJsYXyC3vl2RX6rni2In2OhwoW9e
	 GheY9rbkFMtYg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2V1t-0000000011t-0q81;
	Tue, 17 Mar 2026 15:04:17 +0100
Date: Tue, 17 Mar 2026 15:04:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] greybus: Omit a redundant pm_runtime_mark_last_busy()
 call in two functions()
Message-ID: <ablfYXR7i1nRiaA9@hovoldconsulting.com>
References: <03573ebb-54af-4bd0-9730-5f55d24ae0c9@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03573ebb-54af-4bd0-9730-5f55d24ae0c9@web.de>

On Sat, Mar 14, 2026 at 04:05:23PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Mar 2026 16:00:20 +0100
> 
> The device's last busy timestamp was set in a wrapper function since
> the commit 18c1fe53d186867243f4cf17f4eef60737a16c4c ("PM: runtime:

nit: 12 char hash is enough and reads better

> Mark last busy stamp in pm_request_autosuspend()").
> Thus delete a pm_runtime_mark_last_busy() call before
> two pm_request_autosuspend() calls.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
