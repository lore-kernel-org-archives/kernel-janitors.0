Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754E0C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  8 Jul 2022 11:46:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238005AbiGHLqQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 8 Jul 2022 07:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237731AbiGHLqP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Jul 2022 07:46:15 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFDA7D1F3
        for <kernel-janitors@vger.kernel.org>; Fri,  8 Jul 2022 04:46:13 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 936BF320091A;
        Fri,  8 Jul 2022 07:46:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 08 Jul 2022 07:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1657280769; x=
        1657367169; bh=uJhQFXinp9Lni5IJ8sAkt+I0l3m5bC1LyqjjXBVNxNo=; b=q
        W4XPt0es32MpZAv91q6hOrh1hhjIganhoddKhWU4dvAqgcoS5CUOW46x+tkyi8Ch
        q+BqC5e+Tl21Zk/ZN3spR3WP1DqxfgdmM/2W/3D9kyX9F6zJ9Mb++2Liql29HuSu
        +ID+7A4/febGPfT6zphl0TsrlDanl4YCkLVTT8Ng1ed560XKInSxVBhny9fjuWL7
        hG8w5sOTSCd0F4gA5j2Jeq75afnAfZusqK1AfUDG0Lv8mP1WUJpa3x6q7bTXYE5B
        LtjgSVbILnWx72qSqr5PAKipCkxK/yN14RnlFiLJw1ocL+7lY2j/6/mnu0xsVaEo
        LqvdetnENL4/1gO78ubrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657280769; x=
        1657367169; bh=uJhQFXinp9Lni5IJ8sAkt+I0l3m5bC1LyqjjXBVNxNo=; b=L
        dR6UGB9aHfgTI0oSjqOUdVyOPCtHdUZ1uH7hwp0uCTatEXlEF5qofSZJUTrojgrT
        NWuOMTrflEYwr5iX7X1/6nyFXVBhDBmrgg0s6Ti8jRfccyxJnSRbXdUJFUtpDeHG
        3yiFyKsLMSYV4JeURo3QgfHVw6nqb58YQ7geR9Qn5MgSviXqfYqGzLR3wEKIcWx7
        W4OlT82sccrg+PGCLVivzKytl8/UknDzaoazk1Z3qzfbi/ogoU2gejukfOXMYp56
        w8E/0Pfk9M0NT3YG1kaE+cGd5t6d8HckGa125cWHDPCyolflZwxLt862+bkmjwWx
        mrbWd90gG/v5UX4XDZi2g==
X-ME-Sender: <xms:ABnIYsD3FaHl1YxLCgyVbAG4apzrzOXhNTvbWq2NZrfUyHtd9Vm1Gg>
    <xme:ABnIYugY53-KVz8B4XVnp3cT8W4cLntionQeeGUpGRRxEd9v8UmDuThxMnvkoGurQ
    U0xNVvWthbeQmHNrqM>
X-ME-Received: <xmr:ABnIYvliBjNSbKmhsUQvsPJHKxbqutIdkOXWwHwUC-Ee8S8lZnNbNdCKAiN7KrluKxpfhGUFUQ8NKu_30w2QYlt5TNH032t-HuF71mM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
    ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
    tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeuieeggffhffffieefheduie
    euvdetgeeufeffvefgtedvffehheekffevudefieenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ABnIYixGE-dxeDBMqAdu5G1P_JcREGz1ZPbuVX8OiHC3Z2y1el8qzQ>
    <xmx:ABnIYhQtFMmmknZmKcXHWAhXBq9IsJUelJKZXu5naDBYeBFFZVfdAQ>
    <xmx:ABnIYtbFbSUFmvLyfGyvx_RsXvAshfpJcRYIXMp8pH0EC4HDLNgP1A>
    <xmx:ARnIYmIs8LN1sx4784WF6myb-jYKmz7J3NUwsUZI3Erx4UL257Feuw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 07:46:07 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com,
        dan.carpenter@oracle.com
Cc:     Maxime Ripard <maxime@cerno.tech>, narmstrong@baylibre.com,
        airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
        jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
        daniel@ffwll.ch, kernel-janitors@vger.kernel.org
Subject: Re: (subset) [PATCH v2] drm/bridge: Avoid uninitialized variable warning
Date:   Fri,  8 Jul 2022 13:46:03 +0200
Message-Id: <165728076204.379115.16118851103019344227.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <YrrIs3hoGcPVmXc5@kili>
References: <YrrIs3hoGcPVmXc5@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 4 Jul 2022 13:55:40 +0300, Dan Carpenter wrote:
> This code works, but technically it uses "num_in_bus_fmts" before it
> has been initialized so it leads to static checker warnings and probably
> KMEMsan warnings at run time.  Initialize the variable to zero to
> silence the warning.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
