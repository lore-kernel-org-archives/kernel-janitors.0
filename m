Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C1B5577A
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 18:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710787304; cv=none; b=PXRLDu+qTy14Ws4Q2D2hpMWGLQnMxusEb4AS+2CSGPhOGTW+kBrbf2c8PJFiR1G4rro3EqGs5gxo3hGkZYiNet3jMH0/P+H4kDh+8exB3jwBJSDQD7G4BC6kVdGZrlB7KNMpZRFB9ysXcRbSPm55hR/DW4ReLooNyDdFi+2Pm7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710787304; c=relaxed/simple;
	bh=bZ8EF+f0ojIjoq6Dr918Kh/3SPma0ywuu31m4SVF0CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JV7zZxHGf2zgUfLx6Rwjpby0JC8Q0fOqucHs0gjCk2xpbmvU7ywa7K0bzp3TS91hoB9TGGKETmCGBUBGCDbkrgGD8/k/5GBXb5LiAkKgfzx6CO0zfFYFeM4hiYAmGcWPG1hWGVP5WABaFlkr5ZPm5ZVDpU1En/Is+SlHZJ2RJes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=dMjyIKml; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="dMjyIKml"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-429f53f0b0bso29390611cf.2
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 11:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1710787301; x=1711392101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2Eahz5y1g6Io4kuIZCPOk+HRz1bynd6ShyA3Ce0EGU=;
        b=dMjyIKmlDNCMZ3lNdbPCCvzpwkAD6yspleRqJAznvikT+WCcOja2js+6+xd4hX2Asx
         leNBm+qNaNjoi4eFFyY3lgfUq9YftU2FuLRAdViMqVHLM0GVFCTB/Di0/RvySj05y0pT
         tMhRFiBLl+8rxRJxkk3GFhdGISmglhkBVPnug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710787301; x=1711392101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2Eahz5y1g6Io4kuIZCPOk+HRz1bynd6ShyA3Ce0EGU=;
        b=DiUU+7SRW1EGgR1axupoPu+TjVVV63bZxNuFKjFJd4Dp5jbFh5i/yi3bK3ldK/GsLs
         pDb8J1ucBGuqy4u0Xl8V8QVPFfQEyZUkUS4dzlc9pF15Z7FBQhl5+zoTWcNlCG0Na0C5
         XvRQQYRE4AyZ2NfGTpJaldE68Qm0238URJegFhuU9tTg1AMuUQps1NbF+NtkOEmnwj7V
         2+FJy+petZlSunz8wFysvF4v8RvhQIUa0Cop9TDw7cpBiXA9BiiQiQuFP+JWWcVuvCAl
         tPtZuJZxQeSMzyBdWnM2e8ROlFSW4D04lXY4dgChF7taDkEP5Dk8T1twHlSTlpr5vlsP
         l5KA==
X-Forwarded-Encrypted: i=1; AJvYcCVcGgnHaROrUQqi1LUN/y/ID9vRGsWwM4Eu5WaMVuYd0mUoyk1vUBXgQh4iD3KBc9myWHaNdt+jbZkM11f5jn8Grn4hJceH2is9KNaYPymG
X-Gm-Message-State: AOJu0YwBrlxBO/HXHpQzpuqk+lr9nmkuDADtVM+L3uic9AQpPOqc33qb
	Pd4MmV9TWgX9B+hQsrG7q0mcnetGdlPYyXt4VzltTIpvWnZC488nvXZII7ZPQw==
X-Google-Smtp-Source: AGHT+IGa3DaP+ZQVnj5jdz1bnLoir7DhMaL4Yu8xli/2COHN6CI/dNA/dqupLIRNhbwqIkT59FDHPg==
X-Received: by 2002:a05:622a:248:b0:430:e4ad:afbf with SMTP id c8-20020a05622a024800b00430e4adafbfmr381232qtx.20.1710787301471;
        Mon, 18 Mar 2024 11:41:41 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id fj5-20020a05622a550500b00430b423f06csm3796449qtb.86.2024.03.18.11.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 11:41:41 -0700 (PDT)
Message-ID: <3eb9d5c2-149c-460c-9684-3fdaf946c400@ieee.org>
Date: Mon, 18 Mar 2024 13:41:38 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] mikrobus: Add mikroBUS driver
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Ayush Singh <ayushdevel1325@gmail.com>,
 Vaishnav M A <vaishnav@beagleboard.org>, devicetree@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, lorforlinux@beagleboard.org,
 greybus-dev@lists.linaro.org
Cc: LKML <linux-kernel@vger.kernel.org>, Alex Elder <elder@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor+dt@kernel.org>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Kridner <jkridner@beagleboard.org>, Johan Hovold <johan@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
 Rob Herring <robh@kernel.org>, Robert Nelson
 <robertcnelson@beagleboard.org>, Tero Kristo <kristo@kernel.org>,
 Vaishnav M A <vaishnav.a@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20240317193714.403132-5-ayushdevel1325@gmail.com>
 <4fe6f68a-786c-4e3d-b97d-847d6965d1d3@web.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <4fe6f68a-786c-4e3d-b97d-847d6965d1d3@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/18/24 12:58 PM, Markus Elfring wrote:
> …
>> +++ b/drivers/misc/mikrobus/mikrobus_core.c
> …
>> +static int mikrobus_pinctrl_setup(struct mikrobus_port *port,
>> +				  struct addon_board_info *board)
>> +{
>> +	int ret;
>> +
>> +	if (!board || board->pin_state[MIKROBUS_PIN_PWM] == MIKROBUS_STATE_PWM)
>> +		ret = mikrobus_pinctrl_select(port, "pwm_default");
>> +	else
>> +		ret = mikrobus_pinctrl_select(port, "pwm_gpio");
> …
> 
> How do you think about to avoid the specification of a bit of duplicate source code here
> by using conditional operator expressions?
> 
> 	ret = mikrobus_pinctrl_select(port,
> 				      ((!board ||
> 					board->pin_state[MIKROBUS_PIN_PWM] == MIKROBUS_STATE_PWM)
> 				      ? "pwm_default"
> 				      : "pwm_gpio"));

No.

It's a complex enough bit of logic without trying to bury
it inside the parameters passed to the function.

					-Alex

> 
> 
> Regards,
> Markus
> 

