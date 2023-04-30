Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687B6C77B73
	for <kernel-janitors@archiver.kernel.org>; Sun, 30 Apr 2023 05:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjD3FT1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 30 Apr 2023 01:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbjD3FT0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 30 Apr 2023 01:19:26 -0400
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728F71BFD
        for <kernel-janitors@vger.kernel.org>; Sat, 29 Apr 2023 22:19:25 -0700 (PDT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-32b4303da0cso7853235ab.0
        for <kernel-janitors@vger.kernel.org>; Sat, 29 Apr 2023 22:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682831964; x=1685423964;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbgNg7bzEOiE+PpMY9EfhvJTml8HBUQsJEoVcCv5c8Q=;
        b=ZqzZWo79lG+Ms6qzRud2V3XhAY1ttyynPNdQZUztO0xnAIsMW1LrJgf4zWAfX/XmL0
         VF2N7DBEIQs+fl9mN24Ot8sHaiy/DgabNO7Vp1CaKgpFUr/HEpLs3nokoE1Ut7iRPVfH
         t+VPm7thVVKv8F4oLX6KuJ29I2UEUTI+xKszN30xulr+wQXulGpmHglWNIgiVfaPXQGP
         wAGbsI+NpCuPJNqNe+a8LDg9AUNwxhK3G8EhQ+EEW2yf64oMNUApDYLKNdMuGnhYGRLv
         jG5eOygemzGm2vGbW51QwHpAY9poDhTv8cqRyexOXv9lyzoYDGraEBZaXaBimliXx6Yl
         IeaA==
X-Gm-Message-State: AC+VfDzEBBbXkJb0g82uIR48DhiFTchgJ2OJHM+Zo92RqBKhmb183mC0
        RVDEPDZUNe6c0pwGjtnNgUxAhIvNZFjoKf8cr09qVDWOy3qE
X-Google-Smtp-Source: ACHHUZ7ExN+zShsIJc2XiFG2sXg9LR6zZCWJUqmWpaBVinskpdR+1L/m2w4P7/W7ipfQJwevuqU8oEbPVxYZNAFl3zT5ZpDJfNwZ
MIME-Version: 1.0
X-Received: by 2002:a92:d143:0:b0:330:a575:37e2 with SMTP id
 t3-20020a92d143000000b00330a57537e2mr852781ilg.4.1682831963878; Sat, 29 Apr
 2023 22:19:23 -0700 (PDT)
Date:   Sat, 29 Apr 2023 22:19:23 -0700
In-Reply-To: <00000000000083d76d05f909f716@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006c7b6b05fa86d9ee@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in xpad_probe
From:   syzbot <syzbot+a3f758b8d8cb7e49afec@syzkaller.appspotmail.com>
To:     chaorace@gmail.com, dan.carpenter@linaro.org,
        dmitry.torokhov@gmail.com, dzm91@hust.edu.cn, error27@gmail.com,
        gregkh@linuxfoundation.org, hdanton@sina.com,
        hust-os-kernel-patches@googlegroups.com,
        kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        matthias.benkmann@gmail.com, mkorpershoek@baylibre.com,
        mudongliangabcd@gmail.com, nate@yocom.org,
        pgriffais@valvesoftware.com, radon86dev@gmail.com,
        rafael@kernel.org, rojtberg@gmail.com, s.demassari@gmail.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        vi@endrift.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

syzbot has bisected this issue to:

commit db7220c48d8d71476f881a7ae1285e1df4105409
Author: Vicki Pfau <vi@endrift.com>
Date:   Fri Mar 24 17:42:27 2023 +0000

    Input: xpad - fix support for some third-party controllers

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1028a1f8280000
start commit:   92e815cf07ed Add linux-next specific files for 20230428
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1228a1f8280000
console output: https://syzkaller.appspot.com/x/log.txt?x=1428a1f8280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c8c8ae4d47d23592
dashboard link: https://syzkaller.appspot.com/bug?extid=a3f758b8d8cb7e49afec
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a5408c280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d3b0e4280000

Reported-by: syzbot+a3f758b8d8cb7e49afec@syzkaller.appspotmail.com
Fixes: db7220c48d8d ("Input: xpad - fix support for some third-party controllers")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
