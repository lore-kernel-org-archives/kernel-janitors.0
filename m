Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676C7F48C
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Nov 2024 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732175426; cv=none; b=OPZCGMM/BSDRKyw/xkrMJnxQ9gjU1aqOCXIvmQXopI19slSTTDZ2fPQpxUeXk3Erqu4zLD6sDo5W0Giq1jwufb22TnP4C6bHbEOGYx9WR3vf0/lTK9foORXMdmNjXtsWiOOKUcRXP1RiPYL1R4orBwHpxyPL/zbpVMQ5YHJgJg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732175426; c=relaxed/simple;
	bh=wM1iOQ6QD63YeR1jXPE90LoDUMaLyTJ5BbHjBNMp3YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfKfbet666JTL5OwwCUaUKTrNOl0zoKOYMgaaUwz++EBlqjWl6ZhgSpm9/wkDQzdVBldqBSavGxreBgvileBgNAoxtOvoqMbuZ3KsF3ODbRHj15XrpJed27q3OeC3FVHU8+5hyyUBKVjx7jOJyXPRfYXrxdG/eeofqCWVNOF+BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JFY17lLQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JFY17lLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732175423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0S+T9jzGoJUnwkGSTavJ+CCZs4lI12ayfbKOcBesSfA=;
	b=JFY17lLQPDWARm61gIVz0pr/eGhc5P48kFkvjSJBUkFKlTHJpbKi4zYH3ui7T2vtVryCUd
	8Z2NNESx44BC9PtGkHFbNE9ektbNc4dy8e1NnYIjHy1tJV5RIMfCxgNCmvsEgeNXVWS+8d
	UCrNbMz6x7aufmvGW4f/vDlC/lEJ+XQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-h9WwjvfMMlSLinhFiQ21rg-1; Thu, 21 Nov 2024 02:50:22 -0500
X-MC-Unique: h9WwjvfMMlSLinhFiQ21rg-1
X-Mimecast-MFC-AGG-ID: h9WwjvfMMlSLinhFiQ21rg
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4314c6ca114so3945065e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 20 Nov 2024 23:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732175421; x=1732780221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0S+T9jzGoJUnwkGSTavJ+CCZs4lI12ayfbKOcBesSfA=;
        b=a8VimSih/Qwq+3rtj7v/RjvLZqbGAs02gXbjmFZp3Ixp/CPrZOPtpPEu0+ARyA4FKl
         jZddyXJWkeuV9P8HtKNk1szAwsNqYawXdKhTSSSa1dRNaNXrcGDHUlsaUUag5jfrlklR
         As87F6/mlX5x2QoXu+CzmkxRdoN07JU7L9p4G2fwDu2bVJWuHmLwJLW4VRDyqyCunSEY
         aqtSToywKwZPzzic/vxvpjGYFqWcfAqcmOMhrP4efVO4f26IVtJqXZbhS7shXyt+7bzg
         7jdAf9SxZzaaVgygjHe0vjYYnfZncUxBnFPG4NNVADR3uPQHU60S7tjo34PjDAJ1Lt9o
         I8yA==
X-Gm-Message-State: AOJu0Yz7gvEgB21l/nFq0PKVGOw49bj7uDtzfeQyXnflCmPfi2bVQh3y
	4OaoqfmrGRouwIibkBmTsKkpcPM4CWZr6UHzyCK5zCjmvjC/pxQerbwR9OAeC5mIpm1n2/XqqKk
	zaHOFX6O8juYCC3kCs2I5S2GnWBV9p8+TJErM1DboB4fU47LsrLT633uQD+TQGD1Adg==
X-Received: by 2002:a05:600c:5125:b0:430:582f:3a9d with SMTP id 5b1f17b1804b1-4334f01f731mr44704285e9.26.1732175421284;
        Wed, 20 Nov 2024 23:50:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhYF/d2fapOg1q5yG0D1rBPToLlrBhF2TIDsM+dmIvzhgUy6ZfNWGyrQrrlZIRDBN2+NP6UA==
X-Received: by 2002:a05:600c:5125:b0:430:582f:3a9d with SMTP id 5b1f17b1804b1-4334f01f731mr44704215e9.26.1732175421004;
        Wed, 20 Nov 2024 23:50:21 -0800 (PST)
Received: from [192.168.88.24] (146-241-6-75.dyn.eolo.it. [146.241.6.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254910e77sm4075444f8f.59.2024.11.20.23.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 23:50:19 -0800 (PST)
Message-ID: <1c5d7ea9-ba80-483b-aa30-02ed7fb110d9@redhat.com>
Date: Thu, 21 Nov 2024 08:50:18 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] octeontx2-pf: remove redundant assignment to
 variable target
To: Colin Ian King <colin.i.king@gmail.com>,
 Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>,
 hariprasad <hkelam@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241119175236.2433366-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241119175236.2433366-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/24 18:52, Colin Ian King wrote:
> The variable target is being assigned a value that is never read, it
> is being re-assigned a new value in both paths of a following if
> statement. The assignment is redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

## Form letter - net-next-closed

The merge window for v6.13 has begun and net-next is closed for new
drivers, features, code refactoring and optimizations. We are currently
accepting bug fixes only.

Please repost when net-next reopens after Dec 2nd.

RFC patches sent for review only are welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle


