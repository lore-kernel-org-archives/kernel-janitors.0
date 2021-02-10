From: Jessica Yu <jeyu@kernel.org>
Date: Wed, 10 Feb 2021 16:17:56 +0000
Subject: Re: [PATCH] module: potential uninitialized return in module_kallsyms_on_each_symbol()
Message-Id: <YCQHNI3bowhhnRD+@gunter>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YCO8AwE57IzaMamG@mwanda>
In-Reply-To: <YCO8AwE57IzaMamG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Petr Mladek <pmladek@suse.com>, Miroslav Benes <mbenes@suse.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

+++ Dan Carpenter [10/02/21 13:57 +0300]:
>Smatch complains that:
>
>	kernel/module.c:4472 module_kallsyms_on_each_symbol()
>        error: uninitialized symbol 'ret'.
>
>This warning looks like it could be correct if the &modules list is
>empty.
>
>Fixes: 013c1667cf78 ("kallsyms: refactor {,module_}kallsyms_on_each_symbol")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!

Jessica
