Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA59E81DE0
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Oct 2023 11:21:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjJFLV2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Oct 2023 07:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbjJFLVK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Oct 2023 07:21:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB6ACA
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Oct 2023 04:21:09 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881E1C433C7;
        Fri,  6 Oct 2023 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696591268;
        bh=2OvrbOVd1DKguidAQ5wXL9nm274STWXog0it8L1OjsM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GdZZwAQSgZBHWp1jTnfdzwFBAtEaTGAn8O2qY7csoymxukv1i+x6bVX714q6IREqu
         CEl0BDx9ADZFQ4hPKZbF7j6jaMQEN9IGE2L2Scvto9fcflXDe0ly/ULA8TZOPHcWVW
         USV0yQ/MPTbYN40TNv6D6v3Ox6msODB4Fw6AJpaU4YK+AmuVDQEnZlwOXSpCS+pcRj
         Mkn5eUhg/LMAUYNirlKoiX4QeeU125ckl/GfElank9zcVUNUPA0oXi9psoL5RNU+J7
         QLuZYVdl0crucpwbB3AHsZXUqqHovYkTP8lOhruoPURrj4mpcAeXbq33Ef5oeZPLt6
         pJKSvTHkYQVkA==
Date:   Fri, 6 Oct 2023 13:21:04 +0200
From:   Simon Horman <horms@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jinjie Ruan <ruanjinjie@huawei.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] ixgbe: fix end of loop test in
 ixgbe_set_vf_macvlan()
Message-ID: <ZR/toAqmRnTWljdy@kernel.org>
References: <4d61f086-c7b4-4762-b025-0ba5df08968b@moroto.mountain>
 <34603f41-1d51-48df-9bca-a28fd5b27a53@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34603f41-1d51-48df-9bca-a28fd5b27a53@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 05, 2023 at 04:58:01PM +0300, Dan Carpenter wrote:
> The list iterator in a list_for_each_entry() loop can never be NULL.
> If the loop exits without hitting a break then the iterator points
> to an offset off the list head and dereferencing it is an out of
> bounds access.
> 
> Before we transitioned to using list_for_each_entry() loops, then
> it was possible for "entry" to be NULL and the comments mention
> this.  I have updated the comments to match the new code.
> 
> Fixes: c1fec890458a ("ethernet/intel: Use list_for_each_entry() helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Simon Horman <horms@kernel.org>

