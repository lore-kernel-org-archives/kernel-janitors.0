Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6721AC88CB4
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jun 2023 14:03:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbjFLODm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jun 2023 10:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233523AbjFLODl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 10:03:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1465F10C2
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 07:03:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C5BE6286C
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 14:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E364EC433D2;
        Mon, 12 Jun 2023 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686578619;
        bh=m2x4W7kPo9/C2W8ESj9pCncyc9QUnweaZx9AdOT6u7g=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sWM8rh3aFqAyJET1RR/9mSGir5kUAyhAo9xVP7ZvKTbprGEwtXaX0YOPJj5+urCii
         A8XjvKh7l+dX/pcOa0Qsb0NLAggXzMWc24gM7p07DEO2ECrFMrNqTlBVvBDW/ig7fN
         wrAALs8oY0DfUT5kUvwHICmUks2OtI7wEj6cgNY6ulKCxb1kqfnIxkchCUVDobSiaF
         FGe7bDKleGkFC+0JZSBNIAjyvU3Rk1lIxEl4z8Ui1h9y8zujL+6brNs3v8gEQ1PrcK
         jNsvxuz+wav7Pf86E2X2n7QNAr7Lnx/ONP3XktUCdDRyzXvwrnGCP6qsYF4/KNnpBt
         4h2rr1iNwDBeg==
Message-ID: <a166c00d-d759-b905-5bfc-db61f58b7663@kernel.org>
Date:   Mon, 12 Jun 2023 17:03:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpsw: Call of_node_put() on
 error path
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <e3012f0c-1621-40e6-bf7d-03c276f6e07f@kili.mountain>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <e3012f0c-1621-40e6-bf7d-03c276f6e07f@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 12/06/2023 10:18, Dan Carpenter wrote:
> This code returns directly but it should instead call of_node_put()
> to drop some reference counts.
> 
> Fixes: dab2b265dd23 ("net: ethernet: ti: am65-cpsw: Add support for SERDES configuration")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>
