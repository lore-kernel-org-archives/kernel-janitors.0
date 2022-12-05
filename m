Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E5FC4321E
	for <kernel-janitors@archiver.kernel.org>; Mon,  5 Dec 2022 05:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbiLEF0A (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 5 Dec 2022 00:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbiLEFZa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 5 Dec 2022 00:25:30 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4377B1E8
        for <kernel-janitors@vger.kernel.org>; Sun,  4 Dec 2022 21:25:02 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 189so13100607ybe.8
        for <kernel-janitors@vger.kernel.org>; Sun, 04 Dec 2022 21:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8AkiS2Qfxp4kAJlb5zxEpYsW01DD5z1qyB1/NcGlCU=;
        b=jRMfCPVIXHdaUPlDFQX14oqQwK/ECBMzc+1qN6zwVN90FJM+Uee6n6QODpuu3UhVfY
         1klgUmDInvjv/yf5Fd79wrynLJeg0sfU7gtF+0iawuIY8wYTib+HWsyDuBQc0psygD1L
         q8V3Ltl3iEXghaA1Crzyg8EnHSBfUGBT9ll+7xoX9ZH55t+YNIWGk79B8Lt9m1Qe+yGf
         Qgc2teWHmNo5j3rvOccKHA1orS36SbOKU1vN/o+LjOudpRy72n42CzPgjzkmGeTe8Z/9
         91Aku0G41bWd2XJZJotted3NkqW0UybR64KuC7l0EOk18PPyzWyHlQn+mLackLiAVPvm
         aZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8AkiS2Qfxp4kAJlb5zxEpYsW01DD5z1qyB1/NcGlCU=;
        b=zNh9UfERQbTgy+TmOdMes00moGAqub++Fbv25kZuLohA37MWnZ/4+H0xlDMr6uc2S7
         otd8UemEyuFlK+SwqtgPkbEYGeDXq0wK1sqE4FW+S+NzzG4l6+/cJaFgd94D15wqqIKN
         jJEdl+PCocJe/nSr2gsW9OOMNIriyNFENazhDmV1w4B0zyvjb30LgowQCH/N4tgLgb9Y
         suROmZ/l9IHLTwttGSAWOoQBlspFrs4ZtYLxwSwWdJlio8gc9HeT1oXApHAQJL0/6Uw8
         bfzUnwM18ETh2l3tIO6TPFSnbkDchomrulDuCQ3FIiK3wFyUQ905HUhnXS60AHVv/wAr
         U88Q==
X-Gm-Message-State: ANoB5plMQAvkYRqtwqKwIdSVo2JMdfavgiR8XmCModf2DdaoLTx+O3pH
        D89pPGPbF5YC4JwfI5pD1ox6AqJr7yfErV7eip78Ug==
X-Google-Smtp-Source: AA0mqf6CuUZoAffgj4lZ4AOfj/mxkdpNHXOHGtOqAIbKcbvfSRxACN2WnuOEJVOcB3Z2Hbx1dX8FUOOTGLV7sH1tqL0=
X-Received: by 2002:a25:d655:0:b0:6fc:1c96:c9fe with SMTP id
 n82-20020a25d655000000b006fc1c96c9femr16557533ybg.36.1670217901547; Sun, 04
 Dec 2022 21:25:01 -0800 (PST)
MIME-Version: 1.0
References: <adc33d6c7dd01e29c848b9519b6a601219ba6780.1670086158.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <adc33d6c7dd01e29c848b9519b6a601219ba6780.1670086158.git.christophe.jaillet@wanadoo.fr>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 5 Dec 2022 06:24:50 +0100
Message-ID: <CANn89i+YnmoAunWzwG1KvCH0WUOCXfA6SztW3Xdf0vN4QktRGQ@mail.gmail.com>
Subject: Re: [PATCH] packet: Don't include <linux/rculist.h>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Dec 3, 2022 at 5:49 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> There is no need to include <linux/rculist.h> here.
>
> Prefer the less invasive <linux/types.h> which is needed for 'hlist_head'.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Let see if build-bots agree with me!
>

net/packet/af_packet.c does not explicitly include linux/rculist.h

It might be provided by include/linux/netdevice.h, but I wonder if
this is best practice.

> Just declaring 'struct mutex' and 'struct hlist_head' would also be an
> option.

I do not get it, see [1]

> It would remove the need of any include, but is more likely to break
> something.

I do not see why you are even trying this ?

> ---
>  include/net/netns/packet.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/net/netns/packet.h b/include/net/netns/packet.h
> index aae69bb43cde..74750865df36 100644
> --- a/include/net/netns/packet.h
> +++ b/include/net/netns/packet.h
> @@ -5,8 +5,8 @@
>  #ifndef __NETNS_PACKET_H__
>  #define __NETNS_PACKET_H__
>
> -#include <linux/rculist.h>
>  #include <linux/mutex.h>
> +#include <linux/types.h>
>
>  struct netns_packet {
>         struct mutex            sklist_lock;

[1] Definition of 'struct mutex' is definitely needed here.

> --
> 2.34.1
>
