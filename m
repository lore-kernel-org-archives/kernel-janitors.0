Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B22E810D1
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 11:29:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbjI0L3g (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 07:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjI0L3g (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 07:29:36 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1577F180;
        Wed, 27 Sep 2023 04:29:33 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38RBTKIp028294;
        Wed, 27 Sep 2023 06:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1695814160;
        bh=/uygrMTt+sS6fKj6H6SonG1Pv9RkLKarrN56GecG968=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=Oodd9r3X4XG3ypLQwNcaz2MwI031FYdcqKdG33Xz8OQEaYJ5Rin3MxO6v1Z7XeCdi
         RjCwWHrfXy/dXMFJs8hyKV3jynq6R9W1dJzbgWJ6ZMKGtbr50riRdoiylGGjerkY2x
         V7KfZYRfNzpIfFpkorUwV1Anhl0M1PHALuuO0BlE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38RBTKh6009677
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 Sep 2023 06:29:20 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 27
 Sep 2023 06:29:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 27 Sep 2023 06:29:20 -0500
Received: from [10.250.135.44] (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38RBTDeg067437;
        Wed, 27 Sep 2023 06:29:14 -0500
Message-ID: <20c88067-17f6-097b-be51-b6bf82cba619@ti.com>
Date:   Wed, 27 Sep 2023 14:29:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/3 net] net: ti: icssg-prueth: Fix signedness bug in
 prueth_init_tx_chns()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        MD Danish Anwar <danishanwar@ti.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "Vignesh Raghavendra" <vigneshr@ti.com>, <netdev@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <34770474-0345-4223-9c11-9039b74d03b4@moroto.mountain>
From:   Roger Quadros <rogerq@ti.com>
In-Reply-To: <34770474-0345-4223-9c11-9039b74d03b4@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 26.9.2023 17.05, Dan Carpenter wrote:
> The "tx_chn->irq" variable is unsigned so the error checking does not
> work correctly.
> 
> Fixes: 128d5874c082 ("net: ti: icssg-prueth: Add ICSSG ethernet driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>
