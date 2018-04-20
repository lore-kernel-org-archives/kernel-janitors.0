From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2018 08:21:50 +0000
Subject: Re: [PATCH] mfd: tps65911-comparator: Fix an off by one bug
Message-Id: <20180420082150.u2oovqr4b4fd6vrq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419134634.GA19793@mwanda>
 <20180420080943.jdbf7vtnkc33vbvd@dell>
In-Reply-To: <20180420080943.jdbf7vtnkc33vbvd@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 20, 2018 at 09:09:43AM +0100, Lee Jones wrote:
> On Thu, 19 Apr 2018, Dan Carpenter wrote:
> 
> > The tps_comparators[] array is used in two places.  We only access the
> > COMP1 (1) and COMP2 (2) elements.  Unfortunately, we're accessing the
> > wrong elements and also one element beyond the end of the array.  There
> > was supposed to be a zero element at the start of the array which is
> > isn't accessed but makes the math work out nicely.
> 
> I normally just apply patches from you, but this is a hack, right?
> 

I liked it, I thought it was nice.  It uses 32 bytes but any fix was
going to use *some* memory.  I don't have strong feelings about it
though, if you want to write a different patch I can do that instead.

regards,
dan carpenter

