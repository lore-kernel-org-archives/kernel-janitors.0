Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F48DC4743C
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 12:20:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F7DE6112D
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 12:20:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhFUMWd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Jun 2021 08:22:33 -0400
Received: from mga11.intel.com ([192.55.52.93]:15361 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229621AbhFUMWd (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Jun 2021 08:22:33 -0400
IronPort-SDR: 44/GvlYZpk2bSV/ZYI1/ZBOzdHLlgKfgwQZAa4lIlpG1A6VcusMZSmtDGWQm5II4M9x7jnD0zM
 6JejbqI9u9qA==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="203810327"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="203810327"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 05:20:19 -0700
IronPort-SDR: wTdkUDAeCf8a4p9HSCxKTyvBo8U6kIN/7BuU8CDNV5s6h0cZ7GMLTmZuXsYfDUGjsoUB3DSgOA
 ervLeQXZwkSA==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="486469414"
Received: from unknown (HELO [10.185.172.254]) ([10.185.172.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 05:20:16 -0700
Subject: Re: [Intel-wired-lan] [PATCH] igc: Fix an error handling path in
 'igc_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, kuba@kernel.org, jeffrey.t.kirsher@intel.com,
        sasha.neftin@intel.com
Cc:     netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org
References: <f24ae8234fedd1689fa0116038e10e4d3a033802.1623527947.git.christophe.jaillet@wanadoo.fr>
From:   "Fuxbrumer, Dvora" <dvorax.fuxbrumer@linux.intel.com>
Message-ID: <71d37297-1a79-ffea-03ae-a88c1a5a6ebf@linux.intel.com>
Date:   Mon, 21 Jun 2021 15:20:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f24ae8234fedd1689fa0116038e10e4d3a033802.1623527947.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/12/2021 23:00, Christophe JAILLET wrote:
> If an error occurs after a 'pci_enable_pcie_error_reporting()' call, it
> must be undone by a corresponding 'pci_disable_pcie_error_reporting()'
> call, as already done in the remove function.
> 
> Fixes: c9a11c23ceb6 ("igc: Add netdev")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/net/ethernet/intel/igc/igc_main.c | 1 +
>   1 file changed, 1 insertion(+)
> 
Tested-by: Dvora Fuxbrumer <dvorax.fuxbrumer@linux.intel.com>
