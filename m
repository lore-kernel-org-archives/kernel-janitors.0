Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86954C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 09:17:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F15E611C2
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 09:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235760AbhEQJTL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 May 2021 05:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233552AbhEQJTL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 May 2021 05:19:11 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5355CC061344;
        Mon, 17 May 2021 02:13:27 -0700 (PDT)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <johannes@sipsolutions.net>)
        id 1liZIn-00AGiS-Hq; Mon, 17 May 2021 11:12:41 +0200
Message-ID: <42f98bf9dd5919a0bb2184360b3181f68d303fd4.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2 net-next] alx: unlock on error in
 alx_set_pauseparam()
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Chris Snook <chris.snook@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Mon, 17 May 2021 11:12:40 +0200
In-Reply-To: <YKIwPe2/k1R+PTWU@mwanda>
References: <YKIwPe2/k1R+PTWU@mwanda>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 2021-05-17 at 11:58 +0300, Dan Carpenter wrote:
> We need to drop the lock before returning on this error path.

Haha, how many locking errors can I have in a single patch :(

Sorry, and thanks for all the fixes!

johannes

