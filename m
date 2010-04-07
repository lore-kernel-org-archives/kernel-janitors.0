From: Linus WALLEIJ <linus.walleij@stericsson.com>
Date: Wed, 07 Apr 2010 12:53:14 +0000
Subject: RE: [patch] i2c: off by one issue
Message-Id: <CEE6BB42CAD6E947908279175AF8470A03A50DA2@EXDCVYMBSTM006.EQ1STM.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100407092258.GD5157@bicker>
In-Reply-To: <20100407092258.GD5157@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Jean Delvare (PC drivers, core)" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>
Cc: "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Jean Delvare <khali-ReZ1+7V3V0tg9hUCZPvPmw@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Lameter <cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

> If we don't find the correct rate, we want to end the loop with "i"
> pointing to the last element in the array.

Good catch!
Acked-by: Linus Walleij <linus.walleij@stericsson.com>

Yours,
Linus Walleij
