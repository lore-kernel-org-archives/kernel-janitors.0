Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B892EB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 11:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjFSLrm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 07:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjFSLrj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 07:47:39 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B19E130
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 04:47:27 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f900cd3f69so18386225e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 04:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687175246; x=1689767246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWlJYwdCUfBlFGZKizl0GxiNXteMsT9gcqvTsOApU/E=;
        b=K0yglfGatPbUta8mAHvIga/XRv1NIT5KcaFCvQrQNd/DzfjIcQlCKKMBp/y5CiWzOC
         ERZ2X6vf2klvxBer3CXn1Zy15a5c+RF8wJOpRm1ismrnGpHf1L5v/hsBCYRTgAggpIid
         /9Wf7nQrCIiSXfJr40vd9C4JszeiThmzCELA5sNENfi7NAEvjMlhiJRBY8KapAr9Whcs
         6o2zowGQOTz1qmP8CyhTav8Is7zpBMZNuQEkrIF6iRbk+CNxTFOa2hheIpIEdhnpF9BL
         ZoROaXbnJSemqpiFasuVDiewUHedO+5B7Rl75ltY3Jyh5QmsdkiM58eVGzg4lfn6j/Ew
         kNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687175246; x=1689767246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWlJYwdCUfBlFGZKizl0GxiNXteMsT9gcqvTsOApU/E=;
        b=dTT2CIAoI2LD/QaSGGQY54UuH5dYPUDEW6+AJX43NbEtcYhD59ikfT+vAolg4WmZAx
         zJksEL7q9zApIxoHpXZFHxcsmLhexkM5qHkKNYQ6K/f8XHSrbUkgqVaGDxQIg+hbo9im
         YXp26GmSwYOcJpr3r5BrCmLVaM2kiTTt1aaufqrTF1d1tBkRffMspgkyHAFKE/0aAYjD
         ClbksifOaVDL9uHtNmPdaEqtxSILEnlx/fkBk/BrEhUi3Fa/JageGH9WQCC2eIoAkZvJ
         JnfYwqf+N9Mv1g7b2h6FDrrmyM2+Q+IXCqgKN7Zeat/ktC1jFgdQOTHD+12450sfU8ZG
         116w==
X-Gm-Message-State: AC+VfDwLHc5ILhJkgGlnMKOh0UwPq8Oo92U9x4XCZfwyc7AsopxWCPIq
        qnvatCEv4D1sJdFKIODFd23jtQ==
X-Google-Smtp-Source: ACHHUZ6yF5Wg+ySHnIbIm3GmKwvUQW1PgUhZnWqi3kkg14VfkIrwyMlupDh3Dc8Cu4G10HmONT74ZQ==
X-Received: by 2002:adf:d092:0:b0:307:7f38:37f with SMTP id y18-20020adfd092000000b003077f38037fmr5678278wrh.66.1687175246001;
        Mon, 19 Jun 2023 04:47:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k6-20020adfd846000000b003111025ec67sm13562580wrl.25.2023.06.19.04.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 04:47:23 -0700 (PDT)
Date:   Mon, 19 Jun 2023 14:47:20 +0300
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
Message-ID: <0be8c2ad-499a-4cf1-af98-920af542c5b9@kadam.mountain>
References: <cb7c39a9-c004-4673-92e1-be4e34b85368@moroto.mountain>
 <d87d9f00-8d85-6220-43d3-51ef8e793193@kernel.org>
 <c0c661bb-2584-46cd-9c72-8f1d9ccbaee4@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0c661bb-2584-46cd-9c72-8f1d9ccbaee4@kadam.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 19, 2023 at 02:44:11PM +0300, Dan Carpenter wrote:
> On Mon, Jun 19, 2023 at 01:01:49PM +0200, Jiri Slaby wrote:
> > On 19. 06. 23, 11:45, Dan Carpenter wrote:
> > > The atmel_complete_tx_dma() function disables IRQs at the start
> > > of the function by calling spin_lock_irqsave(&port->lock, flags);
> > > There is no need to disable them a second time using the
> > > spin_lock_irq() function and, in fact, doing so is a bug because
> > > it will enable IRQs prematurely when we call spin_unlock_irq().
> > > 
> > > Just use spin_lock/unlock() instead without disabling or enabling
> > > IRQs.

Maybe I should add a "a second time".

"Just use spin_lock/unlock() instead without disabling or enabling
IRQs a second time."

regards,
dan carpenter

