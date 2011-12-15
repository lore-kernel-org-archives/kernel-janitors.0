From: "Arend van Spriel" <arend@broadcom.com>
Date: Thu, 15 Dec 2011 11:49:52 +0000
Subject: Re: [patch] brcm80211: smac: precendence bug in
Message-Id: <4EE9DEE0.9050703@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111215112332.GA3906@elgon.mountain>
In-Reply-To: <20111215112332.GA3906@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Henry Ptasinski <henryp@broadcom.com>, Roland Vossen <rvossen@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 12/15/2011 12:23 PM, Dan Carpenter wrote:
> Negate has higher precendence than compare and since neither zero nor
> one are equal to four or eight the original condition is always false.
> 

Acked-by: Arend van Spriel <arend@broadcom.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Gr. AvS

