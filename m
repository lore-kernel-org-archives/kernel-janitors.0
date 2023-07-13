Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AAEEB64DD
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 Jul 2023 05:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233799AbjGMF4X (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 13 Jul 2023 01:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233648AbjGMF4W (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jul 2023 01:56:22 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9E41FD7
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jul 2023 22:56:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso574614e87.3
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jul 2023 22:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689227780; x=1691819780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z28waPMMcML4FxoCgp2g5KyfqzPG+MLJOa6/wcRK7uU=;
        b=bO+N6KPY0vpCtdeu7jj+uZ4+2yeYFGnQL2Jnzboq8IiPSfPKVkRgLPPaP+SXIKDwJM
         TRBT2eCk8ZZPvUvPJ78DvzT5/mm2T3N+JHX9En6rzou7fRVG9YX2mT8LuBp9bgjDew72
         bTueo75T0uCD6fJDhaDMTKgxH4/6GAOn+WfRQV/uIPUUdEnaqHxcfuHQditZH5SLrwdN
         kVaQahwsvx/XlqDOykkVBTsNbXOuig+aRozCvwkGKs1Jhpvq+s5+ekdD1vnjDbcecu3H
         rG1f8MMr6Bdib3QVlmmG5Sip1tyYhA6aifHqhoG/qENuqlRlL8rabwViV8czM/BzBbXf
         w5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689227780; x=1691819780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z28waPMMcML4FxoCgp2g5KyfqzPG+MLJOa6/wcRK7uU=;
        b=I2f7PpRrAyhKv5Pb4X0aP9ovh/TRFZFlN7QLdMHHAIvwZAPcqCioLFh2CzH72pLuR8
         AB0CGvx5VlgcXoTyItU+KnR3F1QvmYRh4O6SbYGnswK1vipQobW7BNi9prXv6nZ5LV/+
         eK808D2hko3i59WL9M0q8FkeBf6GPQpzTfwFmVNqTtd5cNBkpB193ulGDj7pkPoT8O7t
         wi+tVqFDzBIK+2FuSqGK42EO0ArzvvBfozly84Gz340d63M+c0OPV3HIB3JOZfe0wOlO
         zzhLUIdw6Yi9oWRzpohWqbgIRQq8Nd/zFZCS0GR871Rb/mNNA/TefBX0VYIErLe6wqQJ
         ltCA==
X-Gm-Message-State: ABy/qLa2pzf/aWydmc6XzApBToJjmj3rdfZxJiNzT0ciUymDWqntBah/
        bBsDTX3YpcEFhpnvCtflHsnOhPyP6Kd8FuxI4uw=
X-Google-Smtp-Source: APBJJlFLVxyJe1Fgg/t322tKLr9Egq9wOZ4YCi+x7AaVR7Q8Q8xc6dIUgyfsVpSerCmTRFG9LkKLHQ==
X-Received: by 2002:a05:6512:68c:b0:4f8:711b:18b0 with SMTP id t12-20020a056512068c00b004f8711b18b0mr441810lfe.3.1689227779717;
        Wed, 12 Jul 2023 22:56:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t12-20020a5d6a4c000000b00314329f7d8asm6871477wrw.29.2023.07.12.22.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 22:56:17 -0700 (PDT)
Date:   Thu, 13 Jul 2023 08:56:14 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] devlink: uninitialized data in
 nsim_dev_trap_fa_cookie_write()
Message-ID: <3f07832b-a595-4d3b-b4d3-b9256bdd1fd0@kadam.mountain>
References: <7c1f950b-3a7d-4252-82a6-876e53078ef7@moroto.mountain>
 <20230712124806.5ed7a1eb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712124806.5ed7a1eb@kernel.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 12, 2023 at 12:48:06PM -0700, Jakub Kicinski wrote:
> On Tue, 11 Jul 2023 11:52:26 +0300 Dan Carpenter wrote:
> > Subject: [PATCH net] devlink: uninitialized data in  nsim_dev_trap_fa_cookie_write()
> 
> We usually reserve the "devlink: " prefix for net/devlink/ changes
> rather than driver changes, so I adjust the subject when applying.

Thanks!  I should have seen that, sorry.

regards,
dan carpenter

