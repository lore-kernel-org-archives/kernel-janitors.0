Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69720C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Dec 2022 16:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235209AbiLMQG3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Dec 2022 11:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234710AbiLMQG0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Dec 2022 11:06:26 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D235021242
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Dec 2022 08:06:25 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id w15so16109961wrl.9
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Dec 2022 08:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rBklxY/O97KPdCxvMoesQGXYh+NHVpQPLwaGFlYDNDk=;
        b=GcE87HOtJa2nmkvgJgrmVaMHr8WXR+2NaRJG7sOAbW/DiRVdXKbnSikLfWLy9r6O+3
         xdWbbirslT8DWmwysJV7vZ6RIAHsI63yFRUJ9G/KpyXVWRKEV9nOOWAkfwi4CYI9a5UU
         w5h8o1HKCoJL2XGMOvA2aKuJ1W0I5i/um8jCAOl3jE+iAVU1gDn2HTqQNVYFHkiwQ44S
         8d4Ww3e4HfjPiRKsTETYZD0Nxh8LTFbVyLwDVd/NZMmNMj5UTxRvzyd+53RcMpiaj11N
         yeihGiIOGk9ZnBSk3AvJlFTDaLjHtTC7Bw6pwhWW2Ad93JGS+MbvcHBRzteAs25Aaaim
         FFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBklxY/O97KPdCxvMoesQGXYh+NHVpQPLwaGFlYDNDk=;
        b=cWDjH5l6Vpq8GQT17t3MjeoOPfrydTvARiACPcICjiY9xYABus9wwO6MuWUqWbmPW8
         IWrrUS17WhmcD3V0jz2l3fjOjNM5/400LpSxdm7Z7NG+s1cbVhkItfng3Sh1a9xlbMzz
         or9Wy7bus7cFchk7fhxHL7vumuR/asKvjT/WB0FW7aIdYRdDPCScczC2oap9mqp2QzlV
         T8PhWTfNJoguqjFb7fJGgP/dPaVYw/mu+r9WPfRKcnpyvnpt8YWbMDjhxolaajJxDLsx
         jt8/c4U2ruZX/Kfiyvx0G/1oZi7zGX2Jj3CElw+/UpwsLLQzu16vTmaG3PI4Rn3hW4v2
         /JVg==
X-Gm-Message-State: ANoB5pmbrKa0pc4eLVlIJobvN8zc6dCiXGbihCKbW+30Liuz1SUIzysB
        kPl3/dyscbx+4dg5MXk1gZu4IvRnbCDlEZeQ
X-Google-Smtp-Source: AA0mqf4f/1VfwVs8Ym9xLmje27uYkbaFWfbkuZZPsoqBSHSQwcwF8cfk7fXj5lmUR8k2wK0E+E6nIg==
X-Received: by 2002:a05:6000:170f:b0:253:62af:8025 with SMTP id n15-20020a056000170f00b0025362af8025mr2406444wrc.61.1670947584142;
        Tue, 13 Dec 2022 08:06:24 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id d8-20020a5d4f88000000b002425dc49024sm162844wru.43.2022.12.13.08.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 08:06:23 -0800 (PST)
From:   Colin Ian King <colin.i.king@gmail.com>
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     kernel-janitors@vger.kernel.org
Subject: [PATCH 0/1] idlestat: minor fix for EOF checking
Date:   Tue, 13 Dec 2022 16:06:21 +0000
Message-Id: <20221213160622.338859-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Using static analysis with clang-scan I found a potential EOF not being
checked in a fgets call in idlestat. Fix this.

Colin Ian King (1):
  tracefile_tracecmd: add null return from fgets when EOF occurs

 tracefile_tracecmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.38.1

