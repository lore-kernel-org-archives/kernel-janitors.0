From: David Miller <davem@davemloft.net>
Date: Mon, 24 Dec 2018 22:49:11 +0000
Subject: Re: [PATCH][V2] drivers/net: appletalk/cops: remove redundant if statement and mask
Message-Id: <20181224.144911.772423671168046343.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181224194146.11511-1-colin.king@canonical.com>
In-Reply-To: <20181224194146.11511-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Dec 2018 19:41:46 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The two different assignments for pkt_len are actually the same and
> so the if statement is redundant and can be removed.  Masking a u8
> return value from inb() with 0xFF is also redundant and can also be
> emoved.
> 
> Similarly, the two different outb calls are identical as the mask
> of 0xff on the second outb is redundant since a u8 is being written,
> so the if statement is also redundant and can be also removed.
> 
> Detected by CoverityScan, CID#1475639 ("Identical code for different
> branches")
> 
> ---
> 
> V2: Remove the if statement for the outb calls, thanks to David
> Miller for spotting this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Colin, I almost didn't notice how the "---" there is in the wrong spot
and therefore was cutting out your changelog and signoff.

I fixed it up, but please be more careful in the future.

Thanks.
