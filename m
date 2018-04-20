From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 20 Apr 2018 08:39:09 +0000
Subject: Re: [PATCH] mfd: tps65911-comparator: Fix an off by one bug
Message-Id: <20180420083909.66a6t63s5q6vpwp7@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419134634.GA19793@mwanda>
 <20180420080943.jdbf7vtnkc33vbvd@dell>
 <20180420082150.u2oovqr4b4fd6vrq@mwanda>
In-Reply-To: <20180420082150.u2oovqr4b4fd6vrq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 20 Apr 2018, Dan Carpenter wrote:

> On Fri, Apr 20, 2018 at 09:09:43AM +0100, Lee Jones wrote:
> > On Thu, 19 Apr 2018, Dan Carpenter wrote:
> > 
> > > The tps_comparators[] array is used in two places.  We only access the
> > > COMP1 (1) and COMP2 (2) elements.  Unfortunately, we're accessing the
> > > wrong elements and also one element beyond the end of the array.  There
> > > was supposed to be a zero element at the start of the array which is
> > > isn't accessed but makes the math work out nicely.
> > 
> > I normally just apply patches from you, but this is a hack, right?
> 
> I liked it, I thought it was nice.  It uses 32 bytes but any fix was
> going to use *some* memory.  I don't have strong feelings about it
> though, if you want to write a different patch I can do that instead.

#define COMP                                    0
#define COMP1                                   1
#define COMP2                                   2

It's unclear what the defines mean, but if COMP really does exist (is
there a datasheet for this device?) then your solution is a suitable
one.  However, if there is a COMP, then why isn't it used?

If it doesn't actually exist then this would be more appropriate
change I think:

#define COMP1                                   0
#define COMP2                                   1

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
