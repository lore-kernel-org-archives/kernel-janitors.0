Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6FEC433ED
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 18:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9897361108
	for <kernel-janitors@archiver.kernel.org>; Sat, 10 Apr 2021 18:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234856AbhDJSYs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 10 Apr 2021 14:24:48 -0400
Received: from mx1.opensynergy.com ([217.66.60.4]:61315 "EHLO
        mx1.opensynergy.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234392AbhDJSYs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Apr 2021 14:24:48 -0400
X-Greylist: delayed 436 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Apr 2021 14:24:47 EDT
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain [127.0.0.1])
        by mx1.opensynergy.com (Proxmox) with ESMTP id CA77AA12B3;
        Sat, 10 Apr 2021 20:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:from:from:in-reply-to:message-id:mime-version:references
        :reply-to:subject:subject:to:to; s=srmailgate02; bh=flMyugclSqb+
        wAO9k1tJ+ecrs2GxO/hHiLPPe7sDecM=; b=0DCITfk38Efzyum2sPHDo/2Ucbqj
        bQK0hAUSCZm0Cyx/ioFrkapdLShAKjLaDznkxqbMIxTzoQVtScPg60RNKhlCQJn9
        42aT+ofGidgl1jsTQINRjnwQdRXXcOs3p4WRq8Y4giWtrTm08jXm0VkuKMDwj03T
        X/gj8uw5d2enk5TuYvXZkR7Sq3k9Y9UCjUaNRXyK0V4vRBlN+j+L7ZaQkJnElSqv
        YBkb+hq1fOCAMuCYlXDIwuv1zaejCOn+O17J8CUNPjjbZmDbZFNiWFSGwSMfbHTr
        WVjVoh2ev5cd5RY2cUP5yqxsKu4K4Oddu2pqtXqXyV8/eC+N9vceact4wg==
Subject: Re: [PATCH -next] ALSA: virtio: use module_virtio_driver() to
 simplify the code
To:     Chen Huang <chenhuang5@huawei.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC:     <virtualization@lists.linux-foundation.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20210408125429.1158703-1-chenhuang5@huawei.com>
From:   Anton Yakovlev <anton.yakovlev@opensynergy.com>
Message-ID: <d0c7f617-50ef-0d39-cbd2-11925eba24d0@opensynergy.com>
Date:   Sat, 10 Apr 2021 20:15:45 +0200
MIME-Version: 1.0
In-Reply-To: <20210408125429.1158703-1-chenhuang5@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 08.04.2021 14:54, Chen Huang wrote
> 
> module_virtio_driver() makes the code simpler by eliminating
> boilerplate code.
> 
> Signed-off-by: Chen Huang <chenhuang5@huawei.com>

Thanks for the patch.

Reviewed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>

> ---
>   sound/virtio/virtio_card.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
> index ae9128063917..150ab3e37013 100644
> --- a/sound/virtio/virtio_card.c
> +++ b/sound/virtio/virtio_card.c
> @@ -432,17 +432,7 @@ static struct virtio_driver virtsnd_driver = {
>   #endif
>   };
> 
> -static int __init init(void)
> -{
> -       return register_virtio_driver(&virtsnd_driver);
> -}
> -module_init(init);
> -
> -static void __exit fini(void)
> -{
> -       unregister_virtio_driver(&virtsnd_driver);
> -}
> -module_exit(fini);
> +module_virtio_driver(virtsnd_driver);
> 
>   MODULE_DEVICE_TABLE(virtio, id_table);
>   MODULE_DESCRIPTION("Virtio sound card driver");
> --
> 2.17.1
> 
> 

