From: Christian Lamparter <chunkeey@googlemail.com>
Date: Mon, 30 Dec 2013 18:10:10 +0000
Subject: Re: [PATCH 3/11] mac80211: use ether_addr_equal_64bits
Message-Id: <1458346.msaUrcf9Zq@debian64>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388427307-8691-1-git-send-email-Julia.Lawall@lip6.fr> <1388427307-8691-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388427307-8691-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Subject: p54: use ether_addr_equal_64bits

On Monday, December 30, 2013 07:14:59 PM you wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Ether_addr_equal_64bits is more efficient than ether_addr_equal, and can be
> used when each argument is an array within a structure that contains at
> least two bytes of data beyond the array.
> 
> The structures involved are:
> ieee80211_hdr defined in include/linux/ieee80211.h and
> p54_common defined in drivers/net/wireless/p54/p54.h
> 
> This was done using Coccinelle (http://coccinelle.lip6.fr/).
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Alright, I changed the subject to "p54: ..." (John, can you do that, or do
you want another patch?). Since this has not much to do with mac80211. 

Acked-by: Christian Lamparter <chunkeey@googlemail.com>

Regards,

Christian
