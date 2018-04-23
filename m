From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Apr 2018 11:54:21 +0000
Subject: Re: [patch] CIFS: set *resp_buf_type to NO_BUFFER on error
Message-Id: <20180423115421.sz6qqz6dsu6zpxd5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131841.GC31552@mwanda>
In-Reply-To: <20170207131841.GC31552@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Apr 22, 2018 at 10:30:00AM -0500, Steve French wrote:
> Looks like missed merging this one.  The code paths have changed
> around this - but on error they seem to ignore the resp_buf_type
> field, but looks like it would be cleaner to initialize it, so created
> an updated patch to do roughly the same thing and merged into
> cifs-2.6.git for-next
> 
> 
> Dan,
> Any objections?
>

I don't have any objections.  It sounds like you already wrote the patch
or were you asking me to do that?  Either way is fine.

regards,
dan carpenter

