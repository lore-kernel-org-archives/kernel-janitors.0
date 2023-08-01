Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AA0C41513
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Aug 2023 05:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjHAFqa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Aug 2023 01:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjHAFq3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Aug 2023 01:46:29 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43358119
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jul 2023 22:46:28 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe1344b707so8347426e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jul 2023 22:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690868786; x=1691473586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VtfeVm+pZg2c5VCnLnxW1fO82KR5VHswyzC54DKBGoQ=;
        b=RCrXJYro/hO9TGbgFNl/MGklx4O1HzWnDT98GialYHRAyHMmRaTQWaQBJNHHBRGvCx
         he8PMaUVxGBZHE2knw1477flscoUt3MDjDVsFarORred6Q2fg0CDP/wICEpAF9F0jq92
         qAZCyvwsc09QmSl1hJ3DCuqGE+KygIehVbgmfJQcyCIqhlAq4RyCA1MA+z9SHqmGhW53
         LvI7Mccfm3cTidctkiMUDXupLTb4TBIsU/a65N+6+Bi04CfnA3dW4wEC4V9P1hEV66bw
         G1szQztPP/jfkA1MEg0QRM+DKqzneQaxiUnZuhLvZnLVk3SXdfYaS4hUndpkAYlmUoUc
         Fwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690868786; x=1691473586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtfeVm+pZg2c5VCnLnxW1fO82KR5VHswyzC54DKBGoQ=;
        b=TAaPu49ial/2e6iu6xE4nXJq4ZUny6zB39mpUGeJWiI5eWw6z+aiDkfoYoqC/uolGY
         n75bX0FrtzU5gQtIUTIM6VuOV7lro27eBpsI7X2Z91NCgqa3QjUT2Hck8Plxl+6eSOaa
         8OPj+j4fbcZqntGqO8FRaQULqeeeKdWxjwaqgA7tsYn1XydgMMMNmAucOb5f4fREvkqc
         1zF+bpJBNtKhjBwcQOKaDoguDVCdbaMhBTJ7EHeEGU2rqk2ylSsHFqCMsxo2JRYIrHL0
         tdrGQMqmudGwZArQFet2g8kOc9sBf9+Qj721C1hy2d1B7EYvuYbFNaOVYd6dG9lDnuVh
         sTtw==
X-Gm-Message-State: ABy/qLaIWL+Kz3NdCJWyDdM+gj4obEm5HsAOxtZMHhXVKpQAAuZevSYY
        zAmeKGMYa3HIa0S8DGMQAG9CEr9JEKKLM5OznT4=
X-Google-Smtp-Source: APBJJlHMaC5V5AYOVUvFg1FoZfR2acUsBo8Fh3lxOaTxGZ3kE39gfSC6OwcF8Eywvzt/QzkN0zwM/w==
X-Received: by 2002:a19:771d:0:b0:4fe:825:a07f with SMTP id s29-20020a19771d000000b004fe0825a07fmr1238613lfc.57.1690868786399;
        Mon, 31 Jul 2023 22:46:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f9-20020a7bc8c9000000b003fa96fe2bd9sm15814946wml.22.2023.07.31.22.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 22:46:26 -0700 (PDT)
Date:   Tue, 1 Aug 2023 08:46:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Lin Ma <linma@zju.edu.cn>
Cc:     Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Alexander Duyck <alexander.h.duyck@intel.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter P Waskiewicz Jr <peter.p.waskiewicz.jr@intel.com>,
        Petr Machata <petrm@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: dcb: choose correct policy to parse DCB_ATTR_BCN
Message-ID: <d29e7d32-1684-4400-9907-f2f69092466d@kadam.mountain>
References: <20230731045216.3779420-1-linma@zju.edu.cn>
 <fbda76a9-e1f3-d483-ab3d-3c904c54a5db@web.de>
 <3d159780.f2fb6.189aebb4a18.Coremail.linma@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d159780.f2fb6.189aebb4a18.Coremail.linma@zju.edu.cn>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 01, 2023 at 09:34:17AM +0800, Lin Ma wrote:
> Hello Markus,
> 
> > 
> > …
> > > This patch use correct dcbnl_bcn_nest policy to parse the
> > > tb[DCB_ATTR_BCN] nested TLV.
> > 
> > Are imperative change descriptions still preferred?
> > 
> > See also:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.5-rc3#n94
> > 
> > Regards,
> > Markus
> 
> Yeah, thanks for reminding me. I haven't been paying attention to that
> and I will remember this ever since. :D

Simon reviewed the patch already.  Don't listen to Markus.  He's banned
from vger.

https://lore.kernel.org/all/2023073123-poser-panhandle-1cb7@gregkh/

regards,
dan carpenter

