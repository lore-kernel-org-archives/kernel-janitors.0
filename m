From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 02 May 2012 20:06:39 +0000
Subject: Re: [PATCH] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <20120502200639.GA26017@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, May 02, 2012 at 07:13:37PM +0300, Tomas Melin wrote:
> -Simplified function logic by assuming that n_chan >1 if not <=1. Removes
> one level of indentation.
> -> readability improved and code fits into 80 chars
> - Code indentation fixes, corrected comments
> - Added braces to if() for readability

Please break this up into one-change-per-patch, so it can be reviewed
easier and accepted properly.

thanks,

greg k-h
