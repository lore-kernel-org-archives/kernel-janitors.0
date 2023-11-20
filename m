Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SXAvK+LU"
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6DBE5
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Nov 2023 22:14:34 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4083f61322fso13190285e9.1
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Nov 2023 22:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700460873; x=1701065673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbbQXlLM5rzQD/2Q3ynuAoYoACD7YY6nmC8tH95Lw5U=;
        b=SXAvK+LUHUvVNYrXHgMbByyw/BTUJAw81uk81cygdcxEhGOUsKTSIBX6SfBl3p0hTs
         ZO4vjYCtfNs5Ykpl7RqdN4lrahN1jBV3SNNzlXQcjRwDwguCfWn+wsxBgIZcmodFVKwE
         50vcQsK4xPfcpQ1o1o3iEFoyRK6vz1GZL3Ib1DC9/3zK5zhxk2n7R0LtvcxlVNv75FtQ
         hlPCnCfDJJChREmjJieIZ7LwrACSYhOXOkRBi1pARpB9Ip/r9+FoDdtezCxfGZ2zszat
         4iQdivC8zZOYnA13Fy1ryVzJDRsMR2LlSoM7TGEYsgdIfYgkbIZtHC3pJxrLd/JVi8qt
         rrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700460873; x=1701065673;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbbQXlLM5rzQD/2Q3ynuAoYoACD7YY6nmC8tH95Lw5U=;
        b=tWCdOOpzhncGS0uPPNlCJ9vE1EXmGMEfLqjptWKYW75JaizAUA2j0AdRSGSArPUsiA
         XCRRC8aqmmGzvLLC1cFXMkN9x52Tmi+mcdUZVj3tB27n9IKI1OhX2zsrFAW0+EWeIiF9
         O3le+fJizh6oLCsl0nfnwhc0Q2bfp7130gn2S7FIu10BrrD5Vc1jWtEejvPrKHGk0RDj
         F7lvuEi3Mti3DQnq09TED2gYCs+V9PqiaGLSSuBoO+xYURRLwISvXZJ3Ejq6Y8OpWZCk
         m6GDIDdnuYEeXe2iXLcx8lnHgRU29kYank83YDp8bzohIl64voM0jglGpIY/zHRm7SAZ
         3Mcw==
X-Gm-Message-State: AOJu0Yx/YiJGeD3hcJwhdHZdSB1oxrjtJjnPQERwTMl6lUzhRJbN2DZI
	h57o1IulopBWQsxIbZoBhxLD3w==
X-Google-Smtp-Source: AGHT+IGzKv935lOdpZd3Z+/Bot9oeXhwBAS3lV+3fYuXbVgc69YgQXsGKDnfj1wjbrzAY3h8y9FHeg==
X-Received: by 2002:a05:600c:3c9b:b0:40a:3e41:7dd8 with SMTP id bg27-20020a05600c3c9b00b0040a3e417dd8mr4698567wmb.13.1700460872980;
        Sun, 19 Nov 2023 22:14:32 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id n27-20020a05600c3b9b00b00405959469afsm12486333wms.3.2023.11.19.22.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Nov 2023 22:14:32 -0800 (PST)
Message-ID: <ccfcf2a5-c04b-4781-8658-d63044b9b9c6@tuxon.dev>
Date: Mon, 20 Nov 2023 08:14:30 +0200
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
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Richard Genoud <richard.genoud@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <f2e9790d8b49aeba8b43ce018d30a35b837ac1eb.1700409299.git.christophe.jaillet@wanadoo.fr>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <f2e9790d8b49aeba8b43ce018d30a35b837ac1eb.1700409299.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Christophe,

On 19.11.2023 17:55, Christophe JAILLET wrote:
> dma_request_slave_channel() is deprecated. dma_request_chan() should
> be used directly instead.
> 
> Switch to the preferred function and update the error handling accordingly.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: Also update atmel_prepare_rx_dma()
> ---
>  drivers/tty/serial/atmel_serial.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 1946fafc3f3e..6aeb4648843b 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -1013,14 +1013,18 @@ static int atmel_prepare_tx_dma(struct uart_port *port)
>  	struct device *mfd_dev = port->dev->parent;
>  	dma_cap_mask_t		mask;
>  	struct dma_slave_config config;
> +	struct dma_chan *chan;

There is no need for this.

>  	int ret, nent;
>  
>  	dma_cap_zero(mask);
>  	dma_cap_set(DMA_SLAVE, mask);
>  
> -	atmel_port->chan_tx = dma_request_slave_channel(mfd_dev, "tx");
> -	if (atmel_port->chan_tx == NULL)
> +	chan = dma_request_chan(mfd_dev, "tx");
> +	if (IS_ERR(chan)) {
> +		atmel_port->chan_tx = NULL;
>  		goto chan_err;
> +	}
> +	atmel_port->chan_tx = chan;
>  	dev_info(port->dev, "using %s for tx DMA transfers\n",
>  		dma_chan_name(atmel_port->chan_tx));
>  
> @@ -1188,6 +1192,7 @@ static int atmel_prepare_rx_dma(struct uart_port *port)
>  	dma_cap_mask_t		mask;
>  	struct dma_slave_config config;
>  	struct circ_buf		*ring;
> +	struct dma_chan *chan;

Ditto

>  	int ret, nent;
>  
>  	ring = &atmel_port->rx_ring;
> @@ -1195,9 +1200,12 @@ static int atmel_prepare_rx_dma(struct uart_port *port)
>  	dma_cap_zero(mask);
>  	dma_cap_set(DMA_CYCLIC, mask);
>  
> -	atmel_port->chan_rx = dma_request_slave_channel(mfd_dev, "rx");
> -	if (atmel_port->chan_rx == NULL)
> +	chan = dma_request_chan(mfd_dev, "rx");
> +	if (IS_ERR(chan)) {
> +		atmel_port->chan_rx = NULL;
>  		goto chan_err;
> +	}
> +	atmel_port->chan_rx = chan;
>  	dev_info(port->dev, "using %s for rx DMA transfers\n",
>  		dma_chan_name(atmel_port->chan_rx));
>  
