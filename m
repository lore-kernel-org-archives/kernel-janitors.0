Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4643E14D2B2
	for <kernel-janitors@vger.kernel.org>; Mon, 13 May 2024 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715601378; cv=none; b=JJa19gPcsIQbCUsmOuekWCPzBiGwQP8Tnwvm5LevZ7mdYUfW7D5xePyYfal/rirfjsvWhyesbO6ze35mn4gch1Bx07OCeucYKYIK71tY1xSxFrskpiSvP1z0yvPjavu+5PgeIFBfXiIC7futw6Xyhd4Rfz47vEfYtT02ofXpAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715601378; c=relaxed/simple;
	bh=/K5+pcbqvHdmlKOIY6EGxlQYW8ZajxPOAOvXpRv0FbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMIdBNHIdlthl90/T+CP1Rjf3Te3WQMbMSxmc0X9Lpd2lAlLoPuugkR4x88vxuTGnJSZ2DMeXlWef/G2uHKuhzb3fxOHX591HUkodIu2vL50fEjZ7KIoij11bXxQsTtKoiIl8eDkt3qG9Yc7pSl6fppLnvidXQkIbTv67hLVkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Kew62/v5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Kew62/v5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-420180b5897so4551735e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 13 May 2024 04:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715601373; x=1716206173; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SVjlWqAdfLnp41PpnyNhWZSZIhghyWvNnJwtCIztyEM=;
        b=Kew62/v5idseMPnkp4F3MIDryaF9FFyCBe5IoHp8kdaIv6s/GZeDW0KGqOLqak6pH6
         vcER/yR77fsBwjMmEo5E6WugXHxSkbK0gRbnml211CHOyWG0Fx+tVLP07fjYDFVO6Qim
         25V7eS6KfLRDl106PkmJdncPCcR1PTEmidqk3mjaS/ggoe869ELFKrIwjrlcJpOI5hrE
         4SRwHicZx6qaFmaCmAHU5I5gX1jPTii/a7t0+p8tKWfALRLBFsZcCM5SAwE5mDuKxEGa
         c39mY99OHk2VkgwuLTh7rU0JKXBRjYFSYp5SVDWNh/2/uZY3PzaVPMFC7MWGUrJJIeBJ
         Dy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601373; x=1716206173;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVjlWqAdfLnp41PpnyNhWZSZIhghyWvNnJwtCIztyEM=;
        b=KuQ95dw11eNhMxAGTG1ygFuNVTJ7vo46hm9a7QRu8mghT8e1s42YOim4GNWS4W2YGW
         QfapJF43pMRFBxsjHR4ED1lTyZHkqMCaNnqIKpf6okblXQgFyUGwoN365uEirSqvvqLX
         /Z5pO+yt16vf0Zkg2Q9JDT8RRDEIr4WiIMUeQQlX+2p4xD7lN3IEV0P5vXEPh6/qxudD
         YRqXc5Vr3OEaUwquZlgnhIn2mjwUcI8a8RxBJDjmeUG2v1bHUm61wLBNeGH74M/6O6N9
         NGUioUkz+YlgmKnDFNTrI9LdB6XV6mpb06CWLav3Tjxr/lrh5xlawHsjRVC8RTU53ex+
         s3uw==
X-Forwarded-Encrypted: i=1; AJvYcCX1grJLh0+xRVLu6fxgwEIFWo/qpDSQKyy4vh36XbFqRjP73NMtrJ5sLTYdmaYPoQBw9WX8YdvSAM/QQJsMI9SUAIEX+aODnxuLC7ufsMmB
X-Gm-Message-State: AOJu0YyoQrngkcUQ6pGYxl6GTSrBAHbrD3ycreAqfWXCLvL2I2vABOq/
	NywnW8wGpLSrxaxSyzNBQAIay+jcuJMi5iW60H89vEA+kmWBMSA8G/tnI149tpI=
X-Google-Smtp-Source: AGHT+IFgswfetSuy8fSnW1jZdJ739NMwh+RprYAmO4yJuBB3g7hQJgzPn7f9sw3vDrnKs/BAr/2Q8g==
X-Received: by 2002:a05:600c:3b26:b0:41f:3ee0:a302 with SMTP id 5b1f17b1804b1-41feac55f70mr66726895e9.30.1715601373573;
        Mon, 13 May 2024 04:56:13 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccee9335sm154180975e9.29.2024.05.13.04.56.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2024 04:56:13 -0700 (PDT)
Date: Mon, 13 May 2024 19:56:05 +0800
From: joeyli <jlee@suse.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Justin Sanders <justin@coraid.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Chun-Yi Lee <joeyli.kernel@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jens Axboe <axboe@kernel.dk>, Kirill Korotaev <dev@openvz.org>,
	Nicolai Stange <nstange@suse.com>,
	Pavel Emelianov <xemul@openvz.org>
Subject: Re: [PATCH] aoe: fix the potential use-after-free problem in more
 places
Message-ID: <20240513115605.GE4433@linux-l9pv.suse>
References: <20240410134858.6313-1-jlee@suse.com>
 <11361de9-b145-41c0-8d5e-5312cd710124@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11361de9-b145-41c0-8d5e-5312cd710124@web.de>
User-Agent: Mutt/1.11.4 (2019-03-13)

Hi Markus,

Thanks for your review! I will send v2 patch.

Joey Lee

On Tue, Apr 30, 2024 at 06:16:00PM +0200, Markus Elfring wrote:
> > For fixing CVE-2023-6270, f98364e92662 patch moved dev_put() from
> …
> 
> Please add a subject for the mentioned commit hash.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9-rc6#n99
> 
> 
> > This patch adds dev_hold() to those functions and also uses dev_put()
> > when the skb_clone() returns NULL.
> 
> Please improve this change description with a corresponding imperative wording.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9-rc6#n94
> 
> 
> …
> > Fixes: f98364e92662 ("aoe: fix the potential use-after-free problem in
> > aoecmd_cfg_pkts")
> 
> I suggest to omit a line break for this tag.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9-rc6#n145
> 
> 
> …
> > +++ b/drivers/block/aoe/aoecmd.c
> …
> > @@ -401,7 +402,8 @@ aoecmd_ata_rw(struct aoedev *d)
> >  		__skb_queue_head_init(&queue);
> >  		__skb_queue_tail(&queue, skb);
> >  		aoenet_xmit(&queue);
> > -	}
> > +	} else
> > +		dev_put(f->t->ifp->nd);
> >  	return 1;
> >  }
> >
> …
> > @@ -617,7 +622,8 @@ probe(struct aoetgt *t)
> >  		__skb_queue_head_init(&queue);
> >  		__skb_queue_tail(&queue, skb);
> >  		aoenet_xmit(&queue);
> > -	}
> > +	} else
> > +		dev_put(f->t->ifp->nd);
> >  }
> >
> >  static long
> …
> 
> Should curly brackets be used for both if branches in these function implementations?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v6.9-rc6#n213
> 
> Regards,
> Markus
