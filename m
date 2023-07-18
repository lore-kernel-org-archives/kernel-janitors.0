Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91659EB64DA
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 06:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbjGRG6y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 02:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbjGRG6x (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 02:58:53 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8221732
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 23:58:35 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so5322844f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 23:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689663514; x=1692255514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkR8qqb+tZbWWWMSMobDqmb6wWe0/8Tvk+eaJzSaNiY=;
        b=oQzkecp3eDrjKFOrzKgXnZOg5cpVEKRypTPCPmhh/sLLfK0W13xCZzcM/VI70jJFPl
         Fwa3S8NdvFQKkGQYWJAMR1zHFP5Ysl/ufyEJWlJfgVXFX+JVtc8QPkUM7g/l2DRLV0Xd
         rXUYg0ZzVPn/Its3B26G9Rh31SHyyUykKmfeL19t3QK1qBu011h7v3SY91KLqbfBHfPn
         0Vqo0UVhfKmcNde+/yF0AkJzsJTSB75UxChR9fXOS5ItLfBPwN0Ko79me9Esy27HwssM
         Dyobl8S5JWavMrJgqDtPD9FWeR5bs99rsyeUMNa7SakXrucf4MB9NCgQ6ubHIvXoLpjy
         NWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663514; x=1692255514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkR8qqb+tZbWWWMSMobDqmb6wWe0/8Tvk+eaJzSaNiY=;
        b=juvdqn+opzNwZjWdyR3/yCnpjGnA8BVuGPVenn1UUr1uJKksTY5ca5EAMEV2+rA4ui
         S0DBzMI5i26KghBhAhDctlqBfg+UlV1j4UapJCU6hPTX+P9s6T3ICVIGCUqJZpLQvk+Q
         JYhHDRfh3oKmdMIf8Kw+/i1OL8Kn/FnZqsUBZJg7Rk+A0R/YxsX360k20gnQdC3PML4E
         Epk0bvEjdayk40so3oSypPEcP8G/uB2VIGJlgjpP/i9J6w3Gp/1YylpOT2fzb0MyI6eW
         8kLDQ1uRFO4+VIWeU3ReVyUhb9vDX2zkJZrtCf+CIuWtdZm5HKnEZv6RLa3qoSVnU8Bq
         Cn6Q==
X-Gm-Message-State: ABy/qLYOcbn+jwRm/jglu/twfNSTyVWyaKouKuGSmH115VqielZM/ZtX
        yTE+nQH03C4nNtkw8d0fH8zedw==
X-Google-Smtp-Source: APBJJlED6jt8xHaJu7Q+cJhP4iZsf33uSnbrn3oqSpD8pTr55ZYfnUl37FR46MpOM2b5hdLAdZh5/Q==
X-Received: by 2002:a5d:4b07:0:b0:315:930a:a962 with SMTP id v7-20020a5d4b07000000b00315930aa962mr14378852wrq.59.1689663514061;
        Mon, 17 Jul 2023 23:58:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r15-20020adff10f000000b0031437299fafsm1449736wro.34.2023.07.17.23.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 23:58:31 -0700 (PDT)
Date:   Tue, 18 Jul 2023 09:58:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: mediatek: vcodec: Fix an error handling path in
 vdec_msg_queue_init()
Message-ID: <1dcd0fab-eee3-4693-a7d2-4a72baef5c97@kadam.mountain>
References: <efa0d4910998931a2ec9d933117fa71482d7b33a.1689624542.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa0d4910998931a2ec9d933117fa71482d7b33a.1689624542.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 17, 2023 at 10:09:19PM +0200, Christophe JAILLET wrote:
> All errors go to the error handling path, except this one. Be consistent
> and also branch to it.
> 
> Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

I sent this one a month ago but it hasn't been applied.

https://lore.kernel.org/all/b8948d9a-65bc-4f3f-aa90-60addd064819@moroto.mountain/

regards,
dan carpenter

