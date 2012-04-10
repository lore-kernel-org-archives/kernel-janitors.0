From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Apr 2012 07:49:59 +0000
Subject: Re: [PATCH 2/2] qlcnic: Remove redundant NULL check on kfree().
Message-Id: <20120410074959.GA4393@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1333951879-3230-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1333951879-3230-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh nayak <santoshprasadnayak@gmail.com>
Cc: anirban.chakraborty@qlogic.com, rajesh.borundia@qlogic.com, sony.chacko@qlogic.com, linux-driver@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 09, 2012 at 11:41:19AM +0530, santosh nayak wrote:
> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> kfree() checks for NULL before freeing the memory.
> Remove redundant NULL check.
> This is just a clean up and also looks good from performance point of view.

I doubt it has any impact on performance.

[snip]

>  static void qlcnic_free_lb_filters_mem(struct qlcnic_adapter *adapter)
>  {
> -	if (adapter->fhash.fmax && adapter->fhash.fhead)
> -		kfree(adapter->fhash.fhead);
> -
> +	kfree(adapter->fhash.fhead);

This changes how the code works.  That's very sloppy to not notice
that.  If you did notice it, it should be justified in the
changelog.  :(

>  	adapter->fhash.fhead = NULL;
>  	adapter->fhash.fmax = 0;
>  }

regards,
dan carpenter
