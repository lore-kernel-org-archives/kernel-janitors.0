Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A87C47082
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 May 2021 07:56:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E37460FE9
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 May 2021 07:56:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhEaH5l (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 May 2021 03:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbhEaH5k (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 May 2021 03:57:40 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19D6C061574;
        Mon, 31 May 2021 00:56:00 -0700 (PDT)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
        (envelope-from <martin@viti.kaiser.cx>)
        id 1lncm7-0003sc-UW; Mon, 31 May 2021 09:55:51 +0200
Date:   Mon, 31 May 2021 09:55:51 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8188eu: remove dummy wext handlers
Message-ID: <20210531075551.xjlr74wjxhxsrvj3@viti.kaiser.cx>
References: <20210529121346.8422-1-martin@kaiser.cx>
 <20210529121346.8422-2-martin@kaiser.cx>
 <20210531060223.GV1955@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531060223.GV1955@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan and all,

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> The patch is good, but next time, just put all this commentary in the
> commit message.

I was asking myself if this "expression of my doubts" should go into the
commit message or not.

Thanks for the feedback.

   Martin
