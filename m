From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 10 Nov 2018 13:03:29 +0000
Subject: Re: [PATCH -next] sysv: return 'err' instead of 0 in __sysv_write_inode
Message-Id: <20181110130329.GE32577@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541823204-45068-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541823204-45068-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Christoph Hellwig <hch@infradead.org>, David Howells <dhowells@redhat.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Nov 10, 2018 at 04:13:24AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> fs/sysv/inode.c: In function '__sysv_write_inode':
> fs/sysv/inode.c:239:6: warning:
>  variable 'err' set but not used [-Wunused-but-set-variable]
> 
> __sysv_write_inode should return 'err' instead of 0
> 
> Fixes: 05459ca81ac3 ("repair sysv_write_inode(), switch sysv to simple_fsync()")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
