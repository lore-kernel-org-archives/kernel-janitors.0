From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Date: Tue, 01 Aug 2017 23:16:17 +0000
Subject: Re: [PATCH 2/3] lib/test_kmod: take the lock in register_test_dev_kmod()
Message-Id: <20170801231617.GZ18884@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170707083933.2mgnpqafhspbwu7h@mwanda>
 <20170707084036.f6jxmffxk67qtmce@mwanda>
In-Reply-To: <20170707084036.f6jxmffxk67qtmce@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 07, 2017 at 11:40:36AM +0300, Dan Carpenter wrote:
> We accidentally just drop the lock twice instead of taking it and then
> releasing it.
> 
> Fixes: 39258f448d71 ("kmod: add test driver to stress test the module loader")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, queued!

  Luis
