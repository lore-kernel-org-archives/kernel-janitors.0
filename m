From: Jakub Kicinski <kuba@kernel.org>
Date: Thu, 17 Dec 2020 19:02:31 +0000
Subject: Re: [PATCH][next] octeontx2-af: Fix undetected unmap PF error check
Message-Id: <20201217110231.4b798ecb@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BYAPR18MB2679726F785B910EA9325ADCC5C40@BYAPR18MB2679.namprd18.prod.outlook.com>
In-Reply-To: <BYAPR18MB2679726F785B910EA9325ADCC5C40@BYAPR18MB2679.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Cherian <gcherian@marvell.com>
Cc: Colin King <colin.king@canonical.com>, Sunil Kovvuri Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geethasowjanya Akula <gakula@marvell.com>, Jerin Jacob Kollanukkaran <jerinj@marvell.com>, "David S . Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, 17 Dec 2020 05:24:34 +0000 George Cherian wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently the check for an unmap PF error is always going to be false because
> > intr_val is a 32 bit int and is being bit-mask checked against 1ULL << 32.  Fix
> > this by making intr_val a u64 to match the type at it is copied from, namely
> > npa_event_context->npa_af_rvu_ge.
> > 
> > Addresses-Coverity: ("Operands don't affect result")
> > Fixes: f1168d1e207c ("octeontx2-af: Add devlink health reporters for NPA")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>  
> Acked-by: George Cherian <george.cherian@marvell.com>

For some reason patchwork did not register your ack automatically. 
I wonder what happened. I added it manually.

Applied, thanks!
