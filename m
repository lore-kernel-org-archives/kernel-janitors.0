Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAB7EB64DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 14:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbjFSOnZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 10:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbjFSOnX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 10:43:23 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD14AF
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 07:43:21 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f62cf9755eso4522905e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1687185799; x=1689777799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jg4ozZVfolPqyn/t5WEFg1Uls/OOAkHpHShj9UmDbj0=;
        b=XM/YRcXn05iISSP7KE+IKbXpoTRTcJ718yU5TO6gcp/oHw+hYoh0ZSL4WhK5bcd+jf
         6mAAKvJM6L/16KW2cU/etYW1s4n/kP+ZnqPLRw8j4gkGd0gBhg1EckAqltFK62g5BFYv
         F4qZ8WHPYxeuBDUf/227tO1lNgF62oIqWUhWUrhBf9LFkoyFtowqLyVpxk38pWpTioks
         T7z7sbBXhgtHTmX23pNuwBDYalbF+BQqJh5pyC+/pn403N4z5DFsbO0q8GwU0+Gh0Tmo
         BacDMSvWblkXQmOTRpcEQLKJNp4qvOSKcG6e6P5B9YRsKldgvakXMH2eSJMQySdw+iGm
         LCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687185799; x=1689777799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg4ozZVfolPqyn/t5WEFg1Uls/OOAkHpHShj9UmDbj0=;
        b=jOqB5/od7fDzC8XGEvlVv3zDAtwEaXSoQmU+6B+FDow9A+++xbtxLrdaEkIwsBg8zH
         QsPu9FQhuQPvgZRYrVCQZt4wL/DN2oaoyU8N0Rf8cpQj0rNwKsQNDq1aZMexBAnJwPZi
         iHAqHY66vPcCVyQSe8jWWjbv/CUVFcgiL4sTn4NFBToAKRydavbzs7evmGqyhaOKH8o1
         iT1tKGUe53xD5vOKc5Fm2pD41Jm2KQdacP2iK1EAUqNrrHDrTl3X5Poxd/YWB4x6+NFb
         q2LP6YB8MBkV3SKqCFON1pjykXxD7LuxWyNW/Mm38MJyMuXr5vZubzpCepmsafQgx3wR
         2Y7A==
X-Gm-Message-State: AC+VfDwKpMuzCEDW/dwujFU2uHAXOk+ocO5YzE66LD576ZtRdWNgv1JN
        uI2Z0Jbugg6toETGXomYvuDavw==
X-Google-Smtp-Source: ACHHUZ6jK/vkslU8B7BumS0VEdj9EzsfjsiTwLT42WV7OsJvLgsBm6xMwCmMKVvxkyum5HDdV4pj/Q==
X-Received: by 2002:a19:da01:0:b0:4f8:3b15:b878 with SMTP id r1-20020a19da01000000b004f83b15b878mr4868043lfg.67.1687185799177;
        Mon, 19 Jun 2023 07:43:19 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id k6-20020adfd846000000b003111025ec67sm13972121wrl.25.2023.06.19.07.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:43:18 -0700 (PDT)
Date:   Mon, 19 Jun 2023 16:43:17 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Paul Moore <paul@paul-moore.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH net-next] netlabel: Reorder fields in 'struct
 netlbl_domaddr6_map'
Message-ID: <ZJBphdB/7k0Hk8y2@nanopsycho>
References: <aa109847260e51e174c823b6d1441f75be370f01.1687083361.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa109847260e51e174c823b6d1441f75be370f01.1687083361.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Sun, Jun 18, 2023 at 12:16:41PM CEST, christophe.jaillet@wanadoo.fr wrote:
>Group some variables based on their sizes to reduce hole and avoid padding.
>On x86_64, this shrinks the size of 'struct netlbl_domaddr6_map'
>from 72 to 64 bytes.
>
>It saves a few bytes of memory and is more cache-line friendly.
>
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
