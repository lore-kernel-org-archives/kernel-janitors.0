From: Marek Lindner <lindner_marek@yahoo.de>
Date: Sun, 06 Nov 2011 14:16:46 +0000
Subject: Re: [B.A.T.M.A.N.] [PATCH 1/5] net/batman-adv: use kstrtoul, etc
Message-Id: <201111062216.46584.lindner_marek@yahoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1320586010-21931-1-git-send-email-julia@diku.dk> <1320586010-21931-2-git-send-email-julia@diku.dk>
In-Reply-To: <1320586010-21931-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: b.a.t.m.a.n@lists.open-mesh.org
Cc: Julia Lawall <julia@diku.dk>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Wunderlich <siwu@hrz.tu-chemnitz.de>, "David S. Miller" <davem@davemloft.net>

On Sunday, November 06, 2011 21:26:46 Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use kstrtoul, etc instead of the now deprecated strict_strtoul, etc.

Thanks for the patch but we already have a patch lined up to address the 
issue. It will be submitted to net-next in the next week or so.

Regards,
Marek
