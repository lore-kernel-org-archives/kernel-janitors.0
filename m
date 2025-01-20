Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C067C18801A
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jan 2025 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364345; cv=none; b=Z5BodFTpuQ0qslVmSt+9W8Ya2XasGwF8sSOLxy3rnNV2Q5cjqH3qEQBbRXD9R0oMXy2BivFWSI0RqN1dcKHZRwnAde7d3IQAhKjG6rOaL9jyVpo63ZD52Gjyh8IfoJ4Oe2F0HGofDnPUk3sujhC8GbP4EIGRr+qg5bn/tdcwAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364345; c=relaxed/simple;
	bh=Wv9GGr0AHazJMxhAX3/VKaYkMURsMVFubS6MvIpvVOY=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RNxTnNoP1rNM8onVUV22bBuoMcH7Z3N4b3EGWrGprMxVG/Saa3pzTi1iljUyxWRjMDf26WpZKTcuyHJVtdeEXlbvEM4tlFtn1Ny5+4Fm0oc9P9IJsMuFkt9L66VlQh/oRbluEykzd+1huCLDKO+h9KVycrbCY2p9Emu0NPA+C4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBQagRzO; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBQagRzO"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so7097940a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Jan 2025 01:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737364342; x=1737969142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4osUXvd+TS+2Di9MJy5PSYEbWA2axjayFuDdKqIgg0=;
        b=UBQagRzO1tMPAALbRP7aSWKJzG00+ZIkbdSt7S0lmvznjoAMVvyYCwI5BtfJoOuZ9Y
         Dplc/xZdVvHHQoFvheZ3kCfjr8iH9g6+hStngvW8e95/NKwQti7t3Z3KOOTuD/Wb9dC5
         I2MHzCT6fICl+oWI9eCRcDV2M4yUyUb54PGV+lYirWa/q5UAgjwzvXWbvnWJqpSOvKDH
         RotnJhORgbFmxrEW8Lt9mnnbTxcfnfKtitkFXKlwlTwW4cFigYExIDIwveIj48aMLqi2
         fSEG9VpxIY0KbtclwT/INqHsKYeVBrMrBEKytXn7naVqlmNjBqrQEzdqhBkgU9mCYW3i
         5PeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364342; x=1737969142;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4osUXvd+TS+2Di9MJy5PSYEbWA2axjayFuDdKqIgg0=;
        b=rXt0HAu6rhgH63EfOiwZ/glyNVCcWtPjPorCpfe8BN7eFqXNTWai0PLBGDSgq//Moz
         KirBQkepPdokN5KXmR+aUPm9Iy+dhgo+qEzE4V5YWzjeu47r2qbfqmHSwQaX8K8Sn8ZE
         ZsofRehasVh0E+6FAjkayxB5YsqaH0Q/CuCzFF0voCgU8EfwC9qIMzFq6I/pVgdP2ZbA
         /ZyVPXlFCJTx0RPN3TLvnS3EcukYlVntWvLE7b+4IquQIJwNWrK0ck5D7vM554gri2pS
         KL7HFKUQYvkq4nEDegk+8T7T0hXEcRL3xfFuV3ekwgSHT09lzLGN6jW34lhMYExEkwGn
         PgDg==
X-Forwarded-Encrypted: i=1; AJvYcCUcYjltEVgv6zCMpJ9VcBpdsgKO+IS8hnVkddj7fHJdYaSJJxsDyWZpLkEr2SxfY/eARU4nWeMIhhVE1Ly7Fug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb6GTT8e8LXg5tBWX0NyT6IJ4IwI+oP93mQRud/uCAqK4pOIVC
	0J2by1gDq+kEEBH83SsuOlzXys4S6fJnx9SbLTTUpUYBw/54EgNU
X-Gm-Gg: ASbGncuw7EFY23STF/9E6bDjkbwJAXjarmmQkkDqajrzeP2ot/5WhqTVkO7kqIOF4Xx
	6XA2LJE8rTjp1+RcEMp27dTa+ZLpvfe5bY92XkFcxzMa+Yo56CUahe57roCpDfZ+HyLzvaa+sCi
	BiGAybgFCasrNTrRmx9zyyCVFzEtPsEAbQ4Lf5NqEr+3toroZdhOkd0WvQB5xr4vMCSTeK4CbfK
	pDK+06KnQMsj01AKnvsUI/8DkzpQgFJUNBTWADRn88grPiD16DSMuo/Ibkdago6DFgN+5SEjnVA
	E6uzWg==
X-Google-Smtp-Source: AGHT+IElklLj6QKg+R/x3GgEMBdnH8Z21v+tJKjQR547dR4c7DxWk4Ox3nnm2KhNX//oealD30eyHA==
X-Received: by 2002:a17:907:2da8:b0:ab2:ea8d:83f4 with SMTP id a640c23a62f3a-ab38b0b9c4amr1180162466b.12.1737364341786;
        Mon, 20 Jan 2025 01:12:21 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86fe9sm592788766b.135.2025.01.20.01.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 01:12:21 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <246d95db-b12a-4230-ab8e-b81067b4d9c6@orange.com>
Date: Mon, 20 Jan 2025 10:12:20 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug: broken /proc/kcore in 6.13
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Alexandre Ferrieux <alexandre.ferrieux@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>
References: <9344a80d-4e90-4190-b973-e3347caae87f@orange.com>
 <4ec77bfb-16eb-4fa9-b486-8d2db47577e4@stanley.mountain>
Content-Language: fr, en-US
Organization: Orange
In-Reply-To: <4ec77bfb-16eb-4fa9-b486-8d2db47577e4@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,

On 20/01/2025 06:27, Dan Carpenter wrote:
> 
> Thanks Alexandre for the bug report.  It looks like you're CC'ing a
> bunch of networking people because you're debugging something networking
> related but the actual bug is in read_kcore_iter() so let's CC Lorenzo
> instead.

Yes, sorry for cross-posting so widely. Of course this issue had no link with
networking, but I was in "RC7 panic", fearing a 6.13 final would be cut out in a
completely un-debuggable state, and the generic LKML is so crowded I guess it's
easy to miss a needle.

Anyway, Lorenzo did react with record speed !

https://lore.kernel.org/lkml/3719ee8a-38ef-4aaa-aca4-b6d82df51661@orange.com/T/#ref533860e88ab6ed1cc632411e76178797f1135e

TL;DR: this was a side-effect of unfinished work (not in kcore itself, rather in
the memory protections around modules AFAIU), that will shortly be reverted. The
quick fix until then is to disable ARCH_HAS_EXECMEM_ROX in Kconfig.

