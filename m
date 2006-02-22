From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Wed, 22 Feb 2006 00:14:39 +0000
Subject: Re: [KJ] [Patch] kzalloc conversion in fs/proc
Message-Id: <9a8748490602211614i1c31e611y5183e27c0d3aa8a1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140562907.26848.0.camel@alice>
In-Reply-To: <1140562907.26848.0.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/22/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> On Wed, 2006-02-22 at 00:13 +0100, Jesper Juhl wrote:
> > This looks broken - did you even compile test that patch?
> >
> > Don't you mean :
> >
> > return kzalloc(sizeof(struct vmcore), GFP_KERNEL);
>
> *yuck*, sorry for this, didnt compile test since it doesnt build
> with my config. fixed patch below.
>

Hmm, a simple

$ make allyesconfig
$ make fs/proc/kcore.o

or

$ make fs/proc/

builds it for me. No reason why you couldn't have made the same test.

In any case, noting in the email with the patch what level of testing
you've done is usually a good idea.
Just a simple line saying "compile tested" or "compile & run tested"
(meaning you've build a kernel with the patch and test booted it), or
if you've done even more testing than that, then a line or two
specifying exactely what testing you've done, is usually a good idea.
And if you've done no testing at all, then a line stating "patch is
untested" is really nice.

It helps other people looking over your changes, but it also helps
yourself - it's a nice mental "stop-post"  when you write the testing
info you (at least I know I do) usually look over the patch once more
and think about if the testing you've done is sufficient.
At least consider it :)

Anyway, the fixed patch looks good to me.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
