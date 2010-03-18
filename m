From: Dan Carpenter <error27@gmail.com>
Date: Thu, 18 Mar 2010 08:55:04 +0000
Subject: Re: bug list: range checking issues 2.6.34-rc1
Message-Id: <20100318085504.GL5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201003151002.18928.toralf.foerster@gmx.de> <20100315101146.GL18181@bicker> <adar5nj9aae.fsf@roland-alpha.cisco.com>
In-Reply-To: <adar5nj9aae.fsf@roland-alpha.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier@cisco.com>
Cc: Toralf =?iso-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 16, 2010 at 03:22:33PM -0700, Roland Dreier wrote:
>  > > drivers/infiniband/core/user_mad.c +646 ib_umad_reg_agent() 'umm' 4 <= 6
>  >    641                          u32 *umm = (u32 *) ureq.method_mask;
>  >    642                          int i;
>  >    643  
>  >    644                          for (i = 0; i < BITS_TO_LONGS(IB_MGMT_MAX_METHODS); ++i)
>  >    645                                  req.method_mask[i] >  >    646                                          umm[i * 2] | ((u64) umm[i * 2 + 1] << 32);
>  > "umm" points to a array with 4 elements.
>  > i can be 0 to 3, so "i * 2" goes up to 6
>  > And 4 <= 6 so it's a problem.
>  > Smatch also complained about "i * 2 + 1" but I didn't include that. 
> 
> It's a bit tricky, but I believe this is a false positive.  The code in
> question is compatibility handling for 32-bit userspace on a 64-bit
> kernel.  In that case the range of i will be 0 to 1 (IB_MGMT_MAX_METHODS
> is 128, so BITS_TO_LONGS on that is 2), and so we will only access
> elements 0, 1, 2, and 3 of umm[], which is OK.
> 
> (Not sure how easily a static checker could find this; the code in
> question is guarded by test of compat_method_mask, which can only be 1
> if ib_umad_reg_agent() is called from ib_umad_compat_ioctl(), which will
> only be built with CONFIG_COMPAT set, which can only happen on a 64-bit
> architecture -- but it seems a bit hard for a checker to follow all that)

Smatch doesn't handle anything between functions yet.  Once it does you
could do something like:

compat_method_mask = get_possible_range(this parameter);
That would only be zero, because the other code is #ifdefed out.
Then the rest is simple enough.

It will take some months to get the inter-function stuff working though.

regards,
dan carpenter

> -- 
> Roland Dreier  <rolandd@cisco.com>
> For corporate legal information go to:
> http://www.cisco.com/web/about/doing_business/legal/cri/index.html
