Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327E2C0015E
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Aug 2023 10:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbjHAK2x (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Aug 2023 06:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjHAK2w (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Aug 2023 06:28:52 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A92A1
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Aug 2023 03:28:50 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5222a38c0a0so8097736a12.1
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Aug 2023 03:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690885729; x=1691490529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3Ho+ZTYvFIHB9vt5ml0CuS5M4OvaLd2nOICNHPF+LE=;
        b=AdbH+iyo3/ENto3SAGhYYdsLNkTJnrggHTQlC5FLAcw8q4SFljrDfQQa8xnUpde/Y3
         2MTOdK65uduO8xMMa1yqFQx0ZGUtg8vPIM2Ey/ctMR1neOldx9ON4QQDzyHW9sMa7cPr
         TzYVvBY2qZBRhF7GWxdQLrRkPJjAIuvR0nQaPDpNKW31T/20F/WZwoW4MjDnJkvNnPEr
         RuVbnPzVDsFOXmxMXJU0DUQBA+03X18aWskTdw1/xyt5y74tMMych92a2qMhzdObLmZw
         9z61NnOj0u2dKVrGZUJp5vLGJ36nVSIOhjQ+bvbcV36rkduyZvARJHMHcbOosAiN8WK4
         2/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690885729; x=1691490529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3Ho+ZTYvFIHB9vt5ml0CuS5M4OvaLd2nOICNHPF+LE=;
        b=dre3dmMtDMZSeh+D8B1HguWHdcZuLqczKYl5vG44N8abVlfCqTRLWpFOe1x1eYVYnU
         jTph5EsMrg4ee/wvYUYOj3B5aDiRCxgBnb9LCfWLVlifjR7d/1YHP7lgq38xI/0vKUik
         g9ZZBJn+zd/TEIIndAafgVj3WYd6GYAKzldI4GEe1ulbLuB1DJe20B23fzy51bAWlzKn
         vHGxEmmbSpwKk+YY0XeSqQDoelny0+e+hCPipuWORurKQRp5lGOVks5lx42/PRSSZvXB
         BAZjnmCnHPSuwul7Kdoj40T3pJ+p51RRK7boQhsyaMDHATql5+rwoz3ZWsnJZCajbQEw
         60Tg==
X-Gm-Message-State: ABy/qLaN2xZXi0zpRj5dMlSl/Llfnivx98YJb4reVz65PcS4hD6T3jNj
        GYcgxGfoieW8y/xRtB4zyTrLaA==
X-Google-Smtp-Source: APBJJlFn7BpsioeD1x657x2SSLgwnC4u8qjBSo6pmGhWoBdWzdxUgN5MpgtWQK8NmE9jUBXFhoPdQw==
X-Received: by 2002:aa7:c14b:0:b0:522:27ea:58b with SMTP id r11-20020aa7c14b000000b0052227ea058bmr2067249edp.39.1690885728928;
        Tue, 01 Aug 2023 03:28:48 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id c16-20020aa7df10000000b00522bd24790asm3593876edy.58.2023.08.01.03.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 03:28:48 -0700 (PDT)
Date:   Tue, 1 Aug 2023 13:28:37 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Lin Ma <linma@zju.edu.cn>, netdev@vger.kernel.org,
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
        Simon Horman <horms@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: net: dcb: Communication challenges for patch reviews?
Message-ID: <a03f4f45-08c7-4b7d-8f9a-328dbfbe721c@kadam.mountain>
References: <20230731045216.3779420-1-linma@zju.edu.cn>
 <fbda76a9-e1f3-d483-ab3d-3c904c54a5db@web.de>
 <3d159780.f2fb6.189aebb4a18.Coremail.linma@zju.edu.cn>
 <d29e7d32-1684-4400-9907-f2f69092466d@kadam.mountain>
 <ed7020cb-cee5-16af-55f1-f1adac08f1b6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed7020cb-cee5-16af-55f1-f1adac08f1b6@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

I'm not trying to be mean.  I don't go out looking for Markus's emails,
but he often adds kernel-janitors to the CC list.  Kernel janitors is a
vger list so he's banned but we still see the responses to his emails.

In recent months probably seven maintainers have asked him over and over
(maybe 20 times?) to stop with this nonsense.  So he knew he shouldn't
have asked Lin Ma to redo the patch.

regards,
dan carpenter
