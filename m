Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B71C2301
	for <kernel-janitors@vger.kernel.org>; Thu, 24 Oct 2024 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729764131; cv=none; b=c7XfhoLtlsNhyuzyS9RuubHbqthp2gJ15WoAz2jeBXhMFP2Qeq4PwmHeRU1TxJT5B+WapXkMaNdEWb0YjcwFVe73/pUp3SsZdhOX8TpG0J24zwkCkexcumfoA7wE+XjwCwgcRCEM0AnUK9knzjw86bDvXjeRyr9ptDtbvBRgTtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729764131; c=relaxed/simple;
	bh=+PtBh1RrDhPoISiOigbbw1TrTZPCSz/nvIZNiHGIBiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvR8upy96KEnYBIbSeMivHvBnFnWJNz5qb3eg3mnT0tYRCsh8IB5PvRjj//GDO2Vu0+Eel4rk0nhsRj9LdL694Okuo+UHKILhGHj6bxHSTTCpuNpE9a/34xvCe2/ahSvkEhOMmsxTkAlLnRGvX3ynRfyDcVCM512xENXhE/7Cjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zSp/rkcw; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zSp/rkcw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c940512711so145472a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Oct 2024 03:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729764127; x=1730368927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zmvItc267Y/HrD7VbXHMK1hbgN8DOR+IpIQcbhMV9OI=;
        b=zSp/rkcwZwLO8rfw0fwpwQ4rRo79hwdbCWETjHd01P6SX96008SBhidYNS7+pUHgIQ
         T2STwbjFJnOsQ6vlfUjlnPlTRq5llNwfJF8C43h9IGddbkg/laBBXqd/4ESr4lqILAgs
         dD4qrAPTvGOJdGq97osN1bI2sjMaxi53MiWuw2x4h+xFkeMcioBGIRgNlCnVrwvtXaCH
         y+dC42W56Apt7N0I9Qiou2u1CJERTzhCgw+RLyIPA6ZAjTRJN3cVokBEQfZb477mxr8j
         h8/S5bv6B9VScngUrnjhkchtKqSRUeNvOHESqq5ZsJMfA16bNFXBPHkj5xic4DB7MTLZ
         amwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764127; x=1730368927;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmvItc267Y/HrD7VbXHMK1hbgN8DOR+IpIQcbhMV9OI=;
        b=M+vVP/9KLh87sQHTf+q2ZdrLq2dXaZAmCAQmhjuXN7uoBXGi+F0EeU9roRnrksY4by
         TbrivRipMsDg9N8JlJg4DttOaatvAr3uh4DXrL/dCccPhQhofnRnLbgGVoib2c2nGirJ
         4qIGfXAYVTP/4uGqMeYcv3htLrrg+Fk1JXB8/I35Y2C8nuXOUuRO8/bYBZm5iJ/I3g5l
         U+6dzxuCgV0UNA1W9hxIXryb2E2fR5aGN/18DwEHciwOrHVQwxBb6cuvrYomtzAZyuLH
         k7Wi0txR7/oi2LzonnjNnDDC5q+B/fKP1gnQXm7ZOjXa4WUMJwZHhBGNDXiHbhsJeq+I
         1KdA==
X-Gm-Message-State: AOJu0YzFAyxqisx0iOfTVnJEfcPiE9LvqMppBw14Eaj1wGFkAo7Tw5s1
	wU5doxlHfNINgLt4czGWTFC/jQjNVLtVy9vwsZDDwzho7rOB8zGWGJnvl5h20pg=
X-Google-Smtp-Source: AGHT+IH1p8XWrSpvqDGP03f3rD/RlkfEEWJL4GFLnKG4HyPLILYldU+/ETCVJkHKESWwF/2XDqmVhw==
X-Received: by 2002:a05:6402:510f:b0:5c9:6b2b:5502 with SMTP id 4fb4d7f45d1cf-5cb8aca2d08mr1468889a12.3.1729764127202;
        Thu, 24 Oct 2024 03:02:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c6b54bsm5744672a12.78.2024.10.24.03.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 03:02:06 -0700 (PDT)
Message-ID: <a242de1c-37f6-4f79-bcbb-fc198ebeaa98@linaro.org>
Date: Thu, 24 Oct 2024 12:02:03 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] NFC: Initial LLCP support
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Samuel Ortiz <sameo@rivosinc.com>
Cc: kernel-janitors@vger.kernel.org
References: <f32235a6-d884-451a-bec6-bf659c6f50b1@stanley.mountain>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f32235a6-d884-451a-bec6-bf659c6f50b1@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2024 13:04, Dan Carpenter wrote:
> Hello Samuel Ortiz,
> 
> Commit d646960f7986 ("NFC: Initial LLCP support") from Dec 14, 2011
> (linux-next), leads to the following Smatch static checker warning:
> 
> 	net/nfc/llcp_core.c:1147 nfc_llcp_recv_hdlc()
> 	warn: double unlock 'sk' (orig line 1088)
> 
> net/nfc/llcp_core.c
>     1064 static void nfc_llcp_recv_hdlc(struct nfc_llcp_local *local,
>     1065                                struct sk_buff *skb)
>     1066 {
>     1067         struct nfc_llcp_sock *llcp_sock;
>     1068         struct sock *sk;
>     1069         u8 dsap, ssap, ptype, ns, nr;
>     1070 
>     1071         ptype = nfc_llcp_ptype(skb);
>     1072         dsap = nfc_llcp_dsap(skb);
>     1073         ssap = nfc_llcp_ssap(skb);
>     1074         ns = nfc_llcp_ns(skb);
>     1075         nr = nfc_llcp_nr(skb);
>     1076 
>     1077         pr_debug("%d %d R %d S %d\n", dsap, ssap, nr, ns);
>     1078 
>     1079         llcp_sock = nfc_llcp_sock_get(local, dsap, ssap);
>     1080         if (llcp_sock == NULL) {
>     1081                 nfc_llcp_send_dm(local, dsap, ssap, LLCP_DM_NOCONN);
>     1082                 return;
>     1083         }
>     1084 
>     1085         sk = &llcp_sock->sk;
>     1086         lock_sock(sk);
>     1087         if (sk->sk_state == LLCP_CLOSED) {
>     1088                 release_sock(sk);
>     1089                 nfc_llcp_sock_put(llcp_sock);
> 
> Sorry, to bother you after 15 years, but hopefully this question is easy.  Was
> there supposed to be a return; after the nfc_llcp_sock_put()?

Similar pattern in nfc_llcp_recv_disc().

Yeah, I am pretty sure this should return here.

Best regards,
Krzysztof

