From: Jiri Slaby <jirislaby@gmail.com>
Date: Tue, 05 May 2009 13:35:04 +0000
Subject: Re: p80211wext.c: problem with IW_ENCODE_ALG_WEP
Message-Id: <4A004088.7000907@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0905051522010.9552@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0905051522010.9552@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: richard@rsk.demon.co.uk, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/05/2009 03:22 PM, Julia Lawall wrote:
> -		if (!(ext->alg & IW_ENCODE_ALG_WEP)) {
> +		if (ext->alg != IW_ENCODE_ALG_WEP) {
>  			pr_debug("asked to set a non wep key :(");

While you're at it, there is a missing \n. Care to post a fix for that too?
