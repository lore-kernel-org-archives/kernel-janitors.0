From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2020 18:45:17 +0000
Subject: Re: [PATCH v2] exfat: add missing brelse() calls on error paths
Message-Id: <20200610184517.GC4282@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610172213.GA90634@mwanda>
 <740ce77a-5404-102b-832f-870cbec82d56@web.de>
In-Reply-To: <740ce77a-5404-102b-832f-870cbec82d56@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Tetsuhiro Kohada <kohada.t2@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>

On Wed, Jun 10, 2020 at 08:12:46PM +0200, Markus Elfring wrote:
> > If the second exfat_get_dentry() call fails then we need to release
> > "old_bh" before returning.  There is a similar bug in exfat_move_file().
> 
> Would you like to convert any information from this change description
> into an imperative wording?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id[14671be58d0084e7e2d1cc9c2c36a94467f6e0#n151

I really feel like imperative doesn't add anything.  I understand that
some people feel really strongly about it, but I don't know why.  It
doesn't make commit messages more understandable.

The important thing is that the problem is clear, the fix is clear and
the runtime impact is clear.

regards,
dan carpenter
