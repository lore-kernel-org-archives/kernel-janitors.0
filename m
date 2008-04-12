From: "Vegard Nossum" <vegard.nossum@gmail.com>
Date: Sat, 12 Apr 2008 11:28:53 +0000
Subject: Re: trying to avoid "#ifdef CONFIG_NUMA"?
Message-Id: <19f34abd0804120428h2cdbe498o14a52f6d510e0b7e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0804070741520.23945@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0804070741520.23945@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 7, 2008 at 2:56 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Mon, 7 Apr 2008, Matthew Wilcox wrote:
>
>  > On Mon, Apr 07, 2008 at 07:45:01AM -0400, Robert P. J. Day wrote:
>  > > /* This helps us to avoid #ifdef CONFIG_NUMA */
>  > > #ifdef CONFIG_NUMA
>  > > #define NUMA_BUILD 1
>  > > #else
>  > > #define NUMA_BUILD 0
>  > > #endif
>  >
>  > > mm/page_alloc.c:                if (NUMA_BUILD && zlc_active &&
>  > >
>  > >   not a lot of avoiding going on there, i'd say.
>  >
>  > but it's important where it happens.  it would uglify the code
>  > significantly to replace the if (NUMA_BUILD) with #ifdef
>  > CONFIG_NUMA. Maybe NUMA_BUILD should be used in more places, but how
>  > about doing something useful instead?
>
>  i wasn't planning on changing any of that, i was just trying to figure
>  out why the comment promoted "avoiding" the #ifdef when there was so
>  much of it still around.

It avoids it in the sense that you can now use NUMA_BUILD in
expression, as opposed to CONFIG_NUMA, which won't take the value 0 if
it's =n. It is not intended to replace CONFIG_NUMA when it is not used
inside expressions. (That's my understanding of it anyway).

Vegard
