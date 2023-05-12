Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687CFC77B75
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 May 2023 13:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241096AbjELNoZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 May 2023 09:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240443AbjELNoY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 May 2023 09:44:24 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3A5132B2
        for <kernel-janitors@vger.kernel.org>; Fri, 12 May 2023 06:44:23 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 58C605C02CC;
        Fri, 12 May 2023 09:44:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 12 May 2023 09:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=cc:cc:content-type:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1683899060; x=
        1683985460; bh=qkFj2mVhoUMnv8Ir3jUAh/NYj5vyzTkP0+jLwf8Mh4Q=; b=M
        a07HyZ/Nb0GoAjn9/d6NJcOLBLFJoiKfFm3zDCXXcirNfWnVk0zVaSBPu0J1pg2y
        ZvLGFQIp8LygLEaKTctgC3xpiik25e769SZ0vsYwk1jomF2ii09B7cb3rGWz2xgf
        MRptWwo6d0gbRRTlOV46LbJU13I6dFGzf91z9tLIpbxLboqfheqHYBobkYs1rqGv
        d8OJjhwPVByrF9iTr38pEWtJ3IAXXW58KCgzpDjbRPhRV/eW6JLPUYTOMZXsrxsl
        KGW7Q6TrLAv93Rk06e3Rh0KcsJEmJpT4uzOwBMtyT53fqv70/HskI5QEvu5iwdOn
        eYbjzPfW71rsNX9fnrjBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1683899060; x=1683985460; bh=qkFj2mVhoUMnv
        8Ir3jUAh/NYj5vyzTkP0+jLwf8Mh4Q=; b=Bdu5TsTJabJXzIL1PBPnVgZ49G2ew
        MrPFULoq91h821wUTDbY/A+APYZHivmEgDHovR+n03yTvoR0mJHRcBUqRuPJj7QD
        clbaNOK/ihBHUGjeoylm/W0y+xUIkqqF9sM1tIi9nhixTya0c+GQPSOjNPKWeX9G
        wd/4MgErX7McTyQQgryN3JILN9yDpFw2/hGfXcgzTZ576erw2LLvaAeKit6RMxHe
        sPhHDj82//n9GiDbfRJcmyL5s/rsxc5v5YWXQitlxryd2CsKTgs0/1surzLK8Fd5
        9fCEYOjCxXkHsh96AKIhnsIE9HnseSDz9thQqjf4+/inC1wjBTtFmb5xA==
X-ME-Sender: <xms:s0JeZB5-Gs6ZmMUnzpWGo6LCzMDydA9yo4KwQynYf4d6-TUFsWAaNA>
    <xme:s0JeZO7CNB42R-CbXE1zkWFX6v0pzTuwP1nRyxMof3pFDs8CYsd4qRFsyahW1qCd4
    NuGJVq2KUwSPDcBlwY>
X-ME-Received: <xmr:s0JeZIcrYVIrOGemRvix3Yjq674UEOIi6oyPF8SSgV_78D6gRAliiHM7w2OT4QhylivukiMCIYlzFEfMhu9j8SlQzik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehtddgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:s0JeZKI-0tc6Plxurzt3Y8xXFEGH3Nwbt2RQKRrrO_1Kp1uKNxKKMg>
    <xmx:s0JeZFL7ZT7XJ3hBL50hbUFGNqqRNL7rCzCKdCrjbLlyfNFOhDlnUw>
    <xmx:s0JeZDxKtn0m7RaM7caKPLNgbIkTG_uPs7ypZELvL9DWcFFkoorVvg>
    <xmx:tEJeZDgOKT9lFQuc7JgaBUirlB5bpF_t0KUhbMiHiojzDduScBNvSA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 May 2023 09:44:17 -0400 (EDT)
Date:   Fri, 12 May 2023 22:44:14 +0900
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-digi00x: prevent potential use after free
Message-ID: <20230512134414.GA913159@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
References: <c224cbd5-d9e2-4cd4-9bcf-2138eb1d35c6@kili.mountain>
 <873542aro1.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <873542aro1.wl-tiwai@suse.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Fri, May 12, 2023 at 10:18:54AM +0200, Takashi Iwai wrote:
> On Tue, 09 May 2023 11:07:11 +0200,
> Dan Carpenter wrote:
> > 
> > This code was supposed to return an error code if init_stream()
> > failed, but it instead freed dg00x->rx_stream and returned success.
> > This potentially leads to a use after free.
> > 
> > Fixes: 9a08067ec318 ("ALSA: firewire-digi00x: support AMDTP domain")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Thanks, applied now.

I overlooked the patch. It looks good to me as well.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
