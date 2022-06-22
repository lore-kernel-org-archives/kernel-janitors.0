Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF81CCA47D
	for <kernel-janitors@archiver.kernel.org>; Wed, 22 Jun 2022 14:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354289AbiFVOm5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 22 Jun 2022 10:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358469AbiFVOmz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Jun 2022 10:42:55 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB76B9
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Jun 2022 07:42:51 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 222BC3200564;
        Wed, 22 Jun 2022 10:42:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 22 Jun 2022 10:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1655908967; x=
        1655995367; bh=cbLMw3N8GUrZQk0a1DLFYHdSrm5fnAWrW3eMjhJA0ZU=; b=N
        EbPZqWc+/YOtdNgqEU2/o06trWoeX3GH5UgC7MPRYfixA/LA8Gs0svk9mz4bUBoD
        KeW3nI7S+04K1++hC7rWtmu05Y9Y9kRHLuHC3W9ADAwtkHqd192iJQ6RlGptceeL
        JZoUph17dGefcacsnHUOfS5SvBVeya1VovWaAzMpISG0CFe+Eaj/hctPdzMNbyWk
        5SzIIL8LN4FHnHcWs0xobBkihcPSsDi44jgfUQkdJbO7bD1iAh97qjnejhxdIG/D
        gQDvMkedyjb243hKBH/03g1jvReWUEktlPp8j0BEIfgaM2QiGVvmq/UDu16Av5JR
        aeD7rUm74SIngtU5tWJlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655908967; x=
        1655995367; bh=cbLMw3N8GUrZQk0a1DLFYHdSrm5fnAWrW3eMjhJA0ZU=; b=V
        idgRKlHsldbVRGTvbxsLau/6nptiCvfEanjLUmw6fgIovoUzfzNUs3OjC27HouXs
        TfzkR+wMhlN6CDSqCQjluHTEF+ZKuGMBb5yz+DE3uNG+SCDRTAdifEAvvxqddi+z
        3CutDezfKFVHD2iLZcL1PuGKQSdbQrJS8Zwr6I0tODq+fJLMuX5wq2Ck1htPmCKH
        Or9pqclIR3cVkx3wDEaYWhWD+xCpJvIoIhP7VPKKYvc8v2b1c1z27j7OrVzAMfv+
        T3YBT7Wgq3KPo1vYpqXS8oHDV15B8+2pP+udQgSZTrTyn7oydWFcNTwwjfWcpj9e
        djB17nmHrWa5FYlSvFbig==
X-ME-Sender: <xms:ZyqzYjVEN4rc_Zd3rnCx4VRbjz8mzpl6RLRB6kojnmOcYtgDQWKJYw>
    <xme:ZyqzYrnEoZ_Y4Fung-N9c_4LMx1p_4gXUpkSi8bou5m7raZ2BTgY4X_TlBXd_8XZq
    IRcR-o42_ueROXCOxM>
X-ME-Received: <xmr:ZyqzYvZQiw4RwtZBrhdCSN5oyGBkVrGpb1CKm2HSOEJn1yEMarvPF9cUusHW-T3tyEQCEUM0RusLB_qHlTDNMfpt2z6Wb3A3Fk2t9HI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
    ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
    tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeuieeggffhffffieefheduie
    euvdetgeeufeffvefgtedvffehheekffevudefieenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZyqzYuXouZfCVX8e98z0h4-Ald9twU_WUKOogzj4B70fyuMgq6zbSg>
    <xmx:ZyqzYtmrxSYPUFmK7uuUx3WtWR38rz99x6yfS7pRrRZgEnA9dFCsPQ>
    <xmx:ZyqzYre9gTUSDRjQoQrpPl5Q7d-o5tvwjYidh6ANlSg3R9su_DOxTw>
    <xmx:ZyqzYjXv2UHiX-F7pxuhktgeVef749z5h80CS8lyvhUSjP4HYXTJ9Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:42:46 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     dan.carpenter@oracle.com, mripard@kernel.org, emma@anholt.net
Cc:     Maxime Ripard <maxime@cerno.tech>, daniel@ffwll.ch,
        kernel-janitors@vger.kernel.org, mwen@igalia.com, airlied@linux.ie,
        dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH] drm/vc4: fix error code in vc4_check_tex_size()
Date:   Wed, 22 Jun 2022 16:42:43 +0200
Message-Id: <165590895783.604863.3284375984657879373.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <YrMKK89/viQiaiAg@kili>
References: <YrMKK89/viQiaiAg@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 22 Jun 2022 15:25:15 +0300, Dan Carpenter wrote:
> The vc4_check_tex_size() function is supposed to return false on error
> but this error path accidentally returns -ENODEV (which means true).
> 
> 

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
