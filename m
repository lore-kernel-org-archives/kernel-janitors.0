Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32D9E7E657
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Sep 2023 18:44:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235472AbjIZSoy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 26 Sep 2023 14:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjIZSoy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Sep 2023 14:44:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A38011F
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Sep 2023 11:44:46 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C864C433C8;
        Tue, 26 Sep 2023 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695753885;
        bh=KG2sRyrAO/Zemo0Lf4waWvy+trM3E7P3N8Bf2Td0z9E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AUvW9oG/V5HXkG38frkAq6WJzect8Sgy3xpgqbzNCDcmQcWeKBskGWSS86bxX22C6
         pukD3Jz/wPvip4uK95+/ZcYWPuhGCFzsO0h5UQsaAE5LQ99akHuEfUuwky9s3lfPMl
         6+NRLwrVT3y1vdc8iiQ0/utVKY+RZE0eYG6aQq//AYNcT2jri5C48JKLn8rIdauOox
         fHe1VgYBkx+umMrpAJ+C7miVJRd2ZO8Foosapd1Tel1Ic3xLvzWGt56/JXn9nyfRof
         tKaglTkf6d88T5y/wHNpIhY9BQV9ttPlzNx+KpnHhkVvwfkLbWQcqcju691qJ1m7Y6
         MElvZMb99CogA==
Message-ID: <9670bbbe-e429-4a17-97a9-4d18c3ce907d@kernel.org>
Date:   Tue, 26 Sep 2023 21:44:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3 net] net: ethernet: ti: am65-cpsw: Fix error code in
 am65_cpsw_nuss_init_tx_chns()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <4c2073cc-e7ef-4f16-9655-1a46cfed9fe9@moroto.mountain>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <4c2073cc-e7ef-4f16-9655-1a46cfed9fe9@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 26/09/2023 17:04, Dan Carpenter wrote:
> This accidentally returns success, but it should return a negative error
> code.
> 
> Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>
