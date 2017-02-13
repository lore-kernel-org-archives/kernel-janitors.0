From: Timur Tabi <timur@codeaurora.org>
Date: Mon, 13 Feb 2017 13:03:19 +0000
Subject: Re: [patch net-next] net: qcom/emac: fix a sizeof() typo
Message-Id: <23c98d90-913d-f590-2677-096bf5dc15ff@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170213110021.GA17205@mwanda> <58A19E97.6000704@bfs.de>
In-Reply-To: <58A19E97.6000704@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de, Dan Carpenter <dan.carpenter@oracle.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

walter harms wrote:
> We have a function where the argument is ignored and the rest is const ?
>
> emac_ethtool_get_regs_len seems the only user. So it would be fairly easy to
> move that into that function.
>
> @maintainer:
> Is there a deeper logic behind this ?

I don't understand the question.

The patch is valid (I have no idea how I made that mistake).

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
