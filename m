Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578F1C38147
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Jan 2023 00:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjARAjC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 Jan 2023 19:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjARAiG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Jan 2023 19:38:06 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457C24ED3
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Jan 2023 16:08:52 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id E03155C0116;
        Tue, 17 Jan 2023 19:08:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 17 Jan 2023 19:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1674000529; x=1674086929; bh=q1
        PH25IQLsnN3LX7ptMcvbwCg622ib0Dmv0/dqTvCZA=; b=P8FOQBsndPGuLxLq9T
        l9D6jY5klyaXi0DCeOes1MNz6w0Apdyf+s1DA/kZBTAHaw0kkfki9pHuCHh73AuE
        PqzAv1peGHwq8I/3SC43++9eVp/yEry3tDeMtiPR6G2m/2Syw7XkUlPFkKPLZEdo
        r/x3t+KizxhH4WGDyI+ztgT1NNrqwfF+tGYIEehjnNcQYy7bCxHdX4TquKJbOHAN
        QACoOJYPpAgHDlQh6YY/5LHg+6k4EiezUyDU+AGJenQL6Ro1bXReKN0Y4oROJUEd
        Us1/SLsj2AAAOWfrCDrxJYeKlggc6b8qSYhOkVp8KFiWpK+ocIgMjULfgrE8g/+A
        Xbdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1674000529; x=1674086929; bh=q1PH25IQLsnN3LX7ptMcvbwCg622
        ib0Dmv0/dqTvCZA=; b=lFOPFzlbNDe9pBfWaQB42KArawY2shiWw5LlkRiyzNGj
        CvssjeOIGV9LkUyPx10U9RKgY96W5RxZfwnL1XzlxHqE5xIMxDLdsXL99mjmKpUZ
        8SZldZ5D4oErmCjk0puR42/P9MYMiX+1FflIi9nsdfdcfT7v4oLeUbcqrrItDRXW
        q+qJ5X47Qk3+ZeMk7VH1YLf4ZD1sB//TP45Ew32lD36iBvz/KZ0vO7x1WkQmCu88
        h9q/V6aVmNlDkG2/m5f/wojHblNw1RkG9dXEm9iGhcW0rATGjhZYLHS+OpS7LwjF
        ORu5FVf240BE9H2hGQ5rO2hnjmlt3jzRtir0jz1jvw==
X-ME-Sender: <xms:kTjHY7GjqjKMY6AsB28FZ8NjTaW8t2Y3clUhutYfPZSxzXgyuh3fOw>
    <xme:kTjHY4XU2o6mSqHibk-E6WwO-4pDUk1qaO76a8I_RYr-xvJyEH74KiZki4NumaR3X
    sc-71p20knoyQG3q2A>
X-ME-Received: <xmr:kTjHY9JSGKZJEJHYTiNhbAmZqsCql5MMIqpxGo7KKh9kpvppYfILVZa9fhJcaH9yiwE_DE1SQhU4FxL7_x_TKA3lYAIAOnAICV1a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:kTjHY5FbP01fYwovyfIKyJVm1yFSex1CHz3PfoSiC23u7i8wz_wRqQ>
    <xmx:kTjHYxUHLjSCV5VASMWv6yDmWAkADzB7LR1YxBSMr09YtmLZy4K_8w>
    <xmx:kTjHY0N-OND-gZ5jpCwS-yXPolHWyj5f9XKPcg9d_CohgIXXCPn2EA>
    <xmx:kTjHY3zp5HPzEsC9VibJ3ZKqB3ZnKF_2PgYS6Jb3rtt11W1RDYGxKg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 19:08:47 -0500 (EST)
Date:   Wed, 18 Jan 2023 09:08:45 +0900
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: fireface: fix locking bug in
 ff400_copy_msg_to_user()
Message-ID: <Y8c4jcr/Uo0wiCnq@workstation>
Mail-Followup-To: Dan Carpenter <error27@gmail.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <Y8at+W/7OGvEBY8O@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8at+W/7OGvEBY8O@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Tue, Jan 17, 2023 at 05:17:29PM +0300, Dan Carpenter wrote:
> The ff400_copy_msg_to_user() function drops the spin lock to call
> copy_to_user().  However, if the copy_to_user() fails, then it must
> take the lock again before returning.  Failure to take the lock leads
> to a double unlock in the caller, hwdep_read().
> 
> Fixes: acdebd8b4c0c ("ALSA: fireface: implement message parser for Fireface 400")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  sound/firewire/fireface/ff-protocol-former.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Indeed. Thanks for your care.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
> index f58008762fe6..fa41de978756 100644
> --- a/sound/firewire/fireface/ff-protocol-former.c
> +++ b/sound/firewire/fireface/ff-protocol-former.c
> @@ -680,28 +680,30 @@ static long ff400_copy_msg_to_user(struct snd_ff *ff, char __user *buf, long cou
>  	struct ff400_msg_parser *parser = ff->msg_parser;
>  	u32 type = SNDRV_FIREWIRE_EVENT_FF400_MESSAGE;
>  	long consumed = 0;
> +	int ret = 0;
>  
>  	if (count < 8)
>  		return 0;
>  
>  	spin_unlock_irq(&ff->lock);
> -
>  	if (copy_to_user(buf, &type, sizeof(type)))
> -		return -EFAULT;
> -
> +		ret = -EFAULT;
>  	spin_lock_irq(&ff->lock);
> +	if (ret)
> +		return ret;
>  
>  	count -= sizeof(type);
>  	consumed += sizeof(type);
>  
>  	while (count >= sizeof(*parser->msgs) && parser->pull_pos != parser->push_pos) {
>  		spin_unlock_irq(&ff->lock);
> -
>  		if (copy_to_user(buf + consumed, parser->msgs + parser->pull_pos,
>  				 sizeof(*parser->msgs)))
> -			return -EFAULT;
> -
> +			ret = -EFAULT;
>  		spin_lock_irq(&ff->lock);
> +		if (ret)
> +			return ret;
> +
>  		++parser->pull_pos;
>  		if (parser->pull_pos >= FF400_QUEUE_SIZE)
>  			parser->pull_pos = 0;
> -- 
> 2.35.1
 

Regards

Takashi Sakamoto
