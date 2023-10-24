Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CF7C07545
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 15:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343508AbjJXP2Q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 11:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234969AbjJXP2H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 11:28:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029D11BF4
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 08:28:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEECC433CB;
        Tue, 24 Oct 2023 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698161282;
        bh=rTvxCljC76kJYEmKBkHM2IhWXaKCGdgKaZZd3Qxzv/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HxCyJJJRdFKvutQg+IEL4YCvyqBl/9MXeFPo7zj2SAzKp4h2lDb7e74GxFXKnnL2j
         TeIUHLy+wSX27i1UFhsnvYPuNBZtWajCm3uaKsSJYgAPiqHT4j5p1QsUmvZ2qtlLLj
         atBwH0aEjiMN7X7ipQVR+d/zKFo8q1U1aYf+V+61mrRrQtoiCKkSz6tma8AvBiFfPm
         Zxnb5svpKo2Md97A4aHHZ6FynfM4jUf+OmOPSlv2iIBtuN2DxF2w7UsjbfmeY223bA
         TK3F07EtA9WiOv92sV78LvHbFI6SOPj76VaRq2OQ6g2JF4mfdwV48TKv8Oq4qa2RZ8
         WWFSW/DM5Pfkw==
Date:   Tue, 24 Oct 2023 11:28:01 -0400
From:   Konstantin Ryabitsev <mricon@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231024-notorious-elegant-crayfish-a45d63@meerkat>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
 <20231023-righteous-peridot-parakeet-1bbda0@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023-righteous-peridot-parakeet-1bbda0@meerkat>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2023 at 03:41:48PM -0400, Konstantin Ryabitsev wrote:
> If it helps, I can add a mailing list etiquette page on subspace.kernel.org,
> so it's easier to find.

FWIW, such page now exists:
https://subspace.kernel.org/etiquette.html

-K
