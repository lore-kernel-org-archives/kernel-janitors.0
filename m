Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0982DC43334
	for <kernel-janitors@archiver.kernel.org>; Tue, 19 Jul 2022 17:23:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239007AbiGSRXx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 19 Jul 2022 13:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234779AbiGSRXv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Jul 2022 13:23:51 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F0934B49E
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 10:23:50 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id o10so707756vkl.3
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eZHXeSC1VmUCH9mNj9AUW2Bo/31nO6EiUjVsM1VfENw=;
        b=ikvjELr0mzcMkn646f2t6h9IlMjR09ulcKtvWFk/oWNTPozHVqYPx+SW/ifC4rI2sx
         yZi7GLcy8hYxA+j+iOCXmvSR68JdlHCZKn/N2jfg2NP9cn87ynbzQdH8zZ7t+m0E0+I0
         xPQYmESAsohp07c5tI5Ma8lop3ZA5mNwVkFBNNhAHGaGWJYpl1AS6giiJiD4QdEN4EgX
         X3zG02YbEW/wGfTAdCCnFene34bTqUYtu9jQLo4d7KKuMFClqe7CaNqVRLCqK1eHN7SS
         rAENRyrmOOgjLiHtv+N8sLo9ZF7zBeK0zG1O5dMACPQQvEkGo6V0fcffjpIdeBhLfag2
         y76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eZHXeSC1VmUCH9mNj9AUW2Bo/31nO6EiUjVsM1VfENw=;
        b=g9GpEbgWJbde3PaRPbFicaBa48dW7g6wobI1334LvZrno8XqF2bq9aIBnECMZ+K76B
         d+p3DQbX/Y9+VBjIHWFgsfdjMKXTaTDDTHoBky/hIjIZZgsq1CxZqO10Dt0V35RLLYsf
         VE4XykDLbiRmiGn9oWws40WFGRLguUvNwwnVYc1aEYtQeQGy6j9Q4Tm6h1Tks9qhlo4j
         so0BwtHQXQCtw5QqHfyjieydHuCFAQ69wcmQtNmC5bvoKVS+m/CdqwjrBStu6V15rd3Y
         ib8iMPZiKlz7pRmGrt8HwTTxVN8KWwZUyH9Rsm5iyWI6xuIKRoS8xWvBn0+3dE51hqEL
         PduQ==
X-Gm-Message-State: AJIora9bS6pgoUHQVFI7fwBeogDOil5o7QAAcvsGldhV6i3Wafkr9RiS
        9TgXl32f8SKNvuHsPNWHYrEONg3Roqz7EwwD/3PZQA==
X-Google-Smtp-Source: AGRyM1u5HyuOvFvEtgCsNy8CtDhCYpla6Olw81Yjc2ion524GkJopvGxeDi/yB/uUSHFIlGYU/28nWH7TVqIT0Zq7wQ=
X-Received: by 2002:a1f:a08b:0:b0:375:9914:4f06 with SMTP id
 j133-20020a1fa08b000000b0037599144f06mr4282192vke.14.1658251429478; Tue, 19
 Jul 2022 10:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <YtZzjvHXVXMXxpXO@kili>
In-Reply-To: <YtZzjvHXVXMXxpXO@kili>
From:   Mina Almasry <almasrymina@google.com>
Date:   Tue, 19 Jul 2022 10:23:35 -0700
Message-ID: <CAHS8izPXZx7htkby3j78RAqoHn2hXJqCiDP25XdsuTwj34AX4w@mail.gmail.com>
Subject: Re: [PATCH] selftest/vm: uninitialized variable in main()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        Muchun Song <songmuchun@bytedance.com>, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jul 19, 2022 at 2:04 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Initialize "length" to zero by default.
>
> Fixes: ff712a627f72 ("selftests/vm: cleanup hugetlb file after mremap test")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks,

Reviewed-by: Mina Almasry <almasrymina@google.com>

> ---
>  tools/testing/selftests/vm/hugepage-mremap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/vm/hugepage-mremap.c b/tools/testing/selftests/vm/hugepage-mremap.c
> index 585978f181ed..e63a0214f639 100644
> --- a/tools/testing/selftests/vm/hugepage-mremap.c
> +++ b/tools/testing/selftests/vm/hugepage-mremap.c
> @@ -107,7 +107,7 @@ static void register_region_with_uffd(char *addr, size_t len)
>
>  int main(int argc, char *argv[])
>  {
> -       size_t length;
> +       size_t length = 0;
>
>         if (argc != 2 && argc != 3) {
>                 printf("Usage: %s [length_in_MB] <hugetlb_file>\n", argv[0]);
> --
> 2.35.1
>
