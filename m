Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86293C433DB
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:24:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 642A06193C
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhC0AYU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 20:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhC0AYH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 20:24:07 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1B6C0613AA
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:24:07 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id k25so7153933iob.6
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kWcmqDNjSgMeYn5Nyg6J1/NYCGWlgfXicWyx1OhC3R0=;
        b=fquED2wSUv+ch67CdubGSg9f3jFh3Ancb7wrovx0Mrm+9Ggnl0IkSRmnTwHEbHWAdA
         bqC6Ww+oq2UTHbSfdNo+9sd25RJ04Q+7RaXWC61DG/pNRNaa0KocZC6ekNem/SSQvuJl
         RwU+NcmNjOxUbGevJ/gkoVb+cIudsZU2IgADFYPk28IPnVOvNCcIXrC2Gj3sWssvJtrQ
         2tqh7b3fS7P7gZGVTA3Nxi1qMsmirjED1/UARMgp2Q4miOqzBrPFNPqCsgRALuZd8pKI
         7JRt+X4OaOr3r3ABP1v2YvQL4qw+yeGaDjagZf3FJnH0ZDsrbYe+NLyd1WgR7q3HKHmF
         surw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kWcmqDNjSgMeYn5Nyg6J1/NYCGWlgfXicWyx1OhC3R0=;
        b=YBgP9Fd+oDk/1dXpsOw7Prumul8GGN69RQnUepDvgiqWn+qI0Lz7MxQF9D9+Dg63ub
         QgTN9oXusDTbJHcb0juInEbMnrWrITughlYPpCrfjpH0dZ2OCUoXpyCuo8RAcimo4E6j
         IQ1MGvum+hJcekaH90r+bEbULeoAIAe1DTrOo5MGUdKemBiWxtFC1ZUrXdBv9MdSWR5o
         9GDWBSavLHoufs6/ZwQaZrV1cSv2Ba+qagGpA+CUhErcgh4vTOGL6yPyUBhgmKTJVRDe
         a8CtkdOAdMpkh1HsNkhWnpMx3hQ4l0xjsXfJTpZt/9oYev59YguZUqWDEJ2PZkt7UeT6
         6itQ==
X-Gm-Message-State: AOAM5318LXytt1xYz+V9x6x9W+0VKFPqPCm23bfVmnFEuZXglIyk3jBW
        mMfu2OvfkXuHNZ54RkK6Kmt2nsE+WqECQpn+ng4=
X-Google-Smtp-Source: ABdhPJzu7X7HTviVbHkO5+zIcPCigw6WEAd8ddThIawVm1vOGA1G3GM5EznMV/T1gx0+zvz6xyc79nvVfFF1qMD+4KY=
X-Received: by 2002:a05:6602:1689:: with SMTP id s9mr11811345iow.171.1616804646661;
 Fri, 26 Mar 2021 17:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210327001736.180881-1-eantoranz@gmail.com> <20210327001736.180881-6-eantoranz@gmail.com>
In-Reply-To: <20210327001736.180881-6-eantoranz@gmail.com>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Fri, 26 Mar 2021 18:23:55 -0600
Message-ID: <CAOc6etY0QruhUJtEQqD8sx1zn4SNAw3rGpMiyS+kDz=uYcBLDw@mail.gmail.com>
Subject: Re: [PATCH -next 6/6] staging: rtl8723bs: sta_mgt: return _FAIL if
 there is an error
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marco Cesati <marcocesati@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Ross Schmidt <ross.schm.dev@gmail.com>, fabioaiuto83@gmail.com,
        linux-staging@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 26, 2021 at 6:18 PM Edmundo Carmona Antoranz
<eantoranz@gmail.com> wrote:
>
> If there is an error when calling rtw_init_bcmc_stainfo() inside
> rtw_init_bcmc_stainfo(), variable res is set to _FAIL. However, when


I must have been half-asleep when I was writing that. :-D Sorry. I
don't think it's that bad that it should be taken back, though.
