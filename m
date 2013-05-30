From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 May 2013 13:08:47 +0000
Subject: Re: [Patch] Staging: winbond: Made local functions static
Message-Id: <20130530130847.GJ23932@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A6E81C.2000303@gmail.com>
In-Reply-To: <51A6E81C.2000303@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Harsh,

Here are some notes on the devel process.

You should probably include the driver devel list in the CC.  I
always include one public development mailing list.  Normally I
don't include LKML if I have another devel list CC'd.

In staging we're trying to merge patches as fast as we can so our
standards are slightly lower than things in the mm/ directory for
example.

Your last two patches have had too many unrelated whitespace changes
mixed in.  They were small and this is staging so no one commented
on it.  But it's best to avoid that.

When someone gives a review comment like my comment on u8 vs int or
Walter's comment on Set_ChanIndep_RfData_al7230_50(), that's not
stuff you introduced so it could be fixed later/ignored.

Walter's comment on "inline" is correct, but it's probably not a
"redo this patch" thing, it's more of a "think about this for later"
thing.  In mm/ that kind of thing would be more serious, but this is
staging.

My comment on deleting blank lines is something that the patch
introduced.  We'll need to put the blank lines back for this patch
to move out of staging.  It would be better if you could send a v2
patch, but Pavel already Acked the patch and Greg may have merged
it.

Anyway, thank you for the patches.  I hope you'll stick around. :)

regards,
dan carpenter

