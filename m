Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC2CC433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 29 Apr 2022 14:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377752AbiD2Otg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 29 Apr 2022 10:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377828AbiD2Os4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 29 Apr 2022 10:48:56 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBA77E1CC
        for <kernel-janitors@vger.kernel.org>; Fri, 29 Apr 2022 07:45:36 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 6077B3200977;
        Fri, 29 Apr 2022 10:45:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 29 Apr 2022 10:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1651243534; x=
        1651329934; bh=m4Mix+xZ0LdIgRpgPju9F38NAOYS+36zubs6DlYrG3U=; b=t
        0tE6t1OzJOp2y+C9k8GoqRFShTkEGmj/49UvQjHYeMJxVThuNRm430iQot/mMpY5
        lc8wKwoHX2zzRzPxow7X99ZZdQEscWK1djTsTkTdSrtJKFnr9ybSpC343gFoQvmG
        YXT8txuScHEgZSh3glgNJ5IAYw1r3S+ciep+TEwjgrHH+ahwbDHToA6BaerrAmLZ
        SHDQTLlGDZ1o1L5ohWeekfl5rU5y7leXn5iCcvI4jMUBOQI8BM05gf/krgQB7GmX
        g7JrPcagw0PA1N5jKI/YD4gpSCr5V2S2zSPJBNNvzvn3ycSVrNKrwBAuGhI9X2Ck
        0i0gqLd4Hbp0MeorQDuzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1651243534; x=1651329934; bh=m4Mix+xZ0LdIg
        RpgPju9F38NAOYS+36zubs6DlYrG3U=; b=clLB1Tej7fW4TQQIyLaVFcTmZ4HYn
        HX3FkmQ585wTjqbg+d08DBaK40wjgJR3LtPy3sC85HmVaUxoQeGn0krpGhlL5xSM
        hgZJmmjwJHzULZA+g1aN75yl2vbh3HQGXUZU5kp3JhQR2yC6JPXv5In2eG+faPm8
        Pc16ZNe6HTryUZNXlibj9aNvNm4F9OFWwcYYvLaWNbr2rEIWjCNTcFgFgkBnxYN1
        9fR2b768ntlzjjBSL6//Q2b9qjjnU0o6h/tP1+HMJ4ALqk0vQaWi1/wHF/hOqLUo
        lPLYh+KAIm6VNcN2AO6Nd3kjRYMLab82qOQzjvFNAYp6p4gigVmsrXZOQ==
X-ME-Sender: <xms:DvprYr5kUmEmHwLGVbWpiqi1QktLz8pAYWFhFflEAsP-hUC6PD7Oxg>
    <xme:DvprYg61tWHICTg3yFmmYlSIMbGKqIYHfVUTKx0Au8qyn8eHboQFegqvbaOONL2W3
    C27hQe_tOTzqtyvONg>
X-ME-Received: <xmr:DvprYicDUd9wGZrIfaDycj4oDcJYjgLuotkBfpOVhQiZEpD9C4-gjtPQz8SQQEKnjsArwKq0ZXrE6tXgVsOnQ_XmvQtAIAhjBgMFjTY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
    udefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DvprYsLNKt0MzZMT9Dr2rQ8Puoll-qBkeQKoNfgbNsOYFNQx49PyTw>
    <xmx:DvprYvKrMccN04OPsP2pG02iGOFsGesaWv8nyc-z8yTSwey4Al5Mxg>
    <xmx:DvprYlw-oFAJNW-sKr6kprVqS_w8NbpRpu5pEA7LGsUbvrIy3KDUBA>
    <xmx:DvprYgXjdpYxvFVd9lkqyceUkPmwNN2CoPwOumV7NpWk5FM6x6Bc8w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 10:45:33 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <mripard@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Samuel Holland <samuel@sholland.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: (subset) [PATCH] drm/sun4i: dsi: delete unnecessary IS_ERR() checks
Date:   Fri, 29 Apr 2022 16:45:21 +0200
Message-Id: <165124351807.924095.4917503236588048711.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <YmqH71MtoGn2AXUg@kili>
References: <YmqH71MtoGn2AXUg@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 28 Apr 2022 15:26:23 +0300, Dan Carpenter wrote:
> The "dsi->bus_clk" pointer cannot be an error pointer at this point.
> The check is confusing and unnecessary.  Delete it.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
