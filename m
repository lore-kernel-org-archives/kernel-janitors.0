From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Tue, 11 Oct 2005 22:08:40 +0000
Subject: Re: [KJ] Re: Fixing: char *foo = "blah";
Message-Id: <9a8748490510111508p5419bbd7gf2a9a09d6583f5be@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/11/05, Felix Oxley <lkml@oxley.org> wrote:
>
[snip]
>
> I am nearly ready to submit a patch for this.
>
> I have done the code modifications, the test of the basic principle and am
> currently comparing the size of the kernel (make allyesconfig) before and
> after the patch.
>
>
>
> I will submit the whole lot in 12 hours.
>
>
>
> However I have a couple of queries.
>
> First, here are my own answers to the questions I submitted previously to
> which I received no response :-(
>
> (Ricardo did reply, but didn't answer my questions)
>
>
>
> Here is a reminder of the TODO list task:
>
> > > From: Jeff Garzik <jgarzik at mandrakesoft dot com>
>
> > >
>
> > > 1) The string form
>
> > >
>
> > > [const] char *foo = "blah";
>
> > >
>
> > > creates two variables in the final assembly output, a static string, and
>
> > > a char pointer to the static string. The alternate string form
>
> > >
>
> > > [const] char foo[] = "blah";
>
> > >
>
> > > is better because it declares a single variable.
>
> > >
>
> > > For variables marked __initdata, the "*foo" form causes only the
>
> > > pointer, not the string itself, to be dropped from the kernel image,
>
> > > which is a bug. Using the "foo[]" form with regular 'ole local
>
> > > variables also makes the assembly shorter.
>
>
[SNIP]

I brought this up a while back on LKML in a thread with the subject
"[RFC] cleanup patches for strings". You may want to read that thread
- there was a lot of good feedback.

You can find it in the archives here :
  http://www.ussg.iu.edu/hypermail/linux/kernel/0506.2/1056.html
or here :
  http://lkml.org/lkml/2005/6/21/16

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
