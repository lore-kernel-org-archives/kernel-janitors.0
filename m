Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5FBC433E6
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Mar 2021 06:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85C2664EC4
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Mar 2021 06:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238048AbhCCGF5 convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 01:05:57 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:54725 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575183AbhCBSVM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Mar 2021 13:21:12 -0500
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 429213ADF36;
        Tue,  2 Mar 2021 14:52:02 +0000 (UTC)
X-Originating-IP: 86.206.8.148
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1F8F2C000E;
        Tue,  2 Mar 2021 14:47:39 +0000 (UTC)
Date:   Tue, 2 Mar 2021 15:47:38 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Conor Culhane <conor.culhane@silvaco.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i3c@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] i3c: master: svc: remove redundant assignment to
 cmd->read_len
Message-ID: <20210302154739.00cd4a22@xps13>
In-Reply-To: <20210224151349.202332-1-colin.king@canonical.com>
References: <20210224151349.202332-1-colin.king@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Colin King <colin.king@canonical.com> wrote on Wed, 24 Feb 2021
15:13:49 +0000:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment of xfer_len to cmd->read_len appears to be redundant
> as the next statement re-assigns the value 0 to it.  Clean up the
> code by removing the redundant first assignment.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 8d990696676e..1f6ba4221817 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1124,7 +1124,6 @@ static int svc_i3c_master_send_direct_ccc_cmd(struct svc_i3c_master *master,
>  	cmd->in = NULL;
>  	cmd->out = &ccc->id;
>  	cmd->len = 1;
> -	cmd->read_len = xfer_len;
>  	cmd->read_len = 0;
>  	cmd->continued = true;
>  

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miquèl
