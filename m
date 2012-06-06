From: "Franky Lin" <frankyl@broadcom.com>
Date: Wed, 06 Jun 2012 23:43:10 +0000
Subject: Re: [PATCH 5/7] drivers/net/wireless/brcm80211/brcmfmac/bcmsdh.c: adjust suspicious bit
Message-Id: <4FCFEB0E.2020206@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr>
 <1339018901-28439-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1339018901-28439-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Brett Rudley <brudley@broadcom.com>, kernel-janitors@vger.kernel.org, Roland Vossen <rvossen@broadcom.com>, Arend van Spriel <arend@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com, Julia Lawall <julia@diku.dk>

On 06/06/2012 02:41 PM, Julia Lawall wrote:
> From: Julia Lawall<Julia.Lawall@lip6.fr>
>
> IRQF_TRIGGER_HIGH is 0x00000004, so it seems that&  was intended rather than |.
>
> This problem was found using Coccinelle (http://coccinelle.lip6.fr/).
>
> Signed-off-by: Julia Lawall<julia@diku.dk>

Thanks, Julia. But this has already been fixed by Joe Perches [1] and 
the patch has arrived at Linux wireless tree.

Franky

[1] https://lkml.org/lkml/2012/5/30/482

