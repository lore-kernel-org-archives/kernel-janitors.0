Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9EC3E40E0
	for <kernel-janitors@vger.kernel.org>; Thu,  1 Oct 2026 10:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852167; cv=none; b=DtBVsTh5r3l8UWkckhw7RtnnZxfjUbqdLfJA4zSTrsdcyOil+sw0Cq+BTyI9QdpGBHOjt8q9ec/x8yLrtPQQpmBUQr/wcFoqDDzU9DVkmqlgRdYshLAqwgXIDkWUIX6YKkQ0ACSrvZrBlI6JztkbW4OB22E4pR1iqh8qViOFqng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852167; c=relaxed/simple;
	bh=5lz9a2eR7DX2zBjwG63Iv0aXfgNn41kdLdOuaCzbroI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIC1MicEHsdSuszehB71YJvfcjGEPM5GFbcN2r5+Ta6lu/efwdTF7+DikU2eXINZab61sAKf7y3CCXWIha8fsXpSUvPo5zQYl2ubf4JXht03U2AquufILoukgWoz0qniWsSUG1CiXH7nFF2V5apR2upok+G0/UeLR2lyZ8DQzFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMDyAjgb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMDyAjgb"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso217137f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Oct 2026 03:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790852165; x=1791456965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5iTgZ1YN02O/klBS6DhkVQTUmyd0nDZjkXixmV+qwqo=;
        b=fMDyAjgb3p/3ypjPCYxB41N1Ua0ctAOIoJrOtrJm4p701o5VX+jITqYo3zyJ05D5Ji
         IQ8eKIqfpxftBkpy6pBIPGVGof60rU+HuuVKQAgT2jHJIkbFXPaWoxHZ7zc2fwiYtTKv
         1Xq5/KyNc3HlbDa18hqkykADKxV7t8SVbqFgF6EuPOAxzze+3SmADvAMbNd+Ub2nVuAm
         s9oJySKdv52idit1rhAqqbDPGJiJh6SKM9XmbUX1JFTzlAwCsm8ZofxdOgzqqsJ5SoTX
         tIONRipWZHNtEvJYxoixbomIIHEOyeTXGrLQfOma7v5o7hqFgvGSDa8s8gG7k4uwOQ9z
         bNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852165; x=1791456965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5iTgZ1YN02O/klBS6DhkVQTUmyd0nDZjkXixmV+qwqo=;
        b=xoa69os1IjZ9WMm+dePnHorBnndtIwDNd2z4y5hHlmNeFwWBKUi2dgE5anNJtMi/5j
         v77Ti9HQUYS2V/2WPw6lVuZyEt9MbOQc9xoXk9lrS20q4hjCV1j+e8TcgzkU6v6tfZTF
         6n1rGDUAu8iLJBZBQEJVt8Txh8A1So4q1EgjxOk0iHU+fruyHp6n7Tf99WHS21/3OsMV
         thS7KN0QvZB9MYL5zLipmuQungkcT6mcYL27R9dWKxD9WpfgkpJag6DPcRJWDcG17+Bq
         DXfwfVTUOi5EOLnsGUoSDUUMNRGH7wRNw2PnuPNw0BpEfc9XqZrXTCOPPfnkKJ+Vewt6
         xhCg==
X-Forwarded-Encrypted: i=1; AKwUvBzPOe+o6ffMliwcpkO/SiH0hzUXVtTPJjuG+QrSUzznA5J3E1F5GxQpBK5mifQRZu6sXt20VPyGxBOP6RwTiYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCbK3fu9o5W2UJaN3ASF33rtxWze2HxRHHbo3UZzE2FsB+a9Q0
	touAZZoLFWC/QU4dtjwfBe1S5MMhQVoA7koeFbsSuk93i/l3ue8hrmiq
X-Gm-Gg: AYBFou2XMRYzmX8UU6iCtZOZS0ssRuWqQet/1CepiEicyfQS0EkpVtAlyrU5okvXbqW
	E0u2WY0N3SPLYuNznlT4PpK/xaIoTO6KXqNrxYmxjFt52GI+q0XHHxs9BfEK5/cyjPBEk3rpXx+
	pDo2vYE6GSahRnXtd4hqcnTsH7UUj8M2OqLJ0OM3fIXGATyCS/vCU98H5cNR5P0NMVeaQEjexJ8
	M/r6WJnsprDcQKjo/8pyxe/91TxPSchhJhu2Vm8d+2ZEsg6Y3TpeQRtTlaO6wIBc6aqt4Auom/5
	QBo9Q0708vdw7sgg7QlurJBpkM8sA6aCs9AOteAj+19zeFIyuO7IJ7mfxlaUuzUzTtcAVpnAd6x
	GM7WTLdPqohK06lEjUqfve5775MzWXGcLzsTdlknpMbATEvIVR5HXeg9EnlJ5uqYTcAcBE0Pi3O
	BJOJQ3D3fCG73ybbsYp/eRTdCB0AjR9Nr9vNiZbBmerQRSQoPmF3+bAeFlagBADU6zgvXz
X-Received: by 2002:a05:6000:61e:b0:48b:f1f:8b12 with SMTP id ffacd0b85a97d-48b0f1f8dcbmr2108965f8f.9.1790852164632;
        Thu, 01 Oct 2026 03:56:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690c47dsm5579889f8f.15.2026.10.01.03.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:56:03 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:56:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ginger <ginger.jzllee@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the
 lock
Message-ID: <ar48QGIJ76kQmG--@stanley.mountain>
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com>
 <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
 <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de>
 <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>

On Wed, Sep 30, 2026 at 01:57:11PM +0200, Ginger wrote:
> > >>> Were any more of your contributions supported by advanced source code analysis tools?
> > >
> > > If you meant AI tools, then at this stage, no. For this patch, I have
> > > used AI tools to help phrase
> > > the patch better, but I did not use them for code analysis.
> > Will this information trigger further collateral evolution?
> >
> 
> The collateral evolution will only affect the experimental analyzer.
> It does not affect the submitted patch.

Please, don't use AI to write emails for you.  Our inboxes are already
full enough.

staticthinking.wordpress.com/2026/01/27/no-ai-slop/

regards,
dan carpenter
