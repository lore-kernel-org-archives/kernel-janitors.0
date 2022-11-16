Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0C6C4332F
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Nov 2022 13:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbiKPNYB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 16 Nov 2022 08:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233429AbiKPNXr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Nov 2022 08:23:47 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8518FDC4;
        Wed, 16 Nov 2022 05:23:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD43661DD6;
        Wed, 16 Nov 2022 13:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0583C433D6;
        Wed, 16 Nov 2022 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668605025;
        bh=p+DJlB3s7cTLjFausQdOeYPjLX03jW5vrYZ/lglDEWE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BL/BzKAA6E6FvmPdLScU1ey74vJf8Te0mVM5gCPhSRxXoKvyXnc4inCPWLwT2usl7
         EyvPf7xcuoaiPPS8W6elQT8snx2hImomeCmfc1rWT8lapqtwoeiaNTrU7GRSV4hdNy
         Pwy3AeM+nO9KXeS7SeTQcl9G9h61nXDJvmcqWIJH0S9eLbexbxuaROhJ2LWRMJlhU5
         MtHlVrfeQviW7zZsjBB53Os/XpAVPYLXT0EdzhY+7noQaaaVBTADof0EHxVz5wRozG
         K4CNmTZUlzf6yftY+me2Yucs0PwPWbDmfrU7QNyR/eQLjA+ztH8S47TyPZxwPVm4qi
         H0EMaw0SAn03g==
Date:   Wed, 16 Nov 2022 15:23:40 +0200
From:   Leon Romanovsky <leon@kernel.org>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Denis Kirjanov <kda@linux-powerpc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next][V2]: sundance: remove unused variable cnt
Message-ID: <Y3TkXBYArRgIAhPE@unreal>
References: <20221115093137.144002-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115093137.144002-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 15, 2022 at 09:31:37AM +0000, Colin Ian King wrote:
> Variable cnt is just being incremented and it's never used
> anywhere else. The variable and the increment are redundant so
> remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> 
> V2: Use the correct net-next convention. I do hope I've got this correct,
>     apologies for being consistently incorrect in the past.

Almost :)
 [PATCH net-next][V2] -> [PATCH net-next V2]

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
