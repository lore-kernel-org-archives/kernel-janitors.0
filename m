Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53EDC4338F
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Aug 2021 08:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB3A261163
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Aug 2021 08:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242857AbhHFIky (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Aug 2021 04:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32934 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242910AbhHFIkw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Aug 2021 04:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628239236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tHov3y4SzmkkW5jDcMFWWiMdIHJrFRJZsW5hu3bt+0g=;
        b=LlIfREwkpkMMzF3KhLGdeOARd2uRMlk/VR4Zk9a/vGa7PVIHHCYj6Z2Z4p/yMkldWncF/F
        1YhHK/IGaoUhwJGtZLc9P9hvLA4C384NR4Vh5TNWuXqeM9PSFe5iPwfrzh8mYm8mDhivue
        JB4EeC6BfHfvzt/NWhTzs+jvrDRrN5M=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-BBZtXrlyOxC1R44IWNpgtQ-1; Fri, 06 Aug 2021 04:40:35 -0400
X-MC-Unique: BBZtXrlyOxC1R44IWNpgtQ-1
Received: by mail-qv1-f72.google.com with SMTP id z25-20020a0ca9590000b029033ba243ffa1so5937123qva.0
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Aug 2021 01:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tHov3y4SzmkkW5jDcMFWWiMdIHJrFRJZsW5hu3bt+0g=;
        b=BGdE/WlhAdKGpXud6GJd51TWl7jVzzEnDx5g4LMHlykHUDUP377/TG51NDIPLYsZKE
         4ZdPDkzQsdL65YOT69xcDIAhOpH3hihLToHyn55j17JdOlsK90HSnPkNd2sHSwjj6PAz
         v0F4lw7TxonYUC1RS2eu8+9EiCd9N9cbwwQiM3yWtWaw8bwrtg42EPB3OpK2Q+5DvybM
         yonI1jaim7duX6whHjm0hNrIHl5Mlvx0vBpkPYhVhd9YGxHmbmdOzLuxdTSdkrkBhrm7
         OC7iu5ZPz2F71NGPpo3HPJvg8GyJ7Lv7C6q4GsAswPt6NwMI1cj9w3hl1CrIEx+2EAxj
         pLUg==
X-Gm-Message-State: AOAM530CNSQ7kqW4Vag+oyOlAZ3jpNcmMa9EawKEHyfHBSBn/ZeBHci7
        wgQPGxus6EBrFxqntOTQaL3OQtEaEU89zjzYoKpG/FtbqmBQGVt/pBp/msZHh+fpbr/QpN8JXY2
        txQhQSqz1Ng3ogNHNmnJDdK4BlLdU9zhRt4bp2xXAS5Zp
X-Received: by 2002:a0c:e6a4:: with SMTP id j4mr9833974qvn.16.1628239235104;
        Fri, 06 Aug 2021 01:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG8yeXhfv/qxy3RiueRJVQNA47VYPxJN/st1UyOvkbJ5Wt6DTvXY+KGruJHT5/zgeTCZHf/m3QIq/MjDPTKcc=
X-Received: by 2002:a0c:e6a4:: with SMTP id j4mr9833967qvn.16.1628239234943;
 Fri, 06 Aug 2021 01:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210806083818.GA2797@kili>
In-Reply-To: <20210806083818.GA2797@kili>
From:   Miklos Szeredi <mszeredi@redhat.com>
Date:   Fri, 6 Aug 2021 10:40:24 +0200
Message-ID: <CAOssrKdVn2uvQXTdMgMgEiPTHgoem0Acavq0aB5BMo=ynwJyGQ@mail.gmail.com>
Subject: Re: [bug report] fuse: move fget() to fuse_get_tree()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Aug 6, 2021 at 10:38 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Miklos Szeredi,
>
> The patch ff12b2314569: "fuse: move fget() to fuse_get_tree()" from
> Aug 4, 2021, leads to the following static checker warning:
>
>         fs/fuse/inode.c:1557 fuse_fill_super()
>         error: uninitialized symbol 'err'.

Hi,

This is already fixed in the latest tree.

Thanks,
Miklos

