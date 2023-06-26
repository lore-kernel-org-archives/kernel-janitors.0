Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1689AEB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jun 2023 12:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjFZMmN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Jun 2023 08:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjFZMmM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Jun 2023 08:42:12 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2391211B
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 05:42:11 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-312863a983fso3740741f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 05:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687783329; x=1690375329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1xYFUI/k6vE8xTpsdHwPYP/AxDoWz5CfcCmedbDcsCk=;
        b=HulYCJn2XvaoDSsPKEw20CbMSvHHqVWwluwnv+5VYXvTK9JPgZ5nM3vQc35CmzxnVT
         erSpLVKvkwcp9NcrYGD0XF6zV5/FE7ShtDTlaa7RRJ7lTJ0Rl+l2ql7V+xWoL7BQvspW
         bUup2x/P3rogs01jgXA864coD/zr8aeVLsmxVpKFeUmYNif+lEEMcNwz+YQvJ90+V5/S
         Sca/4xnf4cwZ0DktnLljqtStdu3CZ0hcXzeCEfW5nEmNFV6OPPRZQ53y7knjWUzVL219
         qpuOQ/exS1vaqQXMVVL4IXxyw2LvSSZu8iPBjpgIMltUNPVUbagSRGficpDPylbcjgrn
         /xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687783329; x=1690375329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xYFUI/k6vE8xTpsdHwPYP/AxDoWz5CfcCmedbDcsCk=;
        b=DKA6QxqqHCbxNL3IkiT54X8TYBexM3ORxT8hEjoaqxuZhtADHXSm4NyqbRxee1SPCF
         6ph735QJYrwmyvKcoftuqx2u86PQ47fM8KSyRu6LK1PcAc3TQ1dxQ2UmtcF+Ay5Z0fao
         Z8L76vBOv80zCiZiPU64mcAZtKloO6BkFeUzRQ810SoKTbiKVRvQTZA4C9i3yfNIVSRA
         Lrj6tojRwuOO4uI6gZrimWkIoPdlpeYyKWAbueiaAjNSd6ERahDYDcTz8Qi4KMxcjOwN
         K+CrdgSH6ozKxn9s1zOoX8DlrQ3aPAn4/nIdjaYvHW6Ifeas+ZA/lnX3dNAK2Th28lwB
         q6oA==
X-Gm-Message-State: AC+VfDzIP+HaMy+Ej5ybuUFpVXBFFoPSDZttt+T5AHIAciEMBSKvkvMi
        MKL5psfn7vRozl0xfM1+orDYIg==
X-Google-Smtp-Source: ACHHUZ4jV/fFHYVmJHIFWX5YYyvq2DO6Ztl2dE10nsLUPa3JM9Dl8QYQNK041AtNX4hZ2/9zrLf4Xg==
X-Received: by 2002:adf:f203:0:b0:30f:ca58:39ca with SMTP id p3-20020adff203000000b0030fca5839camr23923068wro.31.1687783329608;
        Mon, 26 Jun 2023 05:42:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d504a000000b00313e8dc7facsm5477055wrt.116.2023.06.26.05.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 05:42:07 -0700 (PDT)
Date:   Mon, 26 Jun 2023 15:42:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Ian Rogers <irogers@google.com>, Sasha Levin <sashal@kernel.org>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Ivan Babrou <ivan@cloudflare.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: Re: [PATCH v2] perf unwind: Fix map reference counts
Message-ID: <35569055-0873-4d5d-8c9c-78c818e9aa26@moroto.mountain>
References: <20230623043107.4077510-1-irogers@google.com>
 <64741e8e-e81a-afb9-9ce3-9c2d6baab44a@web.de>
 <CAP-5=fVwhiGJEqTST2bfX8cUALpnTxELSHrvKtyJEPjqQjOacQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fVwhiGJEqTST2bfX8cUALpnTxELSHrvKtyJEPjqQjOacQ@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jun 23, 2023 at 10:49:36AM -0700, Ian Rogers wrote:
> >
> > How do you think about to add the tag “Fixes”?
> 
> In general we've not been adding Fixes as there is a danger a backport
> will introduce a use-after-free.

I feel like we have been discussing issues around Perf backports
recently.  Wasn't there some build breakage that wasn't detected?  Why
not just ask Sasha to leave perf out of the -stable tree?

Also Sasha has a tag to explain that patch AAA is included because
patch BBB depends on it.  I feel like maybe those tags are backwards,
it would be nicer to tag AAA as depending on BBB.  That way we could
add the dependency tags here.

I think at Linaro we have recently been testing taking the latest Perf
tools and using them on older kernels.  I don't know the details around
why we can't just use the perf that ships with the kernel...

To tell the truth, I also don't really understand the problem for this
patch specifically. From what I can see, the Fixes tag would have been:

Fixes: 0dd5041c9a0e ("perf addr_location: Add init/exit/copy functions")

1) Adding a Fixes tag would have automatically prevented any backports.
2) I don't see any possible use after frees.  That probably means I have
identified the wrong Fixes tag?

I'm not going to dig further than that because I don't care.  I'm just
looking at it because Markus added kernel-janitors to the CC list.  But
for subsystems where I'm more involved then I always look at how a bug
is introduced.  That information is essential to me as a reviewer.  So
if I'm writing a patch and even if it's not a bug fix but let's say it
deletes dead code then I often include include the information under the
--- cut off line.

---
This dead code was introduced by commit 23423423 ("blah blah blah").

regards,
dan carpenter
