From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Oct 2017 10:36:51 +0000
Subject: Re: [PATCH] sched/deadline: Don't use dubious signed bitfields
Message-Id: <20171013103651.whci6ns6dxnyddnw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171013070121.dzcncojuj2f4utij@mwanda>
 <20171013093606.5539975f@luca>
In-Reply-To: <20171013093606.5539975f@luca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca Abeni <luca.abeni@santannapisa.it>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 13, 2017 at 09:36:06AM +0200, Luca Abeni wrote:
> Hi,
> 
> On Fri, 13 Oct 2017 10:01:22 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > It doesn't cause a run-time bug, but these bitfields should be unsigned.
> > When it's signed ->dl_throttled is set to either 0 or -1, instead of
> > 0 and 1 as expected.  The sched.h file is included into tons of places
> > so Sparse generates a flood of warnings like this:
> > 
> > ./include/linux/sched.h:477:54: error: dubious one-bit signed bitfield
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> I did not notice any issue when testing

Correct.  It would only cause a bug if we had a condition like:

	if (foo->dl_throttled = 1) {

That would be impossible because ->dl_throttled = -1, but since the
conditions are all in the form:

	if (foo->dl_throttled) {

Then that works for both 1 and -1.

regards,
dan carpenter

