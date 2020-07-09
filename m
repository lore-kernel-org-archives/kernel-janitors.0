From: David Miller <davem@davemloft.net>
Date: Thu, 09 Jul 2020 20:07:17 +0000
Subject: Re: [PATCH][next] net: systemport: fix double shift of a vlan_tci by VLAN_PRIO_SHIFT
Message-Id: <20200709.130717.943617001507092696.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200708183723.1212652-1-colin.king@canonical.com>
In-Reply-To: <20200708183723.1212652-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: f.fainelli@gmail.com, kuba@kernel.org, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  8 Jul 2020 19:37:23 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the u16 skb->vlan_tci is being right  shifted twice by
> VLAN_PRIO_SHIFT, once in the macro skb_vlan_tag_get_pri and explicitly
> by VLAN_PRIO_SHIFT afterwards. The combined shift amount is larger than
> the u16 so the end result is always zero.  Remove the second explicit
> shift as this is extraneous.
> 
> Fixes: 6e9fdb60d362 ("net: systemport: Add support for VLAN transmit acceleration")
> Addresses-Coverity: ("Operands don't affect result")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
