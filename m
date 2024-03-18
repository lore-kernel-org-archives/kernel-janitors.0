Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DA2D048
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710753957; cv=none; b=QV3y1DY4ovcjqHoJ1f58q/WS1NEOtDdBXpkLyG3f9A9WNHDRDPWodXgkfNypGi7RD980pVeo08Fb4LAFE82yuOIVPGYMkWWJrE5+y6QXXNIYOySpTaLl0oVug4oxGjlVYhDIDcE0Tj9TDOU2+Ct8pIBjxoXDxMdOyT1U6Yy+xpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710753957; c=relaxed/simple;
	bh=zEOm0EiFBqFYUj8BdCzuvUG8K0L0U3LAU+dVKRjw4k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3UvtjBGqw6GeXvDZbMeGtQyq67U8au4nPdpyTMnBe/CfszotIvJPLmKaoBhJ3sl1vuaTIJsNvFtE9C2qFt+DweXX7orDZ9Ux8KacaHNqW8CdE5jvJyiI4gY4kq5JEnoBKCQXPLWa1i7/dxJdqxuZWSTT9dFDhm6RHdq12Ujh3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=aT6znPyw; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="aT6znPyw"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33ec7e1d542so2201880f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1710753953; x=1711358753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zEOm0EiFBqFYUj8BdCzuvUG8K0L0U3LAU+dVKRjw4k8=;
        b=aT6znPywi018D1glJqK/30q2e2xOFfu9dA5wrsZMju/zuzKH5FedzamUWzusnHwRW6
         5zH+99mA1GPtTbVjWVkHOR8Jlrg7v54X/JYa1krfWOJQg0USN7seE1thB8nUChXwt3EQ
         9YJCJwZhrZ084CYttNpyJq4FQoIlz34SA0DXKkU1gTfHEgZxV6gS0wOdzVeKiZWFZBzq
         VsoYDd56uvFr/WRMcD7gMB6syhNo79XBBRgfLTv5jGqt5WE4JZ2GPsBHG0iu+sBEjXCK
         xgQ/MJFAC5H1O3hIFzANo81s+rOGn4COGwal5GnNeWG0lizhPd38rARo6wn2rInTacLD
         powg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710753953; x=1711358753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEOm0EiFBqFYUj8BdCzuvUG8K0L0U3LAU+dVKRjw4k8=;
        b=bjCgPRjc4RFQTUQwa95wzpUjo3DSJhGh9YhQWyDHa8bRL0moo2RnNX2lPH7DH1ACly
         UBoeKUkLZyHiogbXmllgIO0mzRVWlPs/pFRVK1lqm/dxvWdfvRc1U/FIxw0BUU9luVn2
         fOTwMHFjaoeE5+LhE34JIxYxPuvfFqqapXe5amxoCUjeoW6hc3/erY4Tz1AbJOq+Hff0
         Vvf6sC2s64nBdE2Qd0TmdRpbNBccGIgllpi9ki+cogk7+kVgg4jifVaaDbiDMtJn2T+k
         ho9N1/wx+mMqpIOxC4W3kFo3MGCwHKCE4awgzW/Nu/RpYU8JImolmMuYk3uayCCA1/vE
         A1sg==
X-Forwarded-Encrypted: i=1; AJvYcCUJVgAVVRbemp2/udmCcFioXb1iXwsH4o0mvuj45I0kU0nTPVJpnyxXM2EBeaVsjD7WD7ljNmJMJjbEbPrdJHXE5vdtzurb+0GGZGCg2fc9
X-Gm-Message-State: AOJu0Yw3NRgCeawH/T0b1knKad2wCGsVunVCq3EzzKLpLTSFChnRsDpO
	SjFq2hj8178iBSk/8lwOjzKXX5ZJ3VBOLDaDzyT6cMczVfLil+PGgLQeJFnYDbU=
X-Google-Smtp-Source: AGHT+IH4VruI12d01sMu0QUhvz+bFlGKzrMX1TpGt3UETCdTqTB1BJVof+0IldCD67i/nPgANjkeRw==
X-Received: by 2002:adf:e582:0:b0:33e:c2a5:15c3 with SMTP id l2-20020adfe582000000b0033ec2a515c3mr8423129wrm.41.1710753953291;
        Mon, 18 Mar 2024 02:25:53 -0700 (PDT)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id f10-20020adffcca000000b0033d640c8942sm9355029wrs.10.2024.03.18.02.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 02:25:52 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:25:49 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] caif: Use UTILITY_NAME_LENGTH instead of hard-coding 16
Message-ID: <ZfgIneq04KwBPWqV@nanopsycho>
References: <af10f5a3236d47fd183487c9dcba3b3b3c66b595.1710584144.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af10f5a3236d47fd183487c9dcba3b3b3c66b595.1710584144.git.christophe.jaillet@wanadoo.fr>

Sat, Mar 16, 2024 at 11:16:10AM CET, christophe.jaillet@wanadoo.fr wrote:
>UTILITY_NAME_LENGTH is 16. So better use the former when defining the
>'utility_name' array. This makes the intent clearer when it is used around
>line 260.
>
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This is net-next material, yet net-next is closed.

https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

pw-bot: defer
