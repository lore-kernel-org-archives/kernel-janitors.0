From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Jun 2019 09:07:34 +0000
Subject: Re: [bug report] lib/vdso: Provide generic VDSO implementation
Message-Id: <20190627090734.GD5715@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627071521.GA22903@mwanda>
In-Reply-To: <20190627071521.GA22903@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jun 27, 2019 at 09:58:18AM +0100, Vincenzo Frascino wrote:
> >    119	fallback:
> >    120		return clock_gettime_fallback(clock, (struct __kernel_timespec *)res);
> >                                                                                  ^^^
> > On x86 this "res" always gets dereferenced.
> > 
> >    121	}
> > 
> 
> I am not sure I understand the details of this bug report. As far as I can see
> "res" is never dereferenced in the vDSO library in this case, but it is passed
> to the system call unchanged.
>

Oh yeah.  Sorry.  My bad.  False positive.  clock_gettime_fallback()
doesn't necessarily dereference "res".

regards,
dan carpenter
