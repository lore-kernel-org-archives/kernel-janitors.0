From: Pierre Louis Aublin <pierre-louis.aublin@inria.fr>
Date: Mon, 22 Aug 2011 14:11:24 +0000
Subject: Re: [PATCH 4/4] drivers/net/wireless/mwifiex/scan.c: test the just-initialized
Message-Id: <4E52638C.8080407@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314021636-11528-4-git-send-email-julia@diku.dk>
In-Reply-To: <1314021636-11528-4-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Bing Zhao <bzhao@marvell.com>, kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello all

On 08/22/2011 04:00 PM, Julia Lawall wrote:
> -	if (!bss_desc) {
> +	if (!beacon_ie) {
>   		dev_err(priv->adapter->dev, " failed to alloc bss_desc\n");
Shouldn't we also modify the error message, from "failed to alloc 
bss_desc" to "failed to alloc beacon_ie" ?

Sincerely
Pierre Louis Aublin
