Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39ADEB64D9
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 13:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjFSNjL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 09:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjFSNjK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 09:39:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4584511F;
        Mon, 19 Jun 2023 06:39:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CCDE360C69;
        Mon, 19 Jun 2023 13:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1632C433C0;
        Mon, 19 Jun 2023 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687181948;
        bh=+yMYlrrrpjBMWR5izSMqH/O1+bOF9xIuZ+0VD+lh6ZE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ik+6lQKabh++qZWl3cENo1KMDs8VhEKzXIfFNs9xT8WmE6+YILwfs2mwvfsg2By9z
         I2vb+DJhnxGzBx7vJD/+uB1kkR5eoKk14cofoO4wdOU92z0gPtvRM/68lrhZFsjpIx
         iyperCQXoaIOPEqFQVeMchex937K/ms4VM57v3ZY=
Date:   Mon, 19 Jun 2023 15:39:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Badhri Jagan Sridharan <badhri@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Elson Roy Serrao <quic_eserrao@quicinc.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: core: Fix double unlock in
 usb_gadget_activate()
Message-ID: <2023061959-volley-badland-81a2@gregkh>
References: <32e22952-8574-4120-979b-ebb6af5f54b4@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32e22952-8574-4120-979b-ebb6af5f54b4@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 15, 2023 at 06:43:03PM +0300, Dan Carpenter wrote:
> Do not call mutex_unlock(&gadget->udc->connect_lock) twice in a row.
> 
> Fixes: 286d9975a838 ("usb: gadget: udc: core: Prevent soft_connect_store() race")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/usb/gadget/udc/core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 83fd1de14784..d58640a9d0ca 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -878,8 +878,6 @@ int usb_gadget_activate(struct usb_gadget *gadget)
>  	 */
>  	if (gadget->connected)
>  		ret = usb_gadget_connect_locked(gadget);
> -	mutex_unlock(&gadget->udc->connect_lock);
> -
>  unlock:
>  	mutex_unlock(&gadget->udc->connect_lock);
>  	trace_usb_gadget_activate(gadget, ret);
> -- 
> 2.39.2
> 

Does not apply to my tree :(
