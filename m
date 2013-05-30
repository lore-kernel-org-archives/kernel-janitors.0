From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 May 2013 06:52:25 +0000
Subject: Re: [patch] minix: bug widening a binary "not" operation
Message-Id: <20130530065225.GL23987@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130516075148.GA7494@elgon.mountain>
 <20130529152826.043e95791122bbd39fc9d005@linux-foundation.org>
In-Reply-To: <20130529152826.043e95791122bbd39fc9d005@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 29, 2013 at 03:28:26PM -0700, Andrew Morton wrote:

> But we should fix it to set a good example, and to quieten
> whatever-tool-i-suspect-you-were-using(?).

Linus wrote some Sparse patches that check for this but they haven't
been merged yet.

regards,
dan carpenter
