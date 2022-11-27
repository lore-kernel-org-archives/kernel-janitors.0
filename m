Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0E8C4332F
	for <kernel-janitors@archiver.kernel.org>; Sun, 27 Nov 2022 14:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiK0O2u (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 27 Nov 2022 09:28:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiK0O2u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 27 Nov 2022 09:28:50 -0500
X-Greylist: delayed 1301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 27 Nov 2022 06:28:48 PST
Received: from kylie.crudebyte.com (kylie.crudebyte.com [5.189.157.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6446E637F;
        Sun, 27 Nov 2022 06:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
        Content-ID:Content-Description;
        bh=wtGluwXH/2Qxz5BbrxLDhKs0b/USvsd3CSaSU2mXw24=; b=oiEkTjE2+hjPKah7Tw6noMkEHn
        wMlebCwUurbqU01UVli/LPitljmkfeFzMwoHDbK9F9ljdLm4DxYgnWmC1jxM9lduJQsOSLSvBC2M7
        KPAMa/50bmPB5USua/X2Go9MlBAFMNf09Z0WGGxZu1G6r5v6kVc2Ry/DC/8avDu5YTAWQzT2OI8zY
        x0O5vwJ5J4zQNkQa9eb5V0x9sXT8+XYO6M1t6M+vb9UbosZqzLRc0q+NE2cR9IR8btKs3DXfpclRZ
        As4ZPo7+LvPK91vpvBMU1Dg8fsX4+75aBQEVuCtfOGKLV4FbUebsZHRgeEbKkvE3wzKxo69nzCMwW
        lrodwc1SrS8Z6hMmrqzj6msjIBpdhf3hgNr80Rmryfl32lJX3c+jp9c8VOVn8XlBfti5TvgazfJQs
        bSJyuvDrpG9eWMUxR1hCbK9w//Mms7mUSqpUWTra2iL5IAGOL7dqjPU2AYLp5FXAclA2zpSIX2EZL
        nvvfKe3q+NZbPUEkbEm0og3vvkb1ZViQzhAOOIdehsTREYkYO9IvtfMsXd0gV9cbNRZocyO3Cmzdv
        nvhcUT3NqxBFBS7bmqPS2wIi7vlMakqqJgsraltikB/ji3fXQ2YDZoytEsnw+87strsohIC6qclPh
        PqTir6iG7pv0WmNJEiin5h4wnfFeqhMbgHoUzGUFo=;
From:   Christian Schoenebeck <linux_oss@crudebyte.com>
To:     Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        v9fs-developer@lists.sourceforge.net
Subject: Re: [PATCH] 9p: Remove some unneeded #include
Date:   Sun, 27 Nov 2022 15:07:00 +0100
Message-ID: <16697035.zmtlf8e6Si@silver>
In-Reply-To: <3d1e0ed9714eaee7e18d9f5b0b4bfa49b00b286d.1669553950.git.christophe.jaillet@wanadoo.fr>
References: <3d1e0ed9714eaee7e18d9f5b0b4bfa49b00b286d.1669553950.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sunday, November 27, 2022 1:59:25 PM CET Christophe JAILLET wrote:
> The 9p fs does not use IDR or IDA functionalities. So there is no point in
> including <linux/idr.h>.
> Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Right, it's used by net/9p/client.c only. Probably some more files in net/9p
could therefore be deflated as well. Anyway:

Reviewed-by: Christian Schoenebeck <linux_oss@crudebyte.com>



