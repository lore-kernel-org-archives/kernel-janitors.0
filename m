Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6964BC2B9F7
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 May 2021 03:12:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45BC561042
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 May 2021 03:12:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhEYDOE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 May 2021 23:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhEYDOB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 May 2021 23:14:01 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B55CC061756
        for <kernel-janitors@vger.kernel.org>; Mon, 24 May 2021 20:12:31 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id s15so15333466vsi.4
        for <kernel-janitors@vger.kernel.org>; Mon, 24 May 2021 20:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hh7q+u3PQs9FnCxo0AI97z4AFr42pPhmERTNRWxYl0c=;
        b=pPXJSdf1rv8WcUA+8rxTpsWTTY/1xJu459KUDSraz0BvARuyDptlGU7qL5L/isPq+a
         2rmpSzPpaA+iEDOXysTVWR4m5H1ClEhPlBFApVxWczHVFk4/uQvcl7LpYlXVGxL6NJb+
         j8SN5ITdF7sSfCrDQCW1fjqiiqL1mUsT6th9/qQ08V380C/xr0sUFL4xNGTfkT2pk5qc
         y7cfQnInqzZ/C6ae2h5gANNI/GuCEvo/RvHo4WsYr+d0+fmYK9JHLUxb5Vz2M4W0/9cT
         MNDEv0U95sLCbVG03876RoHCYsv5qvzkHM3sZBryNzw9DlLgWXInbxg1NVwXErXmBv/k
         lZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hh7q+u3PQs9FnCxo0AI97z4AFr42pPhmERTNRWxYl0c=;
        b=IJYdky37TdlY/Y3B56i7PLJ74Vfk6aC9/F7kppRvxPJ5t1Cf6r8cs1cdkgdx9X7hNZ
         nQV+kdv4tO8rJTHwd4pjLdsp3U7N0s9DUpBUWcfHMLcPyPWajx/5GinjdVP4wJYoBEnK
         wgJuWg1kw9ol+3PWlXBa9G8uqHNKY+8eR478b+Lb/hXN8dJaJ5OVQIm+lslTbriV+v3f
         LjPKMq3gz0nozaqAp1g4uh0bB/48LrX95elABhfeB6PXbzLBs3uSHnOVa71zH03aP4qM
         WWlSB2VZa0VyV+7BzSONoPFfGRSHCv8rb297uFkR7eJLHdl/Ibuln/G8etswzjS3daXN
         pcPw==
X-Gm-Message-State: AOAM530bIh8KoIYRvqogaJSxIRWxJClKacEWwslYZK0RkRcKxA0a6S8I
        DXW2Pt3fXKE7crWjJq/Y27uO+Z2IMbQvTFaTqvvMSA==
X-Google-Smtp-Source: ABdhPJzDNKuzhu/VY8WMVLKih3X9JxaBhy4/5X7QuXPBaO7TvjQysRGO/wkZZ+5IjcGaLvnzDWJWHbChjgKdSmzQ/Y8=
X-Received: by 2002:a67:d71e:: with SMTP id p30mr25147437vsj.25.1621912350170;
 Mon, 24 May 2021 20:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210524133704.2432555-1-weiyongjun1@huawei.com>
In-Reply-To: <20210524133704.2432555-1-weiyongjun1@huawei.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Mon, 24 May 2021 20:11:53 -0700
Message-ID: <CAPTae5K=4NpOanziQWA7RmdxYrxwwgfKixKi1SG6LrMZcCh=0w@mail.gmail.com>
Subject: Re: [PATCH -next] usb: typec: tcpci: Make symbol 'tcpci_apply_rc' static
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 24, 2021 at 6:26 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> The sparse tool complains as follows:
>
> drivers/usb/typec/tcpm/tcpci.c:118:5: warning:
>  symbol 'tcpci_apply_rc' was not declared. Should it be static?
>
> This symbol is not used outside of tcpci.c, so marks it static.
>
> Fixes: 7257fbc7c598 ("usb: typec: tcpci: Implement callback for apply_rc")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 34b5095cc84f..22862345d1ab 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -115,7 +115,8 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
>         return 0;
>  }
>
> -int tcpci_apply_rc(struct tcpc_dev *tcpc, enum typec_cc_status cc, enum typec_cc_polarity polarity)
> +static int tcpci_apply_rc(struct tcpc_dev *tcpc, enum typec_cc_status cc,
> +                         enum typec_cc_polarity polarity)
>  {
>         struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
>         unsigned int reg;
>
