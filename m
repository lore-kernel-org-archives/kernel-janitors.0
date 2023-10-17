Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20885CDB474
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Oct 2023 09:10:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234943AbjJQJKM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 Oct 2023 05:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234868AbjJQJJw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Oct 2023 05:09:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4677C191;
        Tue, 17 Oct 2023 02:09:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E005CC43395;
        Tue, 17 Oct 2023 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697533766;
        bh=0J00yBt6B+0GI95PaNrYuW82ColdTJxLKzN75HBOfTI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M93MFRgowGo0xLvNH6mhY5IHz2AkL7yxlNmuE7f59h0T89aSwLaRh0fll8U2VvMMq
         uYt3SmBdvdMxZKlHcPYonQHU/Lk7OQTer9zwjggGGYnijGlTHRRzgHKzu3ikmbjsuc
         igoHi5ZtXAC/Dz1s0Irue5hYTRz+YBVW+/Otljrg7SV4207jGrwNcvu0rdLTOEkncr
         OnAroEb0QT8ruQQ007OAEJQe05hskjvquJ1X7X2Llt7KGT/GkvGWmbBFJEz466qBQE
         apkoWKiptypCbWpjR0rEg26YlOozMELZfxcFeRAlJJ3v0VrBCmXpClLfXUIy1kMkdb
         63Cmh90bJvkdw==
Date:   Tue, 17 Oct 2023 11:09:22 +0200
From:   Simon Horman <horms@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Pravin B Shelar <pshelar@ovn.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, dev@openvswitch.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [ovs-dev] [PATCH v2 1/2] net: openvswitch: Use struct_size()
Message-ID: <20231017090922.GQ1751252@kernel.org>
References: <e5122b4ff878cbf3ed72653a395ad5c4da04dc1e.1697264974.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5122b4ff878cbf3ed72653a395ad5c4da04dc1e.1697264974.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Oct 14, 2023 at 08:34:52AM +0200, Christophe JAILLET wrote:
> Use struct_size() instead of hand writing it.
> This is less verbose and more robust.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: No change
> 
> v1: https://lore.kernel.org/all/8be59c9e06fca8eff2f264abb4c2f74db0b19a9e.1696156198.git.christophe.jaillet@wanadoo.fr/
> 
> 
> This is IMHO more readable, even if not perfect.
> 
> However (untested):
> +	new = kzalloc(size_add(struct_size(new, masks, size),
> 			       size_mul(sizeof(u64), size)), GFP_KERNEL);
> looks completely unreadable to me.

Thanks, this looks correct (and more readable) to me.

Reviewed-by: Simon Horman <horms@kernel.org>
