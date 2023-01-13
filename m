Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47C0C3DA78
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Jan 2023 19:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjAMTk5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 Jan 2023 14:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbjAMTkM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Jan 2023 14:40:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099C0892E5;
        Fri, 13 Jan 2023 11:38:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A5E6DB82184;
        Fri, 13 Jan 2023 19:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BCBC433D2;
        Fri, 13 Jan 2023 19:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673638715;
        bh=jVTigcncu918aW6IO9uMohQaq48FyNtFtLKl6fNFPlA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ly7aBpJrDOj/VhDR3FLlia23grsdV66MhJcv3+/jbczcWlJS08sXWnYvDKHQKrds8
         sxVxsGjK5Z1vETJoThTWVwC4AVKhWQOdFfMf39hPL6cusARG+4mQ/Y6U0cW0gO28/s
         RpJSzMKDlWdGXxsgdQvkUplwDCoPBvrfkJZ+lYFCiMk9ERCGi8M8CRtvarv5UyjGrL
         aA1oDrwdDUHvwFowWuOSRqI1x3VR75esWdevnmx0lUDW02LsMWJ7AU60kphBz0iFeI
         e7RUi1gFn8VX+WMYkDQ06tsU42w7nC7ZASazcsfwecd3f3dXyOsZwbMaGdXHr9htFD
         vcsbpf+bOKXbQ==
Date:   Fri, 13 Jan 2023 11:38:33 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Dimitris Michailidis <dmichail@fungible.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Simon Horman <simon.horman@corigine.com>,
        oss-drivers@corigine.com, "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: remove redundant config PCI dependency for some
 network driver configs
Message-ID: <20230113113833.10abe9cc@kernel.org>
In-Reply-To: <20230111125855.19020-1-lukas.bulwahn@gmail.com>
References: <20230111125855.19020-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 11 Jan 2023 13:58:55 +0100 Lukas Bulwahn wrote:
> While reviewing dependencies in some Kconfig files, I noticed the redundant
> dependency "depends on PCI && PCI_MSI". The config PCI_MSI has always,
> since its introduction, been dependent on the config PCI. So, it is
> sufficient to just depend on PCI_MSI, and know that the dependency on PCI
> is implicitly implied.
> 
> Reduce the dependencies of some network driver configs.
> No functional change and effective change of Kconfig dependendencies.

Applied, thanks!
