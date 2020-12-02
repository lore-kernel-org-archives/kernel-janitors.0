From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Dec 2020 06:42:23 +0000
Subject: Re: [PATCH] Staging: rtl8723bs/core fix brace coding style issue in rtw_ioctl_set.c.
Message-Id: <20201202064223.GN2767@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201201214915.GA397311@a>
In-Reply-To: <20201201214915.GA397311@a>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Don't put a period at the end of the subject.  "rtw_ioctl_set.c." If I
were reviewing this as a real staging patch to be applied, I probably
would not comment on it the first time you did it.  I try ignore trivial
stuff like that.  But since you are going to resend the patch then you
may as well clean it up.

On Tue, Dec 01, 2020 at 03:49:15PM -0600, Brother Matthew De Angelis wrote:
> Fix a brace warning found by the checkpatch.pl tool at line 178.
> 
> WARNING: braces {} are not necessary for any arm of this statement.
> 
> Signed-off-by: Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
> ---
  ^^^
These three lines are the cut off line.  If you put notes after the cut
off then the notes are not include in the final commit message.  That's
the normal place to put questions and comments about the patch.

> My apologies, I meant to sent this. 

Ah...

> Would a patch like this be worth Greg's time?

Again, this is a situation where Greg will probably not take more than
15 seconds to review or think about your patch.  It fixes a checkpatch
warning and doesn't introduce any new issues.  Apply.  I review staging
patches as well and I follow the same philosophy as Greg on this.  But
often other maintainers have higher standards.

And it's always good for you the developer to take more than the minimum
15 seconds to consider the patch.  There are several other "WARNING:
braces {} are not necessary" checkpatch complaints in this file.  You
may as well fix them all.

There are other things to clean as well.  But they should be done in
separate patches.  For example, what does check_fwstate() mean?  What
does it return?  Normally kernel functions return 0 on success and
negative error codes.  Boolean functions are supposed to named more
obviously like fwstate_set() where the name tells you right away that
it returns true when the state is set and false otherwise.  Why is there
an underscore at the start of the _FW_UNDER_SURVEY name?

There are other ways we could write the if statement like:

	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;

	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;

All that stuff would have to go into different patches, but it's worth
thinking about.  But if you're going to resend this, then please fix all
the "braces are not necessary" warnings in the file.

regards,
dan carpenter
