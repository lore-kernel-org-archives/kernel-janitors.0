Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FAB356A3E
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Feb 2026 23:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770073300; cv=none; b=nm1rcunc6fcvcpfcYA8mi/kP3tC75pzlwVvNIhR6StJ3nHeDHlzP7GG5IUtmLb2Eg+kxcxD3b2pvdXGe9iEydREwJvaJFxp+KKB5ekkDs9R1MNxxR9DRiHCM53nop2m5nQnvHe0mURpKe/WrA+2iUNDUyKQ52pt4ylSS0/S5ayI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770073300; c=relaxed/simple;
	bh=Z6GqiyZap0TxD9V8wqrG7540asWNXM6u1cBE0RODAqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvS/Or04jYoYw98Q4kjlIFUPv8AJAeoh0/q7L0ohweLoph6nN2/xT/NTLXnJmPn1RIwggKuNgJCCZw/cZkfFt0SdEKqZYBAP8R28doKT11COrfa/YwhOkMgjr80CzDEL+cZN8SLuVZLKNq28/FNdXXIngnK1G2DVRw2f3lgIZ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gGGJb/lb; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gGGJb/lb"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45f126d47b8so3253602b6e.2
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Feb 2026 15:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770073298; x=1770678098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SCzpKsUtNwK5udm8CfpcSaSMileQmrqYxikfvGaGy2w=;
        b=gGGJb/lbZHxEdJf7JMnu6796aYjujU4HwxL3l+r+e8lg6eDZVjT3W2y+o7/oSCW1rB
         7reF0434HRIYBG8zkIIyMmB8jKV7hZuZePZwB3xuxOCWTKz95ed6ZVIiRzOza2AT87qB
         w8ivnNWqsKPVH6142JZXxIpAvEZ3iJU79O1SE66FpMY+kes45/I8oba6VS1zXXWbHoYY
         VnPgndPSV4YFodsDHtOQsRgA9DHdB2HhEs/OZMYzmAs0caQjE3nSkMiT3TTsZbwvkjIj
         P2KP+zvO+TRh36iVpk6bcGxun098gCi9TDpDsc366tYS8rHlLk+h+KEmsLE0R3KeXhNS
         aasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770073298; x=1770678098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCzpKsUtNwK5udm8CfpcSaSMileQmrqYxikfvGaGy2w=;
        b=xE4kvUBr7C5JwFopRkqdcMQ/axy5UdH9nFnD9MwulJFBhOfvZKSpL3UVRrBADSq5VT
         b0D67yvjwDzmFp5VGD8apLzcKjTiyRqvsIg4P9ud0ld6Pj83os1XV16ltHsw92qcV3cV
         BNM7heZtbXrPNrr7qmA+znedPOS96KhaUEPZ6unvZ7xlJ2NDqG+vnitMRvSUYZjXoCfA
         YNqhwZWGvGFVp/aqvq9UjJYSdL2uW5bHnNKYZq+8reTB3XgGREieRhmDe6dWVOGVjwYr
         KBMp+8nWb6H5J8U0yDAAWX0kGdXUBgumGUMjrbQTMz5z792c+AFsXqB7KRvidKM0us2r
         AeWg==
X-Gm-Message-State: AOJu0Yx3oKMF5hQChJPSFzJvg9MF8PX5mgp51oyy0OaS5pSbsleqG9+f
	5sHS0uZm8gxTL8FWHHjFzMHzAbh5TkvAxHn+Kxv8TstmANzZGiTeGM8Sb8iRC4x4dtI=
X-Gm-Gg: AZuq6aKmIyA7Y5O6DVPuM+M7KEUUn5yfc8SE+hG6pSV7WuDG3+BzlntUUfpIZa5YvA7
	U77hAigGiRt9u3QwfpgG1olbGfmfL7rynNwMSfwd2NMcDT0eRlAAAeVLKD1eY/yoX23XM1RjgqS
	MtlGuvHJUc6E5uI2/x58yxzsrHpMG2WmCglum5OWl4WwKTVD2K63hEAgwvldu0RG0/l620OGN71
	b7u8Pw2lliEisB3XMAbZtVJWIesPW7rtsoNUbrLOo5U6t0nNVuJbhLTnaDsqR7f+ZCKpqkuBUZY
	G0dEiylyz2Uvec1YG7M5wfomBzhswIZTAJb30FqqaEn4Z56ONyW83kjmnK0yiRyOLwjKxTOhfrU
	4wSPZmtpGr73yjIbfIEaM9FC/mbrMTAoUZpc9Qi8jQVrlUVEDgsdDkrY4fDUpJ1xpWsVkKZBbc+
	e3s0+/pxGiuxtHlD3abFJT7RST0VRK4M/E1TiWr2oFcFxpOD+FFLPAKScnXn2e
X-Received: by 2002:a05:6808:1313:b0:450:d0d8:aed0 with SMTP id 5614622812f47-45f34d0d02amr5853054b6e.40.1770073297618;
        Mon, 02 Feb 2026 15:01:37 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45f08d894f5sm10614525b6e.5.2026.02.02.15.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 15:01:37 -0800 (PST)
Message-ID: <38793c4d-e79a-4896-8b25-e20bc8ecbb74@baylibre.com>
Date: Mon, 2 Feb 2026 17:01:36 -0600
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202194033.627967-2-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 1:40 PM, Harshit Mogalapalli wrote:
> Store the spi_device_id at probe entry and reuse it for the name and
> chip info instead of calling spi_get_device_id() repeatedly.

Even better would be to replace spi_get_device_id() with
pi_get_device_match_data() and turn sca3000_spi_chip_info_tbl[]
into individual structs that are used directly as the match
data pointers.

> 
> Reuse the local dev pointer for resource managed helpers. While at it,
> reshuffle variable list in a reverse Christmas tree order.

The dev cleanup sounds like a second unrelated change that can be split
out from the spi_get_device_id() changes.

