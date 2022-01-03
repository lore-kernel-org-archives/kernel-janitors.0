Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346EFC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Jan 2022 10:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbiACKas (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jan 2022 05:30:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiACKas (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jan 2022 05:30:48 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE07C061761
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jan 2022 02:30:47 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id t187so15538687pfb.11
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jan 2022 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
        b=K5BEbt9OjKO+nuqxpvzbIOlXKc6txbVTj2xfbbvgeXff1lHQfcdfbFdinIBNEq0EyO
         Y1aCWLAj4I6N5aIbVrp02f36dabPmFWQ8BiKUWjxqHdsE1oXmAmDB33rNVwT2RaiAGS2
         nDMYYHPmDL4PfdBErgwWs8EHct2Z3Z+uDPY9KZ/+H+TJncxI2Pexcrtxgj/DbqOXEIVt
         PCegKTkSznNwgTdolMRZLUIKw/hxyb2wMSN8XWJT8egb0H8fLooQPDX5yVhfIahzMBJa
         23cSUeyaczkJ+xdjSYMP8Rzg70cKqDcxOZKBvM2STQF2+CH+UcTBs3UsOswcrji9OpBm
         hKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
        b=x5zFahcHPJGPhWTkzQGzbze6gsXPRWw2dN5yY//lWyCA8szsWVkAh8Y+BHSobgYDXP
         Ei1f6At4f5mq+VoznzQZrIiHdEGJg2nT4xeDJ/i93oX8oG57NUKgIY0ixiBvgjoGFu4E
         F5nteUwR6sv/4IiFfApjTJx5+JrSF4JUP5NAiIj5GMRBhs2sIgb136DVuQIfW7E3ROw9
         fWRAtXzYomZ0dd9b5acKVv3P+l2JjbeSD36VE0ziHgVgoU7RppXz/99PS+PK+CC4B/fD
         gbk1vG2FHPrk9S3EywGLqd0GUPVlVvM/6hZIdpcMQeDhBBxghyvgJC9rexXbn0tvW33S
         5EHg==
X-Gm-Message-State: AOAM5305pA/TQ0Ene1d1tirFF5g88YdXNlu91KyjbXcFkDR4sjHxjgbS
        umqzTim+rQXOO3F7G43Q3ZBtMCjdtl7tOdq0Fq+GFQ==
X-Google-Smtp-Source: ABdhPJzjmfkMpGxFmUpkFi1mKbOuAv2LnaShqmU2K2ivWzs/UE9RKuPtNoD834Rh8/Elsaluwf7Y0D03nF5Me2CLMTg=
X-Received: by 2002:a63:6d3:: with SMTP id 202mr38562627pgg.324.1641205846920;
 Mon, 03 Jan 2022 02:30:46 -0800 (PST)
MIME-Version: 1.0
References: <4bc21aed4b60d3d5ac4b28d8b07a6fdd8da6a536.1640768126.git.christophe.jaillet@wanadoo.fr>
 <YcyIidlnW4Sh6CGm@pendragon.ideasonboard.com>
In-Reply-To: <YcyIidlnW4Sh6CGm@pendragon.ideasonboard.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 3 Jan 2022 11:30:35 +0100
Message-ID: <CAG3jFys8i+D32BSmsLnSG2ArP+wwf-q7DtxoateX8Ln-5V5RtA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: sn65dsi83: Fix an error handling path in sn65dsi83_probe()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        andrzej.hajda@intel.com, narmstrong@baylibre.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        marex@denx.de, frieder.schrempf@kontron.de,
        linus.walleij@linaro.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied to drm-misc-next
