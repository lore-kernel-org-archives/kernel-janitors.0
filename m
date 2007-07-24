From: Cripps <acripps@gmail.com>
Date: Tue, 24 Jul 2007 17:41:01 +0000
Subject: [KJ] Re: [third][PATCH 0/4][2.6 drivers/net:] ARRAY_SIZE(arr) macro
Message-Id: <c6711b6b0707241041o702040a5u2f53fd92b5ac6292@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

So, since there has been no more feedback (about things that I need to
change) in this patchset, should I
try sending them off the th lkml ? I've tried sending a few patches to
maintainers, but I've received no replies
from the ones who still have the emails listed in the files ... most of the
emails bounced back.

Thanks in advance for a little wisdom from the KJ gurus :)
-acripps

On 7/16/07, acripps <acripps@gmail.com> wrote:
>
> Sorry that I've been inactive for a few weeks, I've had more thrown at me
> than
> I can handle lately.
> Here is a re-re-send of my original patchset ... I've cleaned these up a
> bit.
> I have removed any superfluous and unrelated patches from this set (for
> example, I completely removed the '#if 0' chunk from this patchset, as
> well
> as the whitespace patch). You know what they say, third time's a charm.
> As well, I've run build tests on the whole patchset. There appears to be
> no
> build issues with the files affected by this patchset. The process I used
> to
> test these is as so:
> make allyesconfig
> make -k 2>../buildLog
> grep -n "drivers/net" ../buildLog
> ... and then eyeball the grep results for the filenames associated with
> this
> patchset :)
>
> Again, any feedback on this would be appreciated ... as well, if somebody
> could give me some configuration hints on replying to threads using gmail
> without mangling patches, I would be grateful, I'm using the sendpatchset
> script for this, which means every time I want to resubmit a change to one
> patch, I have to re-send the whole patchset to prevent code mangling.
>
> -acripps
>
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
