From: David Miller <davem@davemloft.net>
Date: Fri, 03 Jan 2020 00:31:30 +0000
Subject: Re: [PATCH 13/16] ptp: ptp_clockmatrix: constify copied structure
Message-Id: <20200102.163130.2142256837162342774.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
        <1577864614-5543-14-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-14-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@inria.fr
Cc: richardcochran@gmail.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed,  1 Jan 2020 08:43:31 +0100

> The idtcm_caps structure is only copied into another structure,
> so make it const.
> 
> The opportunity for this change was found using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied to net-next.
