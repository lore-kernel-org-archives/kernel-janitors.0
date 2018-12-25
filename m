From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Tue, 25 Dec 2018 08:06:08 +0000
Subject: Re: [PATCH][V2] drivers/net: appletalk/cops: remove redundant if statement and mask
Message-Id: <322fb722-cf17-896a-cbf4-27ac796d0c7a@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181224194146.11511-1-colin.king@canonical.com>
In-Reply-To: <20181224194146.11511-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 24.12.2018 22:41, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The two different assignments for pkt_len are actually the same and
> so the if statement is redundant and can be removed.  Masking a u8
> return value from inb() with 0xFF is also redundant and can also be
> emoved.

    Removed. :-)

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
[...]

MBR, Sergei
