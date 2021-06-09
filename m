Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DAAC48BDF
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A827613AE
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 10:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235453AbhFIKxr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:53:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45285 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234821AbhFIKxj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 06:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623235904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3O034lC9XVT1tHLr7bzKUshMkaUGECTxo1+ipe8YQ0I=;
        b=b5QxBd/6a3YhM0SSaYuZpa6ZymdSO5p/j5igxt2XnPdtgEkInK9Yt4zrkjo79OFPSHt6k9
        7DEjXg3CgAQd6jaTr/BgnD78wKaIbOWMMrF4n7bO0R13vklwE/7Dxhxh8N3C8c02XfpTWi
        xVS0BgPG3bN4Jr2iB0MsC+4+rqcMpmw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-iyiu2rurNdWkHa3Lepjl-w-1; Wed, 09 Jun 2021 06:51:43 -0400
X-MC-Unique: iyiu2rurNdWkHa3Lepjl-w-1
Received: by mail-wr1-f70.google.com with SMTP id d5-20020a0560001865b0290119bba6e1c7so6632307wri.20
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Jun 2021 03:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3O034lC9XVT1tHLr7bzKUshMkaUGECTxo1+ipe8YQ0I=;
        b=gMshfOia0PwT6ri3r/ftoBQmuEqTpFk53CXe4kE/Ix/TfagvSC88pjhkdni+cHsCiI
         if1+4GJwcMZ0F2JJK7UsUekuWzZegwgff2co+VZcE5ngyGuWvi38mJrxBpTyMr7MrutP
         Ge1bGIE5M0vH2MrIUN+sQZ7n8C2+7+36DojtvVWzi/sH5puwGgLyoXUF7R5laANSbQci
         wF9+GFvBOr31/DVY2eOYDvfJtXHQrT86t7v2CrbhVQuu9OdKAi7lrAfnVAdgP5tuLdo0
         stOO4lgp0VqBS97z+SLDfi0DQH3tfgMoIdNKYgNBDUPV3M4uABu+vfZMcBRJKtFC+d2F
         YoeA==
X-Gm-Message-State: AOAM532bpxhrS3M4E99otcin9m0tTZddEWJodbnLQyBudwRysJmdTh6n
        k2bH5YxEXPmM9In+tVXDIT3WTtpXwqxaEkF8LishZvbBCfLWSx6Whgnt1xnx4q7sxlYRS/ighz7
        pLzC8SwuDlwKYOa/DMM5m9UvFx/QwjnBb0/cO0fTym94u
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr28687492wrs.361.1623235902150;
        Wed, 09 Jun 2021 03:51:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFUVH4RJ8l7mW7Wdi2mAODQQWJJNufTytgE5ne0NwBsUZTSEThQDObeBpv3G+IgXE8n9iyWpYuvMruDn6AcCA=
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr28687476wrs.361.1623235901974;
 Wed, 09 Jun 2021 03:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031244.2822705-1-libaokun1@huawei.com>
In-Reply-To: <20210608031244.2822705-1-libaokun1@huawei.com>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Wed, 9 Jun 2021 12:51:30 +0200
Message-ID: <CAHc6FU7yT48KaRrQt-1jn=8Cwvu9XUjfQNJC0es5cUN91Y_D=A@mail.gmail.com>
Subject: Re: [PATCH -next] gfs2: Use list_move_tail instead of list_del/list_add_tail
To:     Baokun Li <libaokun1@huawei.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Bob Peterson <rpeterso@redhat.com>, weiyongjun1@huawei.com,
        yuehaibing@huawei.com, yangjihong1@huawei.com, yukuai3@huawei.com,
        cluster-devel <cluster-devel@redhat.com>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 8, 2021 at 5:23 AM Baokun Li <libaokun1@huawei.com> wrote:
> Using list_move_tail() instead of list_del() + list_add_tail().

Thanks, I'll add that to for-next.

Andreas

