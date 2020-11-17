From: Nathan Chancellor <natechancellor@gmail.com>
Date: Tue, 17 Nov 2020 01:55:25 +0000
Subject: Re: [PATCH] scsi: sd: remove obsolete variable in sd_remove()
Message-Id: <20201117015525.GA801777@ubuntu-m3-large-x86>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201116070035.11870-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201116070035.11870-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>, "Martin K . Petersen" <martin.petersen@oracle.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 16, 2020 at 08:00:35AM +0100, Lukas Bulwahn wrote:
> Commit 140ea3bbf39a ("sd: use __register_blkdev to avoid a modprobe for an
> unregistered dev_t") removed blk_register_region(devt, ...) in sd_remove()
> and since then, devt is unused in sd_remove().
> 
> Hence, make W=1 warns:
> 
>   drivers/scsi/sd.c:3516:8:
>       warning: variable 'devt' set but not used [-Wunused-but-set-variable]
> 
> Simply remove this obsolete variable.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
