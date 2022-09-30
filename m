Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B1DC4332F
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Sep 2022 16:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbiI3Qfs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 30 Sep 2022 12:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbiI3Qfr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Sep 2022 12:35:47 -0400
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D7B10D0CD;
        Fri, 30 Sep 2022 09:35:46 -0700 (PDT)
Received: from in01.mta.xmission.com ([166.70.13.51]:58642)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1oeIzJ-00CyVp-Qf; Fri, 30 Sep 2022 10:35:45 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:47416 helo=email.froward.int.ebiederm.org.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1oeIzI-00Et3R-Sr; Fri, 30 Sep 2022 10:35:45 -0600
From:   "Eric W. Biederman" <ebiederm@xmission.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220929203903.9475-1-lukas.bulwahn@gmail.com>
        <87tu4p3jwn.fsf@email.froward.int.ebiederm.org>
        <202209291638.BD0B8639@keescook>
Date:   Fri, 30 Sep 2022 11:35:38 -0500
In-Reply-To: <202209291638.BD0B8639@keescook> (Kees Cook's message of "Thu, 29
        Sep 2022 16:39:19 -0700")
Message-ID: <87wn9kzup1.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1oeIzI-00Et3R-Sr;;;mid=<87wn9kzup1.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.110.29.46;;;frm=ebiederm@xmission.com;;;spf=softfail
X-XM-AID: U2FsdGVkX1+v1+HqCxxCIh/LfD/UrB7U7RKTyzEaoz0=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH] binfmt: remove taso from linux_binprm struct
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Kees Cook <keescook@chromium.org> writes:

> On Thu, Sep 29, 2022 at 05:17:28PM -0500, Eric W. Biederman wrote:
>> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
>> 
>> > With commit 987f20a9dcce ("a.out: Remove the a.out implementation"), the
>> > use of the special taso flag for alpha architectures in the linux_binprm
>> > struct is gone.
>> >
>> > Remove the definition of taso in the linux_binprm struct.
>> >
>> > No functional change.
>> 
>> Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>
>> 
>> Alphas binfmt_loader is the only use I can find of that variable
>> so let's kill it as well.
>
> Ah, sorry, misparsed this -- you mean, alpha's use (now removed) was the
> only place it was accessed. Agreed. :)

Yes.  I was looking in a tree without my previous change merged.

The code in binfmt_loader (which is removed in the my change) was the
only user of that variable I could find.

Eric
