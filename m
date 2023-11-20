Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bhRTW9Zr"
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD859B4
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Nov 2023 23:13:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5094cb3a036so5802496e87.2
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Nov 2023 23:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700464380; x=1701069180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLaWQRdfr6nMXYi7OACSu7/8cprPzA6DbFJtJv63SGI=;
        b=bhRTW9ZrHM0RzAcHbQyMaZfux5E72+Ag+0SrZKQhkGWe6dnziCmxPDxsVzNogxYp1p
         Q4UJZ1bC9ImHvK+f/caoxlsJvH0N3iis2wAn2+jq+EhjoeAfYj8V46J0muRpLT/lmeni
         ElXMUEU/ZIgA6wiXguOYZxoI4FeD0EvlWiL6Adz3SKVhGKQkkWUTq82LbPHoXHaSNLpj
         MTNBW0K3/ZKFP4Rg6zV0bdlO9HydRoHfCSqrVll4Wa6peswsXOU7DX+p4J2QSYwkXQ+0
         VJuVdVMJG0+qWWNPJMYaTyFjXdpF2I1Q2fT/KaBZfweLOmyNeuEqUddk2A7c28+UCYJm
         LrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700464380; x=1701069180;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLaWQRdfr6nMXYi7OACSu7/8cprPzA6DbFJtJv63SGI=;
        b=A3b1xz9us2LWiUtVEfEKjLLEsFeR46G+sxhbTpkhT4po/eoLx9h10I/Rb2H+vl546e
         vpSq59OFjFWbjWqwnqqO5i+qRbaVuHuraVyL83UO8NnBsOZJLbvZnpyr6tmknk/6sk4e
         hSbjksDAMONekLVITBbaEYbHAAbgDw8drHWFXjjTpxD7jlhb/2aN3lVyEs2D2i+wrA/G
         uWCvCvFCLujHpSzbZhSnRWYQPMuQ9aUzz0DZ8fqcY4uUpcB8mjaxzs8RN7vnsePGxcr2
         u43EhCWnwallS6nXyki5VIeVs5pzqxaFdFkqe0dCY1AR5na4w0waYPIAvHAJdPhV7s5I
         js4w==
X-Gm-Message-State: AOJu0YwsLpqg2vJ2DBZMZXUfoGOdjdDSUJSK88s3wHWREBe/CRsnzVxJ
	a+ciZf4hEAJQ9UyYb0qFCSLYmw==
X-Google-Smtp-Source: AGHT+IHHFMPQE7uzRJ7hggvhdnwod6oYenlYn43gfqLBGmts/lNT/cwsHue+sv5rh25AhF8PCpDjiA==
X-Received: by 2002:a05:6512:358f:b0:502:a4f4:ced9 with SMTP id m15-20020a056512358f00b00502a4f4ced9mr4139590lfr.62.1700464379945;
        Sun, 19 Nov 2023 23:12:59 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b003316debbde4sm8229214wrr.48.2023.11.19.23.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Nov 2023 23:12:59 -0800 (PST)
Message-ID: <e37ce03e-4e41-4262-9f54-bcbab3bb1421@tuxon.dev>
Date: Mon, 20 Nov 2023 09:12:57 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: atmel: convert not to use
 dma_request_slave_channel()
Content-Language: en-US
To: Jiri Slaby <jirislaby@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Richard Genoud <richard.genoud@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <f2e9790d8b49aeba8b43ce018d30a35b837ac1eb.1700409299.git.christophe.jaillet@wanadoo.fr>
 <ccfcf2a5-c04b-4781-8658-d63044b9b9c6@tuxon.dev>
 <5c2ec2ff-459e-4bb7-b287-8a06005c86f5@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <5c2ec2ff-459e-4bb7-b287-8a06005c86f5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20.11.2023 09:04, Jiri Slaby wrote:
> On 20. 11. 23, 7:14, claudiu beznea wrote:
>> Hi, Christophe,
>>
>> On 19.11.2023 17:55, Christophe JAILLET wrote:
>>> dma_request_slave_channel() is deprecated. dma_request_chan() should
>>> be used directly instead.
>>>
>>> Switch to the preferred function and update the error handling accordingly.
>>>
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>>> ---
>>> v2: Also update atmel_prepare_rx_dma()
>>> ---
>>>   drivers/tty/serial/atmel_serial.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/tty/serial/atmel_serial.c
>>> b/drivers/tty/serial/atmel_serial.c
>>> index 1946fafc3f3e..6aeb4648843b 100644
>>> --- a/drivers/tty/serial/atmel_serial.c
>>> +++ b/drivers/tty/serial/atmel_serial.c
>>> @@ -1013,14 +1013,18 @@ static int atmel_prepare_tx_dma(struct uart_port
>>> *port)
>>>       struct device *mfd_dev = port->dev->parent;
>>>       dma_cap_mask_t        mask;
>>>       struct dma_slave_config config;
>>> +    struct dma_chan *chan;
>>
>> There is no need for this.
> 
> How'd you avoid crash in here then:
>         if (atmel_port->chan_tx)
>                 atmel_release_tx_dma(port);
> ?

I wanted to say that instead of adding the chan variable the
atmel_port->chan_tx would be used instead.

> 
> thanks,
