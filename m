Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4695818C36
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Oct 2024 06:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727938418; cv=none; b=LgjpIXICMPLVMMP14+WeQe9ZB0Zbcyv6nmlWQKvnqxFIZ+zo42qo5QSR04vU6OeF1jqm6ATaG+vPP6MidhMqg0HaNi1ia4UOTXdWl3lapoTujHh+2lbUC19VgtjnDZ+8JW9wS66AFyCs0TC/vPcQBehyAnsryqo6NP6iCgT7FSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727938418; c=relaxed/simple;
	bh=RTz2paAPGkOCvRTYA1sc2qKt4ix/70iavVeUYG7ddAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWEourCzb93uZo96KcJLAGadvLf009AII73bgsTCA57Y4XkDqvG26VPw0Mkf9t7EZ/jsSibauKxmquk9f6Q0g+47Br5z3K5690VAOAFajQMG6zePcXLaJ9mgQDWOpB6I99m++bNB8n8MdXizK5yuAvOv4zLV/5WSGjwHNhOAlLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJD9KYX4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJD9KYX4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42ca5447142so712685e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Oct 2024 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727938415; x=1728543215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pWinR9+IEUeT26gv9XriISeb7/hBJQCK5PO4fEg0ua4=;
        b=GJD9KYX4YkAyMR8cxfoYWgFTlcdqmhbQjGs3F3T6m77eTIyNRkQtdh9mRgmHeDWgz7
         I/YytAkBfbjty2ZbcmksK1ze0YgklkKm3P1GkcutAB/NtLJMu99jQqkENNVFQWacD6i3
         74UQPiQ0PlL7Fod2Z1f91moKn22o4hPGYp37jWHGCRbA4s463zpCIDIRbybrwufOXXuq
         Ac6pM8KwNOIYfxe9lMcv5WjzRa7fhRTMAobgEHdCGbIQIXPbqffjJCignVi5F3Gs4N2L
         lR0OyLg8baCeYiladsj5apAT6LGGl6GoOpsDfdrUKJ1vl4fT82FB9ihTANRPkiAZs/se
         SJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938415; x=1728543215;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWinR9+IEUeT26gv9XriISeb7/hBJQCK5PO4fEg0ua4=;
        b=YJ9Ngp2GLERdt3y2GpFIuNNM9gLNk2ezIe+8SjKdL2QFl7Y60OFBc4N67bXnxldoM2
         DSUzhf6CsCGJWAPwXotXifTKSDHpFO3nqqCr/FwcMjf2PfyVAxQHi9d7Gy6jIQYB/sFS
         Hhuyz32L9eycUxRnlQdBuridjKq9eab7IoA9QNPKp0DHs8KWhdFd260qATGHOP+POCeN
         9ef3PzXhcUMHSxoJPcShyRjR0V2ktKeMq1V1UjgxSBBzBIBoTEDqj8Xm6rfsdrkXQUg1
         z8SGZXNilbdvLn3u4U4i1M6gNAWhB0yuB07udKbeakuJOuwkc3I2OGW9Ps7Lz6fPJacq
         a8zw==
X-Forwarded-Encrypted: i=1; AJvYcCW0OvhD/pOBmtT+SZPe0eevDfxA5zenXZZAACdI3hKoDbmmwpwwaI+bCHUVvoh3LwADwuxp1/NtSZJQJ8wRMUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzguvyiZC6fb/Vq8ZHR9Lo+ScR3xLwg4NnGBsERGYdoLj8e/yLV
	MxL27T+5N9wpVEfAyq4185+1kKLJqB+RmQ2Iy0ebw3UuV+QlQKIuQkOGYSxfyQs=
X-Google-Smtp-Source: AGHT+IExfsY8Dl/j6nsGGSXJy4gmkLFKdF9p4YmX76Pvf+jF2tDCnazTK3jObwlr72l9boAJSe7WNQ==
X-Received: by 2002:a05:600c:3c8b:b0:42c:ba83:3f08 with SMTP id 5b1f17b1804b1-42f777b00c6mr20600385e9.2.1727938415575;
        Wed, 02 Oct 2024 23:53:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f8068398esm6602035e9.34.2024.10.02.23.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 23:53:34 -0700 (PDT)
Message-ID: <9e113d6b-c919-4b72-bd31-b8ab11e6a6f1@linaro.org>
Date: Thu, 3 Oct 2024 08:53:31 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powermac: Call of_node_put(bk_node) only once in
 pmac_has_backlight_type()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
 Jani Nikula <jani.nikula@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, LKML
 <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <b7e69e04-e15c-41ec-b62b-37253debc654@web.de>
 <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
 <34233c4c-1f61-4bc6-aeca-9f5faba8509e@stanley.mountain>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <34233c4c-1f61-4bc6-aeca-9f5faba8509e@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/2024 07:56, Dan Carpenter wrote:
> First of all, the change is wrong.  We can't dereference "prop" after calling
> of_node_put().  You have to be a bit extra careful reviewing Markus's patches
> because a lot of the rest of us have blocked these messages so you're on your
> own in that way.

Yep, I plonked him some time ago and everything is in spam.

The code looks just incorrect and I think Markus did not understand it
before transforming.

Best regards,
Krzysztof

