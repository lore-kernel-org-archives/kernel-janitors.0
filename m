Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8E01EE029
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742405938; cv=none; b=JBG8vLC5Sqqs0WZhMbFIo+aifthCq2i93JKG1UA8JitbILm8cllkciw2PdAM535AW+WdUQbEzV9AZEvRfkpIzdVerQRJWH1Hu/xfFqfImitC5zYnhzBthnLr/d3m4jsUv6tldnAoRHSQH97mY3jhSTZJKAABvtcOS/qC7eKOMZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742405938; c=relaxed/simple;
	bh=OS750zsOhsm0zRWuj41DPLa6HTkZm4qf9YADRneYMmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnR18IhMghUgDofqLQcn6yKddFvQW0i58oQDxy8jbf9RVWHMe/VOA/JvjmpIEGls4Wbevl1TQ9PMAJLfaog+DVs+0u4oLHRmDjEstIdVzuPLqFbHMMSwRsgKy/REXb83+pfUuT0phG1VE7Atb0NsYttqZ4EGp0tTF6jLs3oy2rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D32iwhrI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D32iwhrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742405935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOucbCH8053ol58iaNfOQldT2PnQaQ3dzjaib8K+1rk=;
	b=D32iwhrIlTlKLP4u4B5THu1zWk/r4NzCV6gY6NIfB8AdjhvaKeXrljHIGyimJ/74c1Ys88
	Qo6R/BP1z1v+ZYTTanjyHqGdHp1jpAqhZiAKE18o+j0B9HWfiH+2mRpS0AT/NrHaKTtLYE
	6q56iyqyI0/Iscs/A/n/5Yn+gDrU5O4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-xNZeWwdzOHSERS5NnNw1EA-1; Wed, 19 Mar 2025 13:38:52 -0400
X-MC-Unique: xNZeWwdzOHSERS5NnNw1EA-1
X-Mimecast-MFC-AGG-ID: xNZeWwdzOHSERS5NnNw1EA_1742405931
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3914bc0cc4aso3988840f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 10:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742405931; x=1743010731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOucbCH8053ol58iaNfOQldT2PnQaQ3dzjaib8K+1rk=;
        b=u11NLJQpij623jasMIUmpZsIeEhuO0gXcpjdrSP5wzcxG0HaAab7uM0c1mWBQThI4z
         +9iIR5uQXU+UKdgb7oNl4r4msHCg5jaOWf3/gcMhc06bMKU20M3/qlGtDmIpFYLCkCtc
         m9D7HZXZdtmlQLmkcY0tKLNOhX1veHDb2XC2EZd9RvvgqwakbV9wKmBKyBYUmBnXke5a
         T7aL9jtOMav2B/F039mXvfU5auoRUj1ReibgYI36XL/qf4w9/ZtX6C2YM9mLtxQK1Bvz
         eGVxwezS5bTGJwrk6QajPEdxMZ9ebYR5wQqm64UErs7d2f0N2UVU3ORWSnoutVWs7pzg
         L1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcSTq6FmaU+pP2jXL5Nd47ir9WJARuQ6gpKwdYA2eyWHAWidKU9HsqS6Sf8NNa875SunX7U3EUYjq+F2zeZVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfG5eTCedKG6WtZ6HxqJ65rOIqQX+Y4t693MNwUPdpDbsW8ohn
	SlIbynTAXm6BVEbFIAFMyvHGZ3KnQVZbEeHHXlKn9a9VhlURQteZlz05babfwp654W4Som8aTz6
	heLUjksXGT5EO0+k+sIt+ksI957K9lxcivOObxBVNWQK2lmWvpczIgs5h+nwiBMshkA==
X-Gm-Gg: ASbGncsuT6T9XF6Y0M5clMBSbJBqVoEoW0ttsJKD+DtgjCJNndezcTHLz17yGCkWITT
	/6Fk7mWdzSlHBUd7Jf1XA5RKUXGrFce9XdqB4a2L8ol3UYIaT1q9q1x2DrBsNFDmqidlkWl7VET
	DDiN+shTITTS8Z1HRryUlpUKbyWY7EJ0GQnTnUVPP9HIJFDjfHCcFv0iYE5gG+GicEIc06Tl8db
	zCyZUQvxu6U2G0dEDMnhqPmUAX80rAXQv//WZvx1bKe6YYUThq+XBYK1ZbmpXjrVRKwOZc0X4hK
	h27+SqGk9aEjIV/+0DqPcrdkiiQVykyIljgxMbMF3YFtpA==
X-Received: by 2002:a5d:5f84:0:b0:391:46a6:f0db with SMTP id ffacd0b85a97d-399795df888mr243972f8f.37.1742405931390;
        Wed, 19 Mar 2025 10:38:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHG5Tm2aTbhmmrCTzYClNAc5qOmeImMeQaQKe4i+YdSRkAsvTNxuFmNMQxghPMgkdbjpxDPA==
X-Received: by 2002:a5d:5f84:0:b0:391:46a6:f0db with SMTP id ffacd0b85a97d-399795df888mr243952f8f.37.1742405930965;
        Wed, 19 Mar 2025 10:38:50 -0700 (PDT)
Received: from [192.168.88.253] (146-241-10-172.dyn.eolo.it. [146.241.10.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb8c2sm21081012f8f.85.2025.03.19.10.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 10:38:50 -0700 (PDT)
Message-ID: <6365c171-5550-4640-92bc-0151a4de61a1@redhat.com>
Date: Wed, 19 Mar 2025 18:38:49 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] xfrm: Remove unnecessary NULL check in
 xfrm_lookup_with_ifid()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <2eebea1e-5258-4bcb-9127-ca4d7c59e0e2@stanley.mountain>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <2eebea1e-5258-4bcb-9127-ca4d7c59e0e2@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/12/25 6:21 PM, Dan Carpenter wrote:
> This NULL check is unnecessary and can be removed.  It confuses
> Smatch static analysis tool because it makes Smatch think that
> xfrm_lookup_with_ifid() can return a mix of NULL pointers and errors so
> it creates a lot of false positives.  Remove it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> I have wanted to remove this NULL check for a long time.  Someone
> said it could be done safely.  But please, please, review this
> carefully.

I think it's better if this patch goes first into the ipsec/xfrm tree,
so that hopefully it gets some serious testing before landing into net-next.

@Steffen, @Herber: could you please take this in your tree?

Thanks,

Paolo

