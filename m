From: Jeff Garzik <jeff@garzik.org>
Date: Wed, 20 Feb 2008 16:51:32 +0000
Subject: Re: [PATCH] drivers/net/cs89x0.c: compilation warning fix
Message-Id: <47BC5A94.8060908@garzik.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200802171823.15759.lpotenza@inwind.it>
In-Reply-To: <200802171823.15759.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Potenza <lpotenza@inwind.it>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Leonardo Potenza wrote:
> From: Leonardo Potenza <lpotenza@inwind.it>
> 
> Suppress the warning message about the 'netcard_portlist' defined but not used.
> 
> Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
> ---
> 
> When building cs89x0 as a module, the following warning message is generated:
> drivers/net/cs89x0.c:198: warning: 'netcard_portlist' defined but not used
> 
> Since the netcard_portlist is not so big, I just marked the array as __used.

applied


