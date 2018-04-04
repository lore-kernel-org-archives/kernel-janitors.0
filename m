From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Apr 2018 12:19:27 +0000
Subject: Re: [bug report] net: thunderx: add ndo_set_rx_mode callback implementation for VF
Message-Id: <20180404121927.d4f2td7xv3in3gou@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180404111645.GA26736@mwanda>
In-Reply-To: <20180404111645.GA26736@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Apr 04, 2018 at 05:15:28AM -0700, Vadim Lomovtsev wrote:
> Hello Dan,
> 
> Thank you for your feedback on this.
> 
> I'll update driver accordingly with next patch series.
> 
> Sorry for wasting your time, my bad - I should check such things at my side.
> 

I'm just forwarding static checker output.  It's not like I'm judging
you or that I've never skipped a kmalloc() check...

regards,
dan carpenter

