From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Tue, 27 Dec 2005 08:42:59 +0000
Subject: Re: [KJ] Kernel Development Environment
Message-Id: <9a8748490512270042q715ba02u736aa8e22e8b6259@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c71658670512251844i58587d82h9181cf28e74a2017@mail.gmail.com>
In-Reply-To: <c71658670512251844i58587d82h9181cf28e74a2017@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/26/05, Vishal Soni <vishalrsoni@gmail.com> wrote:
> Hi,
>
>  I am new to kernel development. I am have some questions.
>
>  1. Is there any documentation on how to setup kernel development
> environment?

Well, there are some documents in Documentation/ that you'll probably
find useful - start by reading the HOWTO (
http://sosdg.org/~coywolf/lxr/source/Documentation/HOWTO ), and then
move on to the various documents it refers you to. That should get you
started.

As for setting up a "development environment", well, there's really
not much to that, all you really need is a copy of the kernel source,
gcc/make etc, the diff and patch tools and a copy of your favorite
text editor for making changes.


>  2. Do kerenl developers use emulators (bochs, qeum) for kernel development?

Some do, some don't.

> What are most commonly used emulators?

I doubt anyone has actual numbers, but at a guess I'd say that UML
(User Mode Linux) and Xen are two of the most commonly used tools in
this area.

>  3. How do i take to kernel source for kernel.org and setup the compiled
> kernel on a new box. I am instrested in how can I create a bare bone file
> system on the development box to do kernel development.
>
Perhaps this will help you:
  http://www.linuxtux.org/~juhl/2.6-kernel-build.txt


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
