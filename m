Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B04C77B7D
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 May 2023 17:17:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243835AbjEORRq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 May 2023 13:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243827AbjEORRb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 13:17:31 -0400
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FED6E9B
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 10:15:57 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id ybnepdN4B4Eobybnepjxfr; Mon, 15 May 2023 19:15:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1684170956;
        bh=tjbWYtWJTtOAaFL/DfgU+hQjnAxrNeVxu1yjJPXsji8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=tdjxYzeKEs5N49Wh/DT0gtNIgwI3NoV4rB9kOjf/rcT5TtCzIUHJ3Z7CB5dQzmSy6
         Stfu7Vvg6/aDOKuEC7/jnjDx5pQdwYcsx37HAZEL4rPmfDEX+xu0B+cv578OLynGOL
         Le3H6q9w0WpgcMcIDhpBgU7tfT0nGc/xh9xQ2Y0IBMRrPvrF4ekv5hhmpD9te2u0uD
         ZbFbKGvnJt/uZZyoFsEjkmi5ygj5eEXqbGQsBsd15MvWDRga65qKpkPoiXfPwJrZHa
         3D37SKLTYhUZyzPYOhzUnrfyIQztZgtepG+q/J8ax6VmCjS24LItxLOSO/ky7zLL5G
         8QHL6oBWp7eIA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 May 2023 19:15:56 +0200
X-ME-IP: 86.243.2.178
Message-ID: <5359488e-2b37-b328-3dbc-00bedd1726d5@wanadoo.fr>
Date:   Mon, 15 May 2023 19:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] coda: return -EFAULT if copy fails
To:     Su Hui <suhui@nfschina.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
        coda@cs.cmu.edu
Cc:     codalist@coda.cs.cmu.edu, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20230515061923.767680-1-suhui@nfschina.com>
Content-Language: fr
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230515061923.767680-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 15/05/2023 à 08:19, Su Hui a écrit :
> The copy_to/from_user() functions should return -EFAULT instead of -EINVAL.

Hi,

just for my understanding, why?

Even if not perfect:
    git grep -A1 copy_from_user | grep EINV | wc -l
    15

    git grep -A1 copy_to_user | grep EINV | wc -l
    12

CJ

> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>   fs/coda/upcall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/coda/upcall.c b/fs/coda/upcall.c
> index cd6a3721f6f6..1517dc3bd592 100644
> --- a/fs/coda/upcall.c
> +++ b/fs/coda/upcall.c
> @@ -510,7 +510,7 @@ int venus_pioctl(struct super_block *sb, struct CodaFid *fid,
>           /* get the data out of user space */
>   	if (copy_from_user((char *)inp + (long)inp->coda_ioctl.data,
>   			   data->vi.in, data->vi.in_size)) {
> -		error = -EINVAL;
> +		error = -EFAULT;
>   	        goto exit;
>   	}
>   


