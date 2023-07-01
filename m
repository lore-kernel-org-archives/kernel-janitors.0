Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D17EB64DC
	for <kernel-janitors@archiver.kernel.org>; Sat,  1 Jul 2023 15:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjGAPAv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 1 Jul 2023 11:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjGAPAu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 1 Jul 2023 11:00:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4617A35B3;
        Sat,  1 Jul 2023 08:00:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA37160AB3;
        Sat,  1 Jul 2023 15:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA57FC433C7;
        Sat,  1 Jul 2023 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688223649;
        bh=+CATQ94X96pEsyvLLOgVuj1lXomvGeVeEj/5+G0He70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IugKfnLCUmen9tyhpHqp7khuvKjnd4QiZTBtTs6YmpQA7x/ibTk6VaY4+nC6wiqYQ
         ehoa2e0ol6Lyt/ame8kyPwlJzjF9gk4aD65wv3JlAY5qtAyYsOcR9hwvZicds7VymN
         vgW00+0+EuaM+ZFzPGpWgIlIT2UTayLbAZ1WHjy8=
Date:   Sat, 1 Jul 2023 17:00:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Franziska =?iso-8859-1?Q?N=E4pelt?= 
        <franziska.naepelt@googlemail.com>, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Emily Peri <eperi1024@gmail.com>,
        Guo Zihua <guozihua@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kang Minchul <tegongkang@gmail.com>,
        Philipp Hortmann <philipp.g.hortmann@gmail.com>,
        Veerendranath Jakkam <quic_vjakkam@quicinc.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: Fix space issues
Message-ID: <2023070123-unburned-worsening-0713@gregkh>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jul 01, 2023 at 04:43:09PM +0200, Markus Elfring wrote:
> You should not put only your own email address into the field “To”.
> Please reconsider the distribution of addresses between message header fields once more.

Please do not comment on staging driver changes anymore, it is not
helpful to anyone involved.

greg k-h
