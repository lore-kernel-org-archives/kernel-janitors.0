From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 23 Aug 2019 17:24:07 +0000
Subject: Re: staging: vt6656: Use common error handling code in vnt_alloc_bufs()
Message-Id: <10006e33-ed90-74ec-4d59-4074caf4ecd4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <91e8a9b7-e79d-dafc-10b8-dd79eb59eff9@web.de>
 <20190823145540.GA2536@qd-ubuntu>
In-Reply-To: <20190823145540.GA2536@qd-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

 Your patch remove redundant code, which is fine.

Thanks for your constructive feedback.


> code you changed was simple enough to be understand quickly. I think replacing
> it with a crossed goto (even if it remove redundant code) might not be the best
> option.
>
> A solution might be to move the second loop to the top of the function

I am unsure about the relevance of the loop ordering for the affected
resource allocations.


> so you should be able to replace the end of the cleanup calls with:
>
> enomem:
> 	ret = -ENOMEM;
> free_rx:
> 	vnt_free_rx_bufs(priv);
> 	return ret;

The exception handling can eventually adjusted another bit according
to your refactoring.


> This way, only a failed call to vnt_submit_rx_urb() should jump to free_rx,

It seems that a goto statement will still be needed in an error code
part by both discussed variants.


> another failed call should jump to enomem or previously defined
> label, so we can correctly forward errors.

This view sounds promising.


> With such solution it might be worth adding a comment to describe
> that all error should be ENOMEM except for vnt_submit_rx_urb().

Can this function implementation become clearer also without
such a comment?

Regards,
Markus
