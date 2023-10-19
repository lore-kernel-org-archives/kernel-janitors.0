Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54659CDB465
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 17:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346352AbjJSRrr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 13:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345646AbjJSRro (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 13:47:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02407114
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 10:47:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6FAC433C7;
        Thu, 19 Oct 2023 17:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1697737662;
        bh=VKaGxEAxlfSQwaqUlB/6PVF77fnIGJA9T2faQyqHGQQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o09epg6r1yGFyJLZ4A0fI3LYCXOUQYKnj2vJOwoT7bTqHRcSC6cCyo/zvXUlWv0eq
         hJki/tgVTFYLY8tem7/ocOwTlhkksWHdctxgtdOf+dHV4Lry42pvhf+UVJMY6jiUYM
         WX+LZtnNdlSxuNbGJPREAcDxdtno3eXhjm/KQmXo=
Date:   Thu, 19 Oct 2023 13:47:41 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231019-guru-unpaired-1dd4bd@meerkat>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 19, 2023 at 07:11:36AM +0300, Dan Carpenter wrote:
> KTODO: add check for failure in function_something()
> 
> Then people can look on lore or use lei to find small tasks to work on
> or they could use lei.

We can also have bugbot turn these into bugzilla bugs, if there's consensus
that it would be helpful.

-K
