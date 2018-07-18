From: David Miller <davem@davemloft.net>
Date: Wed, 18 Jul 2018 22:11:46 +0000
Subject: Re: [PATCH] ipv6: sr: fix useless rol32 call on hash
Message-Id: <20180719.071146.1992073818180515891.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180717155254.30367-1-colin.king@canonical.com>
In-Reply-To: <20180717155254.30367-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Jul 2018 16:52:54 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The rol32 call is currently rotating hash but the rol'd value is
> being discarded. I believe the current code is incorrect and hash
> should be assigned the rotated value returned from rol32.
> 
> Detected by CoverityScan, CID#1468411 ("Useless call")
> 
> Fixes: b5facfdba14c ("ipv6: sr: Compute flowlabel for outer IPv6 header of seg6 encap mode")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied and queued up for -stable.
