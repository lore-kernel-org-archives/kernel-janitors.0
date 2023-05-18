Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05927C77B7D
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 May 2023 07:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjERH15 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 May 2023 03:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjERH14 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 May 2023 03:27:56 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5E619B5
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 00:27:54 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30644c18072so1070386f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 18 May 2023 00:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394873; x=1686986873;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wAPcJcHb9lKCODrpIEtgfzkB1DoeCu+XIopDXrwmOUY=;
        b=p4bGehl+AL3xt0ORppIKtVNCFnQgTO7NvJ3kryiwNyfA1+3v1x8TSMfcTCmMrMASm+
         JCyt5YVGSpwhFNaexMx4PraBNYB2zn8BaW6/O/d+r8IJZEA5sQJ3JM0K6HH1w264+dQX
         1m7zH3gu79RYkM4sB4oXf1un+cPRR5oagYjVzk7Q1hTbL3iNN7AO6cDchZouNqtDyXU6
         7ZJkXoJl+UiGr1sUVRBRepo462zsr453mxIjbOXAY1S8IoTSznm91tEkfLk72ILFrwtz
         ixZ4EJKHboBfqFx88pjBcAofO/u4yaz6UVG9wcbc1ennxibqFVUrtjYKvdxVgSwOZcVw
         gC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394873; x=1686986873;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAPcJcHb9lKCODrpIEtgfzkB1DoeCu+XIopDXrwmOUY=;
        b=fHQ7dhwJ3wcYRmON6UPM4J9l7cBaRhgjFUOyMsuGYLPaga5nKIez9FLI1JrbF8QyNQ
         WxUa9CGhcygOdYMz7r5mMJYsbNa9P4cWY/QEwxcD23mlY4ybW3zab6bG7EKcGIAPykRD
         3SY26cBF48tbGzhBobIjo7N7+RHN1wsD/RLr6ttW/RGsDm193uLkJ7Cg5O/CniVIpCPL
         bneM/xl3sxNb8J39/9a0BcQwOeK+T54KxNr8aHDIqdThWXup9/qV4AuvslK097Zcrdit
         IEam/AjlYYH0RXIg3ZIuwL3iuaZqmU6/5RvqwuRx5FLpLaWmmvr6i2xoK1N9CIBXzKlw
         M85Q==
X-Gm-Message-State: AC+VfDxWlo7t/UfmilzkK4tvYupAK2Gb1C4dnhtLkXklDJrkeagwEylU
        hbrQBg4APSSQtIzjS7vVb5JjwA==
X-Google-Smtp-Source: ACHHUZ5MDAPID0M0aH387pe9Up4M/guBe8D+W2Lpb2aVALft3UYWaSr2NE4gDqg4tnUpRN9Bj1fCMQ==
X-Received: by 2002:a5d:438c:0:b0:309:49e6:9047 with SMTP id i12-20020a5d438c000000b0030949e69047mr1014609wrq.16.1684394873452;
        Thu, 18 May 2023 00:27:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e5-20020adff345000000b003047ae72b14sm1171736wrp.82.2023.05.18.00.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:27:51 -0700 (PDT)
Date:   Thu, 18 May 2023 10:27:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     smatch@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: devm_ on lists
Message-ID: <db0e0930-d76c-426b-9d9b-366f97d7e167@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

I sometimes have more ideas than I can handle in a day and my mind
resets every night so every morning I am a blank slate like that guy
from that movie.

So I'm going to start writing them down and adding a hashtag.
#StaticCheckerIdeas  I'm going to CC kernel janitors until the Smatch
list gets archived on lore.kernel.org

There is a bug in ti_sci_probe() where it does:

	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
	...
	list_add_tail(&info->node, &ti_sci_list);
	...
	return of_platform_populate(dev->of_node, NULL, NULL, dev);

Idea 1:  If of_platform_populate() fails, then info freed but it's it's
still on the the &ti_sci_list list.  Look for list_add of devm_ data
and ensure that it's removed from the list before an error code.

There are other lifetime issues surrounding devm_ data.  We need a
list_del in the release function as well.

Idea 2: The other error paths all have clean up so last error path
should have clean up too.

regards,
dan carpenter
