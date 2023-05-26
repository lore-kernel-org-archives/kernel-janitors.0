Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8ECC77B73
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 16:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244186AbjEZQKq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 12:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjEZQKp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 12:10:45 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4220610A
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 09:10:36 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2af30d10d8fso9186441fa.0
        for <kernel-janitors@vger.kernel.org>; Fri, 26 May 2023 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1685117434; x=1687709434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gRqtf20Zyw/eUJigoBjplcoiLQHtDmcweGJHFBjhwxw=;
        b=G9QwBt5smZ2pr868PDTwGskX9AEfSOkOccrEEw9aL8IgbmTTmePzjioIOfu8aMUJ3j
         xok3/sCPu0lRngMIb/kKzS/tztrNdsoFQYPgaB1vRypxUwaNgsMe6bIlEMbbh6GBd3lr
         q4fGWWFGyN336Y+eMn0+l9Qqlj88Pz6JDQomcmomBR7Qyb4dTJ7Au+liBaNEFoZ0rIiL
         Lu+f2xfbwyzeJcurhx7WbbibUIgHvk+q4cIOM1YxHXFZJ5/t/D/yHiMhP2dRvRpCZa9g
         0ZQcHOvRXw/q1mgJoh3gkUAGYrL5B5CXoQnKxQqKvCQLWUIkZbm3AXWZiPWQwwUx3x3k
         3hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685117434; x=1687709434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRqtf20Zyw/eUJigoBjplcoiLQHtDmcweGJHFBjhwxw=;
        b=HmXxHX2ocVvOWbdYZ8LMIrUKfA2PFV0cU86ruyKX68JugIGb4nVc/gBrxx1JBdb8Lu
         R4i9BIWRSLMyscHNIWuclAVfOy4RjK98wY1PCWSheiVs48zuEMhROQAD7MrgAF1MzdHe
         tTahlRb12pIiFYWW5HDwFMpE6x0DUJ4fw+l8O0RzXsNbzRYy71eheoSeduZujs6D2I4u
         f7fix+9Nk7a7186w3ziVXN0Ebp7uBT15SS249SD95F5sZyauuc25OmTI+CyDEojoI/Dc
         Wvb1nabMcYMM+88iDa9cpbZ8G4IpAwijPbgGAIH4EuuTHMcfnh4hnvCP5FxkeDQRwBmZ
         xoag==
X-Gm-Message-State: AC+VfDxmxW+MUVyiUhENdHQHraZB/xGM4KbYwEaJDYi38kWGdiaFffnO
        i3DTtmwVRRUOm0JbSOmcmFOncA==
X-Google-Smtp-Source: ACHHUZ5N2NAgrMVINU3eq0ZhD3xFOoGgyWy1XrAbjL42a3dgVehAoxgdTwxyg1A9sG7VK8/37Zr4oQ==
X-Received: by 2002:ac2:51ad:0:b0:4e0:a426:6ddc with SMTP id f13-20020ac251ad000000b004e0a4266ddcmr776070lfk.0.1685117434326;
        Fri, 26 May 2023 09:10:34 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id y16-20020ac255b0000000b004eed8de597csm679541lfg.32.2023.05.26.09.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 09:10:33 -0700 (PDT)
Date:   Fri, 26 May 2023 18:10:32 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Jesper Dangaard Brouer <brouer@redhat.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Jiri Benc <jbenc@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: fix signedness bug in
 skb_splice_from_iter()
Message-ID: <ZHDZ+G51wKK3/XMi@nanopsycho>
References: <366861a7-87c8-4bbf-9101-69dd41021d07@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <366861a7-87c8-4bbf-9101-69dd41021d07@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fri, May 26, 2023 at 03:39:15PM CEST, dan.carpenter@linaro.org wrote:
>The "len" variable needs to be signed for the error handling to work
>correctly.
>
>Fixes: 2e910b95329c ("net: Add a function to splice pages into an skbuff for MSG_SPLICE_PAGES")
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
