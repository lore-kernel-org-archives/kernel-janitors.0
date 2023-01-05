Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F1DC53210
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Jan 2023 14:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234086AbjAEOMO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Jan 2023 09:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234089AbjAEOL7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Jan 2023 09:11:59 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EE44C72E
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Jan 2023 06:11:55 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 141so6255033pgc.0
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Jan 2023 06:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JoOKD3fhvjltOz/BKivLTcbhttDC/bdQobavcXcDp9Q=;
        b=gAzUJJZY5TesWCbvlLm0Nvx5S8CWI/OFNcWGJRSXMa4u88qBLtq5Z57hlmLeVUiUXT
         Q8qjI/S0cMW9p8VYrieFiq0UGy5hnC86U+wYcFYymtPtgcdR/0SMbf0iXhDaBCaYTWVM
         6EV941rjN0MvpnXmnAsYcu+KRfPbRLXLKs5RFKov6UP4Z/rLlMqHNZTWzc0GjfGZ98vL
         7bK6FnyecXCpEKUA/oLqjRvQgzrsb270C9MAuES3bQRVOJIjEaB8QihVyc4pLscEdypU
         yNTS7dDPW3Idv+LDW+1kKfPZSvzqYRKttpcOuTb5lR7YyW8LbbVVpp2tQm+NbqpazAAB
         xKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoOKD3fhvjltOz/BKivLTcbhttDC/bdQobavcXcDp9Q=;
        b=KT2bheeRD/8B5NbAQ8JSk2uj+zIm7GEM0UU0lUeueaGO1RhdTr8o7HPE7YFqr3noKY
         3sGhgZD9zWhm0/tZb4Mzygpi1vNWFp7eWqifYBaBPyeQp1TAT+8dOuG6yMpPoBJV6Q1H
         9OCxeW9yIkMzl2jfY21XLT7k+XzlBUPT9ZBIVvmJKjBuZ6QNucbpIkrbdjVcBt6P/Rqd
         07JlHB4EawNRsyL3ndXWN3dDlrDsuNPvFJdN7uoTEHPqwh2eV7Gd7yTqp4xssrd3pC/v
         AA9QLa16eWva9fvIrH2Pr64NZWrNbpF6Eq4jKJrSXao+jJQgcZXu5IOyXsvltg/6fJPB
         idvg==
X-Gm-Message-State: AFqh2koZuXgVQx6YZ/PaQsCER2ytLDwsxPY2b0096n1HUnega9QswWs8
        0xbm1dYyyxSKw/ZuN22AmtQczw==
X-Google-Smtp-Source: AMrXdXt6ixVFYcF7JJc/xVT+7SfOpce9UgPPB+H+PfeNMBECoEDdXUIxAj9b40GeUTZxLY9XysPaXQ==
X-Received: by 2002:a05:6a00:c5:b0:582:6173:c6c5 with SMTP id e5-20020a056a0000c500b005826173c6c5mr18357064pfj.14.1672927914729;
        Thu, 05 Jan 2023 06:11:54 -0800 (PST)
Received: from localhost (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id f76-20020a62384f000000b005810a54fdefsm20048453pfa.114.2023.01.05.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 06:11:54 -0800 (PST)
Date:   Thu, 5 Jan 2023 15:11:51 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
        Taku Izumi <izumi.taku@jp.fujitsu.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] fjes: Fix an error handling path in
 fjes_probe()
Message-ID: <Y7bap08pgqs1LL48@nanopsycho>
References: <a294f5f3af7e29212a27cc7d17503fba346266b5.1672864635.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a294f5f3af7e29212a27cc7d17503fba346266b5.1672864635.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Wed, Jan 04, 2023 at 09:40:47PM CET, christophe.jaillet@wanadoo.fr wrote:
>free_netdev() already calls netif_napi_del(), no need to call it
>explicitly.
>It's harmless, but useless.
>
>Remove the call, make the  error handling path of the probe and the remove
>function be consistent one with the other.
>
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
