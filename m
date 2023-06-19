Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5E0EB64DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 14:41:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbjFSOlg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 10:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbjFSOlf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 10:41:35 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D06E5
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 07:41:32 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-311153ec442so2642504f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 07:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1687185691; x=1689777691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3vRHMWvV6nRKP2P2dnaYnD/vJ4nVZEBNGPmS2g6sB54=;
        b=MBvkNTMd8+x2CMVqKe6KI1honpkMNSPACpdV8zTk8NUhDdbrWtK1dTv5bbULCwNTIL
         0X5v6oPGgjVOXFp5w8PkSzLFdpj6zq8I5jDqS85XX9cMWQuz5DbUvrRy055ONgUl1xwY
         VmcZ8bt432jtzQBi9O4tp6Po6tf442Z/4QhoXEhDn7vfvjIJezNwHl7CFUAdWEDrVbtu
         dQb14TPHw1kZGO8vh2WQxPJRyXId8tZmw+Jilj+YS4CnK3/F5mnyGZg8Z2dolXo9nc3q
         tBDZDvZ7LC77pzRHliK7tLY+W+OHu4ULcpTquyQ3GUOHFFnMPvH047lmlZ/ISKbrq6nj
         V1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687185691; x=1689777691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vRHMWvV6nRKP2P2dnaYnD/vJ4nVZEBNGPmS2g6sB54=;
        b=biZhc4nxsBfYv7PUyEj+XnUvyzTE+wKJ9NCU39wT/68KqjvdX9kFXCMsbufCiC0yeP
         9uP4aLaf6uIIUx5llWdSeENgGVI5If7LdXFEfPndR+xuQLFRHI+oTNH4dTujuKFW7Kb8
         khglSXFr/yBWzGl+83ekjmG4UOncXsQaTtCN+oJg7pRjWLwMjheX38CfL+lFf96v0aA7
         EMzvEVztrI6HqRVT4BQgQF+s9duxdeEJDidfSSMBxLJQXo1jTB36kmKzUVBuCarOAkxY
         F0DrR1xW/Z156Ne70hYTploCo38J1ic3vfcCVOp2hfFoot5Oy8G+kax6uDSyRYfXwhWR
         BssQ==
X-Gm-Message-State: AC+VfDxoJhFih4Z631jDJbQsH2b2g11d5wKmjiIHouv/iqsa8NZZ3ocd
        GvN7de91JexebP71+jkT00bQmw==
X-Google-Smtp-Source: ACHHUZ5JuZfNdQKe0TujONIhR4K2XB0lAjDXfzZYECblP+LvKNcA4TS0HaJJR0823aN+/fXh1L6Rww==
X-Received: by 2002:adf:ef10:0:b0:311:ff2:87e4 with SMTP id e16-20020adfef10000000b003110ff287e4mr8846429wro.33.1687185690687;
        Mon, 19 Jun 2023 07:41:30 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id c2-20020a5d5282000000b002fae7408544sm31795247wrv.108.2023.06.19.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:41:29 -0700 (PDT)
Date:   Mon, 19 Jun 2023 16:41:28 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] mctp: Reorder fields in 'struct mctp_route'
Message-ID: <ZJBpGFF7870dcWe4@nanopsycho>
References: <393ad1a5aef0aa28d839eeb3d7477da0e0eeb0b0.1687080803.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <393ad1a5aef0aa28d839eeb3d7477da0e0eeb0b0.1687080803.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Sun, Jun 18, 2023 at 11:33:55AM CEST, christophe.jaillet@wanadoo.fr wrote:
>Group some variables based on their sizes to reduce hole and avoid padding.
>On x86_64, this shrinks the size of 'struct mctp_route'
>from 72 to 64 bytes.
>
>It saves a few bytes of memory and is more cache-line friendly.
>
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
