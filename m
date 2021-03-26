Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13F6C433C1
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 23:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CB6F61A2A
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 23:08:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhCZXHj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 19:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhCZXHc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 19:07:32 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2DFC0613AA
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 16:07:31 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id v10so498565pfn.5
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 16:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8dMGW3NNPH6KeBSqsN/4K5vPXVK2n7GhMJaRLYoxTdI=;
        b=pwgm2iRdYyFSmvOtjVPPj2gT1kT1WR47rTSofebDXFr2+VpIUhAOxMDECLSjAzKOe/
         M/3nVSt2OO+hH6LASlmFnX5p2KsZqEfL7im3rcaVapF3jftZF9VWQolqah+7O1xPwr6N
         MwxXK+ER5jHsmNLBOydf5wBmWEPleJk9bMyW6LBGrpZuYSqjz+z7LFpKDDtAzLgPGbpq
         YsxpJtKiF06Mbsu80XIMhCFjs5V6cvdtUQX4tn7TWgdWRe9FVFpAfWiLvSWBzORjqpv6
         m4uf/UAPZ6Z8N8rf85/eCb/80cb8hK2WzQdL3DFLEeNbq29hV88siFplUORQEF1c09XB
         t/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8dMGW3NNPH6KeBSqsN/4K5vPXVK2n7GhMJaRLYoxTdI=;
        b=Xw7RqZ2NWhNMxiBtW7H+oqkpGKpTAt6SNk6YBO5TqeRfXUA9WHyVCkARhKD37Sjbhq
         FThY1F7Uzal0VrnJ4rPpNa4NrRNL6vZys0eE3uzGbeNEfnHkB1bUvhaoO1C26dNaqgf8
         xb7AgdtFirOwG2Dltn1XhtwnB1/LY2fiIiIn1IvY7yfNI7/EPeN5RblVpsJlCWMf8Tce
         rq1KvSoBLhG3QImEe9TLYoqTzplPOhga8ZZoaeBa+tE4allBPjpv86iQxG9jQsFT0gC2
         LpWRhs2WFBY+DxqJUsBHYxYt1i6Shv/7bBpIkn/Alx2rMS9HA8Mhk+BlS2NMAsz0Su+l
         RmPQ==
X-Gm-Message-State: AOAM533q1dRGtfkDBZdbR9F/hddKAUkls8GXcPB18U68fiGsv+Uinth6
        unqlKZnJH8vsiIPFsFayDi3z5g==
X-Google-Smtp-Source: ABdhPJyMs1TfN0Oz89SmCYz4go0u4i6QTlAdW5Mak2N/gkuqkWc0/joe8Ju/qqG4/my5p7XWfht/aA==
X-Received: by 2002:a63:485b:: with SMTP id x27mr8478635pgk.0.1616800051305;
        Fri, 26 Mar 2021 16:07:31 -0700 (PDT)
Received: from ?IPv6:2620:10d:c085:21cf::141d? ([2620:10d:c090:400::5:4d27])
        by smtp.gmail.com with ESMTPSA id l25sm10410526pgu.72.2021.03.26.16.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 16:07:30 -0700 (PDT)
Subject: Re: [PATCH] io_uring: remove unsued assignment to pointer io
To:     Colin King <colin.king@canonical.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        io-uring@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210326195251.624139-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <88e590c4-8174-73fe-ebca-de879b21b317@kernel.dk>
Date:   Fri, 26 Mar 2021 17:07:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210326195251.624139-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/26/21 1:52 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an assignment to io that is never read after the assignment,
> the assignment is redundant and can be removed.

Thanks, applied.

-- 
Jens Axboe

