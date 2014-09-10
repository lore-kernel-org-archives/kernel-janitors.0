From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Sep 2014 11:05:25 +0000
Subject: Re: [patch] usb: gadget: f_fs: signedness bug in __ffs_func_bind_do_descs()
Message-Id: <20140910110525.GP6549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140909120609.GB19760@mwanda>
In-Reply-To: <20140909120609.GB19760@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 09, 2014 at 06:37:02PM +0200, Michal Nazarewicz wrote:
> On Tue, Sep 09 2014, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Tue, Sep 09, 2014 at 03:57:26PM +0200, Michal Nazarewicz wrote:
> >> On Tue, Sep 09 2014, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >> > Btw, there is a sparse warning:
> >> >
> >> > drivers/usb/gadget/function/f_fs.c:401:44: warning: Variable length array is used.
> >> >
> >> > The risk here is that the array would be too large.  I don't know the
> >> > code well enough to say if it can be triggered, but from an outsider
> >> > perspective it looks scary (security implications).  There should be a
> >> > comment explaining why it can't be used to overflow the 8k stack.
> >> 
> >> n in that function can be at most 4
> >
> > I looked for where this limit is set but couldn't figure it out.  Which
> > function is it?
> 
> The limit is never explicitly set, but logic in this function guarantees
> it:
> 

Ok.  Thanks.  I maybe could have found this on my own because I store
this sort of information in Smatch except that "ev" is an anonymous
struct.

regards,
dan carpenter

