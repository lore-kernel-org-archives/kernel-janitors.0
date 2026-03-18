Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1850373C18
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Mar 2026 21:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773868439; cv=none; b=H/WGGgAufNWzQHlleHSyWxtPf9QEUm+7SAeQ4Q5gHMQfNcVHLP3obIeaSp2zt7VC0nEYZcYWJGu9YE5F5CgiR+P55Y7Ktw3yCm5cRamxpT+UJ6XdSUXRCSVEP4y8k6/JiL/y9SihIshIl/5VoN8C1XALFCyspj3CAoJjEdVPaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773868439; c=relaxed/simple;
	bh=s2NRFJyBQz5oiptd7hu2gPq3H2m/wAy1m114TV5rCh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHkbGjC9OxNdACjnSa7MGcMLUfgKHhJsmqivTZ9g2IU8/8L652PCp6NcjLyFZ/uc4KTljNzYwE2CMVPksEhMZS2UxMTTTnF+yDgGIGrpw0N5SDHDiUfSBMAhaqhcsgaFAQEM9pmmui2x5eLqMPAZlxUlTlBdQ1fcfMl43G42eO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b=wyNFBTPm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="wyNFBTPm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-485409ab264so1565155e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Mar 2026 14:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1773868436; x=1774473236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2kU43AlMQDJ+y4iCNAzBB3zEZFAq2dkQy3AbLDN39A=;
        b=wyNFBTPmN3ZkKk2+gIkRTOxtdDqvQFhcTm436M891jABmrJunV9tITfBJ/SgrhcrPB
         /ux70Xg1uKxZuoc+HXlai26r6HnxH1GnkX5QPPCU5JFiCaWbJhZHF31sQkIPtLeFtqX7
         RtVLerLONG4TR95eAvRG6zng8IdKfRQRgpNaDI7pGA5nr3+JOtFGlbcXjcyem9puo2ji
         asE6xd3MhXpsni8xEeee6akhwoJGTBSaIHhWkKnDLKkOYIF2LsxRsZ7wsjVp2LWOKSEt
         uFOZTbRxWDQizrQ5jFDhVYmNk1+RsWBtGVJ9uRvf/yxk9nzrf9u4B/pIFXotzfi4KUz3
         Osbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773868436; x=1774473236;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2kU43AlMQDJ+y4iCNAzBB3zEZFAq2dkQy3AbLDN39A=;
        b=qGzEbqARKXW/b9yNyn7zU1zxJifR2yddCH5m7ENnVZFBfiYSZcsoG3zNug+L44LroZ
         rl2AUI0EGIvR/DutpvtSpJXuP7uvdfzGediKGO9n+zdjJqJgiBCu3ZbfS6E/m5aWc+3T
         l29VK2nYx7++XNAbZUBRfwO0qZV/pN+Zf12aiRYzvZhfcMq6GvYEO9HW2x3QvFkZ2c6k
         XxDRNgIcT/ejR4ixJ8tEfzcTHeD4/rKcF5WlbjHbjebMsUoI6fArUHRPOg7C/6rPxSGj
         uxSQLpcTM0Zjl8tdxn+aDqA5IcASffB2TF902280iXEBM+wNphDKtfewfrwgqnZoTOV3
         y0lg==
X-Gm-Message-State: AOJu0Yyrc5tAOjluxGfhitzhc7LEkBBRxdjCr/CPJak5SMuJnDfM52JA
	TgfCs6Y6WDhMzg1r7+Cmh/SSIJ9zRqdlSKjP7AtztM+I11bSElEzMqZVWcDv2ytMXcA=
X-Gm-Gg: ATEYQzwzP7T+onDdiSOfwi82LWPCo7eHXKwmYHaGa5spHWN8CnkVobhA0rshwfArnsw
	pFcb0EqqhXxhews4H3cWDNek5Uw9ncOVxGU8jEDRcoORmjHX95icvQsBdNbjAsY+059tivm/wb2
	RQ0WqA8GWhj0nRJ6MgTxcB4xEv3IA+WsU5VHo3UQfk1eHPoOKGEKp37i08RzCawVM6xJ121VEZE
	TS6jOK2x6NJNAq9XteF0aKGhTCalKJ4ZFfU8yQ5RIFoNv2NWhdondKb1hup0HNPdVriTL3UPYAm
	+ZLpZMa1F2IyC3G1bvuiOqiQ9Bde95cyBuQmNNLuZgXanJdLwE44L6Ufhyc+RUg7didWGMQxhcq
	yd9BGO7SugUzcE5qXKeBoe7W1vMVaiopSODxveEWq3Tb+WnXWYwWKxpwROtGrseX7Otl2hTTwgL
	wYoxV9kKdV5SlrGGWiCF3Nah7VQvofGoOu1MXwfxBGljqcGgZc2UBRav/kZXDnp5A7McSrNNo1f
	Vik4oRJKuqZ388=
X-Received: by 2002:a05:600c:c493:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-486f8b32877mr19492525e9.8.1773868436229;
        Wed, 18 Mar 2026 14:13:56 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bc0187sm30798895e9.29.2026.03.18.14.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 14:13:54 -0700 (PDT)
Message-ID: <f67a657b-bec5-404f-9435-a69f11b7e396@linbit.com>
Date: Wed, 18 Mar 2026 22:13:52 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drbd: Fix typos: "receive_peer_dagatg" ->
 "receive_peer_dagtag"
To: Jens Axboe <axboe@kernel.dk>, Colin Ian King <colin.i.king@gmail.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com,
 linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260316202549.33978-1-colin.i.king@gmail.com>
 <ea558bc4-3efe-4eca-9da6-56f4a5302056@kernel.dk>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <ea558bc4-3efe-4eca-9da6-56f4a5302056@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Am 18.03.26 um 20:05 schrieb Jens Axboe:
> On 3/16/26 2:25 PM, Colin Ian King wrote:
>> There are a couple of typos in drbd_info and drbd_err messages.
>> Fix them.
> 
> Doesn't apply against for-next?
> 

This is against the drbd-next tree, which is included in linux-next
since a few days.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Next/Trees#n267

I realize this is a bit awkward, since there is no way to really know
which patches target linux-next and which block/for-next.
Is there any specific way we could handle this to make it easier for you?

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

