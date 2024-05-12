Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D184282E5
	for <kernel-janitors@vger.kernel.org>; Sun, 12 May 2024 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715522124; cv=none; b=ocIVopg4KWRGkU2dbBtooqUQasSO35cmbwW+OopO4H7MKbwles0jpdK0OMD+TrhmPGjNO6S0rQ4ElMd29GmlryLTyrZHvUGuGKAiMjPP4jl1aHRya1E6gS2F5/HpFgb25aI9fsnAq5AnDP3559MT5BW6cblZ2WYmXTT/bpWPWqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715522124; c=relaxed/simple;
	bh=QzWIjhiIW1aFIbIhMjmlJIAZhe/Sp3sb9SM0pcpMXm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7bJ6NO3ej6U8lXi1xcPXuX5lAUCRdGdwgwRVjdQgNxgSNwvi771WpuqOdNq+/djzz8Oc+g0cIjtNk09jeBJUVl1xfkBNH7IedhyUKY12g92N613ZnGVBAiMnUkuiZSjKC4EOQUaUtUYk0GacM/UVG04wMX3/+hIH/wMoUnENgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JDEqEiKQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JDEqEiKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715522121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N/r0A7TPkHZGpSI3kSzq0XZsCei4tDjmUynzk4cOnsI=;
	b=JDEqEiKQmrqP+BO9BbuFngLrbx3SliZjNt2NTTrDIInOam57A4dqNfDf5v1+6uNQsckuPZ
	UAt/ZD9c1XB78wk2H+sldx25KkuuEG4xA2bHOkGPxr93JRdPjkBJclUQFi3lw5tLX8HteE
	6c3kTzhIU0BdXK+Z5Nx1hrnIShn+6kI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-MYmOqwe_MUCfFYS5N5exGA-1; Sun, 12 May 2024 09:55:14 -0400
X-MC-Unique: MYmOqwe_MUCfFYS5N5exGA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2e1e7954970so28719071fa.2
        for <kernel-janitors@vger.kernel.org>; Sun, 12 May 2024 06:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715522113; x=1716126913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/r0A7TPkHZGpSI3kSzq0XZsCei4tDjmUynzk4cOnsI=;
        b=GvM5DiYlwMGW1CRqtZBTmueL81ZCtba3QoccDW0wbDcPEe+mAOzDT69+hgbmqL/7iE
         1aK4veDvzfkJSL6wV2XqbTFaL2XrU8D5FFm2DFcBtsFPLPJxQLLTjwP2xCcBye0LSeb6
         DOVgVVq4Bdju1CBMdstaDgxXnSxSTyWu+iPGJhygkOYknjXs6tNhArn9i6/qb7IJS5qP
         n8ykXNjYc3qc5+7uZzn3ShtDQhS6P78PqwGNpJeSF7SJgsTsrSLABEuazDyaC/TIehiQ
         ztWyx4E62k32y/Rkg74/wxbvwfRpqycGvMFIbKzB8XpCaGROca45jcR+C7OE2jCwiGl1
         HqiA==
X-Forwarded-Encrypted: i=1; AJvYcCX+PpHYiQLSeWGUTYAzl0w8+yQ5LLMAmzRmJAQpHWG4X81m+P8C/golu1f3W77ivVz0RLz58TXWrzn7Q7/z/bbOHHc9329syDUJEfBgokSj
X-Gm-Message-State: AOJu0YxyV8pZsG+yB0o+BUXroCV+JfN3M/h2YAYzEILh2oHwm+KTqRP3
	jIi/H7/jMwA+weAJwdsDb+Ii2xVxPuKw4x4WHKaH5JzSoxEfjxC0FeI00v5vjaZK5IxuXq+n3WB
	Ce7ko74ZyMxhKabOkHK/u0EFe78fbZlTgOt/uA9SVhY6pQzPoT3Xn0gxJlLPC/vmROA==
X-Received: by 2002:a2e:954c:0:b0:2e5:6957:187a with SMTP id 38308e7fff4ca-2e569571f3amr35927991fa.4.1715522113220;
        Sun, 12 May 2024 06:55:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhPImeqHdj7RC0ZYwwkh8BAqDqXDeq0j+HJ2a85twhLE+tGMBO4C8LqXyu6uCaufPlp77uZQ==
X-Received: by 2002:a2e:954c:0:b0:2e5:6957:187a with SMTP id 38308e7fff4ca-2e569571f3amr35927831fa.4.1715522112795;
        Sun, 12 May 2024 06:55:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1787c699sm458503866b.53.2024.05.12.06.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 May 2024 06:55:12 -0700 (PDT)
Message-ID: <dd84ba87-b546-41ec-9cbd-9e6d0fa35476@redhat.com>
Date: Sun, 12 May 2024 15:55:11 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: chipone_icn8505 - remove an unused field in struct
 icn8505_data
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-input@vger.kernel.org
References: <37443a675ca07c91c5f0118ce255406e6e3c08f5.1715502304.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <37443a675ca07c91c5f0118ce255406e6e3c08f5.1715502304.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/12/24 10:25 AM, Christophe JAILLET wrote:
> In "struct icn8505_data", the 'wake_gpio' field is unused.
> There is also nothing about gpio neither in this driver nor in the
> data-sheet.
> 
> So, remove it.
> 
> Found with cppcheck, unusedStructMember.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
> Compile tested only.
> 
> It was added in the initial commit e7330fa032bb ("Input: add support for
> ChipOne icn8505 based touchscreens") but was never used.
> ---
>  drivers/input/touchscreen/chipone_icn8505.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/chipone_icn8505.c b/drivers/input/touchscreen/chipone_icn8505.c
> index b56954830b33..c1b4fc28fa8d 100644
> --- a/drivers/input/touchscreen/chipone_icn8505.c
> +++ b/drivers/input/touchscreen/chipone_icn8505.c
> @@ -68,7 +68,6 @@ struct icn8505_touch_data {
>  struct icn8505_data {
>  	struct i2c_client *client;
>  	struct input_dev *input;
> -	struct gpio_desc *wake_gpio;
>  	struct touchscreen_properties prop;
>  	char firmware_name[32];
>  };

