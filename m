From: Miroslav Benes <mbenes@suse.cz>
Date: Wed, 10 Feb 2021 12:08:39 +0000
Subject: Re: [PATCH] module: potential uninitialized return in module_kallsyms_on_each_symbol()
Message-Id: <alpine.LSU.2.21.2102101307030.14803@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YCO8AwE57IzaMamG@mwanda>
In-Reply-To: <YCO8AwE57IzaMamG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@lst.de>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 10 Feb 2021, Dan Carpenter wrote:

> Smatch complains that:
> 
> 	kernel/module.c:4472 module_kallsyms_on_each_symbol()
>         error: uninitialized symbol 'ret'.
> 
> This warning looks like it could be correct if the &modules list is
> empty.
> 
> Fixes: 013c1667cf78 ("kallsyms: refactor {,module_}kallsyms_on_each_symbol")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Miroslav Benes <mbenes@suse.cz>

M
