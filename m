Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B21C7EE29
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Jun 2023 10:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbjFDKFe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Jun 2023 06:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbjFDKFc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Jun 2023 06:05:32 -0400
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFB2DD
        for <kernel-janitors@vger.kernel.org>; Sun,  4 Jun 2023 03:05:30 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id 5kc3qnMr98aX95kc3ql4Ju; Sun, 04 Jun 2023 12:05:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1685873128;
        bh=H7HOt9NbS9hKvkpvzL9bUevl/qXMy7TlMlUd9qZbZuQ=;
        h=Date:Subject:Cc:References:From:In-Reply-To;
        b=Suudwoo4DermxkyYPVUrf3YfDmlOejnxQebkESIISRpAfn0plY6b5kC02rmkIVeft
         7inNz4P0lYD+GPHg/McD0mmlmThuL+pTA/+Zipz+kb+YVUelA5eNrgqz4hcpwU0r5I
         7G3dYt1Dt6oTOSobmI6jsTEHJaWVC8nV8hUHGVdyR5xtc3exylCgGz6a0DYIaz3YUe
         RNMbrpMcdOmQMQLsfy319v6aE+H1JmrZ03N5kfyOkNtxVAs7Duiw4/hkHFyEf6h0BJ
         EI9x3UIJZRxIkmNZ56/5DXXMiz0Ez8RA6RXxcHtcqHZkvkZyrsL0la9VmCK1rmyagL
         AT/s6yn0GQGYA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 04 Jun 2023 12:05:28 +0200
X-ME-IP: 86.243.2.178
Message-ID: <48ecec64-5e9f-8081-753b-f2c6f188980c@wanadoo.fr>
Date:   Sun, 4 Jun 2023 12:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] cdx: Drop useless LIST_HEAD
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <cee692c7babd754c1c36186af116c4bb4dad0a17.1685853842.git.christophe.jaillet@wanadoo.fr>
Content-Language: fr, en-US
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <cee692c7babd754c1c36186af116c4bb4dad0a17.1685853842.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Le 04/06/2023 à 06:44, Christophe JAILLET a écrit :
> 'cleanup_list' is unused, so drop it.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/cdx/controller/mcdi.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/cdx/controller/mcdi.c b/drivers/cdx/controller/mcdi.c
> index a211a2ca762e..03e34f214aea 100644
> --- a/drivers/cdx/controller/mcdi.c
> +++ b/drivers/cdx/controller/mcdi.c
> @@ -611,7 +611,6 @@ void cdx_mcdi_process_cmd(struct cdx_mcdi *cdx, struct cdx_dword *outbuf, int le
>   {
>   	struct cdx_mcdi_iface *mcdi;
>   	struct cdx_mcdi_cmd *cmd;
> -	LIST_HEAD(cleanup_list);
>   	unsigned int respseq;
>   
>   	if (!len || !outbuf) {


NAK. Ouch!

Something went wrong in my compile-testing process for this one, sorry 
for the noise.


CJ

