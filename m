Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED0FC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 May 2022 07:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbiEWHfH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 May 2022 03:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiEWHfE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 May 2022 03:35:04 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 275E23A0
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 00:34:55 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0E65980C2;
        Mon, 23 May 2022 07:30:57 +0000 (UTC)
Date:   Mon, 23 May 2022 10:34:53 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] tty: n_gsm: Fix packet data hex dump output
Message-ID: <Yos5HacdiYhni9v+@atomide.com>
References: <YosxSDXeL9jTCENN@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YosxSDXeL9jTCENN@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

* Dan Carpenter <dan.carpenter@oracle.com> [220523 06:57]:
> Hello Tony Lindgren,
> 
> The patch 925ea0fa5277: "tty: n_gsm: Fix packet data hex dump output"
> from May 12, 2022, leads to the following Smatch static checker
> warning:
> 
> 	drivers/tty/n_gsm.c:720 gsm_data_kick()
> 	warn: sleeping in atomic context
> 
> drivers/tty/n_gsm.c
>     698 static void gsm_data_kick(struct gsm_mux *gsm, struct gsm_dlci *dlci)
>     699 {
>     700         struct gsm_msg *msg, *nmsg;
>     701         int len;
>     702 
>     703         list_for_each_entry_safe(msg, nmsg, &gsm->tx_list, list) {
>     704                 if (gsm->constipated && msg->addr)
>     705                         continue;
>     706                 if (gsm->encoding != 0) {
>     707                         gsm->txframe[0] = GSM1_SOF;
>     708                         len = gsm_stuff_frame(msg->data,
>     709                                                 gsm->txframe + 1, msg->len);
>     710                         gsm->txframe[len + 1] = GSM1_SOF;
>     711                         len += 2;
>     712                 } else {
>     713                         gsm->txframe[0] = GSM0_SOF;
>     714                         memcpy(gsm->txframe + 1 , msg->data, msg->len);
>     715                         gsm->txframe[msg->len + 1] = GSM0_SOF;
>     716                         len = msg->len + 2;
>     717                 }
>     718 
>     719                 if (debug & 4)
> --> 720                         gsm_hex_dump_bytes(__func__, gsm->txframe, len);
> 
> gsm_control_message() is holding a spin lock so gsm_hex_dump_bytes()
> might need to use GFP_ATOMIC instead of GFP_KERNEL.

OK thanks for the report. I'll send a patch for GFP_ATOMIC later on today.

Regards,

Tony
