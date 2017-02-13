From: Timur Tabi <timur@codeaurora.org>
Date: Mon, 13 Feb 2017 15:43:10 +0000
Subject: Re: [patch net-next] net: qcom/emac: fix a sizeof() typo
Message-Id: <ec77175e-7531-ace6-9e4d-02d95edc9ea9@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170213110021.GA17205@mwanda> <58A19E97.6000704@bfs.de>
 <23c98d90-913d-f590-2677-096bf5dc15ff@codeaurora.org>
 <58A1B492.9000103@bfs.de>
In-Reply-To: <58A1B492.9000103@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

walter harms wrote:
> The question is: why is a simple calculation const*const
> separated into a function ?

This is a callback function.  That's just how it's defined.

It's rare, but there are drivers that use the parameter, like this one:

http://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/tree/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c#n591

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
