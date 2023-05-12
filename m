Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF905C77B7C
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 May 2023 23:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240957AbjELX55 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 May 2023 19:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240779AbjELX5y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 May 2023 19:57:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE9A86B5;
        Fri, 12 May 2023 16:57:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4396E658CC;
        Fri, 12 May 2023 23:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649FEC433EF;
        Fri, 12 May 2023 23:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1683935817;
        bh=LDope8vqn+neA/rDW2moCG3E8yWqZ25lWX/JxB2rRzk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lDHj+azcmIO60UO9bdbkWgvYVD8N4mStTz/Qeuugs+cS/payHc9iXXKjJsu5kaAUn
         mBA5CeJz0amNXhHu7+UcuRJP3niL6ElC6wVotRBbiTlMjs6A9jZSenmorVLTot72KQ
         uHA3arEEP7m9jVUGVhvZ5DQj367hvgT/m9PSfkQg=
Date:   Fri, 12 May 2023 16:56:56 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-mm@kvack.org, Conor Dooley <conor.dooley@microchip.com>,
        Support Opensource <support.opensource@diasemi.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: repair pattern in DIALOG SEMICONDUCTOR
 DRIVERS
Message-Id: <20230512165656.885a774fe3f69f54fcc45cd0@linux-foundation.org>
In-Reply-To: <20230509074834.21521-1-lukas.bulwahn@gmail.com>
References: <20230509074834.21521-1-lukas.bulwahn@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue,  9 May 2023 09:48:34 +0200 Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 441613662db7 ("dt-bindings: mfd: Convert da9063 to yaml") converts
> da9063.txt to dlg,da9063.yaml and adds a new file pattern in MAINTAINERS.
> Unfortunately, the file pattern matches da90*.yaml, but the yaml file is
> prefixed with dlg,da90.

I'm seeing a different hash:
361104b05684c ("dt-bindings: mfd: Convert da9063 to yaml")


