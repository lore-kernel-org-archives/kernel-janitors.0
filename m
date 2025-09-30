Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D51DE2BD
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759241983; cv=none; b=rqeCyGqc6P3aG62jDZDpeITtzGjpRrNJVOv25x2ytcKj6yuG4/9+qUfWXcQ0i6R40Gc+luOQp1ZXp9lxoGwKXtkzIAL05DQt38cjjVDqdn5oGX3gspQxgpkvHi8o24bIIds9vPsIZAPvCitVMyxQy/sexJxBqENBHXnED5j1E9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759241983; c=relaxed/simple;
	bh=GSqtGKeLEkDO8mOc2Pcj0fzEKM7m/L0trIvQsuHGZ+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpW4pWCHJ6/O/TrCDuVuChKvBmb3YqlsUDL1lpDli0Y87wJVyGLKP9NJaUM2DQ81A3vh+Jtqo0cMvQhE3VGbhsVhtuZcQBKSjztSZl4B/V08XGrMF8Ipv70JqNlLcZOb0P0c6fJczO+nIULFR7mTmCRPCCQIAqxptQ2v/3EWSsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yhxuy5ew; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yhxuy5ew"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e414f90ceso9833765e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 07:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759241979; x=1759846779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDjqq7jrvNjkxYsdvJ5PPEYM1NX5CibO3X/31GcV+t4=;
        b=Yhxuy5ewqtHtT5+GU5Z05rg4D2EA75Q9+s7iO1LX9UbDq6Bt+M4RjAAM19KhgnaWED
         1hgORD0jrKCg/7kEmkdm3DSv+aieNIIrRxpDtaCWrQxxH23L+HthN6u/s2qch9xOHJCx
         h6hw0f0EduAWK7XUJfAQPv0tTUOXdELc2e0+Z+uqpxXTRpHlUU5Xxds1mwfcjKVW0H+4
         Ybr/gCovG6tgtJN9J8fNwQ0fWBRYEOsbBmWzZdGaFWj1lfvqBBY7QYk9t7T2JmqkZc+5
         J5DzHqU/CZtF+8uk5ZjZh1Dv1uzbhh07CXYsRFWTqMUTn0HNV0xP7UNm8aU9B6WtqDci
         2OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759241979; x=1759846779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDjqq7jrvNjkxYsdvJ5PPEYM1NX5CibO3X/31GcV+t4=;
        b=DOC2dVt8OdsXLiD0h9i+FF/FWnYfsOwskIugEMRqOLUYlZ58FCUz1JW9HYHWcvHSXv
         hImkZcG3pGgQ54KLlMgOwBXiZAyUpp4hxHS+8gZ0+Qt5mcK74wqwT85+nWIpkKTWlxoS
         eiQ370K/NB47pZMbc5wQXMXNN9tZ8gw0MlqGP7yEvcomm0fItdVHUC0eZfg2uBr02YSC
         jIBFN9QXebcdwsQ3HkBSnZcTtb/RxCz5+T2kGEhLhUaYUSnwqWl4Mrcu2fwfAA/W0WvG
         1oj42qZ5B4W/YJ8UEktKZEVP5ugD0Ozaei9hsaS36kbeMBOH2reRD31g6+kd4dJimWX0
         3bGA==
X-Forwarded-Encrypted: i=1; AJvYcCXQUaTD9LhlOZpHvEIXzX0Ycp9i3V8u09alcc/eWhfz6ATLg1vfdFg124MxOyZ3KRYwbzWH3eRAADIPoIs1KMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAAvKpllKh31UXtnopQ7VoNyvcyJ+fob3Y7QGBspxn9WRLleQD
	sDCe6Lnk9nfCLYZeNWA4hBY8fHjguDB7u+hD2Laqu+QUCpaa1UGUuSy6aUFwfyCJzQY=
X-Gm-Gg: ASbGncvfqa+1A1nJ6teQPp2rtE91WFtFVcwzRC38nVu1w+3nh3rh32Q+CpVUHModsfq
	dtKOAslN0VKOmvL8UjYmEZRfx5qEYhzPITHA6JLPPYWuyHUVQDNcb5Y+bJ5ym8ZNRyMFS6OYub2
	a/mycGKd+NXmsRCfycdahxBTGyZtImXAwHasGC7h76vTCVGCM+6xKMbuXZWHcEHRZHiBOmjBJLt
	jmTC+lTZywc6y9WSLLEAsTC0KrckvJi2RotLtDzPFwlauo64xN6ls39/4xY3y1qVA8L3xLk3NBT
	QzOgtKH1lxn9RV5RKDGr2KnkqCfb1lwF7g3ZFbyoRGZkjX+dvaHXU+jmONSdF929F5m48h8E0vF
	4i8Q8k6jOjOyD4+zhdSKlET922sYV8izei3/Ykwf6mgkC4ViUHKerI2Sccvdf+Iw=
X-Google-Smtp-Source: AGHT+IGZAD/5oX1ipv48pfdQeRFK5TqRyymJQORmTLlc+sbKKPcFj0zcXeK1EO+S0yZ9fWsth2JhjA==
X-Received: by 2002:a05:600c:468e:b0:46e:36ba:9253 with SMTP id 5b1f17b1804b1-46e6127b93cmr330185e9.15.1759241978952;
        Tue, 30 Sep 2025 07:19:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e56f3dc27sm67637095e9.5.2025.09.30.07.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:19:38 -0700 (PDT)
Date: Tue, 30 Sep 2025 17:19:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: David Brownell <david-b@pacbell.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Christian Heusel <christian@heusel.eu>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] rndis_host: Check for integer overflows in
 rndis_rx_fixup()
Message-ID: <aNvm91A4Mmu_qamc@stanley.mountain>
References: <aNvOh3f2B5g0eeRC@stanley.mountain>
 <2025093055-awoke-facedown-64d5@gregkh>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025093055-awoke-facedown-64d5@gregkh>

On Tue, Sep 30, 2025 at 03:56:39PM +0200, Greg KH wrote:
> On Tue, Sep 30, 2025 at 03:35:19PM +0300, Dan Carpenter wrote:
> > The "data_offset" and "data_len" values come from received skb->data so
> > we don't trust them.  They are u32 types. Check that the "data_offset +
> > data_len + 8" addition does not have an integer overflow.
> > 
> > Fixes: 64e049102d3d ("[PATCH] USB: usbnet (8/9) module for RNDIS devices")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/net/usb/rndis_host.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> David has passed away many years ago, odd that this was sent to him
> given that get_maintainers.pl doesn't show it :(
> 
> > diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
> > index 7b3739b29c8f..913aca6ff434 100644
> > --- a/drivers/net/usb/rndis_host.c
> > +++ b/drivers/net/usb/rndis_host.c
> > @@ -513,8 +513,9 @@ int rndis_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
> >  		data_len = le32_to_cpu(hdr->data_len);
> >  
> >  		/* don't choke if we see oob, per-packet data, etc */
> > -		if (unlikely(msg_type != RNDIS_MSG_PACKET || skb->len < msg_len
> > -				|| (data_offset + data_len + 8) > msg_len)) {
> > +		if (unlikely(msg_type != RNDIS_MSG_PACKET || skb->len < msg_len ||
> > +				size_add(data_offset, data_len) > U32_MAX - 8 ||
> > +				(data_offset + data_len + 8) > msg_len)) {
> 
> Nice, I missed this in my old audit of this code (there's still lots of
> other types of these bugs in this codebase, remember the rndis standard
> says "there is no security", and should never be used by untrusted
> devices.)
> 
> But will this work?  If size_add(x, y) wraps, it will return SIZE_MAX,
> which we hope is bigger than (U32_MAX - 8)?  That feels fragile.
> 

SIZE_MAX is always going to be >= U32_MAX so it works.

Right now size_t is exactly the same as unsigned long.  I think we might
end up making it a separate thing so we can enforce stricter checking.

> Then we do:
> 	skb_pull(skb, 8 + data_offset);
> so if data_offset was huge, that doesn't really do anything, and then we
> treat data_len independent of data_offset.  So even if that check
> overflowed, I don't think anything "real" will happen here except a
> packet is dropped.
> 
> or am I missing something elsewhere in this function?

Yeah.  You're right.  I don't see anything very bad happening with an
integer overflow.

regards,
dan carpenter

