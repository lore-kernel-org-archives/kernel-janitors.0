From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Fri, 14 Feb 2014 15:42:42 +0000
Subject: Re: [patch v2] w1: small type cleanup in sysfs
Message-Id: <85681392392562@web18h.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140211164513.GF5530@spacedout.fries.net> <20140211210755.GA25579@elgon.mountain>
In-Reply-To: <20140211210755.GA25579@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Fries <david@fries.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi

12.02.2014, 01:08, "Dan Carpenter" <dan.carpenter@oracle.com>:
> On 64 bit systems, a large value for "long tmp" is truncated when
> assigning to "int md->max_slave_count" so we still end up with a value
> less than one despite the "tmp < 1" check.
>
> This is more of a problem for static checkers than a real life issue,
> but it's simple enough to fix.
>
> Acked-by: David Fries <david@fries.net>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good to me, thank you
Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
