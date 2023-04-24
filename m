Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCDFC77B76
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Apr 2023 12:14:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbjDXMOU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Apr 2023 08:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjDXMOR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Apr 2023 08:14:17 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFEB10FC
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Apr 2023 05:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Ceu/85gKskypn0Mrq4JYlt57CB6zS+y89QBRxsdO88Q=; b=Nejt0hIo62NyZ1fkh6fD8vRQZF
        aYMERb5oeaUEbF9TbBbZhTELLP8VnyK34nKzwawbWXzljHpfYAtBqlv2vQrheufsmYpiISOPQTs5s
        nOwGS36PGHYKP+hWkada6uaztQzsPRNRVXFPOF5kRX7HSj0Sg/TAgVFHuRQVZQ62YO9Z+jrsFgwK3
        kj33CAgpr4umMp7NSEUl3PuQJRlffRKtB2WdTGTlp/d70FmdvfOPWt94HguG+hoYxQl95vj1MH+LV
        ReCUR8nlp1J41hgRB6QUd0EszLhRM/8ntdsGY47OcNZuMV0WBXoHiw3+9qI7SHDpyBsd1xdghW5sj
        5WsuNw1A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pqv4v-000QYK-Nj; Mon, 24 Apr 2023 12:13:57 +0000
Date:   Mon, 24 Apr 2023 13:13:57 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        linux-riscv@lists.infradead.org, Linux-MM <linux-mm@kvack.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: In-flight collision: ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 renaming
Message-ID: <ZEZyhSKaAEVpx4KX@casper.infradead.org>
References: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 24, 2023 at 11:40:25AM +0200, Lukas Bulwahn wrote:
> It is easy to fix, adjust this one line to the renaming and 'select
> ARCH_WANT_OPTIMIZE_VMEMMAP'. For now, I am just reporting to let you
> know; probably, it is best to get a quick fix-up patch with -rc2, once
> all the changes landed in -rc1.

Actually, it's best that both parties who send a pull request to Linus
note this collision and he can fix it in the merge commit.
