Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC475C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 28 Dec 2021 07:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235344AbhL1HrS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 28 Dec 2021 02:47:18 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:54933 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbhL1HrR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Dec 2021 02:47:17 -0500
Received: by mail-il1-f199.google.com with SMTP id g14-20020a92c7ce000000b002b1e78da1f9so11108191ilk.21
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Dec 2021 23:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=Uw0HySQnOliUjUKI3r/PFZeo3az9rpmElYd8X6AhRRc=;
        b=sphLgN9RedxR+gQxrjkUFLZIVGZa06QSXlbk1payBNKWRXXu+OnMsZhdNsiQOjwDLO
         RflHvfBZgdfWCMM5hhAqy+a2geVRd5WxfNFvRvpISTheOEy1S+RcyD/EsZqA+eipuYFZ
         1GGmRFZmUv1MGDuBBBmGCqFDsWRdxSlZLWHlw6/KK82LWzuNhSIMDS7VlBVOvM/mj70X
         6QAFB5vjYnbi/VreR51q1B7onksbIWmQkQpZNZ2QEwtNH1BOPZThTTuW1DnU1bNKuGm2
         J49jF0zdidZVtKgWO9e/G/8Y/6nuFSr1w9bALwpzkyUKRO6/6pX7lPl60S2ZHbypcLMM
         FQUA==
X-Gm-Message-State: AOAM531F0oGSWblDLe0QeXpF6XqiOp0/3lbG1KJqC48gRV1OCy3Y1g4u
        t2Mhw54m++Ual0A0irxX4DctmASyjfUjgVLxEiTCwCyxhPwp
X-Google-Smtp-Source: ABdhPJzzBDBBy/cd8LQS9PQTs66isAN0tM25racBxresrnv1pJK8DlLuL0yS3O/+BJ612+mJNZ8W9lYMUF7fK4TZa/4hMmvqZTBX
MIME-Version: 1.0
X-Received: by 2002:a02:b11d:: with SMTP id r29mr9712662jah.71.1640677637200;
 Mon, 27 Dec 2021 23:47:17 -0800 (PST)
Date:   Mon, 27 Dec 2021 23:47:17 -0800
In-Reply-To: <f78b974a-e36b-6d23-6977-fdf50c05600b@wanadoo.fr>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c1a01605d4300787@google.com>
Subject: Re: KMSAN: uninit-value in alauda_check_media
From:   syzbot <syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     christophe.jaillet@wanadoo.fr, glider@google.com,
        gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> Hi,
>
> (2nd try - text only format - sorry for the noise)
>
>
> first try to use syzbot. I hope I do it right.
> Discussion about the syz report can be found at 
> https://lore.kernel.org/linux-kernel/0000000000007d25ff059457342d@google.com/
>
> This patch only test if alauda_get_media_status() (and its embedded 
> usb_stor_ctrl_transfer()) before using the data.
> In case of error, it returns USB_STOR_TRANSPORT_ERROR as done elsewhere.
>
> #syz test: 

KMSAN bugs can only be tested on https://github.com/google/kmsan.git tree
because KMSAN tool is not upstreamed yet.
See https://goo.gl/tpsmEJ#kmsan-bugs for details.

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
> CJ
>
