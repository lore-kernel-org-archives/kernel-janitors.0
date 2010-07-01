From: Simon Horman <horms@verge.net.au>
Date: Thu, 01 Jul 2010 23:28:48 +0000
Subject: Re: [PATCH 11/16] staging/otus: use ARRAY_SIZE
Message-Id: <20100701232848.GE27096@verge.net.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277983381-29424-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1277983381-29424-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, Andrea Gelmini <andrea.gelmini@gelma.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Thu, Jul 01, 2010 at 03:23:00PM +0400, Kulikov Vasiliy wrote:
> Change sizeof(x) / sizeof(*x) to ARRAY_SIZE(x).
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

FWIW, Reviewed-by: Simon Horman <horms@verge.net.au>
