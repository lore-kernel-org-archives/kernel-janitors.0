Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A8EC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Dec 2021 11:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhLGLXS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Dec 2021 06:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbhLGLXS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Dec 2021 06:23:18 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAB6C061354
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Dec 2021 03:19:47 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id l25so55375158eda.11
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Dec 2021 03:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vypJM99vqQPF5xSWQabfj6/UtRvkCkjPqAowV4DA7Mg=;
        b=iyNsUWIjWXshW9N0VR3aIYpGk8icrtq/ISa9O2tyOdPP9mXs4nl/XxlB5NRdSfnnq3
         etc3+k12SQErd5vcGegigaW573mdvIUxVMws02p4eSBgD7/diid7ATKiCEzIGdK8MeV5
         TCI2oyjcF5ZuY3o/tMsk0GqXHUxqOjmd08m/5tGzuCNW8auBDnbhLR7uEvGpGhVNAZLL
         18Hi7tSMTqbPPZD47ynoao68K1YOMFQ7MA3FhzbUgSlPOp6GP8IpIyQiBefUZM/RL6AM
         R6+PanqspYDZhTriRnhNVPe2ooeSX0oD1uSnHrmMQPv4EH1dGgZHUiY4v2RNlEbsOjQS
         G+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vypJM99vqQPF5xSWQabfj6/UtRvkCkjPqAowV4DA7Mg=;
        b=0kAeG/5Mn2joqFspKs0bZ6GEZPYJ0AH9gnoHvv3duybhVutmnhqK/zwXV23/Q2te//
         zZWd8oehF306V50n3UYYFBpxvWU1unNCr1XPuKdY3DsY6nJGGIlzjzhZgqLMhj4Z/VID
         Qs84Sj1RtKIrVSL3I6S0qHAZ8QZ5ovKU/tYTsEqaAngnaWNvJQbHPrsc9wnjbmeaGC0t
         UQZSXwYwlV98p6Ve0udCjlW2bFZfUmpmGeqVj0J/0KMOjUV15ypiMCon6klucj8zs7/j
         j6TVAQCQmTdN3pyHSw+ItQWPw4eKOAnJa7eFBQaESA7n8TjAXj6KFlpyXcvX5971ejxt
         RV+g==
X-Gm-Message-State: AOAM531tSqI/67VxuAcGgI1TEEgb01g1tQJRjLznjM2eVcPX+hXm0wI4
        TXFzpyygIGgTN6K58cEcrk725Q88VXCa3tP1zlhz
X-Google-Smtp-Source: ABdhPJy7WsuXIngGu8SwFbWVRor7Ua86izIldQO0uebC4PuKkQtqYrdNnRK8wpfqYE7fJctKXqx4HQ1i4x1O37pmiLs=
X-Received: by 2002:aa7:d34c:: with SMTP id m12mr8260868edr.269.1638875986333;
 Tue, 07 Dec 2021 03:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20211207104614.GA21381@kili>
In-Reply-To: <20211207104614.GA21381@kili>
From:   Yongji Xie <xieyongji@bytedance.com>
Date:   Tue, 7 Dec 2021 19:19:35 +0800
Message-ID: <CACycT3tTao93MvoU6eGf3i7mEjfxm-kBAGdGRghUb_AuCeUnwg@mail.gmail.com>
Subject: Re: [PATCH] vduse: fix memory corruption in vduse_dev_ioctl()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Stefano Garzarella <sgarzare@redhat.com>,
        Parav Pandit <parav@nvidia.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Dec 7, 2021 at 6:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "config.offset" comes from the user.  There needs to a check to
> prevent it being out of bounds.  The "config.offset" and
> "dev->config_size" variables are both type u32.  So if the offset if
> out of bounds then the "dev->config_size - config.offset" subtraction
> results in a very high u32 value.
>

Thanks for catching this! I think we also need a fix for
vhost_vdpa_config_validate().

Thanks,
Yongji
