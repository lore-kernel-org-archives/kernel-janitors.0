From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Apr 2013 06:28:50 +0000
Subject: Re: [patch] [media] dt3155v4l: unlock on error path
Message-Id: <20130409062850.GI23861@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130409051540.GA1516@longonot.mountain>
 <alpine.DEB.2.02.1304090719480.2019@hadrien>
In-Reply-To: <alpine.DEB.2.02.1304090719480.2019@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Bill Pemberton <wfp5p@virginia.edu>, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 09, 2013 at 07:20:19AM +0200, Julia Lawall wrote:
> On Tue, 9 Apr 2013, Dan Carpenter wrote:
> 
> > We should unlock here and do some cleanup before returning.
> >
> > We can't actually hit this return path with the current code, so this
> > patch is a basically a cleanup and doesn't change how the code works.
> 
> Why keep the return path then?  If the code is there, someone reading it
> could naturally assume that it is necessary.

There are sanity checks in vb2_queue_init() but this caller always
passes a sane "pd->q" pointer so the sanity checks always succeed.
That might change in later code.  ;)

I like the code as it is, but I just wanted to note that the impact
of this patch is zero in case anyone was backporting fixes.

regards,
dan carpenter

