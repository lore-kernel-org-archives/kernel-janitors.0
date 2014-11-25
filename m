From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Nov 2014 17:20:35 +0000
Subject: Re: [patch] x86_64, traps: always true condition
Message-Id: <20141125172035.GH4893@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141125164439.GE19894@mwanda>
In-Reply-To: <20141125164439.GE19894@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Nov 25, 2014 at 09:12:35AM -0800, Andy Lutomirski wrote:
> On Nov 25, 2014 8:44 AM, "Dan Carpenter" <dan.carpenter@oracle.com> wrote:
> >
> > We should be checking IS_ERR() here.  PTR_ERR() is always true.
> >
> > Fixes: b645af2d5905 ('x86_64, traps: Rework bad_iret')
> 
> Huh?
> 
> I agree with the change, but the Fixes line looks wrong.
> 


Oops.  Sorry for that, it was the fe3d197f8431 ('x86, mpx: On-demand
kernel allocation of bounds tables') change.  I will resend.

regards,
dan carpenter

