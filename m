From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 13 Aug 2015 12:22:34 +0000
Subject: Re: [patch] paride: fix a return in pd_detect()
Message-Id: <20150813121034.GA4938@sudip-pc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150812210843.GC8068@mwanda>
In-Reply-To: <20150812210843.GC8068@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tim Waugh <tim@cyberelk.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Thu, Aug 13, 2015 at 12:08:43AM +0300, Dan Carpenter wrote:
> In this function returning non-zero means the hardware was detected and
> zero means it wasn't.  This is a failure path so we should return zero.
> 
> Fixes: 9f4ba6b05869 ('paride: use new parport device model')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

regards
sudip
