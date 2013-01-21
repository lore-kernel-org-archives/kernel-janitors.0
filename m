From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Jan 2013 04:37:36 +0000
Subject: Re: [patch] module: potential deadlock in error path
Message-Id: <CA+55aFyhfuLJqsEiAJ3jyf_OikgZroFkfBW1i-LYwCr0YOVX1w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130118074309.GB31793@elgon.mountain> <87ip6rwcvz.fsf@rustcorp.com.au>
 <CA+55aFzEkSOWL13cX2xaYttPF5=Qpvya9Yapk-RC8KQ5=QJk+w@mail.gmail.com> <87vcarur8n.fsf@rustcorp.com.au>
In-Reply-To: <87vcarur8n.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alexander Graf <agraf@suse.de>, Prarit Bhargava <prarit@redhat.com>, Sasha Levin <sasha.levin@oracle.com>

On Sun, Jan 20, 2013 at 7:52 PM, Rusty Russell <rusty@rustcorp.com.au> wrote:
>
> You've now conflated two completely different lock paths into a single
> unlock.

We have that elsewhere too. And it's what we used to have before too.

So the simple fact is that commit 1fb9341ac348 just introduced this
bug, and moving the goto target around is the obvious fix for it, and
makes it match the old code that was simply incorrectly modified.

The suggested patch instead has *some* cleanup inside the
if-statement, and some at the goto target. That makes no sense to
humans, and just makes it harder for the compiler to generate better
code.

> mutex_bug_cleanup() should really lock internally, but doesn't
> so we wrap it.  And that mutex_unlock of yours has nothing to do with
> cleaning up ddebug, so the labels misnamed, at best.

Bah, humbug. It's called "ddebug_cleanup" because it's called after
the  debug setup, so it needs to clean up the state set up by that.
The fact that it needs to unlock is secondary, and is simply because
the lock is taken at that point, so needs to be released. The naming
is not wonderful, but it's not hugely illogical, and again, that's
what it used to (except "ddebug" has been renamed to
"ddebug_cleanup"). You could rename it if you want to (we used to have
a target called "unlock" at that point), but that's *still* no excuse
for just creating code that does cleanup in two totally unrelated
places.

> Not that it matters much: this is going to change for next merge window.

Now, agreed, that looks better, although I suspect you could have
taken the "split that ugly function up" further still.

                   Linus
