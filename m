From: Greg KH <greg@kroah.com>
Date: Thu, 05 Jan 2012 16:43:58 +0000
Subject: Re: [patch -longterm v2] V4L/DVB: v4l2-ioctl: integer overflow in
Message-Id: <20120105164358.GA26153@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111215063445.GA2424@elgon.mountain>
 <4EE9BC25.7020303@infradead.org>
 <201112151033.35153.hverkuil@xs4all.nl>
 <4EE9C2E6.1060304@infradead.org>
 <20120103205539.GC17131@kroah.com>
 <20120105062822.GB10230@mwanda>
In-Reply-To: <20120105062822.GB10230@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, stable@vger.kernel.org

On Thu, Jan 05, 2012 at 09:28:22AM +0300, Dan Carpenter wrote:
> If p->count is too high the multiplication could overflow and
> array_size would be lower than expected.  Mauro and Hans Verkuil
> suggested that we cap it at 1024.  That comes from the maximum
> number of controls with lots of room for expantion.
> 
> $ grep V4L2_CID include/linux/videodev2.h | wc -l
> 211
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

So this patch is only for 2.6.32?  But the original needs to get into
Linus's tree first (which is what I'm guessing the other patch you sent
is, right?)

thanks,

greg k-h
