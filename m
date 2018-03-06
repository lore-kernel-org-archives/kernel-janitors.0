From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 06 Mar 2018 10:38:15 +0000
Subject: Re: [PATCH] ipmi: missing error code in try_smi_init()
Message-Id: <20180306103814.t7qtksa4vkn3emgy@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180306095803.GA10474@mwanda>
In-Reply-To: <20180306095803.GA10474@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 06, 2018 at 11:26:19AM +0100, Julia Lawall wrote:
> 
> 
> On Tue, 6 Mar 2018, Dan Carpenter wrote:
> 
> > If platform_device_alloc() then we should return -ENOMEM instead of
> > returning success.
> 
> It looks like the word "fails" got lost here.
> 

Thanks.  Let me resend.

regards,
dan carpenter

