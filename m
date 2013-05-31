From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 31 May 2013 16:46:57 +0000
Subject: Re: [Patch 2/2] Staging: winbond: Memory & urb freed
Message-Id: <alpine.DEB.2.02.1305311845240.2232@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A8C27B.9090003@gmail.com>
In-Reply-To: <51A8C27B.9090003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 31 May 2013, Dan Carpenter wrote:

> On Fri, May 31, 2013 at 09:48:58PM +0530, Harsh Kumar wrote:
> >
> >
> > On Friday 31 May 2013 09:27 PM, Dan Carpenter wrote:
> > > On Fri, May 31, 2013 at 09:02:11PM +0530, Harsh Kumar wrote:
> > >> Memory & urb should be freed before exiting from the function, I think.
> > >>
> > >
> > > They are freed in Wb35Reg_EP0VM_complete() so this patch will make
> > > the system crash right away.  Btw, there are tons of real bugs that
> > > I know about but which I don't fix because I don't know what the
> > > right thing to do is.
> > >
> >
> > Ohh! Sorry, I missed it. That is why I was not sure about submitting this
> > change. I need to be more thorough in checking this stuff.
> >
> > I have general question - Generally, shouldn't allocation and freeing up the
> > memory be in the same function so that it is easy to make sure that everything
> > is freed up after completion of task? Is it because there maybe certain cases
> > where that may not be feasible or desirable to do so?
>
> Unfortunately kernel programming will never be 100% easy...  :P  In
> the end you will learn the tricks just like I did.  Here was my
> thought process here:
> 1) The commit message was not convincing.
> 2) The memory was saved to reg->reg_first.
> 3) Follow the Wb35Reg_EP0VM_start() call to the urb_submit point.
> 4) See that we pass Wb35Reg_EP0VM_complete() to urb_submit function.
>    I have worked on usb drivers before so I suspected that
>    Wb35Reg_EP0VM_complete() frees the urb.
> 5) Vefiried that this is true.  Done.
>
> Or alternatively:
> 3) Find reg_first in Wb35Reg_EP0VM_complete() and see that we free
>    it.
>
> Make sure you have cscope configured in vim.  Also in vim the '*'
> button searches.
>
> If you think you have found a bug but you're not sure, feel free to
> ask on kernel janitors.  Probably for new code it's not the right
> mailing list but for code audits it's fine.

I tend to look at other examples nearby.  If other similar functions are
freeing something, then it probably needs to be freed.  If not, then it
might seem more promising to try to figure out why.

julia
