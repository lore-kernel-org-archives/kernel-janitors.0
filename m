From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Apr 2012 18:41:56 +0000
Subject: Re: Patches that add sparse annotations
Message-Id: <20120418184156.GM6498@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334759646-16415-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1334759646-16415-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Apr 18, 2012 at 04:34:06PM +0200, Emil Goode wrote:
> Hello all,
> 
> I just wanted to get your opinion on if maintainers will find the
> patch bellow (and other like it) to be annoying or somewhat useful?
> 
> In the following lwn article Linus is saying that if you intend to
> grab a lock in one function and release it in another, you need to
> inform sparse of this by adding annotations to the functions.
> 
> http://lwn.net/Articles/109066/
> 
> The patch silences the following sparse warnings:
> arch/x86/kernel/apic/io_apic.c:1115:6: warning: 
> context imbalance in 'lock_vector_lock' - wrong count at exit
> arch/x86/kernel/apic/io_apic.c:1123:6: warning: 
> context imbalance in 'unlock_vector_lock' - unexpected unlock

If you have to ask, then probably it's not worth it.

If you don't run Sparse then this warning doesn't affect you.
I run Sparse every day but I only look at new warnings so this
warning doesn't affect me.  If I did see the warning message, it
wouldn't be hard to see why it was there and ignore it.

The downside of sending the patch is that it is a bit of work for
the maintainer to review and apply.  It's also two extra lines of
code that they might not care about or might think is ugly.

Adding the annotations to the .c file silences the warning, but it
doesn't add any more information for finding future bugs.  To do
that you would have to add it to .h file as well.  (But don't do
that because it will find two false positives and zero real bugs).

Also the format isn't right.  It should be:

void lock_vector_lock(void)
__acquires(vector_lock)
{

Your way works, but it looks weird.

Of course, there are times when adding Sparse annotations is the
correct thing to do.  You when that is if you feel it in your heart.
:P

regards,
dan carpenter

PS. if you are looking for inspiration, you could just do what I do
and read Axel Lin's postings to LKML and copy his ideas.

