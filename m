From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Date: Tue, 01 Aug 2017 23:19:18 +0000
Subject: Re: [PATCH 3/3] lib/test_kmod: fix fs module tests
Message-Id: <20170801231918.GA18884@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170707083933.2mgnpqafhspbwu7h@mwanda>
 <20170707084117.jbi3g364jz75liay@mwanda>
In-Reply-To: <20170707084117.jbi3g364jz75liay@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 07, 2017 at 11:41:17AM +0300, Dan Carpenter wrote:
> The break was in the wrong place so file system tests don't work as
> intended.

More importantly it leaked memory per test switch as well.
> 
> Fixes: 39258f448d71 ("kmod: add test driver to stress test the module loader")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, queued!

  Luis
