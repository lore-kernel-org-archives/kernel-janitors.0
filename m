From: Christoph Hellwig <hch@lst.de>
Date: Wed, 10 Feb 2021 11:59:53 +0000
Subject: Re: [PATCH] module: potential uninitialized return in module_kallsyms_on_each_symbol()
Message-Id: <20210210115953.GA28552@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YCO8AwE57IzaMamG@mwanda>
In-Reply-To: <YCO8AwE57IzaMamG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@lst.de>, Petr Mladek <pmladek@suse.com>, Miroslav Benes <mbenes@suse.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
