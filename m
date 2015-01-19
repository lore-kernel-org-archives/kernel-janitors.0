From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Jan 2015 17:46:58 +0000
Subject: Re: [patch 2/6] usb: gadget: uvc: cleanup __uvcg_fill_strm()
Message-Id: <20150119174658.GD6456@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150114210107.GB23203@mwanda>
In-Reply-To: <20150114210107.GB23203@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 19, 2015 at 10:09:44AM -0600, Felipe Balbi wrote:
> On Fri, Jan 16, 2015 at 01:44:44PM +0100, Andrzej Pietrasiewicz wrote:
> > W dniu 16.01.2015 o 13:12, Dan Carpenter pisze:
> > >Oh, yeah.  You're right.  I should have been more careful and I should
> > >have seen that.  Sorry.  But the problem is the original code is still a
> > >bit buggy.
> > >
> > >We call:
> > >
> > >	data = kzalloc();
> > >
> > >Inside __uvcg_fill_strm() we do "data += something;"
> > >
> > >	kfree(data);
> > >
> > >We should save the orignal data pointer so that we can free it
> > >correctly at the end in uvcg_streaming_class_allow_link().
> > >
> > Yeah, right. Thank you for spotting this. The kfree() is called
> > only if __uvcg_fill_strm() fails, though. But of course this needs
> > to be fixed.
> 
> so, should I wait for another version of $subject ?
> 

My patch should just be reverted.  It was totally wrong.  There is a bug
"in theory, but not in reality" that Andrzej should fix as well.

regards,
dan carpenter

