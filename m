From: Harald Welte <laforge@gnumonks.org>
Date: Sun, 18 Apr 2010 20:04:49 +0000
Subject: Re: [patch] pcmcia: fix error handling in cm4000_cs.c
Message-Id: <20100418200449.GA18200@prithivi.gnumonks.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100418190732.GA7920@bicker>
In-Reply-To: <20100418190732.GA7920@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, H Hartley Sweeten <hsweeten@visionengravers.com>, Andrew Morton <akpm@linux-foundation.org>, Roel Kluin <roel.kluin@gmail.com>, Jiri Slaby <jirislaby@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Sun, Apr 18, 2010 at 10:07:33PM +0300, Dan Carpenter wrote:

> In the original code we used -ENODEV as the number of bytes to
> copy_to_user() and we didn't release the locks.

Thanks for pointing this out!
 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Harald Welte <laforge@gnumonks.org>

-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
======================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
