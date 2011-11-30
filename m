From: "Franky Lin" <frankyl@broadcom.com>
Date: Wed, 30 Nov 2011 18:42:45 +0000
Subject: Re: [patch] brcm80211: fmac: small memory leak on error
Message-Id: <4ED67925.6040603@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111130084937.GI6268@elgon.mountain>
In-Reply-To: <20111130084937.GI6268@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "John W. Linville" <linville@tuxdriver.com>
Cc: Arend Van Spriel <arend@broadcom.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, Alwin Beukers <alwin@broadcom.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 11/30/2011 12:49 AM, Dan Carpenter wrote:
> We should free "bus_if" here, it's a small leak but it makes the static
> checkers happy.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>

Thanks, Dan.

Acked-by: Franky Lin <frankyl@broadcom.com>

Franky

