Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A669EB64D9
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Jun 2023 18:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238766AbjFOSLe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Jun 2023 14:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238573AbjFOSLd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Jun 2023 14:11:33 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727E4295C
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Jun 2023 11:11:30 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-54fcef0204aso1783041a12.2
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Jun 2023 11:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686852690; x=1689444690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJi3cCnc2qA6VU+gHOwF45LozWJ4WxOCugFiLIt6KK0=;
        b=7edQvGXJpXGAfxPgc1jNQFe7QPN0YXhx1L5+4xX9bOk38QV/xd3JIVc3YdwnxBnguX
         qCcK6VDiEyl6HgOruxjXZgKChfrH0MABQ3xeaKHfvwY4Jg1OEdu/snrxtho/ENIplk5E
         vZoMUnWWZXXfw6QGJFs5JP8jiPhWNZOxU9OUDTw4PJIxoWbxp04eTrdo7PQ7anDqCybU
         jZYhmoNzJ5ZdHSPtP62IcDyxwVuVhEUvRb4fB0yTqGW48/nYD78h01fYXApcRWre41x8
         xBIQoZv1DDsu1su4VSCj6IzZMT95/5JJE6+PdFEC2v6fFt92jY2se8QSO2IMrJ8Z4vgt
         TUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686852690; x=1689444690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJi3cCnc2qA6VU+gHOwF45LozWJ4WxOCugFiLIt6KK0=;
        b=f7SfEmBRlGUFYTkpfqNNp2QPwBARrNaOCH25DFgSVMFF//yFNYuFAMqsYEi1SWBhpN
         QGZZEvU3kGmTpGp8esaLHLeH+11LbevRqEsfLGlclKAVdDRpPsEgxU0U6FkI1nQ4tc1G
         wbjzIlEs8AWSOcKLLxcOVzvHVtuHT+oQjCSRzhh7B62BkRzz4fo0/7naMMA47Rct2tUA
         Fk2iYMk5NwB8tswJKPsvKPNk5xaytQAXVCpNPin2jTCUrmuI2mPiJNisfLjAsb9pH9gD
         +RJDfbCkCRkMlC1ybE2M+yhL67fo7GRQhVjLmN1a7cRN+2jxlR8NxF45sanvU/L52xJ8
         MG9w==
X-Gm-Message-State: AC+VfDy/APtfjwV8bHf5fDNQKo27t5ibqR3KSu1q0K9momLcmTDNla7o
        qqVeIBEA7u2mV0qf05tJKyWOFjxp7VxlSr87SCLuPQ==
X-Google-Smtp-Source: ACHHUZ7TdJMcV7jKggkCi2cBsbe/G/xosY3BmPuZPnQO1p22CBqpygxGJ/8KZn+ho/nF5S+ofziY6O9lshA4erx07+c=
X-Received: by 2002:a17:90b:1b0f:b0:253:3e9d:f925 with SMTP id
 nu15-20020a17090b1b0f00b002533e9df925mr5004732pjb.31.1686852689775; Thu, 15
 Jun 2023 11:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <32e22952-8574-4120-979b-ebb6af5f54b4@moroto.mountain>
In-Reply-To: <32e22952-8574-4120-979b-ebb6af5f54b4@moroto.mountain>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 15 Jun 2023 11:10:53 -0700
Message-ID: <CAPTae5LVtQryd=yHJo0NksRnxxP7kykw3SgKNx72MqPSyooTnA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc: core: Fix double unlock in usb_gadget_activate()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Elson Roy Serrao <quic_eserrao@quicinc.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks Dan for posting this !

Regards,
Badhri

On Thu, Jun 15, 2023 at 8:43=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Do not call mutex_unlock(&gadget->udc->connect_lock) twice in a row.
>
> Fixes: 286d9975a838 ("usb: gadget: udc: core: Prevent soft_connect_store(=
) race")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

> ---
>  drivers/usb/gadget/udc/core.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.=
c
> index 83fd1de14784..d58640a9d0ca 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -878,8 +878,6 @@ int usb_gadget_activate(struct usb_gadget *gadget)
>          */
>         if (gadget->connected)
>                 ret =3D usb_gadget_connect_locked(gadget);
> -       mutex_unlock(&gadget->udc->connect_lock);
> -
>  unlock:
>         mutex_unlock(&gadget->udc->connect_lock);
>         trace_usb_gadget_activate(gadget, ret);
> --
> 2.39.2
>
