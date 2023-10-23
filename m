Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816A4C001E0
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 16:52:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjJWQwk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 12:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjJWQwi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 12:52:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC312DB;
        Mon, 23 Oct 2023 09:52:36 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA43DC433C8;
        Mon, 23 Oct 2023 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698079956;
        bh=jQgUixbQL8W4wAwTjcJl3cwhkO3yCkXNSDqf574oSw4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KBG7jWc4h4+fJDaiS4Q/CaPIup2hO13Tne4/anTf6UAPe6fxoRMMivAn2M6uJKvgy
         UrF4/gVI4IKFQbsAjygYKrjiUsEO9xHDnPLTl+cpgcYVDVk06QXpyak5mpqkBqoJU8
         GMx+vshWWycWKcQU2nt0uL1VRjF83xSANNNOjYo8TM16Yn3Ra7K7URTRSIaWTUMv7O
         3MkHeReIqsYdpYLmdD5PSyY4Uwske+NxTwOF2+KalNpMLM8R4UHrVahaxS2uEKIz3+
         XpoEBCZQSyHPgDicSnvGFJC/bgMAOTi9Asxx8J2JAT0TWqOBe2HQaM+d8HdcJfJ3a/
         lYe83bQx8Gi+w==
Date:   Mon, 23 Oct 2023 17:52:14 +0100
From:   Simon Horman <horms@kernel.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, intel-wired-lan@lists.osuosl.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] igb: e1000_82575: add an error code check in
 igb_set_d0_lplu_state_82575
Message-ID: <20231023165214.GX2100445@kernel.org>
References: <20231020092430.209765-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020092430.209765-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 20, 2023 at 05:24:31PM +0800, Su Hui wrote:
> igb_set_d0_lplu_state_82575() check all phy->ops.read_reg()'s return value
> except this one, just fix this.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Simon Horman <horms@kernel.org>

