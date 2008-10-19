From: Johannes Weiner <hannes@saeurebad.de>
Date: Sun, 19 Oct 2008 01:00:21 +0000
Subject: Re: [PATCH] kernel: a few readability changes for nice values
Message-Id: <871vydiel6.fsf@saeurebad.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a91986340810162050n6cdfe617nf9aa90620cc79084@mail.gmail.com>
In-Reply-To: <a91986340810162050n6cdfe617nf9aa90620cc79084@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Mike,

"Mike Steiner" <mike65536@gmail.com> writes:

> From: Mike Steiner <mike65536@gmail.com>

newline -- see #15 in Documentation/SubmittingPatches

> Replaced raw nice values with constants and added macro to wrap
> range check with a descriptive name.

newline -- as above

> Signed-off-by: Mike Steiner <mike65536@gmail.com>
> ---
> FYI, this is my first kernel patch. I ran checkpatch.pl on it and fixed the
> errors, except for 2 concerning spaces around "<" and ">" because it would
> make the code less readable.
> diff -up linux-2.6.27.1/kernel/sched.c new/kernel/sched.c
> --- linux-2.6.27.1/kernel/sched.c	2008-10-15 16:02:53.000000000 -0700
> +++ new/kernel/sched.c	2008-10-16 20:37:27.000000000 -0700
> @@ -24,6 +24,7 @@
>   *  2007-07-01  Group scheduling enhancements by Srivatsa Vaddagiri
>   *  2007-11-29  RT balancing improvements by Steven Rostedt, Gregory Haskins,
>   *              Thomas Gleixner, Mike Kravetz
> + *  2008-10-16  A few readability changes for nice values by Mike Steiner

Changes are logged through git, no longer in the file headers.

> +#define MIN_NICE (-20)
> +#define MAX_NICE  (19)

IMO, these values are traditionally so well known that the numbers
themselve have symbolic values :)

Best thing is probably to address people mostly working with the code
directly; you can use git to see who that would be.  Then add them to
the CC:.

I suspect that smaller cleanups will be overlooked more easily during
the merge window.  If you don't get a response, just resend it after
things have gotten a bit more calm again.

HTH,

	Hannes
