From: acripps <acripps@gmail.com>
Date: Mon, 16 Jul 2007 14:05:54 +0000
Subject: [KJ] [third][PATCH 0/4][2.6 drivers/net:] ARRAY_SIZE(arr) macro
Message-Id: <20070716141754.30653.79204.sendpatchset@shcherbakov.homelinux.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sorry that I've been inactive for a few weeks, I've had more thrown at me than
I can handle lately.
Here is a re-re-send of my original patchset ... I've cleaned these up a bit.
I have removed any superfluous and unrelated patches from this set (for
example, I completely removed the '#if 0' chunk from this patchset, as well
as the whitespace patch). You know what they say, third time's a charm.
As well, I've run build tests on the whole patchset. There appears to be no
build issues with the files affected by this patchset. The process I used to
test these is as so:
make allyesconfig
make -k 2>../buildLog
grep -n "drivers/net" ../buildLog
... and then eyeball the grep results for the filenames associated with this
patchset :)

Again, any feedback on this would be appreciated ... as well, if somebody
could give me some configuration hints on replying to threads using gmail
without mangling patches, I would be grateful, I'm using the sendpatchset
script for this, which means every time I want to resubmit a change to one
patch, I have to re-send the whole patchset to prevent code mangling.

-acripps
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
