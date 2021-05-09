Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC33C433B4
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 May 2021 00:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A038661421
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 May 2021 00:44:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhEIApZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 8 May 2021 20:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhEIApY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 May 2021 20:45:24 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9CBC061573
        for <kernel-janitors@vger.kernel.org>; Sat,  8 May 2021 17:44:22 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id p8so11455106iol.11
        for <kernel-janitors@vger.kernel.org>; Sat, 08 May 2021 17:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gj4yGXG+GD5/F3ZaT3n8K/doE8LnNfs4lEMqsuEG4Rg=;
        b=ANH2BDySn0SlrWgLFTYzXdJhn89xt3qcEJRHl8F2Qu5LIjRqRlz+pm0ZRNfrfOa4o7
         h71Mie9p7QTK5rNFbOM1GRC7kwQkblJsSB6VuRj1HJSXv/THX/E177URUL8sFyO6uZcj
         VsWKJLRvRWuvKJpItuXNAHmr1sBVxuSkIIbegSB7vHb8OBwCXdhMD3LCMHII3tamUprx
         arN69lrvjBYDhPqLMZ7mmadOAeRn7TrUynPlTxJ6Jl4ZqHf9oxRVK8l5L9p3Zm+DdHQ1
         iVUF74b8YVSkWVRB0US+wFE4VR64t6lYiOjh+Oomvnx/48LhLkUKAnlIcGAreHI7wSTq
         mRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gj4yGXG+GD5/F3ZaT3n8K/doE8LnNfs4lEMqsuEG4Rg=;
        b=iMMUCyAxBna833uArLEBszcC+HICIQbi0/fODF8Ko9f073GPofPEg6anjd8KM9CcPs
         Ga7qS/7CBxI04V1p24Gu1iJIK4EUyQvv4DsNt6LJv6XZkjB0d7reQNKq4Bfd0ECBD+dG
         w0OYDw65lnZHTcKSYx7IjS76H1xaap0zA0zTB+ev8mu9G/RnTi6QK3BvXyKi0SYmWyX4
         b9o0lBKg+d1cVJFrkcpvRTjKB/mETn/+qAdshotDCWgtus2Pf/nVsTHYW6wnHYYQl/w0
         Or6JM0rc5n1GM2haqAE53bGEeJ6smodJ5l27zOVN99F65XR79SemfH2ZXtlFDkTf6CQT
         pjKA==
X-Gm-Message-State: AOAM533z/b9MV+XloRi1mZdYY1jewxu5LVzOu3eUbtGEzkjukm6nM92T
        FTRRfzd6YK5yy1uJAHaogN96PB1lg0uphYE54wo=
X-Google-Smtp-Source: ABdhPJw/LB5VECdqmKJngIp9mrvc+MMINESSjDIijhQhLjXvHM380ixx7UoUxU49DjYNMlBnQ1JC+k8qvUwnN76VXqU=
X-Received: by 2002:a05:6602:140c:: with SMTP id t12mr12606409iov.169.1620521061958;
 Sat, 08 May 2021 17:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210509004112.421100-1-eantoranz@gmail.com> <20210509004112.421100-2-eantoranz@gmail.com>
In-Reply-To: <20210509004112.421100-2-eantoranz@gmail.com>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Sat, 8 May 2021 18:44:10 -0600
Message-ID: <CAOc6etb05ptYVNPUhsjh_7T34VshWQ0RFHs9c39tFJ4=yPyDWA@mail.gmail.com>
Subject: Re: [RFC 2/2] staging: fbtft: use symbolic error messages
To:     christophe.jaillet@wanadoo.fr,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 8, 2021 at 6:42 PM Edmundo Carmona Antoranz
<eantoranz@gmail.com> wrote:
>
> Modify some error messages so that the symbolic error value be
> printed instead of a numeric value.
> ---

I wonder if this is more or less what Dan and Christophe were talking about.
