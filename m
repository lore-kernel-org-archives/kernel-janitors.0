Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1524B52F97
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Jan 2024 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706518759; cv=none; b=CGzKmhZHauNunYY/HROjX+BRByEMiM4UWm9QOfosJaCAFkoELLSVlSUbTFE6ZQsUhG4HwK5uq9RQztMaEjmJePKTV3XTIVsXsiga0OafOQUTyBDIkdkgodVqVmyh2QQQ4hKmebllA+KD0UoEPCATk7pv2JMaJbq+noS73ImlBsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706518759; c=relaxed/simple;
	bh=SjgxZgEJ0zE2xG68u2eXZKUCpalABl62X6Kdteb45Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwB8EfonAD3J4LoCVIb9AV6kMatIexpI4kctF3kl5RyqnRVN4YoE36dztCVUdnfxhabdUdjYquOmClHm6GpvTNceAg9UpoduJqCyXsdKzdRO73J2xLwesUnoVDEFmpi3kYrSY26n55EVsNFMQX7J44Mkpn/yCCwYIHe2kgEV1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CatMXJ9d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CatMXJ9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706518757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz0NTo7T3zvbZQvTXWnrEg5YVgGabir9bR7S1JM1MOk=;
	b=CatMXJ9dkl5cWEJMzT1lh9Bu1vWmlD2yOe6nVdZ0y12+m+v5HffH0pWo3p5gOHGOcoVqxn
	beli+h68IirFIO+t7lcQc2K3MOf1fjMtTYa9luo27oLF2XgdHyNj2OmhkBRPfSs56dOoC5
	YOqaPijvw9eFGP4RWG1knmXHwRPwFic=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-l2Y2mY5cPpyIW4ovVU49Gw-1; Mon, 29 Jan 2024 03:59:15 -0500
X-MC-Unique: l2Y2mY5cPpyIW4ovVU49Gw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a2f71c83b7eso126301666b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Jan 2024 00:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706518754; x=1707123554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mz0NTo7T3zvbZQvTXWnrEg5YVgGabir9bR7S1JM1MOk=;
        b=QPweCrj6RpdxvkXpipq4+RaHOqxHDx4aLXB5mwsdkxqnPDsFbcxOf7jL6tXdbBdlBY
         UqwQULZ7B3l1RPJQBJv7A5lx580prkRSeRBLa7xZIbOtB2KyWwEqbHIZrUJqas05ykn4
         m5UgAojpjBW63JUl9/T07WuAvAGzwemd9UDbY5IUTA0XC+whT4j2oLz9VDrq/LNdntkt
         UQGs55FchveLgmwqwzH9qQZ9utsok2sY3hr9FG56tuHjhX+7JC32e0h5QusJ4yyQgl7E
         8EFk9vB7dQRXUi5fQ36kQkh4ZKEBQSD5FMf//A7MdXVlfTxLPYA42Jvj8kGws2DFIFdf
         j2VA==
X-Gm-Message-State: AOJu0YzTdcRClzeAtVuvInxhPo+BWXONl0P7Y/xemtCNFJcHR4It9UH3
	wiyWMOceEXOHx6plFGo46s1PhzbJT53rPwb2lIguqmjuJbgq85zNe4WtRbXRvAXFPlmQwkCwYYk
	N5ado+v03zUD4zQKYesThKYXceGZYt+lux0ATZXNIhK2rV7nopRb5VGeiN/UDe17g7Q==
X-Received: by 2002:a17:906:a219:b0:a35:6601:e401 with SMTP id r25-20020a170906a21900b00a356601e401mr2937549ejy.5.1706518754372;
        Mon, 29 Jan 2024 00:59:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHf/JYvN1cOiBBS6nmvk4erwpIf/mxbTQA/LtkKLl9FgSRVphAi5XD9/o+bV8doYWxYglG3RA==
X-Received: by 2002:a17:906:a219:b0:a35:6601:e401 with SMTP id r25-20020a170906a21900b00a356601e401mr2937532ejy.5.1706518754117;
        Mon, 29 Jan 2024 00:59:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ub14-20020a170907c80e00b00a3109a492d4sm3647222ejc.20.2024.01.29.00.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 00:59:13 -0800 (PST)
Message-ID: <bbcf1b06-2a65-4f87-b15a-583a668dfc1e@redhat.com>
Date: Mon, 29 Jan 2024 09:59:11 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] platform/x86/amd/pmf: Fix memory leak in
 amd_pmf_get_pb_data()
Content-Language: en-US, nl
To: Markus Elfring <Markus.Elfring@web.de>, Cong Liu <liucong2@kylinos.cn>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <901291c8-ca9c-47b2-8321-256b314690da@redhat.com>
 <2b3b4754-4c20-48ef-9844-f5db6a7f527e@web.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2b3b4754-4c20-48ef-9844-f5db6a7f527e@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/28/24 11:45, Markus Elfring wrote:
>> Thank you for your patch/series, I've applied this patch
>> (series) to my review-hans branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> Note it will show up in the pdx86 review-hans branch once I've
>> pushed my local branch there, which might take a while.
> 
> Will development interests grow for the application of known scripts
> also according to the semantic patch language?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/dev-tools/coccinelle.rst?h=v6.8-rc1#n71

Markus,

I'm not sure what your question here is?

Is it: "Will coccinelle scripts be run as part of the regular patch
test/merge workflow?" then the answer is that there are no plans
that I'm aware of to do that at this moment.

If such a thing were to be done, IMHO it would be best to have one
of the existing CI systems like e.h. Intel's LKP test bot run this
on linux-next, or on all the trees LKP already monitors.

And it does sound like something interesting to do, but someone
would need to actually setup and maintain such a CI system.

If the question is: "Are patches generated by coccinelle welcome?"
then the answer is "Yes patches generated by coccinelle are very
much welcome".

Regards,

Hans





