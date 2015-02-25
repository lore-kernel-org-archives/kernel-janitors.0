From: Sergei Antonov <saproj@gmail.com>
Date: Wed, 25 Feb 2015 18:20:49 +0000
Subject: Re: [patch] hfsplus: add missing curly braces in hfsplus_delete_cat()
Message-Id: <CABikg9y_MC7gGm_qyTM1nQF0M+nmdt_c1qw+w4BAh-GQ6nTVbg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150225133644.GW19745@mwanda>
	<CABikg9yk7BoL36FMW3sxXOY5MUb-TRDWB_Me3pAjMkpRAU-8ow@mail.gmail.com>
	<20150225171303.GF5116@mwanda>
In-Reply-To: <20150225171303.GF5116@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vyacheslav Dubeyko <slava@dubeyko.com>, Sougata Santra <sougata@tuxera.com>, Christoph Hellwig <hch@lst.de>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 25 February 2015 at 18:13, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Wed, Feb 25, 2015 at 03:50:19PM +0100, Sergei Antonov wrote:
>> Right you are.
>> I would also add 2 things:
>> 1. CC the author of the last patch (the one which introduced it).
>
> Huh?  Sougata is CC'd.  I didn't add a fixes: tag because this is just a
> cleanup and has no effect on runtime.
>
>> 2. Unify the way the return code from hfsplus_cat_build_key() is
>> checked. Now it has two flavours: "if (unlikely(err < 0))" and "if
>> (unlikely(err))". The latter is better.
>
> I'm a bit confused.
> 1) This function uses "if (unlikely(err)) " consistently.

The last patch
https://github.com/torvalds/linux/commit/89ac9b4d3d1a049ae1054f99b1aed81092cd0a82#diff-37a74f715b10ff2d442d82812c89e874
intruduced "if (unlikely(err < 0))" in fs/hfsplus/dir.c for example,
but "if (unlikely(err))" in fs/hfsplus/catalog.c

> 2) I don't see how any of that relates to this patch??

This patch is not bad. But I'd rather see a bigger "Fix the last
commit" patch rather than "Add missing braces".
