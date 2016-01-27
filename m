From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Jan 2016 14:15:07 +0000
Subject: Re: [PATCH 0/2] mmc-host: Fine-tuning for one function
Message-Id: <CAPDyKFrDuon00_ts-EgmtS1WJnC_sCBVwFyOeSZBB5FjpzFv7A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	<5682F3AC.7050107@users.sourceforge.net>
In-Reply-To: <5682F3AC.7050107@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, Sascha Sommer <saschasommer@freenet.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On 29 December 2015 at 21:57, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 29 Dec 2015 21:54:14 +0100
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (2):
>   Delete unnecessary variable initialisations in sdricoh_init_mmc()
>   Less checks in sdricoh_init_mmc() after error detection
>
>  drivers/mmc/host/sdricoh_cs.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> --
> 2.6.3
>

Thanks, applied for next - with some minor change to the prefix of the
commit message header.

Kind regards
Uffe
