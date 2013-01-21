From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Jan 2013 01:56:14 +0000
Subject: Re: [patch] module: potential deadlock in error path
Message-Id: <CA+55aFzEkSOWL13cX2xaYttPF5=Qpvya9Yapk-RC8KQ5=QJk+w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130118074309.GB31793@elgon.mountain> <87ip6rwcvz.fsf@rustcorp.com.au>
In-Reply-To: <87ip6rwcvz.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alexander Graf <agraf@suse.de>, Prarit Bhargava <prarit@redhat.com>, Sasha Levin <sasha.levin@oracle.com>

On Sun, Jan 20, 2013 at 5:20 PM, Rusty Russell <rusty@rustcorp.com.au> wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>> We take the lock twice if we hit this goto.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Damn, just pushed that to Linus: should have read mail first.
>
> I've added this, thanks.

I'm not pulling this. It seems stupid.

Why isn't the fix just this (whitespace-damaged, cut-and-pasted)
one-liner instead? I may be blind, but as far as I cal tell, there's
exactly one single place we do that "giti ddebug_cleanup", and it
wants to unlock the mutex, so we should just move the unlock down one
line instead.

Hmm? Is there some hidden magic going on that I can't see?

                  Linus

---
diff --git a/kernel/module.c b/kernel/module.c
index d25e359279ae..eab08274ec9b 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -3274,8 +3274,8 @@ again:
        /* module_bug_cleanup needs module_mutex protection */
        mutex_lock(&module_mutex);
        module_bug_cleanup(mod);
-       mutex_unlock(&module_mutex);
  ddebug_cleanup:
+       mutex_unlock(&module_mutex);
        dynamic_debug_remove(info->debug);
        synchronize_sched();
        kfree(mod->args);
