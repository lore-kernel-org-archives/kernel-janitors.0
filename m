From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 27 Jan 2004 04:10:54 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/ide/ide-tape.c - handle
Message-Id: <20040126201054.059af414.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040122040839.GA2456@eugeneteo.net>
In-Reply-To: <20040122040839.GA2456@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 27 Jan 2004 09:04:00 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:

| <quote sender="Randy.Dunlap">
| > On Thu, 22 Jan 2004 12:08:39 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:
| > 
| > | I have not compile nor test this patch. stage has to be checked for
| > | null. No trailing spaces too :) 
| > | 
| > | 2902: static idetape_stage_t *__idetape_kmalloc_stage (..........)
| > | [...]
| > | 2909:         if ((stage = (idetape_stage_t *) kmalloc (sizeof \
| > | (idetape_stage_t),GFP_KERNEL)) = NULL)
| > | 2910:                 return NULL;
| > | 
| > | diff -Naur -X /home/amnesia/w/dontdiff 2.6.2-rc1-orig/drivers/ide/ide-tape.c 2.6.2-rc1-fix/drivers/ide/ide-tape.c
| > | --- 2.6.2-rc1-orig/drivers/ide/ide-tape.c	2004-01-22 02:19:18.000000000 +0800
| > | +++ 2.6.2-rc1-fix/drivers/ide/ide-tape.c	2004-01-22 12:01:56.000000000 +0800
| > | @@ -3619,6 +3619,8 @@
| > |  	printk(KERN_INFO "ide-tape: %s: reading back %d frames from the drive's internal buffer\n", tape->name, frames);
| > |  	for (i = 0; i < frames; i++) {
| > |  		stage = __idetape_kmalloc_stage(tape, 0, 0);
| > | +		if (!stage)
| > | +			return;
| > |  		if (!first)
| > |  			first = stage;
| > |  		aux = stage->aux;
| > | 
| > 
| > so... what makes it OK for void function "idetape_onstream_read_back_buffer"
| > to just return at this point?  It can't (or doesn't) return an error
| > AFAICT, but the calling function expected certain work to be done...
| 
| this function is part of the write error recovery function that is
| meant for the unrealiable pipelined mode. after recovering from the
| internal buffer in an event of a write error, it will re-position the
| tape.
| 
| Actually, I just spotted another thing that we need to fix. When we
| are in the pipelined write mode, we can't inform the user about the
| error codes (that is why it is a return void, not return error code),
| until the next task. And the next possible place to inform the user,
| is in the function "idetape_position_tape". If our read back buffer
| fails because we are unable to allocate memory for a stage, then we
| might not be able to position the tape (guess).

Yes, that's along the lines that I was concerned about.
If the kmalloc() fails and there's an early return, the state
of things might not be as they are normally expected to be,
but there's no indication of that that I can see.

| Sheese, idetape_discard_read_pipeline() should be tested to check
| whether positioning can be done but it isn't for most of the calls
| in ide-tape.c.
| 
| > I guess that it could panic(), although I hate adding panics.
| 
| I don't think it will panic, but it will be better if someone
| can test this.

So can anyone do some testing of these changes?

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
