Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B7FC433ED
	for <kernel-janitors@archiver.kernel.org>; Sun, 11 Apr 2021 13:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB18D610E9
	for <kernel-janitors@archiver.kernel.org>; Sun, 11 Apr 2021 13:05:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235622AbhDKNGJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 11 Apr 2021 09:06:09 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:44218 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235606AbhDKNGJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Apr 2021 09:06:09 -0400
Date:   Sun, 11 Apr 2021 13:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
        s=protonmail3; t=1618146350;
        bh=gMCbMDXKluEh7a3wZCLySW+6f1sYY+ESIrdx8bfwTtE=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=QJY4bBcPITcWEBo4JwJW5uYGcN8Hzt32/bfJZkm1+yyaaQ69d+Q2nMVKvQrhFq+Jr
         JD7qzRPF9xUwgEnnEGTit2YgRrtWFvT817LTSWMYXMw+78MIPwILyHsVTYUxYo6v+c
         o6CfICy0rsBqi8DL8UJQqWRYNIW+hLm/yvYGijTbAZ0fQcwo5fDhouI3ZpgqLrNAic
         9vfHxKTS4uNEQX5smN0P2o77AkGlpnsln1ZjF+cMaCs0nfj8xCf8E9baR6nR18eb+t
         BNXrod8g/iNm3MZBBsCf1MBZ32Vh6xudRhT6a5Zw9tg7uo/h0Rf3iZXf8Xvf7bBisY
         AMzpbB4/FpZQQ==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   Bryan Brattlof <hello@bryanbrattlof.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove unnecessary goto jumps
Message-ID: <20210411130531.wpp2jm5xsoxhombk@bryanbrattlof.com>
In-Reply-To: <YHKaeaEPzoDRKI01@kroah.com>
References: <20210410152536.426047-1-hello@bryanbrattlof.com> <YHKaeaEPzoDRKI01@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Apr 11, 2021 at 08:43:05AM +0200, Greg Kroah-Hartman wrote:
>
>On Sat, Apr 10, 2021 at 03:27:02PM +0000, Bryan Brattlof wrote:
>> The next instruction for both 'goto exit' jump statements is to
>> execute the exit jump instructions regardless. We can safely
>> remove all jump statements from __init rtw_drv_entry()
>>
>> This will also remove the extra line-break before module_init()
>> that checkpatch.pl was concerned with.
>
>When you say "also", that almost always means it should be a separate
>patch.  Please do so here, try to do only "one logical thing" per kernel
>patch please.
>

Will do.

I'll resubmit a clean v4 without the extra bits.

>
>thanks,
>
>greg k-h

--
~Brayn

