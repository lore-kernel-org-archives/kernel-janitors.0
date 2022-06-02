Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB35CCA478
	for <kernel-janitors@archiver.kernel.org>; Thu,  2 Jun 2022 14:24:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235823AbiFBOY3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 2 Jun 2022 10:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235818AbiFBOY2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 2 Jun 2022 10:24:28 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF8CE013
        for <kernel-janitors@vger.kernel.org>; Thu,  2 Jun 2022 07:24:25 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d22so4643725plr.9
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Jun 2022 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HxegqmluZfGum4dvqgOU0+mOd4/mzJT29RY5Mq2PSmo=;
        b=uuMOyjNlfwL7j6moDJgG7DcpONkUOrVwhM+DNWrYmg9aBd84kznKvan3AuRTwU+naM
         ddzHcbYCFjll4jQY/8xij8z5PH9TjyFteu10hVgP+97GbMTSRdC9F9wOnYl5myYVVqZ6
         BFnJaP5RM3r837wxhmP7YR1NxvitZSWxo6tKqCGanlMz9eEnVMcgCJ+kJPKJbOQlZYsG
         8omRmI7n5WHCyzEaI4Tq82z80958skwJPzvGAimZ/hHT/BSZZgzserZ3G9MCFdZkZxBF
         Y3qKuT5LzzTe4jsuv32TSpQFkC1mCLnzX3eOpto4VqKyd2VOl928uscBl+lSRwA6D6JS
         bHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HxegqmluZfGum4dvqgOU0+mOd4/mzJT29RY5Mq2PSmo=;
        b=rUEAsVBn6xQdSLjpjo2aRrJuhB8gybUSLhZ8ykutuGPrra29GGYIw6SO4M+IeygyDI
         MCprdqiUQ2B4HOH5vnfKjfIt/vmBL+pKvGmAyzqifop785Y2N1Qsfsnv4kZ6Rj5/Pu+r
         49E2pWPxVbFgEHEw5NqjZSJyrMD393cqaAvBMq0f0Omj0HPhOnBBVk6r0XesLOrQ1o4j
         58+ycfU0Ysw/ox5sbG8AW2Wbh56pbTxeo03T2ldG2Zv4vz8dRgosaHr/LcDvga5uewJi
         rsFZmBKPLzzQEL22+J+w0IcHBM6djs/BL8EqgY4Xi34MRa6C6Lca5NC7EAu19C+ZozAs
         zAvA==
X-Gm-Message-State: AOAM533hl5loPZ+v1bJiSbsk3CTLX4qmj02ITFzhZVKvlrAR+EKOW00j
        9UAWEF4KF2UNuRWXbCgPSLL3yTHJSvFiibqKQ8LythJo0AmctLme8ds=
X-Google-Smtp-Source: ABdhPJz4UU8XuKbPhBvUtYn+vGDCxPdlAiRGgoZq9L/JtvSNTSAsfHCO47SNz+0Rft+0oHk7biDkJsyU5kZLT2AqgY4=
X-Received: by 2002:a17:903:11c9:b0:154:be2d:eb9 with SMTP id
 q9-20020a17090311c900b00154be2d0eb9mr5088209plh.91.1654179865316; Thu, 02 Jun
 2022 07:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220521124745.8747-1-roger@norberthealth.com> <a728cf17-4866-1151-0740-56b06257c917@infradead.org>
In-Reply-To: <a728cf17-4866-1151-0740-56b06257c917@infradead.org>
From:   Roger Knecht <roger@norberthealth.com>
Date:   Thu, 2 Jun 2022 16:24:12 +0200
Message-ID: <CAO_iFwrHcSWJm17fL-Q83DZ5i1xr+_dkEjh5Yt3Hxso0VtnzZw@mail.gmail.com>
Subject: Re: [PATCH v5] crc-itu-t: Fix typo in CRC ITU-T polynom comment
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Ivo van Doorn <IvDoorn@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org,
        Kristian Hoegsberg <krh@redhat.com>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 21, 2022 at 5:44 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> I don't know which maintainer will merge this since no one is Cc:ed on it.
> You will probably need to choose some maintainer to send the patch to.
>
> But let's add the people who merged the header file in the first place
> for their comments/review. (done)

Thanks Randy.

The CRC implementation seems to be unmaintained (no entry in the
MAINTAINER file).
Any idea which maintainer I can send the patch to?

The kernel doc mentions Andrew Morton as last resort (added to CC):
> You should always copy the appropriate subsystem maintainer(s) on any patch to
> code that they maintain; look through the MAINTAINERS file and the source code
> revision history to see who those maintainers are. The script scripts/get_maintainer.pl
> can be very useful at this step. If you cannot find a maintainer for the subsystem you
> are working on, Andrew Morton (akpm@linux-foundation.org) serves as a maintainer
> of last resort.
source: https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Roger
