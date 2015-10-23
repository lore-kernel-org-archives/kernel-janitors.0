From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Oct 2015 08:16:59 +0000
Subject: Re: [patch] igbvf: integer overflow in igbvf_change_mtu()
Message-Id: <20151023081659.GB7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151022091013.GC9202@mwanda>
In-Reply-To: <20151022091013.GC9202@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Oh...  Hm.  I was a bit confused by what Walter was saying.  But there
already is an integer overflow check here so it can't actually be
negative...  I added it a couple years ago.

Forget about this patch.  Sorry.

regards,
dan carpenter

