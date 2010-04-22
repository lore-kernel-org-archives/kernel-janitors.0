From: Greg KH <greg@kroah.com>
Date: Thu, 22 Apr 2010 16:24:20 +0000
Subject: Re: [patch] usb: testing the wrong variable in fs_create_by_name()
Message-Id: <20100422162420.GC30730@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422100052.GT29647@bicker>
In-Reply-To: <20100422100052.GT29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Alessio Igor Bogani <abogani@texware.it>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 22, 2010 at 12:00:52PM +0200, Dan Carpenter wrote:
> There is a typo here.  We should be testing "*dentry" which was just
> assigned instead of "dentry".  This could result in dereferencing an
> ERR_PTR inside either usbfs_mkdir() or usbfs_create().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Nice catch, thanks.  I'll go queue this up.

greg k-h
