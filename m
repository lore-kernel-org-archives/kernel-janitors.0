Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81ECC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 Jan 2022 03:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbiADDaS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jan 2022 22:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiADDaR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jan 2022 22:30:17 -0500
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7413CC061761
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jan 2022 19:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=8zeom9N3e50k8nkohwxAjqmn9nik85eklCEb4gg6NwQ=; b=dkq6feld3iB/XeE5Ssxy/ky96O
        yImPozrFRNiW99WJrUC3J8FI18j7bQjoy5NQTFM5GgIGvj+ZhUoHsA9IqsFMnfqTDRD/vGLhNPKTt
        5r5HIZv8kcecW6FqFwo3ti/zgpNkMdaPAyS3OKZIuM0WIzSfGqCAT7abnzxrjA9zFTU803U1MkB6m
        tlqZ9YUWevsQp32RS+OV5jNnOCkwBn6aBSqrVuulZDs/nq+KGR5n6EToAVpCogmqCFVrfVPm8Z7FZ
        1KQFc9sMTCZ9BojNvBx00xgBd19QcAh4tlQPzphXfgzDsQm40YQaypDmzKiXO0M1RwjYh0GAzCxrL
        fnklut7A==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1n4aWd-005Cge-EF; Tue, 04 Jan 2022 03:30:15 +0000
Message-ID: <c3af0ef3-1c9b-4893-f63d-fd24c4b9b689@infradead.org>
Date:   Mon, 3 Jan 2022 19:30:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To:     kernel-janitors@vger.kernel.org
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: janitors suggestion: MAINTAINERS file
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Run './scripts/get_maintainer.pl --self-test' in a kernel git tree
and fix some of the problems there.

(I see around 130 reported problems.)
(Be patient -- for me this took something like 45 minutes.)

thanks.
-- 
~Randy
