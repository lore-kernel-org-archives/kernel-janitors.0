Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBDE342CA2
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Feb 2026 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132397; cv=none; b=Sc2LtmHyh8+zriKjTLpCBt0LU3dRIaQ+0jaRYbfEw62Kz9w/7drxybzOyz6sAEMFif1MhwDz7hZ42vz38hX1pASQ4mzgqW8li1dwGWPJPOaoeHmuzq1v0Vst6Xj3whBKXnAfFuOZpN4qDqUaS1jTA7ggKer3CfW25TvicPHjKno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132397; c=relaxed/simple;
	bh=5n40Muz08IMbEtfEZx3V2Ip6RkL3gN39O5tvpGBLV4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SUU6vwwXi81yII7hzupjL8ALdtdVQE7bHbVVyolwttYrdCQcm/o0UHHdNH5jMozw4P2fpoMmfbJteS7NOchnh1omaD8ib9aBqaA+ZJ7I9AeZvd+1ro/zbJr36pyGaxLVb4UEkFzDi8rQtSFAcb4RCDvAXFrq/WuoPMm07IqAJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=swR8oH2X; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="swR8oH2X"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45f194e9a98so1801552b6e.3
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Feb 2026 07:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770132394; x=1770737194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+npamYXM8+F17+5UqZREX8PEj8M1DA/ro6ZdeNndwqw=;
        b=swR8oH2X4JGoJ8w27BIu49rMDcty4zCPIguYxebfcz/qOgEmDlCyd/VHGFRpbAMWXQ
         uC7Ld49aEqCv8fwUDQt0vFAdTrMRX9L6Fn+T4uP1G3wtUZl5KfhSozrjil/af4GOCI/m
         yYZ1BdgsGWSr3SL1REQE6q/0sZdcbaT8oUuQ67jyggzZdR2/p4nHV1u5XMCn3uEim7k1
         /Dsxn2EmFxgoOSriOpjBmg41oN7NNJClRRij/vrbbLa6Ral/n97VBxde4tGh6IfaVa3v
         zhA/WpMkRpjdoDMPWGdIWp/B3Y/MLp/mPC8ePCchxy48pG6xZqe56Gq2yfEKcLaYLljV
         CckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770132394; x=1770737194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+npamYXM8+F17+5UqZREX8PEj8M1DA/ro6ZdeNndwqw=;
        b=p78BLnhLd7MqsdhCkSeXDvZog3Al68NAa6x0Fbz8VG6m3nLjdNT7UbvCf/kDea49DH
         1TzgEGTuZkLB5ekrYZfXYHEojMXbFUA8IfEWo/JtXTICs1LyTgrFsWCmLn6z1l49c4ZS
         Rqe1Z5rHb7TkX7PNkFgVR0M04E7Ukf0pLeVKcFgahML8+0N4kRAj2ZldY/P1eKoYFsfa
         M51r3Kit06dAAoy3rAbpN/DvQ4B6yizh3Zf1hrBhg6O3RVs1XxcDcTcoyxLKZBblptvN
         Ow6lYLGJ2huZbhhc9yFgzPYobb9MBqq/Nhi3lqVUM1urWQyc8LN/Fzei0QnKmYXkSQTk
         jM7A==
X-Gm-Message-State: AOJu0YyG7e9AZGz+3H4d/4zyGEmArfqYoKSSoTMIOEvjHKu3dEn3WRv0
	FHvVNct85CqQXpiGR6ktTHdparft6FeqVTmTeZygeWGubntiDgpSPeH5ir9oh0rsX6s=
X-Gm-Gg: AZuq6aJGQJfEFdr5IPVxzWgKKDvxbJNkkp80UniP3tGKdO0DnOl+KVtDyrszMZSdk4f
	LkB+4d5Qic2eBSWsz9xnlNSfgG9monigrki+5nR4oAec6Dxb9STf+duNj+phQ2p0iO6PddJUy4f
	8s2g5iBhF3owVPhPv7+RtUKQuiHWYaK3Blc6ajrC3WnIzexF/SW7e/Dx9HrzKjTC8WaSkS3sldS
	ArKQ08OsRynhMUdlTgltUTAbWHk3mF4fcGRhOp+ZWNuuHnB1K0V0EvUhvqRIyOgyQWk8IZpGidZ
	DvQMfqeyEdFHM56IG8u5f45qd9wv4fh+0qyA57/Gju/sPRnh/s8XYiKIyw7EW0l4734IcjO5Kbl
	0r+0bO5efP4BC/Djm4/R0u0e0us/aQBAfwmxcEex93f3QysFXBwnod+WrgEzncaZRcJ8qY43ZT5
	2oxHPdOuBlIA5Xzz0WxGR6OGB8zSwbFjUSwzjHnLITNjRceqG9+d9km0E=
X-Received: by 2002:a05:6808:c1fc:b0:45e:801c:a0ea with SMTP id 5614622812f47-45f34cd6102mr5829079b6e.32.1770132394358;
        Tue, 03 Feb 2026 07:26:34 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:8e13:880:992:e796? ([2600:8803:e7e4:500:8e13:880:992:e796])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409571ae8f5sm13282707fac.9.2026.02.03.07.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 07:26:33 -0800 (PST)
Message-ID: <eeab5c00-381b-4ee5-bc4a-efc8bd59bb49@baylibre.com>
Date: Tue, 3 Feb 2026 09:26:32 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 next 1/5] iio: sca3000: cache SPI device ID in probe
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Andrew Ijano <andrew.ijano@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
 andriy.shevchenko@intel.com
References: <20260202194033.627967-1-harshit.m.mogalapalli@oracle.com>
 <20260202194033.627967-2-harshit.m.mogalapalli@oracle.com>
 <38793c4d-e79a-4896-8b25-e20bc8ecbb74@baylibre.com>
 <91ba7406-b05f-4aaa-a800-b4c8cde0eeb7@oracle.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <91ba7406-b05f-4aaa-a800-b4c8cde0eeb7@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/26 4:24 AM, Harshit Mogalapalli wrote:
> Hi David,
> 
> On 03/02/26 04:31, David Lechner wrote:
>> On 2/2/26 1:40 PM, Harshit Mogalapalli wrote:
>>> Store the spi_device_id at probe entry and reuse it for the name and
>>> chip info instead of calling spi_get_device_id() repeatedly.
>>
>> Even better would be to replace spi_get_device_id() with
>> pi_get_device_match_data() and turn sca3000_spi_chip_info_tbl[]
>> into individual structs that are used directly as the match
>> data pointers.
>>
> 
> Thanks for the review.
> 
> Jonathan also suggested this on v1, but thought of doing this item separate to this patch series(as its a functional change) , would you mind if I do it in a separate patch after this series ?

I'm not sure why it would be considered a functional change. If you want to
save it for a separate series, that is fine. If we do that though, there
is probably not much point in cleaning up spi_get_device_id() first since
it will all be replaced anyway.


