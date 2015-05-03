From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 03 May 2015 18:14:02 +0000
Subject: Re: [PATCH 3/3] staging/lustre/llite: move some procfs files to sysfs
Message-Id: <20150503181402.GC24370@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430622608-30402-4-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430622608-30402-4-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, May 02, 2015 at 11:10:08PM -0400, green@linuxhacker.ru wrote:
> From: Oleg Drokin <green@linuxhacker.ru>
> 
> Move just first few files from /proc/fs/lustre/llite/*/
> to /sys/fs/lustre/llite/*/:
> blocksize    filesfree   fstype       kbytesfree   max_read_ahead_mb
> client_type  filestotal  kbytesavail  kbytestotal  uuid
> 
> More to follow.

Document please, try just doing one file per patch to make it easier to
understand and review.  And again, one value per file.

thanks,

greg k-h
