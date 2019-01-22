From: Luis Chamberlain <mcgrof@kernel.org>
Date: Tue, 22 Jan 2019 19:47:17 +0000
Subject: Re: [PATCH] lib/test_kmod: Potential double free in error handling
Message-Id: <20190122194716.GC11489@garbanzo.do-not-panic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190121140011.GA14283@kadam>
In-Reply-To: <20190121140011.GA14283@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 21, 2019 at 05:00:11PM +0300, Dan Carpenter wrote:
> There is a copy and paste bug so we set "config->test_driver" to NULL
> twice instead of setting "config->test_fs".  Smatch complains that it
> leads to a double free:
> 
> lib/test_kmod.c:840 __kmod_config_init() warn: 'config->test_fs' double freed
> 
> Fixes: d9c6a72d6fa2 ("kmod: add test driver to stress test the module loader")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks!

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

 Luis
