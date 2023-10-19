Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321BACDB465
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 04:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjJSELq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 00:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjJSELo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 00:11:44 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5EF119
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Oct 2023 21:11:41 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c50ec238aeso75513081fa.0
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Oct 2023 21:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697688699; x=1698293499; darn=vger.kernel.org;
        h=cn:content-disposition:mime-version:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=myuCYeJM46kBGvhwTJjYjvzOGKOZ+6IkjM9iYH2ZIlQ=;
        b=moOJ4fZp94WLLc5F+BegfmZSYeLuWZx5ofqMrfu5yICbJ4jr8IrfVmg+LRJBpA0HLM
         S+Zmkaafeh7cqMs1NoHLh5Tj3FCOM4BYaVDfVKxVOZXyrU0yRcCZBp/Tmg7tXkjm1kKC
         kBu1e76x8YDhxQIz8ds+qTCZTXkS7NmXRKg/O+/dj+6a0gGrSDdvvqaEUDVPej62DKcu
         djdSbkc9/4lNXDsEgUtQOPiTgbkyiX4T6auqEbdKXnKCLlPRj7AM0ZTlMHukHy4aF3WJ
         zARvH2jI/Rlj2rFYekV+sumCieciGXpIsIL6bDgojfL3F9YQKdrVRik8isXjuLRs/L7s
         ejKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697688699; x=1698293499;
        h=cn:content-disposition:mime-version:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myuCYeJM46kBGvhwTJjYjvzOGKOZ+6IkjM9iYH2ZIlQ=;
        b=J6IUaaQbazl7NvDOFf/kMRYAd2Wirl3Vq1sy5/8/dQM3OR7lcZ0DjV+cVwtJKtanHs
         kuYTbF2Bi3575glqP78nQeBupkLO2N2np/9H3EPU22L2n9xfo03yyN5grSOEwZnikR1/
         W4s9oeYRiCC+yoJFGFwNFIe6sW9n7ktDsUjxSzwvvImw5yw0DSs7jKEH8t6hz3Rkbs6y
         ILy32h17UX6iKjYAXtnUvN8hP/Cm9bVY/al21BjB4bMxJYEUiyQx78EVsmNhRXrcSgrb
         TpvS9iuucPW7xA8QqfF5VypAE+c7BlK2dxH9qms5xtFggV5O1lhGwTdR7NthKtCW2Ov2
         kOpA==
X-Gm-Message-State: AOJu0Yz60MDKwEGnz43siAuhRh85S+Qipk912UmvKnYh+sHtk3mlCm+I
        EKiNCPQBvyLrzn2DWWcnkRE/fPhWh4JL1xQ4R3I=
X-Google-Smtp-Source: AGHT+IGPD/XShFyYcXcP6LTLE7f542kIUhnUaL0S94qudfW/4Kjq9wloGBXpkYF5vY5HTV0XjXLkRg==
X-Received: by 2002:a2e:8ecc:0:b0:2c5:115c:2d33 with SMTP id e12-20020a2e8ecc000000b002c5115c2d33mr517582ljl.3.1697688699320;
        Wed, 18 Oct 2023 21:11:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c499100b0040772138bb7sm3234160wmp.2.2023.10.18.21.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 21:11:38 -0700 (PDT)
Date:   Thu, 19 Oct 2023 07:11:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     ksummit@lists.linux.dev
Cc:     outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: KTODO automated TODO lists
Message-ID: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cn:     outreachy@lists.linux.dev,kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Yesterday someone on my lists just sent an email looking for kernel
tasks.  This was a university student in a kernel programming class.
We also have kernel-janitors and outreachy and those people are always
asking for small tasks.

One thing that I sometimes say as a reviewer is "This isn't caused by to
your patch but I noticed something wrong."  We could add that kind of
thing to a todo list by using a KTODO line.

KTODO: add check for failure in function_something()

Then people can look on lore or use lei to find small tasks to work on
or they could use lei.

lei q -I https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=mid 'KTODO AND rt:6.month.ago..'

Then grep ^KTODO ~/Mail/KTODO -R and cat the filename you want.

regards,
dan carpenter
