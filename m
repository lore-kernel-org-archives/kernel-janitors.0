From: Christoph Hellwig <hch@lst.de>
Date: Mon, 25 Oct 2010 18:44:03 +0000
Subject: Re: [patch] hfsplus: fix double lock typo in ioctl
Message-Id: <20101025184403.GA18094@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101025045326.GW5985@bicker>
In-Reply-To: <20101025045326.GW5985@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Frederic Weisbecker <fweisbec@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Oct 25, 2010 at 06:53:27AM +0200, Dan Carpenter wrote:
> This was supposed to be a mutex_unlock() instead of a mutex_lock().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks,

applied.

