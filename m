From: Arend van Spriel <arend.vanspriel@broadcom.com>
Date: Sat, 20 Aug 2016 19:26:42 +0000
Subject: Re: [PATCH 0/3] hostap: Fine-tuning for a few functions
Message-Id: <3b3c91ad-3225-3483-bb58-fdee33bf2290@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <f0cd7a82-e603-6a91-0afd-33bbd1658cab@users.sourceforge.net>
In-Reply-To: <f0cd7a82-e603-6a91-0afd-33bbd1658cab@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Jouni Malinen <j@w1.fi>, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On 20-08-16 18:43, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 20 Aug 2016 18:35:43 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.

Is it worth touching this old stuff especially when you are not making
any functional changes.

Regards,
Arend

> Markus Elfring (3):
>   Use memdup_user()
>   Delete an unnecessary jump label
>   Delete unnecessary variable initialisations
> 
>  .../net/wireless/intersil/hostap/hostap_ioctl.c    | 36 ++++++++--------------
>  1 file changed, 12 insertions(+), 24 deletions(-)
> 
