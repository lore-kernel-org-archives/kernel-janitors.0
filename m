Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110F8EB64DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 14:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbjFSOmb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 10:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbjFSOm3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 10:42:29 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76B5CD
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 07:42:28 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31109cd8d8cso3263069f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jun 2023 07:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1687185747; x=1689777747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6epH37hdpG+43zHnm1jYAPdZwnsNsyegwEKE9/FA+rc=;
        b=pklYDm5xRYSW2AFNSWM+3VocxKr9BLg1Hr53FKkK9tKikvleoVDkWoGy0DGyvMtRhS
         1wf7MwFV/UENAd2a/dnHUPUgEEF4ffzQ5MJsDVu6iTkZIO5/NvnDLHHVrjYy9uOINf/2
         yaljpVx4+7G3iXza22CoRJTMXPNIc3nonETbQWvwiO86FNPUZ71BbOfSUiF21VGHrP1i
         /CwDxFubryo7T0HSuylB0Rx2jXGdIOjC/4gCT8rAHWk9IW7MHDaT+hL/gm+8w+Es61Dj
         sGgZgmpZaYX9DtUcG/vfOKZ73X9p6nDP1Fr/XcESVn3UbAr1ZSAheCCK5VCXYcQxmzof
         x5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687185747; x=1689777747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6epH37hdpG+43zHnm1jYAPdZwnsNsyegwEKE9/FA+rc=;
        b=Nbc9H7E8GvlcQMwll+NqzFH8NkOgR2J8BoapaUOaWiQwXAIVkGcFGUMYnIXc4jwPnm
         zsO8u2rPeSizhBXSzmpcZNI5Nj3sSiCFzx5Bj5Q80QtEjOHYs2+f7DZaV/OPacDl/XWK
         vUMtGQI0gNjk+8Sc89suOGoX4VYfoCRq8Jh6ZUACMvM2Go9Eqxu1wkW/+XtUfkdbG21h
         ODN9UJchv6wFqKvCtanUT3sBz4n9DN5wfF/sopTckkmYV5e9uW0ClZqoonXJ8kZRHTEV
         xmb/m9SKZkop11t4WKWv8pIokUdVgM84eeitMd+nOa40sEbw24aZN/KmTMgkziU88NWz
         CY3w==
X-Gm-Message-State: AC+VfDwu1VIh9YOVmZK9U6NccBwQS8IPW2kUenXlG6lxblMS/2uj73wp
        RGUn3rrZ5R9NHviN2dpkiLtPzA==
X-Google-Smtp-Source: ACHHUZ5GsLFi7Eftr+GWDtD5vjtCFIBvjRQh0Vm+yoQ+n8kb4HQsZW8B15VQxQMJV9e38t0hfcFPFA==
X-Received: by 2002:a5d:574c:0:b0:30f:d05f:debc with SMTP id q12-20020a5d574c000000b0030fd05fdebcmr7467466wrw.43.1687185747252;
        Mon, 19 Jun 2023 07:42:27 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id t12-20020adfeb8c000000b0030ae6432504sm31705801wrn.38.2023.06.19.07.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:42:26 -0700 (PDT)
Date:   Mon, 19 Jun 2023 16:42:25 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Matthieu Baerts <matthieu.baerts@tessares.net>,
        Mat Martineau <martineau@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
        mptcp@lists.linux.dev
Subject: Re: [PATCH net-next] mptcp: Reorder fields in 'struct
 mptcp_pm_add_entry'
Message-ID: <ZJBpUaUoAmIPpU70@nanopsycho>
References: <e47b71de54fd3e580544be56fc1bb2985c77b0f4.1687081558.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e47b71de54fd3e580544be56fc1bb2985c77b0f4.1687081558.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Sun, Jun 18, 2023 at 11:46:46AM CEST, christophe.jaillet@wanadoo.fr wrote:
>Group some variables based on their sizes to reduce hole and avoid padding.
>On x86_64, this shrinks the size of 'struct mptcp_pm_add_entry'
>from 136 to 128 bytes.
>
>It saves a few bytes of memory and is more cache-line friendly.
>
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
