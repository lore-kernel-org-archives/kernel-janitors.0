Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F045347512
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Mar 2026 21:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773868848; cv=none; b=fGYEuXnM6bnmZaYR/sywOnScwwpyesiM9Ga5sdfaUWpHMG1NfWa81VUF4slQ1/fOeoEycuGsmwELlbRjIzIrgX/mRMmFwv7pomHMrhaT605RQwZ6gkLCjcK6tQKqv78eGqUXoqLZ1PiylIzJn4aoJdei9GCgVZAGXWozvueKoaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773868848; c=relaxed/simple;
	bh=mu0jOKXMybSkyn7HccCmNCy4VrVBv2P41hynZRDJEeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQjnPu6yg/jcH9rU5xf6thTSFBK/3o7M8VLYF5Yi1rzmcSPk9ZlHcg7+D/MbmBUZTlGMiBlckdheyX21SWk9bEi98mn93+lzTNEzt5f6h8cpFyTgkBLX3EbHVs4DMdkDW9l8FUJiZ7lwjj+oUFXIr2Tfaq+c5Yc1IWdWInEjwHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=yxP3bFgJ; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="yxP3bFgJ"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d741f61ee5so254472a34.1
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Mar 2026 14:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773868845; x=1774473645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xibiGMBk9lH88oePns/vWYwaj+whDxl4whT6dU143Y=;
        b=yxP3bFgJ1GJKakzLPNN4TFkfeFCB1XUqZLeD9PSqZTqt9dJZ+pXhYkJicnZHnyxW9H
         dJB/fto3Jl94mcJISNXP7NFGCofgJoU0iW1HuNm8ZzEymGdfB3610EDbmlboXnipJWsS
         njShZ3rfYTlIfUVDpqg+vhC5asZM0B3h5YKCIxrCQreLYi7EcoALlcf8HNsnU0l+hMPJ
         BptW3pAl7YJzC/KGX1MuyOIx6fusXVzeDFcEXy06W7aDBZphExq8kpp5bgvXkmK3v2+d
         iK/9/o1BfshMvXtw/qu0v1jqu7t6es7e+ETYNEPHuDB+NLjEcgMVLQuEA25S7S/Mr3Hi
         q6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773868845; x=1774473645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xibiGMBk9lH88oePns/vWYwaj+whDxl4whT6dU143Y=;
        b=bUrLjFIp8mAzfuFAZRuyAjTpP52gucr759ViQ7KL9D0MA6kuKmD5A4O+g+TH9s5GgM
         vkJ4ETsyt+3rEwDQ0VLiuIwgYSyguK3ZW16AIGtZg2eG9u57fI8z+uQn33jgnRx32GPT
         piwTkHmPZ4EO6EdETd0H6IZc3gxP3WSHp9qIvXWq6NLgjp6fBtxH6r6ssnHTESdRWDpa
         gu1Kcl51VSZhjEEbOzX4dJzjbQL4gEfLRyrc4WqBAgoNUW2SEsVn79DEb39PUVC1AXGa
         E8/t1oSrt7EOGUwwTYywcupu4xwkC+Y6CHdGhfqGtyr0MDuG0Yj9toAfcvAw3jLtmwv0
         F9Kw==
X-Gm-Message-State: AOJu0Yx3/p7AVn0e8Bim0am5LilSger6WzNXYUXC2JxeZWZHAFNC2B3T
	5Iw3EquRZ+gNKCmmFnoE/OBAtFiZ1zOqh+MgehRb5jYWbgPIJDXyrUnjdXQTOzn15n0=
X-Gm-Gg: ATEYQzxzO3MqZcUCf7ndpO50wIlVp7g7EgkzTgsBFIFeGDwy8KaHv0jy3Jyok81/gdY
	wQKqfYu+gL1blO3NplriSzZjj+jDHa4wPBMM/5JY8CxNSoPNe1sCnlHTrBlOmfe504xWI7B1nnQ
	cc/kw2HmOm4ix1ovypcu25ItzeiDinwqb7tnW9PbrvveNgzZIJNBrsn9/fhRUSQ4NVcozla/STX
	6AUqyvlpCvrT7URvRWMfBQHWwyn3fkHuksMWU2Us3lb7lfFuKnIdCAYZxRkKxMTczA00cNpDvWr
	GcB9RUUVJ2vGDfYT7/2jqp74p29gqcwlfzL+gHqgBdTg+9bhG9quT7TvRY3CW/8vQImzc5mURBp
	jcSfWpf+21cE6a1hTpqvJ1JdmzFFRJ84/Svl3oJ0/0amUQ+36LtaVDimu+F6HZGbkLxF0qA50en
	Ca7uuUMxUtp+UJkmMlOKebr9dhXUNe/rMn8D1dv9OQa9d5o8BMZxDpKIfVZZEpRVm3kTkuph4VK
	9glavTuAyhyGhVt2v0=
X-Received: by 2002:a05:6820:1505:b0:67b:e4a1:9e66 with SMTP id 006d021491bc7-67c0da88405mr2941966eaf.22.1773868844883;
        Wed, 18 Mar 2026 14:20:44 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89ca52sm2373456eaf.12.2026.03.18.14.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 14:20:42 -0700 (PDT)
Message-ID: <af209f39-b2d6-4573-b05b-286f849fd815@kernel.dk>
Date: Wed, 18 Mar 2026 15:20:40 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drbd: Fix typos: "receive_peer_dagatg" ->
 "receive_peer_dagtag"
To: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com,
 linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260316202549.33978-1-colin.i.king@gmail.com>
 <ea558bc4-3efe-4eca-9da6-56f4a5302056@kernel.dk>
 <f67a657b-bec5-404f-9435-a69f11b7e396@linbit.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <f67a657b-bec5-404f-9435-a69f11b7e396@linbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/18/26 3:13 PM, Christoph Böhmwalder wrote:
> 
> 
> Am 18.03.26 um 20:05 schrieb Jens Axboe:
>> On 3/16/26 2:25 PM, Colin Ian King wrote:
>>> There are a couple of typos in drbd_info and drbd_err messages.
>>> Fix them.
>>
>> Doesn't apply against for-next?
>>
> 
> This is against the drbd-next tree, which is included in linux-next
> since a few days.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Next/Trees#n267
> 
> I realize this is a bit awkward, since there is no way to really know
> which patches target linux-next and which block/for-next.
> Is there any specific way we could handle this to make it easier for you?

Yes, send the patches so they end up in the block tree rather than add
another tree.

-- 
Jens Axboe

