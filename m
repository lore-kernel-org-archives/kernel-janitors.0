From: Matthew Wilcox <willy@infradead.org>
Date: Mon, 18 Feb 2019 14:32:38 +0000
Subject: Re: [PATCH] fs: drop pointless static qualifier in bdev_cache_init()
Message-Id: <20190218143238.GR12668@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218141417.134355-1-maowenan@huawei.com>
In-Reply-To: <20190218141417.134355-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Feb 18, 2019 at 10:14:17PM +0800, Mao Wenan wrote:
> There is no need to have the struct vfsmount *bd_mnt with static
> since new value always be assigned before use it.

No.  The point is to keep a copy of bd_mnt around.  Putting it on the
stack would lead to it being overwritten.
