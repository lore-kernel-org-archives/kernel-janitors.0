From: Joe Perches <joe@perches.com>
Date: Mon, 22 Aug 2016 16:18:57 +0000
Subject: Re: [PATCH 0/3] hostap: Fine-tuning for a few functions
Message-Id: <1471882737.3746.55.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
         <f0cd7a82-e603-6a91-0afd-33bbd1658cab@users.sourceforge.net>
         <3b3c91ad-3225-3483-bb58-fdee33bf2290@broadcom.com>
         <87shtwvm63.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87shtwvm63.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Jouni Malinen <j@w1.fi>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, 2016-08-22 at 18:49 +0300, Kalle Valo wrote:
> Arend van Spriel <arend.vanspriel@broadcom.com> writes:
[]
> But yeah, not really sure what to do with these obsolete drivers like
> hostap, ray_cs and wl3501.

Maybe marking sections obsolete in MAINTAINERS could
flag some "shouldn't touch this" warning for old code
in checkpatch.pl and/or get_maintainer.pl
