From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 21 Apr 2017 22:50:55 +0000
Subject: Re: [PATCH 2/2] lightnvm: don't print a warning for ADDR_EMPTY
Message-Id: <7db94fa9-302e-50fb-14cc-f8917cfeed5e@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421205437.fom72nbe3rfngdra@mwanda>
In-Reply-To: <20170421205437.fom72nbe3rfngdra@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Matias Bjorling <mb@lightnvm.io>, =?UTF-8?Q?Javier_Gonz=c3=a1lez?= <jg@lightnvm.io>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 04/21/2017 02:54 PM, Dan Carpenter wrote:
> Reading from ADDR_EMPTY is out of bounds.  The current code generates a
> static checker warning because we check for out of bounds "lba" before
> we check for ADDR_EMPTY, so the second check is always false.  It looks
> like we intended ADDR_EMPTY to be a no-op without printing a warning.
> 
> Fixes: a4bd217b4326 ("lightnvm: physical block device (pblk) target")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Added, thanks Dan.

-- 
Jens Axboe

