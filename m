From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 10 Jul 2010 16:38:53 +0000
Subject: Re: [PATCH] atmel: unregister_netdev() on error
Message-Id: <20100710163853.GA4695@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278767508-10164-1-git-send-email-segooon@gmail.com>
 <20100710141204.GY19184@bicker>
In-Reply-To: <20100710141204.GY19184@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Simon Kelley <simon@thekelleys.org.uk>, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <shemminger@vyatta.com>, Eric Dumazet <eric.dumazet@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org

On Sat, Jul 10, 2010 at 16:12 +0200, Dan Carpenter wrote:
> > +err_out_unreg:
> > +	unregister_netdev(dev);
> 	^^^^^^^^^^^^^^^^^^^^^^
> > +
> 
> What the pants?  :P
Hmm, I've slightly misunderstood the code, sorry.

Thanks, Dan.
