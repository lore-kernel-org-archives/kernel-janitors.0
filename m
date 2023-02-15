Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC56CC6379F
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Feb 2023 10:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbjBOKNG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Feb 2023 05:13:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbjBOKNF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Feb 2023 05:13:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28CD22A34;
        Wed, 15 Feb 2023 02:13:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 60849B81F81;
        Wed, 15 Feb 2023 10:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760CCC433EF;
        Wed, 15 Feb 2023 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676455978;
        bh=ZsjCKZ1lApUmqVYpalc1Z/mGd7pPE2zbYIOyvcbuC8g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=muk0wf/tWk4M3jz8Ep0LfwebJEks0WrG5JIw/hLhD02pzyzWjCjqWgZVFsAamXnlc
         +mIdGdyInePN9Ej1LMVUuO56FVUdTzlt3oUc/Matb+ooCEPGXPOdQzZELuQ5pbOx65
         3bGCYc8UFGcgLY1Hll2k7jnjh6S+Vhns2NZBXOLzcBDf8pTbEm2T+3ZXDLIq38jRUk
         /I+wwAARB87dntc7bVM7TfBSiKruSODLza9oO0mqviixS7nMFO4LaHTcAeO8dzcDMK
         LEF6YjgFJSTqcATcIfCWpV6NM2pV84oZqaXR2W6cPVvk2NgJ/6W+rXb4hKcFEsUThN
         642oVKyIRaung==
Date:   Wed, 15 Feb 2023 12:12:46 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: Physical Memory: correct spelling in reference
 to CONFIG_PAGE_EXTENSION
Message-ID: <Y+ywHnLBLrAVKpKg@kernel.org>
References: <20230215100808.9613-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215100808.9613-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Feb 15, 2023 at 11:08:08AM +0100, Lukas Bulwahn wrote:
> Commit 5d8c5e430a63 ("docs/mm: Physical Memory: add structure, introduction
> and nodes description") slips in a minor spelling mistake for the config
> PAGE_EXTENSION.
> 
> Correct the config name in the physical-memory documentation.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  Documentation/mm/physical_memory.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
> index 3f3c02aa6e6e..f9d7ea4b9dca 100644
> --- a/Documentation/mm/physical_memory.rst
> +++ b/Documentation/mm/physical_memory.rst
> @@ -210,7 +210,7 @@ General
>  ``node_page_ext``
>    For UMA systems that use FLATMEM memory model the 0's node
>    ``node_page_ext`` is array of extensions of struct pages. Available only
> -  in the kernels built with ``CONFIG_PAGE_EXTENTION`` enabled.
> +  in the kernels built with ``CONFIG_PAGE_EXTENSION`` enabled.
>  
>  ``node_start_pfn``
>    The page frame number of the starting page frame in this node.
> -- 
> 2.17.1
> 

-- 
Sincerely yours,
Mike.
