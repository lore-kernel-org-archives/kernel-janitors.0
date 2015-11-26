From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 26 Nov 2015 13:01:27 +0000
Subject: Re: rtlwifi: Delete unnecessary checks before the function call"kfree_skb"
Message-Id: <20151126130127.DDFC3140731@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <5649C99E.2070602@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>


> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 16 Nov 2015 13:12:25 +0100
> 
> The kfree_skb() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
