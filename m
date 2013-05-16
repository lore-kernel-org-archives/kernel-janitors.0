From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 16 May 2013 19:01:30 +0000
Subject: Re: [PATCH] staging: lustre: fix return type of lo_release.
Message-Id: <20130516190130.GB2778@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1368720380-20974-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1368720380-20974-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: kernel-janitors@vger.kernel.org, andreas.dilger@intel.com, tao.peng@emc.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Thu, May 16, 2013 at 06:06:20PM +0200, Cyril Roelandt wrote:
> The return type of block_device_operations.release() changed to void in commit
> db2a144b.

Interesting, how did you test build this patch, given that the driver
doesn't currently build at all?  :)

Anyway, thanks, I'll go queue this up.

greg k-h
