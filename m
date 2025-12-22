Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAFF32E14C
	for <kernel-janitors@vger.kernel.org>; Mon, 22 Dec 2025 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766404215; cv=none; b=cHnEhGzmWx0yAqJxWkSaZ8ybWNQShLHeNhL9HvWh41KLPV82u43VTQpeumeXXauUUgtynqcGiBcjP9LkQA1hqnSc3JjNIJILPcIrgbCDhGMmOYjEbYw6irquHOrp6R4fRJEbvFbVgoGICuRADhxoGU7MUBYRGaCjbg5N5mvGI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766404215; c=relaxed/simple;
	bh=1RTEL3fXSoievhmTGkDQQGrzLBDPQPQdbykQFNvZfL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtEmGKnmR5oyzFVJMOGiKxvnC6kXCkpfQ09LeLEqYvJWAfYH7g5fQe9Y3NKh/xSi4zkOZLQpzvnJvLoHot0s7s/JPb1RguASg6vtoR5thdba92T2N5v94cfc7aX4T6hmD/rgdvmQ50g5BLxAJZrc9z3UzLwlkLh8Vbj0vRSMZwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yrq8x1e7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZxO3tczf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yrq8x1e7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZxO3tczf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766404212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMALY6ZhNYo19lnmySAg/8ulxjAE0UAGCN8jLmq8SkE=;
	b=Yrq8x1e7KqnFUmw1LPQA3CzW30GbZbVMSG87siaRrNV+CRUNIMz9prWNP/zolbDeHwhHd3
	0bItNf6Bdl4NHadH0GTxWbTHpgfhz1OfCAjMGqLbMovd4BkCgSaNls6Z31rtWt+8yxsGN5
	wPJyJpuzRZy/WibtejhhITYdIhKcGqg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-c-sBIxhwP3aZOAI79VOAVw-1; Mon, 22 Dec 2025 06:50:11 -0500
X-MC-Unique: c-sBIxhwP3aZOAI79VOAVw-1
X-Mimecast-MFC-AGG-ID: c-sBIxhwP3aZOAI79VOAVw_1766404210
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42fdbba545fso2479940f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Dec 2025 03:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766404210; x=1767009010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMALY6ZhNYo19lnmySAg/8ulxjAE0UAGCN8jLmq8SkE=;
        b=ZxO3tczfK7N6M7YMSp9CUIRjhhjDxeS0Dx6ipNMpAeSrE9sooHpDweym909b6HZgOc
         o/L0cQoZGKUHWqkx2vFWcU4qfj3K7REbgaky3QupJjf3WaD2BlEDQ3OcsDh9BqPLW7zr
         xoATS5GiZMghZKnIZMx6SVy+1/Yr0MDekOf0BZshIrSIakIQdqJkFZ4Q3xzjHUI9Bl9n
         VXDcNaNVDnarZfPD0rLoYrfxpgRWx96vf+i5hIObtI1ypBvMv92+v23nFl47neDVcHf6
         dcwyo10QYFjZG/Hhdx7fzG99zrnpY6Mao31gGJh9BL4QD4B994T+3eGl9uaXCiaAtpPX
         9h0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766404210; x=1767009010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMALY6ZhNYo19lnmySAg/8ulxjAE0UAGCN8jLmq8SkE=;
        b=aQBO1NNvn75tTzHIweXPPQXJGQ+LNo8Tybm3sIaj8vhL/zZ8FkIJP6i/p7O59wDhRr
         HpqUImsxvWCaQXrJgou8PWXUUkYvgitt3IwJoTw3qcVS9CT+kQAkwbp16DSaqfcMeaDg
         fUmMzUpYNJyB/malI4nRgZ1/lGkQWPzfKkSA56WSwXKM6iRG/Az6jA1WBH5Zra2VzCzy
         moYbutzIqaJyUakN7Gvazv1San/nBxalRCnIGfc7o47mc9HLo291CDRhEbO7AopK+vHI
         cZO3gi6Fx1TIHaVypB14x+25nSOzH0eSyoxZPc4xH+hsTKkJ10MctJK/jpL5TkT+/mEo
         d/ug==
X-Gm-Message-State: AOJu0YxHk018NXqR7eKqWHjBuGJazGWGcRwwy7iKlas0/OZSDe1AU4oh
	XY5wZ9kvce0CZDBMIHGN/FzrENows7oYOwOpWsyY4BQU74ITkRRpd1pdkv0rtVFR7OA21S7MR8b
	Hv72hd1s3OKn6/lNg2xyn+TXf/6/TSAkOAUhRm1cIvgbXjF3Kso2h45Q0G/+7bCqOVTgwIw==
X-Gm-Gg: AY/fxX7TPMlLoBumt9X/D8C6GcVRw2U1UQCA33RAoA9gvYJpptMzKsjC8E0fYhOjF3S
	fe6LIOpCWomF7+5xmJ3PG+sbPJqp2S1DtUtzhqXlA5n0YjRz4vvimfYLtiPdz27y8eUoZiXHvJb
	uPcSlQO2OUvuR0ljz8MYa6PFDgTC62emzkCuFNmbTfdbDbdFH+bdMvNMQ3wJ02XGgDtofwGOc/g
	3bZMDi2V50NpWnOIz8H7nLHQao2a9bK/rZQ5vRqcmMjASIcNP6+Okhae8wA7hBG9WAg4yTn6fNT
	Rs6/pxaqB1VAnZbj/LQpWvd7e+wfS6M7nQRxCi9aK5v0+y3KC/87s7UtwNgRyRtMurCtcUrb4Vb
	QQnpKdsH5KOXU
X-Received: by 2002:a05:6000:1247:b0:432:5a4e:c023 with SMTP id ffacd0b85a97d-4325a4ec1bcmr5163309f8f.13.1766404210253;
        Mon, 22 Dec 2025 03:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTPl62p13XAIbi9lZDvIY4z09abGkkrGMCB9WGUgY0R3j7kKyjCubla1YJ/bQnHOVKp5mhKw==
X-Received: by 2002:a05:6000:1247:b0:432:5a4e:c023 with SMTP id ffacd0b85a97d-4325a4ec1bcmr5163279f8f.13.1766404209864;
        Mon, 22 Dec 2025 03:50:09 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea226d1sm22136327f8f.13.2025.12.22.03.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:50:09 -0800 (PST)
Message-ID: <190f75e8-fabc-4c39-90e9-eb733c64d3c2@redhat.com>
Date: Mon, 22 Dec 2025 12:50:08 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] net: dsa: microchip: make read-only array ts_reg
 static const
To: Colin Ian King <colin.i.king@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219213334.492228-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251219213334.492228-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/19/25 10:33 PM, Colin Ian King wrote:
> Don't populate the read-only array ts_reg on the stack at run time,
> instead make it static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.

