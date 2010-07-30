From: Dan Carpenter <error27@gmail.com>
Date: Fri, 30 Jul 2010 14:07:04 +0000
Subject: Re: [PATCH 3/9] staging: otus: check kmalloc() return value
Message-Id: <20100730140704.GB26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280488080-20777-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280488080-20777-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alexander Beregalov <a.beregalov@gmail.com>, Tejun Heo <tj@kernel.org>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Fri, Jul 30, 2010 at 03:08:00PM +0400, Kulikov Vasiliy wrote:
>  	if (size > 0) {
>  		buf = kmalloc(size, GFP_KERNEL);
> +		if (buf = NULL) {
> +			pr_err("zfwUsbSubmitControl() failed, "
> +				  "kmalloc() returned NULL\n");

This isn't a big deal, but the pr_err() isn't needed.  kmalloc() already
prints a message unless __GFP_NOWARN is used.

regards,
dan carpenter


