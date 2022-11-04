Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E47C4332F
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Nov 2022 19:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiKDTFP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Nov 2022 15:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbiKDTFO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Nov 2022 15:05:14 -0400
X-Greylist: delayed 396 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Nov 2022 12:05:12 PDT
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269D943AEF
        for <kernel-janitors@vger.kernel.org>; Fri,  4 Nov 2022 12:05:11 -0700 (PDT)
Received: (wp-smtpd smtp.wp.pl 1613 invoked from network); 4 Nov 2022 19:58:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1667588310; bh=SJPHk8FmWhb5cun3BVSxV/Y24lLTBzmzkpLLqHm+Ml4=;
          h=From:To:Cc:Subject;
          b=pq9veQjHpT9kKYTgX3j9+lTaFhIRr2ozRMoMo3WfdclB+VKwsxggUaA3T0SOUYFrl
           ZnnDeI0t6KtHwLCABdUbqNZLKafXFSBMdJtxrbkybFWjXUf5MnDOxzKPLLlKPLeVpI
           VsDj9PVzSN69Wc8lIXu5XvRh3W2ri3SuFYJT08Yw=
Received: from 89-64-15-29.dynamic.chello.pl (HELO localhost) (stf_xl@wp.pl@[89.64.15.29])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <colin.i.king@gmail.com>; 4 Nov 2022 19:58:29 +0100
Date:   Fri, 4 Nov 2022 19:58:29 +0100
From:   Stanislaw Gruszka <stf_xl@wp.pl>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Kalle Valo <kvalo@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iwlegacy: remove redundant variable len
Message-ID: <20221104185829.GA204626@wp.pl>
References: <20221104135036.225628-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104135036.225628-1-colin.i.king@gmail.com>
X-WP-MailID: d61e314174c95f4e2b013d8de70cd0b2
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [sXP0]                               
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Nov 04, 2022 at 01:50:36PM +0000, Colin Ian King wrote:
> Variable len is being assigned and modified but it is never
> used. The variable is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> warning: variable 'len' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
