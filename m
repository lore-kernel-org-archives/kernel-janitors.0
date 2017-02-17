From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Fri, 17 Feb 2017 08:18:25 +0000
Subject: Re: [bug report] net: Prepare gro for packet consuming gro callbacks
Message-Id: <20170217081824.GZ30338@gauss.secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170216201127.GA11170@mwanda>
In-Reply-To: <20170216201127.GA11170@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan.

On Thu, Feb 16, 2017 at 11:11:27PM +0300, Dan Carpenter wrote:
> Hello Steffen Klassert,
> 
> The patch 25393d3fc055: "net: Prepare gro for packet consuming gro
> callbacks" from Feb 15, 2017, leads to the following Smatch
> warning:
> 
> 	net/core/dev.c:4522 dev_gro_receive()
> 	error: 'pp' dereferencing possible ERR_PTR()
> 
> net/core/dev.c
>   4510          if (&ptype->list = head)
>   4511                  goto normal;
>   4512  
>   4513          if (IS_ERR(pp) && PTR_ERR(pp) = -EINPROGRESS) {
> 
> 
> Smatch sees this and assumes that it's possible for "pp" to be an error
> pointer that's not -EINPROGRESS.

pp can be either a vaild pointer, NULL or -EINPROGRESS,
nothing else. So I guess this is ok.

