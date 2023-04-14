Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553EEC77B6E
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Apr 2023 10:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbjDNKTt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Apr 2023 06:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjDNKTn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Apr 2023 06:19:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A80B4ECE;
        Fri, 14 Apr 2023 03:19:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5AD9B64583;
        Fri, 14 Apr 2023 10:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803FAC433D2;
        Fri, 14 Apr 2023 10:19:24 +0000 (UTC)
Date:   Fri, 14 Apr 2023 11:19:21 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: kmemleak: adjust to config renaming
Message-ID: <ZDkoqZlrF2ORqRSx@arm.com>
References: <20230414061241.12754-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414061241.12754-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Apr 14, 2023 at 08:12:41AM +0200, Lukas Bulwahn wrote:
> Commit c87db8ca0902 ("kmemleak-test: fix kmemleak_test.c build logic")
> essentially renames the config DEBUG_KMEMLEAK_TEST to SAMPLE_KMEMLEAK, but
> misses to adjust the documentation.
> 
> Adjust kmemleak documentation to this config renaming.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
