From: David Lebrun <dav.lebrun@gmail.com>
Date: Tue, 17 Jul 2018 16:03:13 +0000
Subject: Re: [PATCH] ipv6: sr: fix useless rol32 call on hash
Message-Id: <6ab9af97-33b6-d5cc-d1e9-6e5fbd9158a8@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180717155254.30367-1-colin.king@canonical.com>
In-Reply-To: <20180717155254.30367-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/17/2018 04:52 PM, Colin King wrote:
> From: Colin Ian King<colin.king@canonical.com>
> 
> The rol32 call is currently rotating hash but the rol'd value is
> being discarded. I believe the current code is incorrect and hash
> should be assigned the rotated value returned from rol32.
> 
> Detected by CoverityScan, CID#1468411 ("Useless call")
> 
> Fixes: b5facfdba14c ("ipv6: sr: Compute flowlabel for outer IPv6 header of seg6 encap mode")
> Signed-off-by: Colin Ian King<colin.king@canonical.com>

Acked-by: dlebrun@google.com

Good catch, thanks !

In that case, the same issue is present in 
include/net/ipv6.h:ip6_make_flowlabel().
