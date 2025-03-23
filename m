Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476E824B29
	for <kernel-janitors@vger.kernel.org>; Sun, 23 Mar 2025 22:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742767538; cv=none; b=iruOQvQbKAVw1uFNQyxwwumt85osQ2x8P+kl/FkJ1/Y+jXDhSaWJMCAteSjnSyLMEQDdBbiBfYhWrcK4nQOHLYeA6TDkUZu9WybEmxoMz6DwWdBS4t+Z14CSjK+27oCdE82ioSQwh9skMekBk7u1MKgJSVFDopf/0IWfyN/BeSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742767538; c=relaxed/simple;
	bh=r/CoD5XmtMpwNiX0LLYeiQn36Tx+HgpAlWQZYih3lB8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=TrVK7GXDYldGueLVOS7UkehwHfMyywFffIOCqxYKFGu3NF64TKiKXmn8cEUPrrZKbJ+2cCsklb/CQOIKGChpd8XLC8ZyK3YPNDPiyTCaZY18MXLuLRu/5BsZjpJqLZBwanFDbZwWRBjm+dqSpcyqRn16m1Ps7WGrYWCtYvpLN6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncOoY0A+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncOoY0A+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so487678066b.3
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Mar 2025 15:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742767535; x=1743372335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:organization
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qv3ehsHFVN2/X29UoY1qZEyzVsEZP4Z/AO70/pcJ8w4=;
        b=ncOoY0A+GpRlcO0NAyg4NIrWMIkj6SF6ezTlyNI5Nu9SijtoNCW6pF7FY1qYUcMIYU
         Xlse/96yOFynHTzpvyQSmNoie2suEnnCHWuWVnZ6INhZ7nKSCodWA2U4uPDSCrgCf6xA
         mF8rIJ/ukSn9Nyu9h4esxeiuAFAbONjjBCBhyTlEdFCu0enm5Win1GvhDLo7MkbIgH2w
         JMZbymOtZuE1Mwi2huj+0EVgAih+aU0iS2c/8+rbJmFyLalc4tRXSCUh25Q/+oK8g6gZ
         5rpzdLY/aPDf6rEAQlFvX9UhvrqcMrh7pZLOQxbPbUKlk/60NTklyx/DpwJV0ZWm/f7M
         aE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742767535; x=1743372335;
        h=content-transfer-encoding:in-reply-to:cc:organization
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qv3ehsHFVN2/X29UoY1qZEyzVsEZP4Z/AO70/pcJ8w4=;
        b=pMTPBO9mqZC8agm4NO+etZlv6AY8/JBPZ6W+agk3sQEiIznGjrhxzxcx1iVBIK+Dvv
         NUFZ1ZBuFpIqZAkhptSzjGXMFHSPgCqLViHpkd1PH6BN5jvCxbHXM43e4RLntiKTPRV3
         VRSK9KDj0JVWHuLEBt+kQsfzGBebLpy4TJ04RaXRSwsYcFMDh1etDcniXngGLP8ZoM2E
         r72ztHrwqmE3Fqt+ZnZHuRqLYt0iWwBmP36D+aWg7f85ecq9HqkJMAnmKkQhGlE3TFUT
         Xs2omD/tUqYkPW7IhkI3yqclruK2DCexFGAfSlu7VSXY7EcZgPYnxvvHQcj35FhMjpwQ
         02kg==
X-Gm-Message-State: AOJu0YwLSaAQqM8n3ETXmstPlhotMvWDhBhv/hogfruXsUiDPLtu4yQ4
	uE3XSuuAjL66HLatUzsHmymICTsxGpkPS+vqAZPjAfNViJ1+7w+cz7B5ew==
X-Gm-Gg: ASbGnct6dyrAu5mA1l/6nYSspM1VyOHl96TlTMGz/5Km7azKFoJ0JtU3K6CQx+bM34l
	UfW1uUtP97mbMVCAsVSC7W8ZZIV9pMb2VMhyV3IHVOoxTHhURvqV9dwgV5vw06VB53akyhY4nUY
	aKL6xU4dxW6oFYfvGleIfksnCQiRhykYtXMAVmP1GKfmod8FbNy/TcgkhIxparUO5ULICnbYQ8P
	agOKIVOJU8BTJhrjjO00gtPHWtQFADaNSI6UdEx8i9TxtvoRsAyvF8yHEzgoJflDlpcsRXFfGkW
	p4KvEOjh1LyvnZ6vQmrtWRJXsPfUhVTy6IcboIuC7pPNg1+QGNBNxHzC
X-Google-Smtp-Source: AGHT+IH4lXH1IfKm/hUQQZdXyRE72ooQ6ABreQDpalA6Nsar+cyYskvVWwPw50+7NacDzQ/y9Nv9iw==
X-Received: by 2002:a17:907:3eaa:b0:ac1:fb27:d3a2 with SMTP id a640c23a62f3a-ac3f20b8790mr1094544566b.5.1742767535222;
        Sun, 23 Mar 2025 15:05:35 -0700 (PDT)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6964189b3sm117362166b.3.2025.03.23.15.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 15:05:34 -0700 (PDT)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <e62f4dad-1eec-41e4-b65b-18f4da1865df@orange.com>
Date: Sun, 23 Mar 2025 23:05:33 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RFC BUG] Send queue accounting of AF_PACKET is always zero
To: kernelnewbies <kernelnewbies@kernelnewbies.org>
References: <19556e673b6.d391a14a1768755.6078484140038889868@mcqueen.au>
 <2025030208-magnetism-talon-996b@gregkh>
Content-Language: fr, en-US
Organization: Orange
Cc: kernel-janitors@vger.kernel.org
In-Reply-To: <2025030208-magnetism-talon-996b@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

When sending raw ethernet frames over an AF_PACKET/SOCK_RAW socket, "ss" always
reports a empty send queue, even when it is obviously full of packets.

The root cause is that packet_snd() never updates sk->sk_wmem_alloc, which is
the counter used by "ss" for the send queue occupation. All other socket types
end up calling something like:

   refcount_add(SOME_SIZE, &sk->sk_wmem_alloc)

Unfortunately, the way it is done is extremely varied across socket families, so
it is not immediately obvious to a newbie where to add this increment, and
associated decrement on skb free.

I'd appreciate any insight on (1) perhaps why it is deemed unimportant to do
send queue accounting for AF_PACKET; and (2) if it is just a bug, where the
incr/decr should take place.

Additionally, an explanation of "tpacket_snd()" vs "packet_snd()" would be very
welcome, as the former does proper send queue accounting, while the latter doesn't.

Thanks in advance,

-Alex


