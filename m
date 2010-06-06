From: Charles =?iso-8859-1?Q?Cl=E9ment?= <caratorn@gmail.com>
Date: Sun, 06 Jun 2010 19:03:40 +0000
Subject: Re: [PATCH] drivers/staging/pohmelfs: fix compile warning
Message-Id: <20100606190337.GA32104@fujitsu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275788460.10961.18.camel@lenovo>
In-Reply-To: <1275788460.10961.18.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi,

On Sun, Jun 06, 2010 at 12:40:40PM -0400, Javier Martinez Canillas wrote:

> Strange, I have a warning with last linux-next:
> 
> drivers/staging/pohmelfs/inode.c: In function ‘pohmelfs_put_super’:
> drivers/staging/pohmelfs/inode.c:1269: warning: ‘count’ may be used
> uninitialized in this function

I have the same warning with a gcc version 4.5.0 20100520 (prerelease).

-- 
Charles Clément

