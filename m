Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA6032720C
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Apr 2026 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535550; cv=none; b=OVdaWiRaJRZJ9Av7XXSJ30LUMsfS1VISsM+Y3CM2F2kV0p17/mPOfVo90Oi3PyLMlj3U2p0IskVXpeGlc5KTgXxHu9l+hb6WLVujzvzt36rkfO+hldW89e0FtKSN5ob5FB/mk3YtQOKrixptb97dD6BmaSGEBnOBxksC2TAGDbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535550; c=relaxed/simple;
	bh=LNI10YJyZvJ1yuxQYKKVFXk8/kFY+3q7VWLxYyrpXZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nav1rzO3IYe9kcncErpa3we34rhc4gYHQzzQdriBKWeMJiSLKGwti8vF71tcvNkwX8Cl1s+cN/QLmfKAovYlTDCOZVm699UjrrOclDHkZEFoQ6JuVKDSg0hBVLHVKZirUUwOJCym4efIDZypUULmgPc7DI0sOM4/scd1ge9V2d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzohliYs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzohliYs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so6640905e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Apr 2026 00:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777535548; x=1778140348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jb2qUXgIUCBo1318jUIo2mYxNd+0eNFEYCws8Uf63UI=;
        b=gzohliYsU/C1iPG+hgVHKJmYXXl6o1w9LuYQxT5SY/mc9XRrUQzf29dSQmQQgE1BzE
         nGPuldSxhwRC/5YVswCnm6B5VN1dKqe22ks8qt2tjx/ETSKcPjNqrAigptZEs/LO7+eY
         etNSTOp5hEqNx7NZysM7V56qoysKwS00LLfrDn13hgQGpc8DV1nVhMNtQAdXMcWAU1VS
         MVSz4z+y1FMihqumM3wWh8bSwbU0AS2ZwVfWqoPoE2r6vbGO3zBPYx1t2rNs35eUjGSi
         Pdyq9RukQb7GmE94dHrHpjIM591PUwMIfzYMbXp/7jzzSqZnisIHjRvAEy0UJ3/np5RL
         gdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535548; x=1778140348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jb2qUXgIUCBo1318jUIo2mYxNd+0eNFEYCws8Uf63UI=;
        b=DdKdkeE0wZqDYA6rRX5+iHlvH7mV2ZYzyp/6ccP/7S/vBNV0MJyr/SDiq+6pWGTo+3
         GcQGH37xpzDvGiCLpn+yQ5Ez8c1RMP4wCOfi/5GyYgGThrV68tu79Ri5U2ztgmVX0Ogf
         GFbUurIcVVwJcNMFBF1PMsSVjnUH7JjdXQ/gxeKz1tZqdT9kofYBcYte0Iq7O29HFVte
         G9nEVtZxPMQmc65XZGLOmbMGwlVk8PY8HeoQeDhJTWnTvrf4jV34GkD2XvfUQS2Q4Yha
         Oqvh26Px06WgfybR8MDAGO5WPe05+7fE3hHahTQsAIvhIChmdRI0aRgUDYogye710E9D
         vVxA==
X-Forwarded-Encrypted: i=1; AFNElJ+RI7Fh66PKSmL+wdbTZ7x+pWuCzxnqbQ+OMuwaPSOQkeNk0Pz9RPzkh64OEdpUFW8Ygy14TD2OTL3P4DzRpkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzso0U5GlKBzqiMip1E6Ct4VTpF28bqBG5nLpAX6kTIA8GQ+LLK
	6FtyFzniKIMcSIm6o4xa3ZAYSpBja8Tr7e80iBknycL2uBVxGeVD5yng
X-Gm-Gg: AeBDiesT804VvpsDSdvn69RKG5lypKhCtGJfk2UW/phwcqllUBkdkEUUb6vdJQaoNSd
	rmAo3irzsIB7ndDVlq8UqS90Wv50IAhQ7wEevGZRAyhVpaQKp74Xklu//xHWEhqwijvCHcoBqsY
	t+arX3Mv5RU4NmBZbcuIZQoJBzck0PkO59nuXPqFs8QxP1Zf41+t+N0hQr1QMlX+E6uMMGumLD+
	PJAOLrBk/HR1rTqyRjvjZxyO7XSPMWQdElSNnxT+ozc30HEkanJZJEyCPxqvEHozywBjtPd2W+9
	W688TzljZcxnOw51UV0Wd9vLsmyxm8EHIxdSkjAm5T7ZIb/tStkQOG8b2p+Hl7LBORDAJwK8fZg
	zZEhvkhZc+hb0+5M2r/JxUae1vwPInfwWkXv7LsxzHA19OBuuMsYv09P07TCJRELgIAa+NeR4x2
	2sw1pe6A+IaKg8P/O7n7wKwAtMhU44ug==
X-Received: by 2002:a05:6000:144b:b0:43d:7e6f:3816 with SMTP id ffacd0b85a97d-4493f42c2c2mr2632064f8f.40.1777535547523;
        Thu, 30 Apr 2026 00:52:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c00sm11298821f8f.25.2026.04.30.00.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:52:26 -0700 (PDT)
Date: Thu, 30 Apr 2026 10:52:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Raja Mani <rmani@qca.qualcomm.com>,
	Vasanthakumar Thiagarajan <vthiagar@qca.qualcomm.com>,
	Jouni Malinen <jouni@qca.qualcomm.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] wifi: cfg80211: don't allow negative key_len values
Message-ID: <afMKN7JK-E6lIsuC@stanley.mountain>
References: <afLzlDT5VF4D746w@stanley.mountain>
 <fd142d26dbc632b26fe39ba8be29d4915a9f92d6.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd142d26dbc632b26fe39ba8be29d4915a9f92d6.camel@sipsolutions.net>

On Thu, Apr 30, 2026 at 09:05:35AM +0200, Johannes Berg wrote:
> On Thu, 2026-04-30 at 09:15 +0300, Dan Carpenter wrote:
> > The ath6kl_cfg80211_add_key() function has an upper bounds check on
> > params->key_len which ensures that it can't go over WLAN_MAX_KEY_LEN but
> > it doesn't check for negatives.  This could potentially lead to memory
> > corruption.
> > 
> > Put a bounds check on negative values in cfg80211_validate_key_settings()
> > to prevent this sort of bug in the future.
> 
> Clearly this commit doesn't seem problematic, but I'm not sure I see the
> path to it mattering? The key_len should only ever be set by
> wext/nl80211, and that can't really end up with a negative length?
> 
> We should probably just make it a u8 there, no way it's ever bigger than
> that, but I'm not seeing through why this would matter much right now.

Ah.  Yeah.  You're right.  :/  Sorry for the noise.

regards,
dan carpenter

