Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB42C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 25 Mar 2022 15:39:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245718AbiCYPky (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 25 Mar 2022 11:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354255AbiCYPjz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Mar 2022 11:39:55 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070557006B
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Mar 2022 08:35:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id p10so8149342lfa.12
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Mar 2022 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=OCf/0n6GjcmqDXv8Gioi+rhx4QNjBGF9KHVx3ac+6zE=;
        b=lUF1kfyWCBY65hVtIc4RDSVWVab21h3hkYrW10/qDdQ+inzdR6BKvrUsbg7iMBAhgq
         K6xgQR74RPxrhD1UEEaACDTOf7ubhYXHGnuGhEUnER7Kg25KoYQhvgy5P/PGEUe7qzY9
         xqvYdezclPzQvGc1JcBOScYjZKlFLGNVECEvrIU62rN4X8nzx8yYABRxAY6LtFhFQ6jp
         jG3KeDl1mLau2dWkuegD2hF/leT+alM83CfDNGIMw1e3k2diTCNr4hpth7jvWvmlN0og
         t0i47g7oO4x3bV71uwIXX00hLeEx746Nc90cysQ9bakwJ0Q3Krlrnncxfbbu6L7IphDz
         E4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OCf/0n6GjcmqDXv8Gioi+rhx4QNjBGF9KHVx3ac+6zE=;
        b=4RDBhwiDVsfPqsyGUA2yjIp7vKwEF3gjWb2z4wHEvbhtRzQ2TreLtNN+IwpMAlCRWY
         w0JOPJHTjd03C0I6HJNoDt50HsuMqVIbAG87y+oK0yfLu9aeEUEruAsy6jLSevNNgr2Z
         HvrXu8aMnux46Qai0w0REMhfTtCfTQu1V66I07QM1SpqX2rt0HEZRlQVvhXNpNnlkbPU
         colN1u5Zw69O8F/qg258+C7oQOsg8Q09nRAggKzFJQhnkwhOW7t9ed3G3W57y2EsDkbB
         QY2xkbRhf5vpLJvGltcDRj+nef/PhFkikpIBhaVhW3N05RsSjeO/Og3A1Uebm3EAFTmU
         P7Xw==
X-Gm-Message-State: AOAM5314U9V/Bvim4Erjcj/rOYA6uopdFQ6BDlwob0uw0mQMB29CGAyY
        CS/PF9LOklMmHVfb13K2QdLnzj5O6KGzJMZtHojHU3tnRrQ=
X-Google-Smtp-Source: ABdhPJx0hLUe9jJXny+YCVlcT52sqvjNuR4X9mNRTi2FZSY4rv6FBedlNYLfuXDYnp3u4nPn4j6lJaNUTIpHodV575c=
X-Received: by 2002:a05:6512:b11:b0:44a:2ead:daf2 with SMTP id
 w17-20020a0565120b1100b0044a2eaddaf2mr8251633lfu.642.1648222532821; Fri, 25
 Mar 2022 08:35:32 -0700 (PDT)
MIME-Version: 1.0
From:   Harm Smits <harmsmitsdev@gmail.com>
Date:   Fri, 25 Mar 2022 16:35:19 +0100
Message-ID: <CAO64rh6_m6rx_=rPcEGLzzT5oaJFYzbE2RSQ-9zwk83ysj16wg@mail.gmail.com>
Subject: [question] Whats up with loading the GDT in startup_setup_env in x86_64?
To:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello,

I really have no clue where to ask these kinds of questions so please
excuse me if this is the wrong mailing list. However, I was working my
way through the linux boot code as I am trying to understand to
somewhat of a degree how Linux booting is done. I have gotten to the
point, right before it switches to virtual address space.

However, there is this one line that just bugs me. Maybe it's an
actual bug (although I doubt it), but the call to `native_load_gdt`
contains a virtual address space ptr, and I simply am wondering why in
the world it is not page faulting. If I change it to be contained
within `fixup_pointer` it still works, and nothing seems to have
changed.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/head64.c#n617

What's the reason that in this case the pointer is not wrapped in
'fixup_pointer'?

-- 
Kind regards,
Harm
