From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Oct 2010 10:55:24 +0000
Subject: Re: [patch] hfsplus: fix double lock typo in ioctl
Message-Id: <201010251255.24670.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101025045326.GW5985@bicker>
In-Reply-To: <20101025045326.GW5985@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Christoph Hellwig <hch@tuxera.com>, Frederic Weisbecker <fweisbec@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Monday 25 October 2010, Dan Carpenter wrote:
> This was supposed to be a mutex_unlock() instead of a mutex_lock().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

