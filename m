From: Greg KH <greg@kroah.com>
Date: Wed, 11 May 2011 21:14:01 +0000
Subject: Re: [PATCH 00/12] staging: usbip: miscellaneous code cleanup
Message-Id: <20110511211401.GC4893@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305103212.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfmooney@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 11, 2011 at 01:54:12AM -0700, matt mooney wrote:
> Hi Greg,
> 
> I am interested in hearing your thoughts on the userspace interface?

Which one?  The user/kernel interface?

> Even as is, it definitely needs some work. For one thing I was thinking
> of removing the debug flag from userspace. The userspace utilites are
> not using it anyway, and it is not 100% working yet.

I haven't looked at the interface much yet, what is your issue with the
debug flag?

To make things easier, and allow you to be able to change the userspace
interface, I suggest moving the userspace code into the kernel tree, and
building it here.  That would allow you to move forward with changing
things easier, doing it all in one place allows you to keep stuff in
sync, and provides people an easier way to actually get the needed tools
to drive the code.

What do you think about doing that?

I've applied a number of these patches, care to respin the others and
resend them based on my latest tree?

thanks,

greg k-h
