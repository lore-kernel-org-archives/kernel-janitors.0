From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 08 Jul 2020 20:32:38 +0000
Subject: Re: [PATCH][next] net: systemport: fix double shift of a vlan_tci by VLAN_PRIO_SHIFT
Message-Id: <3e581bfd-7447-881f-1e0b-9ab1ccd4496d@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200708183723.1212652-1-colin.king@canonical.com>
In-Reply-To: <20200708183723.1212652-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 7/8/2020 11:37 AM, Colin King wrote:
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

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

The change was forward ported from a 4.9 kernel where the shift is not
done, I should have checked the helper usage, thanks!
-- 
Florian
