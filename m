Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6956C74A5B
	for <kernel-janitors@archiver.kernel.org>; Wed, 29 Mar 2023 14:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjC2Odw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 29 Mar 2023 10:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjC2Odf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 29 Mar 2023 10:33:35 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29D79771
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Mar 2023 07:28:41 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id u8so8190965ilb.2
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Mar 2023 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1680100053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4/N2vrJxKSPGNOo4Sdxe+Hpfi1jERAyjrq6Q8qDfAk=;
        b=AzlYpc+XImozgpGsaPACDbUXKjhp9c9A6qcTKDzRCDni1+aFSgFFcxPekrjtKLm0d8
         Ay0qm3J6ff/+kziNBdJN532CeJsuNYkAKc/iHi4DkKhPjY81gfptHuwj3ge51s1OmBDO
         STVZVxxmh0IV5a6EWA+Y7L7WT9ix/ELAYOyB4izb/4qs7urt4IKLTuZ/oLJb/OO5Ye5x
         pQgBiRheHzwox/x0UF3hX59gHn35qw16VHXLCfwqvOTY/TjzOC4Huq3AMDLtATNtbwnK
         uh3+uricXGSMZfLK8f5Gohea9tKExyOW07LHaK2E/fhE0MV2UIqivBSyayCiT35m0FtC
         FJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680100053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4/N2vrJxKSPGNOo4Sdxe+Hpfi1jERAyjrq6Q8qDfAk=;
        b=t5ptYDkjvdPf+2Xg6uNQSHF6ERFpUpfbwYeAUOGs/qGWjijZbwWdlXnj9qWZn7J/RW
         fZCyY+owGmcTj/7vaXlKPYmhi4zjlQFHfLft4oIukW2QdwxZl/sF95ZpE9lkspxGJa60
         HwthW3VuOqVFYYnshx+hzz/y+m2Nad8H4hZvb4G9/HE5WsjTW3lpprv6lIeSKkutUhXh
         kuv61t7uM68DE9e8R8i/V8ZC19FfUyG3NRA+Y3ugHJPL0m6JW8Dycw3W+c07NA9dBczq
         kNrwOrSVPajrt6SUsnts1MkSY6lWQq13wRLzQulXqpT7abxNJWhn+1ZrGWgWdqu7UHso
         BauA==
X-Gm-Message-State: AAQBX9dAHhjcmA7I4sd20d61MlKkX9k2f4JaGha1EuGBAwwLXmO1OocJ
        zNL6aFne9Vt/ua+Y6kfjFC7vyX+sU4RZk5fKvVgQuAGh5HAoCPc=
X-Google-Smtp-Source: AKy350ZXG/6vdtiRwb14rFlkSfYbi/rQ7HyN95sz22NFfzMEzzIVcrSq4Yj28sNoDp2O5+duQn4747E2fbAWADJ+YJg=
X-Received: by 2002:a05:6902:18c2:b0:b78:5662:d5bb with SMTP id
 ck2-20020a05690218c200b00b785662d5bbmr9370969ybb.3.1680099565020; Wed, 29 Mar
 2023 07:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de> <83763b78-453d-de21-9b48-1c226afa13a0@web.de>
 <57a97109-7a67-245b-8072-54aec3b5021d@web.de> <CAHC9VhR=yK72JXW3hJR+gUQtGCNpF0Bzk5RDzPZR0MunC84AUQ@mail.gmail.com>
 <CAHC9VhREfdgiCji=uEeCrc4w1kPGfnWGKnJuUYKXwTApdneSjQ@mail.gmail.com>
 <9e8bb69f-99e8-f204-6435-cc6e52816ebf@web.de> <CAHC9VhQfiNd_4uWBmKCC81UnOJb7Y=UFCDMXuqz3=UPr8QtqNw@mail.gmail.com>
 <382bc6d8-7f75-822a-6c36-088b1d2f427a@web.de>
In-Reply-To: <382bc6d8-7f75-822a-6c36-088b1d2f427a@web.de>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 29 Mar 2023 10:19:14 -0400
Message-ID: <CAHC9VhRxjJ3WMNc=vwkLKGDjSN8G=P9ykMkYg9dAJs3SaxVYYA@mail.gmail.com>
Subject: Re: selinux: Adjust implementation of security_get_bools()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     kernel-janitors@vger.kernel.org, selinux@vger.kernel.org,
        =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
        Eric Paris <eparis@parisplace.org>,
        Michal Orzel <michalorzel.eng@gmail.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Ruiqi Gong <gongruiqi1@huawei.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Xiu Jianfeng <xiujianfeng@huawei.com>, cocci@inria.fr,
        LKML <linux-kernel@vger.kernel.org>,
        Ruiqi Gong <ruiqi.gong@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Mar 29, 2023 at 1:20=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
> >> Would you like to take advice from another information source
> >> better into account?
> >
> > In this case, I prefer what I suggested.
>
> What does hinder you to work with more jump labels for improved exception=
 handling?

I'm the one who has the responsibility to fix bugs in the code when no
one else has the time or the desire, I'm also the one who shepherds
these changes up to Linus and argues for contentious changes which are
not popular outside the Linux Kernel security community.  Having to do
this with patches that I find bothersome hinders me in ways which are
sometimes difficult to explain, but easy to understand if you've ever
been responsible for maintaining a significant code base.

--=20
paul-moore.com
