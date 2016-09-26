From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Mon, 26 Sep 2016 17:38:14 +0000
Subject: Re: [PATCH 5/5] ISDN-Gigaset: Enclose two expressions for the sizeof operator by parentheses
Message-Id: <248e685c-4875-7acc-afaf-8b2ce00bb5f5@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
 <e97b38b6-8c02-6733-8b57-9786bfb911a6@users.sourceforge.net>
In-Reply-To: <e97b38b6-8c02-6733-8b57-9786bfb911a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, Paul Bolle <pebolle@tiscali.nl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Hello.

On 09/26/2016 06:44 PM, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 26 Sep 2016 17:03:56 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
>
> The script "checkpatch.pl" can point information out like the following.
>
> WARNING: sizeof … should be sizeof(…)
>
> Thus fix the affected source code places.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/isdn/gigaset/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/isdn/gigaset/common.c b/drivers/isdn/gigaset/common.c
> index 2e9382f..d901ed7 100644
> --- a/drivers/isdn/gigaset/common.c
> +++ b/drivers/isdn/gigaset/common.c
> @@ -53,7 +53,7 @@ void gigaset_dbg_buffer(enum debuglevel level, const unsigned char *msg,
>  {
>  	unsigned char outbuf[80];
>  	unsigned char c;
> -	size_t space = sizeof outbuf - 1;
> +	size_t space = sizeof(outbuf - 1);

    What?! Does that compile?

[...]

MBR, Sergei

