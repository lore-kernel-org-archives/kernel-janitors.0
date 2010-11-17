From: David Miller <davem@davemloft.net>
Date: Wed, 17 Nov 2010 20:30:21 +0000
Subject: Re: [PATCH] net: ipv4: tcp_probe: cleanup snprintf() use
Message-Id: <20101117.123021.241451290.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289754368-31660-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1289754368-31660-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segoon@openwall.com
Cc: kernel-janitors@vger.kernel.org, kuznet@ms2.inr.ac.ru, pekkas@netcore.fi, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segoon@openwall.com>
Date: Sun, 14 Nov 2010 20:06:08 +0300

> snprintf() returns number of bytes that were copied if there is no overflow.
> This code uses return value as number of copied bytes.  Theoretically format
> string '%lu.%09lu %pI4:%u %pI4:%u %d %#x %#x %u %u %u %u\n' may be expanded
> up to 163 bytes.  In reality tv.tv_sec is just few bytes instead of 20, 2 ports
> are just 5 bytes each instead of 10, length is 5 bytes instead of 10.  The rest
> is an unstrusted input.  Theoretically if tv_sec is big then copy_to_user() would
> overflow tbuf.
> 
> tbuf was increased to fit in 163 bytes.  snprintf() is used to follow return
> value semantic.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Applied, thanks.
