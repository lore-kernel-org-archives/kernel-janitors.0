Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D232C433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Apr 2021 14:56:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05D1361104
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Apr 2021 14:56:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236663AbhDVO5O (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Apr 2021 10:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236529AbhDVO5N (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Apr 2021 10:57:13 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11AFFC06138B
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Apr 2021 07:56:39 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id e13so36705214qkl.6
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Apr 2021 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9cZAWfImI6VLS+4QpAMj/1HbaXFkUQw52F6CC9VLM0Y=;
        b=XOvY2HS1G58unBxLg5ROQPBVXB2i1rtoWGc+bbXT+2vA7bCspRWZdgzAaCCZ0bsoeu
         0sF56VPYV5WfWMwnmZ3Wxy5UtjMzcrDiAqmNu/dR2bYadmmTBLf/iSiXxEjg/GGXuOxB
         mQDhMr9mzdoN6BH9LnOyrOJ8fRZwMpWjD26p+zcqf+J13OviGDOMnBODvZfMg016tALI
         qiyv/x7QuuGB5CZjIlcz701ylLLjRKDmO9O8eprkW2MllSn6Yaui2gI1s2o7s34ux3QI
         jegryPdr6Ar6NzYc3zJu60EBIyHDyIOrzPCcVgX/dgaHH1JrLhbUUe+0XNID6kKlHUJr
         3WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9cZAWfImI6VLS+4QpAMj/1HbaXFkUQw52F6CC9VLM0Y=;
        b=chbEBxAFbRKuKLrFKAjS3v5KGzcs6UamXfebfYTcAr1i08WriA8qT+XAPRdpY3DdSj
         n98UwxtsZvlHuFUd/GdmMTfa5bSqlnyGL2V7PK/+9iWBd6P5mRpCJfrKjZYQOfGpzOQG
         mEKR1SMCwGXzuyn1WQpR8n0FTiKkbSYb6BCTSPG+XPDl7d3r5+8NcHsvkXbe947HdtlZ
         pJ63AHLyelWMzOzAFfzdAqiRUXjI//VECeC0/qKiHquUODxqppgaUIUSb015yKf43/sl
         WOFgTH3Rxnw5JEJPT3wmFt+4/IYOkUYSXXNVKU9+6/CBy/Ag5mKLM3jtIyovD4rAI5uX
         5x/Q==
X-Gm-Message-State: AOAM531esovs0WynjHgK4eewnKLQVeGGGfiW4vZYnDRRQLsN39URdfsY
        0cHRAuGHqEtITvJZvX0d71SU8OecB5yDv4z+UewCkQ==
X-Google-Smtp-Source: ABdhPJxFW03kYV1p+C7svvmXCA8kbvcMHwdxhGDs5AuWcLYnO3Ok1b8fiJ6ENnUdOk4iCG1afoKrJZRnyTQwB3rWzc8=
X-Received: by 2002:a05:620a:52d:: with SMTP id h13mr4127770qkh.472.1619103397954;
 Thu, 22 Apr 2021 07:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <YIE90PSXsMTa2Y8n@mwanda>
In-Reply-To: <YIE90PSXsMTa2Y8n@mwanda>
From:   Patrick Venture <venture@google.com>
Date:   Thu, 22 Apr 2021 07:56:27 -0700
Message-ID: <CAO=notzLH4reOAVu9t=81th+dS52BvBURKveHbg4wDjbdhbH5w@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed: fix a ternary sign expansion bug
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
        John Wang <wangzhiqiang.bj@bytedance.com>,
        Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Lippert <rlippert@google.com>,
        linux-aspeed@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 22, 2021 at 2:12 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The intent here was to return negative error codes but it actually
> returns positive values.  The problem is that type promotion with
> ternary operations is quite complicated.
>
> "ret" is an int.  "copied" is a u32.  And the snoop_file_read() function
> returns long.  What happens is that "ret" is cast to u32 and becomes
> positive then it's cast to long and it's still positive.
>
> Fix this by removing the ternary so that "ret" is type promoted directly
> to long.
>
> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 210455efb321..eceeaf8dfbeb 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -94,8 +94,10 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
>                         return -EINTR;
>         }
>         ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
> +       if (ret)
> +               return ret;
>
> -       return ret ? ret : copied;
> +       return copied;
>  }
>
>  static __poll_t snoop_file_poll(struct file *file,
> --
> 2.30.2
>
