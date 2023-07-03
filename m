Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FB7EB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Jul 2023 12:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbjGCMdV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jul 2023 08:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGCMdS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 08:33:18 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586C5E7B
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 05:33:14 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc5d5746cso46747405e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jul 2023 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688387592; x=1690979592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbjEyULWL6/37XI6VUIi//alYOhlAuf930FnaIS9WkQ=;
        b=OUxAtw5vSPsFxjmXURwGnoN2J9+YjAKe+myiBJmUf9l0ArJy0G5g74/S0IkE0OqvQ7
         pD3Me+8JLQi0mSjPinYFJpzJU+EiElGiWtPALJ2jj91h3K+rUiyc8iqEg4d8NbQ/NxCE
         X5cierhPILETAWsjP4J/5WiFJtFMc9N9BNtCyCqYCKL1f5zf3wjX1oPHVOCdyLxmcGdH
         dMHm5pmnS2sZd4jBI3j6uEKRwwA4Pkbe+iHByS7xQtxPNzAp/N+FSh8+0T39g66XDsfF
         YdZdHvrHd6+OX2QHWXKwtLkGBu/8bvL0DuQn3GBPPe073iCBv2WY/0I4hO9f4DQdaXZp
         5yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688387592; x=1690979592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbjEyULWL6/37XI6VUIi//alYOhlAuf930FnaIS9WkQ=;
        b=P/YtjPvglqlcOIYyDUrhn5TrTc0BSUPUFTnqL0GjnibuYLwOyS9Zdf5mW/U1TRL9DM
         laOd5SB2dF4WTUjyydIhOJ3+CWC11K7mj1aHd3QKFVG/k/zrY2Yh7zCoQAum/b6iqzQB
         W1xIv/rJDLGDhZqBOhN7jc0UeXtMsVr6Bkry8U5NLdBh6wuT0bVSh24L5reMPQJ9YynK
         oZXhRMO0cXOJygexMf7UfSvmVqGMQK42Qn4vNt2UZByUgH7+Rf+rdRPFknRfEUXEkGRk
         BXHkGLe2SJLB2A3yjQKiPXFGqjtb9W1IbZ5wtZO73qPL6CRcT/nDF9eozZOYV5ud1et0
         9Pmg==
X-Gm-Message-State: AC+VfDw69V4Y/p7xbHNN8hYUea+/3q3ajOL14LtjluGmL9eBMFMgpVp9
        qQ6Z+w1QKjVis/diSd7ZBvUCxA==
X-Google-Smtp-Source: ACHHUZ7x89Bw12PK6ySMqwr1DwZdq07oQA0z5Yq+UF7a9FlNp4DufpI7dYWuyaOsbjCMBT/mu1QxUg==
X-Received: by 2002:a1c:6a07:0:b0:3fa:934c:8356 with SMTP id f7-20020a1c6a07000000b003fa934c8356mr9295695wmc.10.1688387592343;
        Mon, 03 Jul 2023 05:33:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id da16-20020a056000197000b0031274a184d5sm25641129wrb.109.2023.07.03.05.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:33:10 -0700 (PDT)
Date:   Mon, 3 Jul 2023 15:33:08 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "Lee, Kah Jing" <kah.jing.lee@intel.com>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        "Yuslaimi, Alif Zakuan" <alif.zakuan.yuslaimi@intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 0/1] Enable UBIFS support
Message-ID: <52af3309-2324-444b-99fa-a267509ea4d4@kadam.mountain>
References: <20230703063309.1342330-1-kah.jing.lee@intel.com>
 <066c9c1b-68f3-8f4c-0e34-e31963b45690@web.de>
 <PH0PR11MB567352E337F1C0D099195E3DCB29A@PH0PR11MB5673.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB567352E337F1C0D099195E3DCB29A@PH0PR11MB5673.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 03, 2023 at 07:45:12AM +0000, Lee, Kah Jing wrote:
> > > The patch is to update the qspi mtd partition range for UBIFS on
> > > socfpga platform - Agilex and Stratix10 boards.
> > 
> > Why do you find a cover letter relevant for a single patch?
> > 
> Will drop the cover letter since only send for single patch. 
> Thanks. 

Markus is banned from the mailing lists.  Just ignore him.

You are absolutely allowed to send cover letters for a single patch if
you want to.  Or you can drop it if you want to.  It doesn't matter
either way.

regards,
dan carpenter

