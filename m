Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A26C77B7E
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 May 2023 18:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240250AbjEYSC3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 May 2023 14:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240131AbjEYSC1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 May 2023 14:02:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652A1D3;
        Thu, 25 May 2023 11:02:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0283A6482B;
        Thu, 25 May 2023 18:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F7CC4339B;
        Thu, 25 May 2023 18:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685037743;
        bh=WX6Q3krLeXnyU1ErGKnaGEj0J5rvRDqnfROl5WFYUIc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uBiCsIsDLy4WPXgsOkAbA4gn4FCBMGjLsFpiA1raKtxrrqxIDhryJM8TgOf0ll42O
         IgVGf6lvNrpEO3L+4qhp3zvUe6nLOytYDtKx/1F8BPVaF/RSPe5OY8wutIVDglh4/9
         4+/ikUnh58ENbCc9Icz1bivQ42AUsPfpnT0InH7EM+5mVXHjbsKnvk+8/BpZ0vgzoc
         ZSULGRQdgSlqUfCyLOQxgo4CYkRbi9A6XQBRxhb9rDcmFsPq3d0I1bV4RMLKttLly5
         DfGNx8XhEomvZkhd3cGehepGqGFNeAHBkb+m8LXd9OkjmpnVr1Sr4AY7r8NqP7sExN
         qa17uXZ/y032w==
Date:   Thu, 25 May 2023 12:02:21 -0600
From:   Keith Busch <kbusch@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Hannes Reinecke <hare@suse.de>, Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvmet-auth: remove some dead code
Message-ID: <ZG+irWuexM05RNsN@kbusch-mbp.dhcp.thefacebook.com>
References: <e6f0e506459eaec9dad74946c1e01aac74874054.1681764032.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6f0e506459eaec9dad74946c1e01aac74874054.1681764032.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks, applied for nvme-6.5.
