Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78A9C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 28 Dec 2021 07:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbhL1HwP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 28 Dec 2021 02:52:15 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:33527 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233544AbhL1HwP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 28 Dec 2021 02:52:15 -0500
Received: by mail-il1-f200.google.com with SMTP id q12-20020a056e0220ec00b002b4dfeb7b27so9440482ilv.0
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Dec 2021 23:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=mfSDVqJhErVedYfVrnJ8dEhFdGpJaXk8RWpKOtafGRE=;
        b=Eby+qe5XTZe2h7B9Z+lpuz/FaS+JI7DQAlDQtCElyHFrazL61+onWFYl0htWr5Ck25
         nEQqeYza5HS4rbuq4u4HVIo3/NlDLUpQdhfSb2reAHEFyqfWdITWTHk7uffC1dTTfuGv
         F68BFYoDpx0ydCTWaSTZbis5waipf989KTYXmszU552PJwIp9EdLY7NELTEAcesr6qoL
         ySIBKyQg7heoRMCty/z+WBl8aGV60cMOISvPvXUZQqofMVLkFSnRYcTljILDynZZaPQG
         5foHwmjCdJ19H2X0WIXzwN2XKK66/5DhTULxSi9SKs9TUuIx/DOy+DrkH3qleezW6jvt
         prww==
X-Gm-Message-State: AOAM533uKuPouEEm4tOhPo+JyGwp7dGQem/owX1IkTrAdo09DaD8F2px
        Hx8E4J6nueVL/FDH/a/0IxPwS/bWwzsGYtJw1+rv5+zZWCeP
X-Google-Smtp-Source: ABdhPJzM3WruGzEgkkdvoZlnjeHQawCjv311LVoKVmDQGijHVqpynMTPKWPTup+cgtOBPkzM/DBouDc0ImZMGjHlUyfc+QXQ8aNq
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c27:: with SMTP id m7mr8941202ilh.114.1640677934458;
 Mon, 27 Dec 2021 23:52:14 -0800 (PST)
Date:   Mon, 27 Dec 2021 23:52:14 -0800
In-Reply-To: <cca3b7b4-d9cf-a275-ec0a-c99720a94049@wanadoo.fr>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000796bc905d4301953@google.com>
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
> (3rd try - text only format, other git repo to please syzbot - sorry for 
> the noise)
>
>
> first try (ok, 3rd...) to use syzbot. I hope I do it right.
> Discussion about the syz report can be found at 
> https://lore.kernel.org/linux-kernel/0000000000007d25ff059457342d-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org/ 
>
>
> This patch only test if alauda_get_media_status() (and its embedded 
> usb_stor_ctrl_transfer()) before using the data.
> In case of error, it returns USB_STOR_TRANSPORT_ERROR as done elsewhere.
>
> #syz test: |https://github.com/google/kmsan.git| master

"|https://github.com/google/kmsan.git|" does not look like a valid git repo address.

>
> CJ
