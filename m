Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF67ECAAD5
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Sep 2022 06:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbiIHG5Y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Sep 2022 02:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiIHG5X (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Sep 2022 02:57:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F4C90C56
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Sep 2022 23:57:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1CDB561B7C
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Sep 2022 06:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FC6C433C1;
        Thu,  8 Sep 2022 06:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662620241;
        bh=RKj0p7+2DV/jN/iA6U4WYLQVoMCZshcyv2vDEmRBeAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pzlCI3AR14y4reXJ0jTJZ2rn5kWNEscL5/QYctNJYCYvmijtkfyM6OX9OMlQfkHkx
         u9CCf4liu5qODolVl6EIhLuqfkNVhsOnayE1Qt1opWUf2gnXqKBzPEV5XB5BGHYkfJ
         9p2yn8+BU8Db0gy/2EMO3Bl+r0Uzcrxnu7fhqKpjpa97emZdeQVNUxO1owEwl2HCEG
         uavSMmAL7Q2ckUKI/ZmORqVWqLDBVR9vj0niuISEBSwe91FwkIud2cThoaGBH5nkJI
         RNx82ugPhxUj03wXqjqJA0kZ79GDbbKllJrBSyCzJyjUKJQHgRZbTMFX/xQ2N5bX2E
         yB3t4aNVng5fA==
Date:   Thu, 8 Sep 2022 07:57:16 +0100
From:   Lee Jones <lee@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write
 functions
Message-ID: <YxmSTH5ETSC0D3Rp@google.com>
References: <Yv8ezribLQbq5ggv@kili>
 <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
 <20220822125705.GD2695@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220822125705.GD2695@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 22 Aug 2022, Dan Carpenter wrote:

> On Fri, Aug 19, 2022 at 09:27:13AM +0300, Andy Shevchenko wrote:
> > On Fri, Aug 19, 2022 at 8:25 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > It looks like there are a potential out of bounds accesses in the
> > > read/write() functions.  Also can "len" be negative?  Let's check for
> > > that too.
> > 
> > ...
> > 
> > > Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")
> > 
> > > From static analysis.  This code is obviously harmless however it may
> > > not be required.  The regmap range checking is slightly complicated and
> > > I haven't remembered where all it's done.
> > 
> > Exactement! I do not think this Fixes anything, I believe you are
> > adding a dead code. So, can you do deeper analysis?
> 
> I spent a long time looking at this code before I sent it and I've
> spent a long time looking at it today.
> 
> Smatch said that these values come from the user, but now it seems
> less clear to me and I have rebuilt the DB so I don't have the same
> information I was looking at earlier.
> 
> So I can't see if these come from the user but neither can I find any
> bounds checking.

What's the consensus please?

-- 
Lee Jones [李琼斯]
