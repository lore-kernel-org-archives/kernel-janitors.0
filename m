From: "Vegard Nossum" <vegard.nossum@gmail.com>
Date: Mon, 02 Jul 2007 10:43:25 +0000
Subject: Re: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <19f34abd0707020343n3504554cyc627c08511e7974e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200706021359.23564.lists-receive@programmierforen.de>
In-Reply-To: <200706021359.23564.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 6/3/07, Rene Herman <rene.herman@gmail.com> wrote:
> On 06/02/2007 05:29 PM, Robert P. J. Day wrote:
>
> > On Sat, 2 Jun 2007, Matthew Wilcox wrote:
>
> >> Why are comments considered useful, yet commented-out sections of
> >> code considered worthy of deletion?
> >
> > gee, matt, i dunno ... could it be that, if some code has been deleted
> > via "#if 0", it might actually no longer have any value?  could *that*
> > be it?
>
> No ofcourse it could not. If it didn't have any value any longer it would have
> been deleted, not turned into a comment.
>
> The value #if 0 code generally retains is documentation. Documentation on how
> things were done before and/or could be done in the future, but are not done
> now. It's documentation for the current developer but even more importantly, a
> future developer. Any "I tried this, but this didn't work quite right yet" or
> "I'd like to do it this way, but this needs something else first" or similar
> information this conveys is very useful, especially over maintainer changes.

> A suggestion that any #if 0 code should preferably have a comment describing why
> it's there would ofcourse not be bad.

In addition, I would like to mention that documentation of these #if
0s can sometimes be found in the changelogs. For a totally random
example:

$ grep -rn "^#if 0$" kernel/
kernel/params.c:27:#if 0
kernel/params.c:722:#if 0
kernel/module.c:51:#if 0
kernel/lockdep.c:204:#if 0

Now, inspecting this can be as easy as running git annotate on the
file/lineno pair. Try for instance:

$ git annotate -l -L 722 kernel/params.c

And it shows who made the change and which commit it was. In this
case, git says ef665c1a06be719ed9a6b0ad7967137258d9457a, which can be
further inspected using git log:

$ git log -p -n 1 ef665c1a06be719ed9a6b0ad7967137258d9457a
commit ef665c1a06be719ed9a6b0ad7967137258d9457a
Author: Randy Dunlap <randy.dunlap@oracle.com>
Date:   Tue Feb 13 15:19:06 2007 -0800

    sysfs: fix build errors: uevent with CONFIG_SYSFS=n

    Fix source files to build with CONFIG_SYSFS=n.
    module_subsys is not available.

    SYSFS=n, MODULES=y: T:y
    SYSFS=n, MODULES=n: T:y

    SYSFS=y, MODULES=y: T:y
    SYSFS=y, MODULES=n: T:y

    Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

So the #if 0 is simply a build fix where the old code is kept for
reference. I guess the sysfs_ops was at one point defined even though
CONFIG_SYSFS was unset, but I don't know. Personally, I don't see any
point in keeping the #if 0ed code. Changing it to #if 1 wouldn't even
make a difference at this point, since the variable is unused. But it
can at least be useful to have the commit number for reference and CC
the authors of that particular commit when submitting a patch for it.

Kind regards,
Vegard
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
