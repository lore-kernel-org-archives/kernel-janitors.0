Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E80EB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 11:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjFSLog (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 07:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjFSLoe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 07:44:34 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7F2123
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 04:44:18 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f8f3786f20so40102685e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 04:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687175057; x=1689767057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1rsF1D8uyZq3uz3se7ElNK4DRXiJnMX09Y1q0xDnG/I=;
        b=LgTzAeD5xJ/jI/z+vqGmfz/9JscizKDPM4gCSd1aAXab5AH1RWD4/R8OTaRrEfMmIZ
         ZBw7Eph2Heqgw2nUbVV1UzQcPZFDTbzfpHgifoP4WEmBRxmjU/p3HF/eN2kmXYbRapTh
         098Pl0fh00mOX0ZqYrEVp9U/6jEJYV4/JvHGPqLtzlEoWtDw4+ZrMtSDIjdmN8pQi0mh
         kWo3mAcDuNmXvFJyUE6CDWNp4Gwsbs7N6IIsR1+QpdIf9ZhfAFRuiIEqbWva5NmqelBI
         kVU+2Pb4U5bVDQaGc6y231OH63JMOchGJeNO40ZF8iAVjAXe8Zi4aMhmGfmEKu+ui4eK
         QrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687175057; x=1689767057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rsF1D8uyZq3uz3se7ElNK4DRXiJnMX09Y1q0xDnG/I=;
        b=goJmvOYRqbga+4EMKApehksB0pECIsAiM78iSCtZEDq/iokXhWNQrm5y5tlYZmW5Kr
         5RKJ9ynTF7C6mEn86RJ4bOgW4F0CbhZCJrFiVnnm6w74w9isdbT6PDe2YSd0lh7MbX+M
         yjENfk4WSL9WyPfu2rt4J+dAZb3UEUrOuN/HRewjiL6v4wLzt6ccf/8ZNDYZWNli5nuV
         AXz+Yun46u3+ghI2tZuc0lDDlAbHyASj5EuN+0LpnPfKC9hB+Gj5NNtEN+FsjxnYQRYK
         /ZZiRnXn6DQqQo4j99Su0s4ARfmDX7uhYwGHINMzleh1uVg8fHNKHK0atQtLt6UeC7/s
         7XfQ==
X-Gm-Message-State: AC+VfDzoX60ezECvQZuPZpy3G4krM1rM7Zkj7Vk30cT9PfOqUbk6xvAY
        qoDZbWo5h9JK1e0OjU6irWIVYA==
X-Google-Smtp-Source: ACHHUZ5P5+CcXudwLHPDYOGouGXNUeoeG018v7vRJs/TWfPYoTGdlqszoXA2UM/AaSddfuK/JRpLoA==
X-Received: by 2002:a5d:468d:0:b0:30f:be1f:8711 with SMTP id u13-20020a5d468d000000b0030fbe1f8711mr9289289wrq.63.1687175057159;
        Mon, 19 Jun 2023 04:44:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i1-20020adffc01000000b0030aee3da084sm31263683wrr.49.2023.06.19.04.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 04:44:15 -0700 (PDT)
Date:   Mon, 19 Jun 2023 14:44:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Elen Song <elen.song@atmel.com>,
        Richard Genoud <richard.genoud@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ludovic Desroches <ludovic.desroches@atmel.com>,
        linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] serial: atmel: don't enable IRQs prematurely
Message-ID: <c0c661bb-2584-46cd-9c72-8f1d9ccbaee4@kadam.mountain>
References: <cb7c39a9-c004-4673-92e1-be4e34b85368@moroto.mountain>
 <d87d9f00-8d85-6220-43d3-51ef8e793193@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d87d9f00-8d85-6220-43d3-51ef8e793193@kernel.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 19, 2023 at 01:01:49PM +0200, Jiri Slaby wrote:
> On 19. 06. 23, 11:45, Dan Carpenter wrote:
> > The atmel_complete_tx_dma() function disables IRQs at the start
> > of the function by calling spin_lock_irqsave(&port->lock, flags);
> > There is no need to disable them a second time using the
> > spin_lock_irq() function and, in fact, doing so is a bug because
> > it will enable IRQs prematurely when we call spin_unlock_irq().
> > 
> > Just use spin_lock/unlock() instead without disabling or enabling
> > IRQs.
> > 
> > Fixes: 08f738be88bb ("serial: at91: add tx dma support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/tty/serial/atmel_serial.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> > index 6e9192f122aa..3467a875641a 100644
> > --- a/drivers/tty/serial/atmel_serial.c
> > +++ b/drivers/tty/serial/atmel_serial.c
> > @@ -868,11 +868,11 @@ static void atmel_complete_tx_dma(void *arg)
> >   		dmaengine_terminate_all(chan);
> >   	uart_xmit_advance(port, atmel_port->tx_len);
> > -	spin_lock_irq(&atmel_port->lock_tx);
> > +	spin_lock(&atmel_port->lock_tx);
> >   	async_tx_ack(atmel_port->desc_tx);
> >   	atmel_port->cookie_tx = -EINVAL;
> >   	atmel_port->desc_tx = NULL;
> > -	spin_unlock_irq(&atmel_port->lock_tx);
> > +	spin_unlock(&atmel_port->lock_tx);
> 
> Hmm, can you ensure the DMA engine code calls this with irqs disabled? If
> so, you should document it in the commit log. If not, you shyuld use
> _irqsave() variant.
> 
> thanks,

Hi Jiri,

I feel like we are miscommunicating but I don't know how to improve my
commit message...  The function itself disables IRQs at the start using
_irqsave().  I have left that as-is.

regards,
dan carpenter


