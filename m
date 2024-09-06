Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DFE1C7B9B
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Sep 2024 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725629251; cv=none; b=qWK1WqI4Wx4W4kyuotJQgdSXcaBsBmQkBCUIKiEUEiuwE4EAX6ygehcvA/24NhX2MaCA/+MdefNVQi8KacbzO57ln4rdJC2upyuGwks6PHmnaTop7tOiAGO1UJiqiYY76sWRI6paU3HLxGg2OxkZcojWTwi9rgHrbI4+ivWTrKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725629251; c=relaxed/simple;
	bh=PNl5VaLScIOW7HEGpUxB5WvNQhPrASGN9iNkVb0l/GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5jOod34IPr2GjBjKOJWlZYtkyLeJfV8nZCVDUdtVFz/Ye0eYbggeikS4JTwYXLX6Cjz5rzyYmS6U5qMsm8cLuQByHzD9Vb0NJBB5HmVHT0e2MQNTh24m9pbaByy+70P1j8t0EN3RO0VvWhHJWJJM7BjT4r/HuliMDhRr9C4Omg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iaAS/ABb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iaAS/ABb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725629247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IjPNr022xYLhGolVIu2SsQehzxUqDqWe4EUz1zQe2/Q=;
	b=iaAS/ABb7LTBHWdnfU5KQ8kAbsgprCm+C7UAR4C1TyJRW+wQ5LEhUY5KocQgtJXf4Kdfo6
	+dGeRkKZXZzVzI4lVZ2B29MRu7qcGWCP38KUK25aTPs6znXHLIMdWpG+JAMWk/+fNNhDqL
	1XnxUTwgHWjzLPoAdlYZgLeSjf1Y0R8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-bgqiF1X7PNGxZdu2gRDtKg-1; Fri, 06 Sep 2024 09:27:25 -0400
X-MC-Unique: bgqiF1X7PNGxZdu2gRDtKg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a8a92ab4dd0so36493366b.1
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Sep 2024 06:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629244; x=1726234044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjPNr022xYLhGolVIu2SsQehzxUqDqWe4EUz1zQe2/Q=;
        b=g3lzn5rlQPk4oXzd3PzfmuIouPXv5sjIue4d2pM+MfCanXbO+cKZiGtvX73uBJBluH
         i0uyoVLPLH2KZ6PjlstG9g39mcMs8KXyD2pW5CecenZbIptDl0ywXYYtT7ZW8dq1tF3B
         pv82c2LsNfXTXJtX9qDy5DuydW704eqmqEXxxBhdXeWhJplyk7Xn1KcUCq9a6NLP0IAV
         615x8R0gRZ9l8xuroreYuCJ06tPDyAZ81OH4AQXZsTysB4osbFDY1Ku9lT7gs8A8QYqP
         /8I/9/YYwIDHLt5PW8h9jXSsbglG09MtEFmxOUE9akh81UzRvsiZz6FjuxKxQB3xpKxi
         yJTw==
X-Forwarded-Encrypted: i=1; AJvYcCVXTg/CkjopWXF17rT4r+a2ZqOl4szNbE/CaDVQMaF74BKN/O+SocGpFsqPka/vQXAHKdUIhnXl2PXgtg0gY8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygx3TRnGfZity2gDtXfLYgdEoiNkXVOGnz+/PXeL+TiYl2W0Sn
	UiNhrfI09Wqd9S/DTpZ0SYWMi+vYZbBJrrScDkNx/AydQpPbsXcxTNG7dCxtkFS9chfjBVQJbqY
	rr7Wn3PpqEHx4VV7ktdU64zqqW/GemSUfS8R1SLQA77BhIdnfd5D1WiibsTmtf8DS5A==
X-Received: by 2002:a17:907:987:b0:a80:f6a9:c311 with SMTP id a640c23a62f3a-a8a88273565mr211889366b.0.1725629244500;
        Fri, 06 Sep 2024 06:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcB3QQBR2uDx98v2VQckrBWO4C7RMR8S/lKeukGfKtD9JofnNPZhsq+M/SfqWpA92TtDIsYg==
X-Received: by 2002:a17:907:987:b0:a80:f6a9:c311 with SMTP id a640c23a62f3a-a8a88273565mr211885866b.0.1725629243894;
        Fri, 06 Sep 2024 06:27:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a6da35496sm226328666b.67.2024.09.06.06.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 06:27:23 -0700 (PDT)
Message-ID: <8fc721e5-74e4-4150-897e-ca203a8d1309@redhat.com>
Date: Fri, 6 Sep 2024 15:27:22 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: Use clamp_t() in
 ia_css_eed1_8_vmem_encode()
To: David Laight <David.Laight@ACULAB.COM>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
References: <155aba6ab759e98f66349e6bb4f69e2410486c09.1722084704.git.christophe.jaillet@wanadoo.fr>
 <20240906081542.5cb0c142@foz.lan>
 <b37a0c60-55aa-44ec-b96c-68cdaabdc110@redhat.com>
 <a9bc91f35f494fb1971229a2df419706@AcuMS.aculab.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a9bc91f35f494fb1971229a2df419706@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/6/24 10:05 AM, David Laight wrote:
> From: Hans de Goede
>> Sent: 06 September 2024 08:53
>>
>> Hi Mauro,
>>
>> On 9/6/24 8:15 AM, Mauro Carvalho Chehab wrote:
>>> Em Sat, 27 Jul 2024 14:51:56 +0200
>>> Christophe JAILLET <christophe.jaillet@wanadoo.fr> escreveu:
>>>
>>>> Using clamp_t() instead of min_t(max_t()) is easier to read.
>>>>
>>>> It also reduces the size of the preprocessed files by ~ 193 ko.
>>>> (see [1] for a discussion about it)
>>>>
>>>> $ ls -l ia_css_eed1_8.host*.i
>>>>  4829993 27 juil. 14:36 ia_css_eed1_8.host.old.i
>>>>  4636649 27 juil. 14:42 ia_css_eed1_8.host.new.i
>>>>
>>>> [1]: https://lore.kernel.org/all/23bdb6fc8d884ceebeb6e8b8653b8cfe@AcuMS.aculab.com/
>>>>
>>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>>> ---
>>>>  .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 24 +++++++++----------
>>>>  1 file changed, 12 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>> b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>>>> index e4fc90f88e24..96c13ebc4331 100644
>>>> --- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>>>> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>>>> @@ -172,25 +172,25 @@ ia_css_eed1_8_vmem_encode(
>>>>  		base = shuffle_block * i;
>>>>
>>>>  		for (j = 0; j < IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS; j++) {
>>>> -			to->e_dew_enh_x[0][base + j] = min_t(int, max_t(int,
>>>> -							     from->dew_enhance_seg_x[j], 0),
>>>> -							     8191);
>>>> -			to->e_dew_enh_y[0][base + j] = min_t(int, max_t(int,
>>>> -							     from->dew_enhance_seg_y[j], -8192),
>>>> -							     8191);
>>>> +			to->e_dew_enh_x[0][base + j] = clamp_t(int,
>>>> +							       from->dew_enhance_seg_x[j],
>>>> +							       0, 8191);
>>>> +			to->e_dew_enh_y[0][base + j] = clamp_t(int,
>>>> +							       from->dew_enhance_seg_y[j],
>>>> +							       -8192, 8191);
>>>
>>> Such change introduces two warnings on smatch:
>>>
>>> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c:
>> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c:177
>> ia_css_eed1_8_vmem_encode() warn: assigning (-8192) to unsigned variable 'to->e_dew_enh_y[0][base +
>> j]'
>>> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c:
>> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c:182
>> ia_css_eed1_8_vmem_encode() warn: assigning (-8192) to unsigned variable 'to->e_dew_enh_a[0][base +
>> j]'
>>>
>>> Should dew_enhance_seg_x and dew_enhance_seg_y be converted to signed?
>>
>> These already are s32, the problem is that e_dew_enh_a is of type t_vmem_elem which is:
>>
>> typedef u16 t_vmem_elem;
> 
> Ugg... :-)
> 
>>
>> And that type is used in a lot of places, so we cannot
>> just change that.
>>
>> I guess we could add a t_signed_vmem_elem (s16) and use that for these vmem-arrays ?
>>
>> I tried fixing it like this:

<snip>

>>  		/* enable group hold */
>> -		ret = cci_multi_reg_write(sensor->regmap, t4ka3_param_hold,
>> -					  ARRAY_SIZE(t4ka3_param_hold), NULL);
>> -		if (ret)
>> -			goto error_powerdown;
>> -
>> -		ret = cci_multi_reg_write(sensor->regmap, sensor->res->regs, sensor->res->regs_len, NULL);
>> +		cci_multi_reg_write(sensor->regmap, t4ka3_param_hold,
>> +				    ARRAY_SIZE(t4ka3_param_hold), &ret);
>> +		cci_multi_reg_write(sensor->regmap, sensor->res->regs,
>> +				    sensor->res->regs_len, &ret);
>>  		if (ret)
>>  			goto error_powerdown;
> 
> Isn't that unrelated?

Yes my bad.

>> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>> b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>> index b79d78e5b77f..c9043d516192 100644
>> --- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>> @@ -172,21 +172,21 @@ ia_css_eed1_8_vmem_encode(
>>  		base = shuffle_block * i;
>>
>>  		for (j = 0; j < IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS; j++) {
>> -			to->e_dew_enh_x[0][base + j] = clamp(from->dew_enhance_seg_x[j],
>> -							     0, 8191);
>> -			to->e_dew_enh_y[0][base + j] = clamp(from->dew_enhance_seg_y[j],
>> -							     -8192, 8191);
>> +			to->e_dew_enh_x[0][base + j] = (u16)clamp(from->dew_enhance_seg_x[j],
>> +								  0, 8191);
>> +			to->e_dew_enh_y[0][base + j] = (u16)clamp(from->dew_enhance_seg_y[j],
>> +								  -8192, 8191);
> 
> How about an explicit clamp(...) & 0xffffu?

Yes that should work, I tihnk.  I actually have changed the type of e_dew_enh_y
and e_dew_enh_f to s16 now and that does the trick of silencing smatch and seems
like a nicer fix.

I need to go and test the fix on actual hw to make sure nothing breaks and then
I'll submit it.

> 
>>
>>  		for (j = 0; j < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); j++) {
>> -			to->e_dew_enh_a[0][base + j] = clamp(from->dew_enhance_seg_slope[j],
>> -							     -8192, 8191);
>> +			to->e_dew_enh_a[0][base + j] = (u16)clamp(from->dew_enhance_seg_slope[j],
>> +								  -8192, 8191);
>>  			/* Convert dew_enhance_seg_exp to flag:
>>  			 * 0 -> 0
>>  			 * 1...13 -> 1
>>  			 */
>> -			to->e_dew_enh_f[0][base + j] = clamp(from->dew_enhance_seg_exp[j],
>> -							     0, 13) > 0;
>> +			to->e_dew_enh_f[0][base + j] = (u16)clamp(from->dew_enhance_seg_exp[j],
>> +								  0, 13) > 0;
> 
> Isn't the RHS just from->dew_enhance_seg_exp[j] > 0 ?
> That shouldn't be generating any kind of warning anyway.

It indeed does not generate a warning I changed all the clamp() calls here
to keep things consistent.

Regards,

Hans

