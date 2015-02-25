From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 17:13:03 +0000
Subject: Re: [patch] hfsplus: add missing curly braces in hfsplus_delete_cat()
Message-Id: <20150225171303.GF5116@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150225133644.GW19745@mwanda>
 <CABikg9yk7BoL36FMW3sxXOY5MUb-TRDWB_Me3pAjMkpRAU-8ow@mail.gmail.com>
In-Reply-To: <CABikg9yk7BoL36FMW3sxXOY5MUb-TRDWB_Me3pAjMkpRAU-8ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Antonov <saproj@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vyacheslav Dubeyko <slava@dubeyko.com>, Sougata Santra <sougata@tuxera.com>, Christoph Hellwig <hch@lst.de>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 25, 2015 at 03:50:19PM +0100, Sergei Antonov wrote:
> Right you are.
> I would also add 2 things:
> 1. CC the author of the last patch (the one which introduced it).

Huh?  Sougata is CC'd.  I didn't add a fixes: tag because this is just a
cleanup and has no effect on runtime.

> 2. Unify the way the return code from hfsplus_cat_build_key() is
> checked. Now it has two flavours: "if (unlikely(err < 0))" and "if
> (unlikely(err))". The latter is better.

I'm a bit confused.
1) This function uses "if (unlikely(err)) " consistently.
2) I don't see how any of that relates to this patch??

regards,
dan carpenter

