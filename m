Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25E4CD98FF
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Oct 2023 08:15:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjJKIPE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Oct 2023 04:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjJKIPC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Oct 2023 04:15:02 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826D098
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 01:15:00 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso61219055e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Oct 2023 01:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697012099; x=1697616899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vtpagy2FOAC+A5GQkeyxkxyJtI+owSgz6W8MfKmR89U=;
        b=pz4t2y1UiskQpLcGhsbTsrF16V7Kyf1HXEd56nBXlVdKfmGiI06BaByidA1HhhokTV
         r8wxkysmhnyCxIdaEgOJtI9AeTp3kR37I99Iqoze9TENa+L4ldSOsaiV8VX9/awiiWJf
         Ms1NuqqrVK1GKVZ5t/tmOqHTV+MZUbyP6Y6pdvJ4BUJ7nCARXiQM4+Ce9ITD17XDKBTj
         cP2mV9h5KFayo9zKGfyQQbmEkK4w4O0sD4O/V2k/FhWGG2s8YfDq3Ciq2qyTAORv2qxB
         1ebmbjGbWpKczc9+nPmiZIWpy6zCoZJtXkW/y/lEFqEaIE1hp46X1+GwFkZ6d03y9X73
         8QYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697012099; x=1697616899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtpagy2FOAC+A5GQkeyxkxyJtI+owSgz6W8MfKmR89U=;
        b=k/VMx+QCtRp8T/H9RsXSz3JnIJnJScoZmqvne/hqnuMTUA42/qdw3Gws3gp5ZWAxEX
         iiz8uzR2oI09dvsdM7fXeXqAgXpBoGz/yXam6OchyON84loY7ML91ConCjJKvUxj5DJw
         jOMaG7SUNnBKTPQkXl5Sr+aYJYssawb3qT7LzxJZBY/U7n0KG5kJwwD4lLfEceTYhvA2
         LIk1xcVNLrxUSKq9AddryzT+O5mQOkZrFT1Ws4Gz0fAwCm2fUxx2HPcQA4tuWVluEg/C
         u8Gi48IDCmT2H5g8i2WmUmqXpOws7SdHPn2kj+gBtplCXwIvkJZZ+ntU/h9Ys12TkEQY
         kk1w==
X-Gm-Message-State: AOJu0Yx17Ve/MUwy8Nn2F4ZYUJkKgO2T0w+5hTcn1ugL26IaUo2G0Rn9
        e48GvA9dluUDyM63HOlAPgxHsw==
X-Google-Smtp-Source: AGHT+IH+nFbUIrVmTEv6gMfTbmCrdI4fJezaJJy9xkJMds1ntqxtbKt+3p2wLJX84bwnz9RfZSqaUg==
X-Received: by 2002:adf:f641:0:b0:31f:b6ea:af48 with SMTP id x1-20020adff641000000b0031fb6eaaf48mr17486391wrp.49.1697012098954;
        Wed, 11 Oct 2023 01:14:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm14561839wrp.116.2023.10.11.01.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 01:14:57 -0700 (PDT)
Date:   Wed, 11 Oct 2023 11:14:55 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Xiyu Yang <xiyuyang19@fudan.edu.cn>
Cc:     Chuck Lever <chuck.lever@oracle.com>,
        Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>,
        Olga Kornievskaia <kolga@netapp.com>,
        Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Xin Tan <tanxin.ctf@gmail.com>, linux-nfs@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-XXX] SUNRPC: Add an IS_ERR() check back to where it
 was
Message-ID: <38b1b94c-3ab1-4fb5-ad8c-946756262bdb@kadam.mountain>
References: <356fb42c-9cf1-45cd-9233-ac845c507fb7@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <356fb42c-9cf1-45cd-9233-ac845c507fb7@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Obviously net-XXX is not what I intended.  This applies to the nfs tree
I think.

regards,
dan carpenter

