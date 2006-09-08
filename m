From: Amol Lad <amol@verismonetworks.com>
Date: Fri, 08 Sep 2006 07:59:15 +0000
Subject: Re: [KJ] [PATCH] MIN/MAX cleanup
Message-Id: <1157701635.4310.27.camel@amol.teneoris.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157631741.2452.30.camel@amol.teneoris.com>
In-Reply-To: <1157631741.2452.30.camel@amol.teneoris.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

include/linux/kernel.h:

#define min(x,y) ({ \
    typeof(x) _x = (x); \
    typeof(y) _y = (y); \
    (void) (&_x = &_y); \
    _x < _y ? _x : _y; })

The casts are required as these macros do very strict type checking (see
&_x = &_y compare at line 4). 

Compiler throws up a warning if min/max are passed arguments of
different types..



On Fri, 2006-09-08 at 13:19, Henk Vergonet wrote:
> On Thu, Sep 07, 2006 at 05:52:21PM +0530, Amol Lad wrote:
> > Cleanups done to use min/max macros from kernel.h. Handcrafted MIN/MAX
> > macros in some drivers are changed to use macros from kernel.h
> > 
> > +      clength = MIN((word)(270-length),(word) (X[i].PLength-this->XOffset));
> 
> What is the rationale behind all those type casts?
> 
> Should we now also write:
> 	if(uint > (unsigned int)300) {
> instead of
> 	if(uint > 300) {
> 
> Can someone explain this? 
> 
> - rme

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
