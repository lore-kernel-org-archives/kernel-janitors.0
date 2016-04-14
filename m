From: Shaohua Li <shli@kernel.org>
Date: Thu, 14 Apr 2016 16:57:00 +0000
Subject: Re: [patch v2] md/raid0: fix uninitialized variable bug
Message-Id: <20160414165700.GA2006@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160413170240.GB6186@kernel.org>
 <20160414093149.GA16549@mwanda>
In-Reply-To: <20160414093149.GA16549@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 14, 2016 at 12:31:49PM +0300, Dan Carpenter wrote:
> If this function fails the callers expect that *private_conf is set to
> an ERR_PTR() but that isn't true for the first error path where we can't
> allocate "conf".  It leads to some uninitialized variable bugs.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
