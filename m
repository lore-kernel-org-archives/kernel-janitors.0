From: Dan Carpenter <error27@gmail.com>
Date: Sun, 26 Sep 2010 13:11:51 +0000
Subject: Re: [PATCH] staging: ft1000: fix error path
Message-Id: <20100926131151.GC6134@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285491595-377-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1285491595-377-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Marek Belisko <marek.belisko@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sun, Sep 26, 2010 at 12:59:55PM +0400, Vasiliy Kulikov wrote:
> +err_free:
> +	for (i--; i>=0; i--) {
> +		kfree(pdpram_blk->pbuffer);
> +		kfree(pdpram_blk);
> +	}

This is wrong.  I don't have linux-next so I can't see the context, why
are we looping here?  The second iteration through the loop will cause a
NULL dereference.

Also there should be spaces before and after the ">=".

regards,
dan carpenter

> +	return STATUS_FAILURE;
>  }
>  

