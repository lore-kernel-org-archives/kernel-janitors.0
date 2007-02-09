From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 09 Feb 2007 06:44:37 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <1171002757.3571.47.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2007-02-09 at 10:47 +0530, Mehul Jani wrote:
> xdr4.c

Mehul like I said...xdr4.c needs a simple macro that does not check type
at all. 

If my understanding of the min/max use is correct then they use default
type checking and min_t/max_t use the type that 'we' specify...so end
result-they are both bound to type-meaning they would both have
statements in expression-resulting in compilation failure as xdr*.c uses
them inside struct initializations.

But the macro that would work in xdr*.c would look something like the
below:

#define min_s(x,y) ((x)>(y)?(x):(y))

But with the above we need to make sure that x and y are not expressions
if we dont want them to be evaluated twice and hence cause other
probs ;)

So either we modify min/max in kernel.h - this means a lot more cleanup
or add another macro say min_s/max_s --- s for simple :) 

Unless we don't do that, it may not be possible to cleanup files like
xdr*.c

-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
