Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861DAC001DE
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 Jul 2023 18:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjGaSnj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 Jul 2023 14:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjGaSni (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Jul 2023 14:43:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9399E;
        Mon, 31 Jul 2023 11:43:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F01D06126D;
        Mon, 31 Jul 2023 18:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6493C433C8;
        Mon, 31 Jul 2023 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690829016;
        bh=bQ/n8sSgCr68cHiUeFkcrAzZyF3+4MF0xc9n3lQWFmg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GlBcUs+tj/rB8Kr4/aS1wQy0dxaXhr+MgaDlDb248BRZscPDFynVptF5gPBtzyNqZ
         2mVsD3KicAODOKzLEiH1C25vd2JL1Ngffupjpp8LT73xAa9pAbIksbYNJ+1zlpBFov
         6q1MDoWroeBTETSKEMgAGeae8hNfhWvcNCGiLJtISQkYt6u+XPlgTUZGPHbPk/atmD
         U36KnntBxPdzJzO0bTiHZGmVbifwXeqxiwy29jK6JKcW8SaFuUI+GziyKaDm2y835Y
         2hSKSIaKgM2xfxs6AwEH9WKsO9qoPSfAVacqhPMpi5aVwVCHRXoFgjz2XLEZCEHz06
         OgvNN1V2kkbcg==
Date:   Mon, 31 Jul 2023 12:43:33 -0600
From:   Keith Busch <kbusch@kernel.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Mark O'Donovan <shiftee@posteo.net>,
        Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Sagi Grimberg <sagi@grimberg.me>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [1/2] nvme-auth: unlock mutex in one place only
Message-ID: <ZMgA1SGzi+VnJ8xS@kbusch-mbp>
References: <20230727134748.4163796-1-shiftee@posteo.net>
 <28d11fc5-743f-0810-8ab7-3fa2a3f98c65@web.de>
 <20230731135152.GA6016@lst.de>
 <d51771bc-32a6-7424-ba02-bcc8ab9bf3f8@web.de>
 <ZMf7BUH3ZD+GA7TA@kbusch-mbp>
 <f551a681-7893-b2a2-9565-8a4c1bd01e33@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f551a681-7893-b2a2-9565-8a4c1bd01e33@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 31, 2023 at 08:37:12PM +0200, Markus Elfring wrote:
> Does the concrete requirement for the usage of “imperative mood”
> mean also that a reasonable subject would be insufficient alone
> without a corresponding description (or “change log”)?

The doc you linked to is a simple guide for people new to the process:

  "This text is a collection of suggestions"

It doesn't claim to be a list of concrete requirements.
