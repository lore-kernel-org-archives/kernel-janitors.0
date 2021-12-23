Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF045C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Dec 2021 12:57:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348515AbhLWM5b (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Dec 2021 07:57:31 -0500
Received: from verein.lst.de ([213.95.11.211]:53836 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348510AbhLWM52 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Dec 2021 07:57:28 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2403B68AA6; Thu, 23 Dec 2021 13:57:24 +0100 (CET)
Date:   Thu, 23 Dec 2021 13:57:23 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] block: drop needless assignment in set_task_ioprio()
Message-ID: <20211223125723.GA24681@lst.de>
References: <20211223125300.20691-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223125300.20691-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
