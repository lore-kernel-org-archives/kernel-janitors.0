From: Christoph Hellwig <hch@infradead.org>
Date: Sat, 10 Nov 2018 08:32:04 +0000
Subject: Re: [PATCH -next] sysv: return 'err' instead of 0 in __sysv_write_inode
Message-Id: <20181110083204.GA28614@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541823204-45068-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541823204-45068-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Christoph Hellwig <hch@infradead.org>, David Howells <dhowells@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Al, can you queue it up?
