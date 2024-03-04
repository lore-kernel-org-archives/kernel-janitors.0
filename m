Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8D12940B
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 08:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709542062; cv=none; b=XUTQm0lBN+TVLlnqHgcUnrWMQhwwSe6lbZwZ7OFmcSQqHmCkFwtitglpgvfwZ+951ND+tL8ebXDJWg+68+n/R05Gq6lM1Z/avEa0PeY/SW7wu73v5T5/zrD/og/kciafIDXvbE74ZaUEXufGhy1xgjc/6qLNmTIUCt8Rnc9H2RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709542062; c=relaxed/simple;
	bh=1Eww+qTUhUQHbs2a5pvURnocd3K/qSwM/cM9HBwO3E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiH2w5svZoKTx9i14nnzL/bjtAJfltfLIZA5vVulMeX8tqOdVgwz+uvYZ3ySKCuN0RxbicFprNMzWtcucUlqj1YpD4b3y60kGwuMyDOwa08FW/56UYIjGkK4f7AuuLZ3WImrz0Yhdit/z4WaiZfok9XSWVd+qi5iro9rRTAGs5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uqheL5WL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uqheL5WL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33d153254b7so2639556f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Mar 2024 00:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709542059; x=1710146859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7+9yLwy4g/S76JKcShgQz5nAay8vl7nY3e7zyU60yw=;
        b=uqheL5WLznG9KDSj4QlpiIFKa/P5T79e+I37he+ZlPsMAgNiJ6l6W/9J1n5JDjy/jn
         m5KghZA/V67ZgWpgGiGomuN2NkA2/xG4KTPJDkWpQCIMK344H0hFbGQcxak8qDhj+Ij0
         Dfd3nhtu8+U9BUp2QHEBYCuwxXj3BXFnaplWf5HKZXMOaDSbOPkzo53G5oLzMWIFaGiH
         tzJzko+nUWlbJWjX9JFsByDUJPianjrNRIrjCB37YlygQfWMpoViyDxG6EvosabXrKUf
         krm6fBI+e1zKrmWhe+7mRwTWu35pUiEp66CBB1yntBZ2WU5O3UJLSn5tLD8px8yCRwrh
         lFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709542059; x=1710146859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7+9yLwy4g/S76JKcShgQz5nAay8vl7nY3e7zyU60yw=;
        b=jWjxaMNDQeEJLlhZMwyrO1MycgKnm/aNHxTrp+erEtD4dihlfsuJOifqUOD91yNjtu
         jxilXnEhKVV4WHoWi5/z7o+lLSM2K/M8wiuJPaAPgvGIHBu+6w/Yb82jCQ6MyTHrI0Pj
         9mu6NyaqPfj3K69iuXPS/9cCjPLPWAoLEh/fV/6cOqNUbgxMv41oNU7Bs5VpAULc7aw7
         WHqe6gA/Eg1s0qS3sU7qXPZD4x7j+beJnftKGRgCeiz7NWd/1gle98qsv4qwrsXXemor
         uhBU044nIOxpeeKYOkXbDQ1+sGk8p/qXCnN5FavvUvjACIl70lzh2xxLunVGPbKdVASR
         ML3w==
X-Forwarded-Encrypted: i=1; AJvYcCVIuxVFIJSBwpIMWltlG0g0RHXI7DrlaCpbN9yMiFCcxhAGnf3JDFzyUNS9pGX1XHE6O6aM5RQu56120tykJbihKIfjSntF9gVbIWdxWuKL
X-Gm-Message-State: AOJu0YwTm7JZtg4d9L+ySoDjMIIcVJD+fr28kwf5e/2V5ERZN6DTIMkS
	RUoEfKzLlA/SmJbaQ3aDBindpAsclKtREITtmHLZAtKoo5De98PZQXe/u+aTMg0=
X-Google-Smtp-Source: AGHT+IH397C/IZeyTppuz1TsnzngdBmJHJmF2TTDC7zoptaIQdk9F1BQ2FnixeEQxkY215RjWKRjdg==
X-Received: by 2002:adf:c007:0:b0:33e:2a76:bb90 with SMTP id z7-20020adfc007000000b0033e2a76bb90mr4595757wre.65.1709542058727;
        Mon, 04 Mar 2024 00:47:38 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id v13-20020adfd04d000000b0033d202abf01sm11552763wrh.28.2024.03.04.00.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 00:47:38 -0800 (PST)
Message-ID: <2c2ba7e0-4861-46c7-992e-a201972ffce8@linaro.org>
Date: Mon, 4 Mar 2024 08:47:36 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: correct type of i to be signed
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240301144517.2811370-1-usama.anjum@collabora.com>
 <CZII7JH72OWF.1IAQO5VJCBZX3@kernel.org>
 <713393d5-13ef-4891-bf7c-d835edacef8a@linaro.org>
 <d6596dd7-4d80-4024-af2b-c4f6c9da1084@collabora.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <d6596dd7-4d80-4024-af2b-c4f6c9da1084@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/24 08:46, Muhammad Usama Anjum wrote:
> On 3/4/24 12:51 PM, Tudor Ambarus wrote:
>>
>>
>> On 3/1/24 15:04, Michael Walle wrote:
>>> Hi,
>>>
>>> On Fri Mar 1, 2024 at 3:45 PM CET, Muhammad Usama Anjum wrote:
>>>> The i should be signed to find out the end of the loop. Otherwise,
>>>> i >= 0 is always true and loop becomes infinite.
>>>>
>>>> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/core.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index 65b32ea59afc6..46bc45b80883f 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -3373,7 +3373,7 @@ static u32
>>>>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>>>>  			     const struct spi_nor_erase_type *erase_type)
>>>>  {
>>>> -	u8 i;
>>>> +	s8 i;
>>>
>>> Can we just have an "int" here. So we don't shoot ourselves in the
>>
>> Muhammad, do you care to resubmit using int? Would be better indeed.
> I'm sending a v2 with int.

thanks!
