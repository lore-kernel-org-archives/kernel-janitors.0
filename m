Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC242C77B61
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Apr 2023 16:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243525AbjD0QWA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Apr 2023 12:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243678AbjD0QV6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Apr 2023 12:21:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B8610EA;
        Thu, 27 Apr 2023 09:21:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C3B7763E3D;
        Thu, 27 Apr 2023 16:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7372EC4339C;
        Thu, 27 Apr 2023 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682612517;
        bh=JiVVx1DtdOQF5TVqOPyCPt4x4HrBUjTJovXEhSgv+nc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S/K2kwEXv2OBiR3ef3WGjtEy0ugeAkANUVtiygVU6REmR+QgUCc1SCKRHjNgjUHIl
         sFBfe8ssUBmPA8+UwLJAxGPh+7NaCstpdqID8+2hcaJDIHbJCse+1FG8sB8eYwfgEj
         X8XIc9yyHXTR5vcWoNzYhnRySP3cbhpjsrx0jWqKcJpHR9HTPnis8K1vuapzhtp8Vk
         1r7zqizW5vK2hXKgz9wSk81ESxwBGoBEPLbX6aOf7EUUy39IAu5/hPA1kFtG1Qry5c
         IweljPEfR99Mhw4mDdPo3chW8nUjMDl84o9SZj9oknn/M4SJedBrVDcNQ6Oh76fxxZ
         4rHNmUxpC0IDg==
Date:   Thu, 27 Apr 2023 17:21:53 +0100
From:   Lee Jones <lee@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mfd: rc5t583-irq: Remove the unneeded include
 <linux/i2c.h>
Message-ID: <20230427162153.GD50521@google.com>
References: <128025bf5b81f5424db2202b0c8cfd9722c28aab.1682319383.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <128025bf5b81f5424db2202b0c8cfd9722c28aab.1682319383.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 24 Apr 2023, Christophe JAILLET wrote:

> This driver does not use i2c, so there is no point in including
> <linux/i2c.h>
> 
> Remove it and add the needed <linux/device.h> instead, which is much more
> lightweight.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mfd/rc5t583-irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
