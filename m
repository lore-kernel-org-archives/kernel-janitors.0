Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A2DEB64D7
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Jun 2023 07:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjFTH6X (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Jun 2023 03:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjFTH55 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Jun 2023 03:57:57 -0400
Received: from smtp.tom.com (smtprz25.163.net [106.38.219.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9E41B4
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 00:57:30 -0700 (PDT)
Received: from my-app02.tom.com (my-app02.tom.com [127.0.0.1])
        by freemail02.tom.com (Postfix) with ESMTP id B6292B00CBF
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 15:57:28 +0800 (CST)
Received: from my-app02.tom.com (HELO smtp.tom.com) ([127.0.0.1])
          by my-app02 (TOM SMTP Server) with SMTP ID 626210571
          for <kernel-janitors@vger.kernel.org>;
          Tue, 20 Jun 2023 15:57:28 +0800 (CST)
Received: from antispam1.tom.com (unknown [172.25.16.55])
        by freemail02.tom.com (Postfix) with ESMTP id A9E99B00D40
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 15:57:28 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tom.com; s=201807;
        t=1687247848; bh=fe2gbNBOimrCNd/Vj8kpZhrYgncj1cjN6H+eAQuu4MY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Xlg98piG1s6bLBhNbXo7UBieV60r1wHPRuUNk7mBSncadT5C1LDiUEt+ERH1ZlZ4v
         sPBIdHPT0N4B0m3KavXQL9d7eRznnDDxDo2eEhstuuP6RvFTmWddN7DkXKh/qh7UxE
         Lcn6leovUXh2QV5XP9BoY42LSK3PSJ+rsDl1C8IU=
Received: from antispam1.tom.com (antispam1.tom.com [127.0.0.1])
        by antispam1.tom.com (Postfix) with ESMTP id A975CD41AF9
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Jun 2023 15:57:26 +0800 (CST)
X-Virus-Scanned: Debian amavisd-new at antispam1.tom.com
Received: from antispam1.tom.com ([127.0.0.1])
        by antispam1.tom.com (antispam1.tom.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id edLD0vxO6jtJ for <kernel-janitors@vger.kernel.org>;
        Tue, 20 Jun 2023 15:57:25 +0800 (CST)
Received: from [172.30.11.106] (unknown [180.167.10.98])
        by antispam1.tom.com (Postfix) with ESMTPA id D096BD4140C;
        Tue, 20 Jun 2023 15:57:22 +0800 (CST)
Message-ID: <c12c4031-52fb-25a2-b411-e668eb9baaa2@tom.com>
Date:   Tue, 20 Jun 2023 15:57:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Su Hui <suhui@nfschina.com>
Cc:     alexander.deucher@amd.com, airlied@gmail.com, Xinhui.Pan@amd.com,
        daniel@ffwll.ch, David.Francis@amd.com, Jane.Jian@amd.com,
        Bokun.Zhang@amd.com, monk.liu@amd.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20230620045919.492128-1-suhui@nfschina.com>
 <da6c860f-0ef0-44e4-8b58-0f4d55c1b8bd@kadam.mountain>
From:   Longsuhui <Jack_sun@tom.com>
In-Reply-To: <da6c860f-0ef0-44e4-8b58-0f4d55c1b8bd@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023/6/20 15:37, Dan Carpenter wrote:
> On Tue, Jun 20, 2023 at 12:59:19PM +0800, Su Hui wrote:
>> Smatch error:
>>      gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:316:49: error:
>>      static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
>>      static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>>
> I doubt that moving the struct members around is safe.  This looks like
> it's in a very specific order.  So I don't think this patch is correct.
>
> The reason for this false positive this code uses a #pragma to pack the
> struct.
>
> #pragma pack(push, 1) // PF2VF / VF2PF data areas are byte packed

Oh, Sorry, I didn't see this code.

This patch is error, and sorry for the noise.

> Sparse does not support this and Smatch uses Sparse as a parser.  The
> main reason why Sparse doesn't support this pragma is because Linus
> thinks it's gross.  You probably didn't even see the #pragma did you?
> And anything you can't see is unreadable by definition.
>
> "Mark the associated types properly packed individually, rather than
> use the disgusting "pragma pack()" that should never be used."
>
> https://lore.kernel.org/linux-sparse/CAHk-=wi7jGZ+bVbt-UfXOkpEQdHzF3Z2HBjkGdjh8q4dvPPGWQ@mail.gmail.com/
>
> regards,
> dan carpenter
