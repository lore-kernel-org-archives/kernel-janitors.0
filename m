From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 10 Jun 2020 14:53:44 +0000
Subject: Re: exfat: Improving exception handling in two functions
Message-Id: <20200610145344.GA2102023@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b9272fb-b265-010b-0696-4c0579abd841@web.de>
 <208cba7b-e535-c8e0-5ac7-f15170117a7f@web.de>
In-Reply-To: <208cba7b-e535-c8e0-5ac7-f15170117a7f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-fsdevel@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Tetsuhiro Kohada <kohada.t2@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>

On Wed, Jun 10, 2020 at 11:27:58AM +0200, Markus Elfring wrote:
> Hello,
> 
> I have taken another look at pointer usage after calls of the function “brelse”.
> My source code analysis approach pointed implementation details
> like the following out for further software development considerations.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/exfat/namei.c?id=155ae4358baf4831609c2f9cd09396a2b8badf#n1078
> 
> …
> 		epold = exfat_get_dentry(sb, p_dir, oldentry + 1, &old_bh,
> 			&sector_old);
> 		epnew = exfat_get_dentry(sb, p_dir, newentry + 1, &new_bh,
> 			&sector_new);
> 		if (!epold || !epnew)
> 			return -EIO;
> …
> 
> I suggest to split such an error check.
> How do you think about to release a buffer head object for the desired
> exception handling if one of these function calls succeeded?
> 
> Would you like to adjust such code in the functions “exfat_rename_file”
> and “exfat_move_file”?
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
