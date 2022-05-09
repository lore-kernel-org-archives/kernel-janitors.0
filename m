Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0E2C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon,  9 May 2022 16:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239386AbiEIQws (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 9 May 2022 12:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239364AbiEIQwr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 May 2022 12:52:47 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB63239B19
        for <kernel-janitors@vger.kernel.org>; Mon,  9 May 2022 09:48:52 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w19so24839724lfu.11
        for <kernel-janitors@vger.kernel.org>; Mon, 09 May 2022 09:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5g8PMEr0fUha/SOThrUTETc1ItXC2lJPUN9/NQxWRVg=;
        b=MTLQyColdjkZgneoiO2JCqBMXtCiy+AfIci1x5bN8m/pMI1K+N6mWUuJqIXJO485zB
         ckPvI6zubY6h6FFL90K0wOdEgJ+OYvs71xh7lZMNbvmpa+88N3wAmAbTRa7164xC4Wpn
         kPadB+F+/aVDf+cfcn3fiXl+O/FKqeSw7T34E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5g8PMEr0fUha/SOThrUTETc1ItXC2lJPUN9/NQxWRVg=;
        b=r4EnuHa9FSurQmmSaVd4tZ1hjMJbIxmnLkRBSMlE/d8z6Tn6JEaC6j/RqIVMBKEJi2
         QKX/J3f2zEhm9jMaWeGhShTNntVuDnimjzsaPQuk9LSHYVUBNVcSBvFKX8we2bZG5hLx
         AlPMTNo5FL6N/UzeBdR3qkLDs0QRA3a1BqYY4NpHpbhZk0rS/jpTtPc7Z92dzJyhnzyb
         9m9uvSIiAdU+udV40c+TIONB3c1vBy5A3dvXlF+KYgy5GlxtiD0ks7xzKzf2m5DGS85S
         VWpxA+UsWp5svf/D4jVJ3JudiRT+WPFfsUXmbqbymNZVkwRmulaK3xH8X1wBKB+nAgA4
         djzQ==
X-Gm-Message-State: AOAM530mo/wfqZ7e2Kd8SlXsQy0VplY8np56eLDs2xGUDwoHTSbn9goQ
        4yqWANdk1zoCHW5IwXVui4JVUM5qxhQEu2UrgnwlwQ==
X-Google-Smtp-Source: ABdhPJwPo5JqWbaAlLxvMlGR2NliI+YODauqw3FDoQdF3n9yPSWsygJ1qVypKeLMyEtd6+ld8sdQSlHGmbJqcJBBw/c=
X-Received: by 2002:a05:6512:2313:b0:473:a307:b1ee with SMTP id
 o19-20020a056512231300b00473a307b1eemr13201763lfu.159.1652114930854; Mon, 09
 May 2022 09:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220508214500.60446-1-colin.i.king@gmail.com>
 <CAADfD8wApw_v+uDTijY1K89WRJ_f7tkHmz=6LR086yMjEU4mWQ@mail.gmail.com> <20220509124427.GG4009@kadam>
In-Reply-To: <20220509124427.GG4009@kadam>
From:   Ozgur <ozgurk@ieee.org>
Date:   Mon, 9 May 2022 20:48:39 +0400
Message-ID: <CAADfD8zwoGUw4aJ8ebz9sLYyZSGp8Au6y5QvpFPvV9Rc4HY_Aw@mail.gmail.com>
Subject: Re: [PATCH] x25: remove redundant pointer dev
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Colin Ian King <colin.i.king@gmail.com>,
        Martin Schiller <ms@dev.tdt.de>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-x25@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 9, 2022 at 4:44 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, May 09, 2022 at 04:57:40AM +0400, Ozgur wrote:
> > On Mon, May 9, 2022 at 1:45 AM Colin Ian King <colin.i.king@gmail.com> wrote:
> > >
> > > Pointer dev is being assigned a value that is never used, the assignment
> > > and the variable are redundant and can be removed. Also replace null check
> > > with the preferred !ptr idiom.
> > >
> >
> > Hello,
> >
> > *dev pointer is device assign global linked list and shouldnt be
> > touched by the driver so *dev wont get any value right?
>
> Why are you talking about "*dev" instead of "dev"?
>

Hi Dan,
I just realized this, i thought dev was necessary for launch functions
device and to activate.
if carries this with x25, dev is useless I understand.

> > Also seems to use this while network interface is initializing because
> > some activation information and stats information is also kept here,
> > for example, open *dev will call when ifconfig is called from.
> >
> > route, link, forward these inital activate and move all values with
> > net_device *dev?
>
> It's not clear what you are saying...
>
> When I review these kinds of patches I ask:
> 1) Does Colin's patch change run time behavior?  Obviosly not.
> 2) Is the current code buggy?  Sometimes when there is a static checker
>    warning it indicates a typo in the code.  I do not see a bug in the
>    original code before Colin's patch.
> 3) What was the author's original intent?  This code predates git but
>    I think the "dev" was just a going to be a shorter name to type than
>    "x25->neighbour->dev".

Actually i thought similarly because when this patch remove dev from i
thought would depend on
other source code whose x25 interface will be implemented are not ready.

I thought any x25 interface or x25route was using it.

> I honestly have no idea what you are saying.  At first I thought you
> might be saying that this is stub code.  But that seems wrong.  Also we
> do not allow stub code in the kernel.

thanks for enlightening,

Regards

> regards,
> dan carpenter
>


-- 
Ozgur Kara
Linux Kernel Developer

ozgurk@ieee.org
