From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 May 2012 07:05:07 +0000
Subject: Re: [patch] [media] gspca: passing wrong length parameter to reg_w()
Message-Id: <20120502070507.GO6447@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120502061525.GC28894@elgon.mountain>
 <20120502084758.1a08823f@tele>
In-Reply-To: <20120502084758.1a08823f@tele>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 02, 2012 at 08:47:58AM +0200, Jean-Francois Moine wrote:
> Thanks for the patch. The bug is very very old (6 years, at least -
> neither have I such a webcam).
> 

My guess is that it's harmless to write a few extra garbage bits,
but it's still worth fixing as a cleanup.

> Maybe the fix could have been
> 
> 	reg_w(gspca_dev, 0x0010, reg10, sizeof reg10);
> 
> but it is OK for me.
> 
> Acked-by: Jean-Francois Moine <http://moinejf.free.fr>

Thanks.

regards,
dan carpenter

