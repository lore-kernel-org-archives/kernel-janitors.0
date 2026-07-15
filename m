Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58492324716;
	Wed, 15 Jul 2026 06:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097782; cv=none; b=aGxVb7x6xziSYKJalFGMfKUoOI9xHP/hLacTq+Jlxkq8SmjGVwMUpH0WLpGV8Rxdwcam8fKIrE+33/WzI+hbhTl9mfI6y7k9xvz8O8EQUlVX8ZQxFmb7qgc9E9h9f9BkuLBboushFxfz5amJ+1Rzth5xg8pr4dBzSrrgnwDbxeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097782; c=relaxed/simple;
	bh=fPlOoy82JUDfb88nu0F2Y4uREMOtOV3M/Svtbg9aWWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jayzQ/ifWdwiJhNeF9qZs+dT5VOzpp9FRQ1OnAwI0XeIUjK8uNCQ5cGMnyA+nSxJqtYNAojTpTIOVmvT9/T9gNJPSp5WQ8TzE5bgLY25gkbbn7CpEVM8vesip89bQVtLoEE+4OVRULoBxQvSIAMbjIFHorlFSsw4TzjoMIHYJfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=lJ04fou+; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="lJ04fou+"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 9CE091F8DA;
	Wed, 15 Jul 2026 08:42:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784097777;
	bh=VhX27eVj94wZ4TbZOZmAuCcKPqJuNV5Qaj379iRya4w=; h=From:To:Subject;
	b=lJ04fou+1i84Pq+5wBTGnkKE/X1Ope/n2XS+7mkCpy4DNnun6qaKWw2taEXi8gc1Z
	 lemFntMKwk0+I5RDNDO0Z58ge+VfTWND2NRG0Nppczt35SiKjdHPP94flzvVQNb0Ut
	 TrWwY+rraEFGqIyVkmXj85eIOhsm0mUXopISmKCJGwTe5bXKbGcd3mXAs2A39pDW9j
	 LD59esS7nJ4R8fFdZYx4v78Zp+Xo8IQRGWQPSZEHu6GLwLR5DvPSCQY22g/L8o0yM8
	 A9a5Xd91lAhQvv8buhnDS8dCoWADwHtRaunSV9WIyQC78jGwbzfenZIpNBa/KlenE5
	 GeeNsy+1YlS+A==
Date: Wed, 15 Jul 2026 08:42:52 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/bridge: lontium-lt8912b: make read-only const
 array supply_names static
Message-ID: <20260715064252.GA40623@francesco-nb>
References: <20260714190400.194605-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714190400.194605-1-colin.i.king@gmail.com>

On Tue, Jul 14, 2026 at 08:03:59PM +0100, Colin Ian King wrote:
> Don't populate the read-only const array supply_names on the stack
> at run time, instead make it static
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>
