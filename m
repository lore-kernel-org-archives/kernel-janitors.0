From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Jun 2016 13:27:49 +0000
Subject: Re: [patch] xfs: don't allow negative error tags
Message-Id: <20160624132749.GP32247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160624122234.GA23169@mwanda>
 <576D31B9.8010908@easystack.cn>
In-Reply-To: <576D31B9.8010908@easystack.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Liu <jeff.liu@easystack.cn>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

On Fri, Jun 24, 2016 at 09:12:25PM +0800, Jeff Liu wrote:
> Hi Dan,
> 
> xfs_errortag_add() is called by xfs_file_ioctl(), which accept the 1st
> argument as signed, i.e,
> 
> typedef struct xfs_error_injection {
> __s32 fd;
> __s32 errtag;
> } xfs_error_injection_t;
> 
> Should we make it happy as well? Also, the typedef can be converted to
> to struct xfs_error_injection by removing the depreciated
> xfs_error_injection_t
> syntax if so.

That has been the user interface for a while so I didn't want to change
it.

regards,
dan carpenter

