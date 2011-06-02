From: Alan Stern <stern@rowland.harvard.edu>
Date: Thu, 02 Jun 2011 15:17:08 +0000
Subject: Re: [PATCH] drivers/usb/gadget/inode.c: add missing kfree
Message-Id: <Pine.LNX.4.44L0.1106021110390.1913-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1106021656060.430@ask.diku.dk>
References: <1307003186-23244-1-git-send-email-julia@diku.dk>
In-Reply-To: <1307003186-23244-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: David Brownell <dbrownell@users.sourceforge.net>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2 Jun 2011, Julia Lawall wrote:

> > I don't think it matters.  This check is probably there only for 
> > safety; it should not be possible for dev->buf to be non-NULL at this 
> > point.  You ought to be able to remove the entire
> > 
> > 	if (dev->buf)
> > 		goto fail;
> > 
> > statement with no ill effects.
> 
> I can send such a patch if you think it is OK.  But I have no way to test 
> it.

I don't either, since as far as I know the "if" condition can never be 
true.  You may be able to verify this just by reading the code.  Note 
that dev_config is used only as a field in dev_init_operations, which 
is used only in the gadgetfs_fill_super routine and therefore only when 
a file in this filesystem is opened.

Note also that the only time dev->buf becomes non-NULL is when
dev_config() succeeds, at which point fd->f_op is switched from
dev_init_operations to ep0_io_operations.  Therefore dev_config()
cannot be called successfully more than once for the same open file.

Alan Stern

