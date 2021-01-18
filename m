From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Jan 2021 12:20:11 +0000
Subject: Re: [PATCH] media: zr364xx: fix memory leaks in probe()
Message-Id: <20210118122011.GA2696@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/WMfVDCsxRghKHH@mwanda>
 <196887f5-677f-0aeb-5f5c-fb4a918d6128@xs4all.nl>
In-Reply-To: <196887f5-677f-0aeb-5f5c-fb4a918d6128@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Antoine Jacquet <royale@zerezo.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-usb@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com

On Wed, Jan 13, 2021 at 05:13:41PM +0100, Hans Verkuil wrote:
> Hi Dan,
> 
> On 06/01/2021 11:10, Dan Carpenter wrote:
> > Syzbot discovered that the probe error handling doesn't clean up the
> > resources allocated in zr364xx_board_init().  There are several
> > related bugs in this code so I have re-written the error handling.
> > 
> > 1)  Introduce a new function zr364xx_board_uninit() which cleans up
> >     the resources in zr364xx_board_init().
> > 2)  In zr364xx_board_init() if the call to zr364xx_start_readpipe()
> >     fails then release the "cam->buffer.frame[i].lpvbits" memory
> >     before returning.  This way every function either allocates
> >     everything successfully or it cleans up after itself.
> > 3)  Re-write the probe function so that each failure path goto frees
> >     the most recent allocation.  That way we don't free anything
> >     before it has been allocated and we can also verify that
> >     everything is freed.
> > 4)  Originally, in the probe function the "cam->v4l2_dev.release"
> >     pointer was set to "zr364xx_release" near the start but I moved
> >     that assignment to the end, after everything had succeeded.  The
> >     release function was never actually called during the probe cleanup
> >     process, but with this change I wanted to make it clear that we
> >     don't want to call zr364xx_release() until everything is
> >     allocated successfully.
> > 
> > Next I re-wrote the zr364xx_release() function.  Ideally this would
> > have been a simple matter of copy and pasting the cleanup code from
> > probe and adding an additional call to video_unregister_device().  But
> > there are several quirks to note.
> > 
> > 1)  The original code never called video_unregister_device().  In other
> >     words, this is an additional bugfix.
> 
> Not a bug, see below.
> 

Thanks for reviewing this.  I will fix a send a v2.  I should have seen
that.

The layering here is sort of confusing in a way...  But not anything
that needs to be dealt with immediately.

regards,
dan carpenter
