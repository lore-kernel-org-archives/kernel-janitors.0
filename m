From: "Arend van Spriel" <arend@broadcom.com>
Date: Fri, 24 Feb 2012 11:15:01 +0000
Subject: Re: [patch] brcm80211: fmac: fix a couple checking after dereference bugs
Message-Id: <4F477135.2030804@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120224062226.GA27261@elgon.mountain>
In-Reply-To: <20120224062226.GA27261@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Roland Vossen <rvossen@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 02/24/2012 07:22 AM, Dan Carpenter wrote:
> There were two dereferencing before checking for NULL static checker
> complaints in this new file.  The list cursor is never NULL so that
> check can be removed.  I moved the other dereference after the check.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>

Acked-by: Arend van Spriel <arend@broadcom.com>

Gr. AvS


