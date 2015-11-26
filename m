From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 26 Nov 2015 12:04:50 +0000
Subject: Re: brcm80211: Delete an unnecessary check before the function call"release_firmware"
Message-Id: <20151126120450.AA72313F2A0@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <563C5DA2.3000005@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Arend van Spriel <arend@broadcom.com>, Brett Rudley <brudley@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, brcm80211-dev-list@broadcom.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>


> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 6 Nov 2015 08:48:23 +0100
> 
> The release_firmware() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Acked-by: Arend van Spriel <arend@broadcom.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
