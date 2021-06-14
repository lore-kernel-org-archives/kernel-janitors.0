Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA31C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Jun 2021 14:58:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83D6261206
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Jun 2021 14:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbhFNPAe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 14 Jun 2021 11:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232919AbhFNPAe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Jun 2021 11:00:34 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124A0C061574;
        Mon, 14 Jun 2021 07:58:31 -0700 (PDT)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
        (envelope-from <martin@viti.kaiser.cx>)
        id 1lso2g-0004Fk-R4; Mon, 14 Jun 2021 16:58:22 +0200
Date:   Mon, 14 Jun 2021 16:58:22 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] staging: rtl8188eu: remove RT_TRACE and DBG_88E
 prints from usb_intf.c
Message-ID: <20210614145822.c3dk3e7p44ypglk7@viti.kaiser.cx>
References: <20210612180019.20387-1-martin@kaiser.cx>
 <20210612180019.20387-6-martin@kaiser.cx>
 <20210614113439.GM1955@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614113439.GM1955@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> On Sat, Jun 12, 2021 at 08:00:19PM +0200, Martin Kaiser wrote:
> > These prints are disabled by default.


> Not, just by default.  There is literally no way to enable them.

> > Replace the print after dev_alloc_name with proper error handling.


> Ugh...  :(  This part really needs to be done first and in a separate
> patch.  You can delete the RT_TRACE() from that one call site since it's
> on the same line but the subject of the patch needs to say something
> like "check for allocation failure".  It can't be "remove RT_TRACE and
> DBG_88E prints".

ok, understood. I'll split this in two (and fix it, I forgot a
semicolon).

Thanks,

   Martin
