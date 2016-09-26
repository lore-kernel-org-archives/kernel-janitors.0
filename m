From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 26 Sep 2016 15:06:56 +0000
Subject: Re: [2/3] hostap: Delete an unnecessary jump label in prism2_ioctl_priv_hostapd()
Message-Id: <20160926150656.54D1A613F9@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <65ed528f-7ec5-a0f2-6219-3e63a78ca0ee@users.sourceforge.net>
In-Reply-To: <65ed528f-7ec5-a0f2-6219-3e63a78ca0ee@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Jouni Malinen <j@w1.fi>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 20 Aug 2016 18:21:29 +0200
> 
> Remove a jump label which is unneeded in this function at the end.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

2 patches set to Rejected.

9291771 [2/3] hostap: Delete an unnecessary jump label in prism2_ioctl_priv_hostapd()
9291775 [3/3] hostap: Delete unnecessary initialisations for the variable "ret"

Reason: The benefit is not clear.

-- 
https://patchwork.kernel.org/patch/9291771/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

