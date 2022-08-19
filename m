Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2E4C32771
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Aug 2022 10:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347454AbiHSKrx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Aug 2022 06:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346578AbiHSKrw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Aug 2022 06:47:52 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC67FE42F7
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Aug 2022 03:47:51 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id by8so1619056uab.12
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Aug 2022 03:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=OUBWcj+l2fZhAH1BrINxznZbkgscwekzK7SpRP2VydY=;
        b=BDVsMt6jVkLAZUOdrMtoDTZJvO0/HENdJAxcJSe6p2JOEuOLxZr2AdO+vhtUep2v9a
         9adeu3JKEUmAbohxo54WDpYRnED0hmdcrvFOpPS3EfwQajcqaohrFUYNdtwBRdvncqM4
         /iyEBGQu+BHjHyXjLujXPFApQ5Pli4SsZGV4Rg8e+2PsnG3FwhhzSuwiQaporfaF2xgy
         WBkuycImAGHqGIQeH55INbFHbN55brtlgJsZjX6lYZAu+mwxQRGHtL9LU065e4ZfYlRB
         yuY38/DwaD++nOb5EPCgEe7ETEucrMUTDnQhGvWufOUBwn024zkgHnprHSRAV7Vj3Imi
         Uc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=OUBWcj+l2fZhAH1BrINxznZbkgscwekzK7SpRP2VydY=;
        b=UyszXd4FlEi8KGQpMWIZf0FTnbdoJqWco02fR5G4/biOqwKEqu4qmvJcxAyVUHJ68L
         JQpiXh3cX+uD9h+qxFaAZX1p6vKOVe1ZNZYk40eHfNYhJLqPvmSWrtpAdFpeX7ZUSLkv
         ODt/FnIldbU6blbk3xkL6Xh/oKbB644R6Ivi649zj5izBpa9V1MDICTW1uqbQVCWNj/i
         kShFKO0rDXaVr1XQmOSDMEgeSizTMQ7EExsa118pvOB01ypFVvDyTmpXZ1xCnLh0DIOm
         2tCJDcvHp9V1hRoJnaJFWk7SZB0QL/LaQj5LuJm5QT0YcqG2LhnPEnxu6/7nOQ3NYssr
         44nQ==
X-Gm-Message-State: ACgBeo3zbSfGEbQG8YWCsSUKlYYvVfpSiHgQy8K9lfgUsgFJhOZuDEbK
        6BtZnAwLJM+ozLPma1PGnjo9Az/VdPhge8lBZO2Wsg==
X-Google-Smtp-Source: AA6agR5rsRD98PksJa5P0Cw1+qZGpWvSleTb3FomztyCM7UJ1Bssw3ZhU2uX9j6qL+N89imUfYdNVQEZjRbNOafAnMc=
X-Received: by 2002:a9f:35c9:0:b0:387:967a:fa31 with SMTP id
 u9-20020a9f35c9000000b00387967afa31mr2614022uad.70.1660906070973; Fri, 19 Aug
 2022 03:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <Yv8dpCFZJdbUT5ye@kili>
In-Reply-To: <Yv8dpCFZJdbUT5ye@kili>
From:   Guenter Roeck <groeck@google.com>
Date:   Fri, 19 Aug 2022 03:47:40 -0700
Message-ID: <CABXOdTddCmyYQ9NqOAoW6jZ00b-60EDPPfwoJUpMTtGUPp3T5Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: fix memory corruption in ioctl
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        "open list:CHROME HARDWARE PLATFORM SUPPORT" 
        <chrome-platform@lists.linux.dev>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 18, 2022 at 10:20 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If "s_mem.bytes" is larger than the buffer size it leads to memory
> corruption.
>
> Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_chardev.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
> index fd33de546aee..2442dce4e208 100644
> --- a/drivers/platform/chrome/cros_ec_chardev.c
> +++ b/drivers/platform/chrome/cros_ec_chardev.c
> @@ -327,6 +327,9 @@ static long cros_ec_chardev_ioctl_readmem(struct cros_ec_dev *ec,
>         if (copy_from_user(&s_mem, arg, sizeof(s_mem)))
>                 return -EFAULT;
>
> +       if (s_mem.bytes > sizeof(s_mem.buffer))
> +               return -EINVAL;
> +
>         num = ec_dev->cmd_readmem(ec_dev, s_mem.offset, s_mem.bytes,
>                                   s_mem.buffer);
>         if (num <= 0)
> --
> 2.35.1
>
