From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 23 Mar 2008 09:07:50 +0000
Subject: Re: any local implementations of linked lists?
Message-Id: <alpine.LFD.1.00.0803230505330.5110@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 23 Mar 2008, Julia Lawall wrote:

> On Sun, 23 Mar 2008, Robert P. J. Day wrote:
>
> >
> >   as i'm currently perusing the implementation of the kernel linked
> > list, it occurred to me to wonder if there are still parts of the
> > kernel that insist on implementing their own design unnecessarily
> > (which they're not supposed to do).  anyone know of any such examples,
> > out of curiosity?  thanks.
>
> There are a lot of occurrences of structures that have a field of type
> pointer to the structure, often with the suggestive name "next".  But at
> least some of them have only a next field and no prev field.  Are you
> interested in them anyway?
>
> An example is:
>
> arch/um/include/aio.h
>
>  struct aio_context {
>         int reply_fd;
>         struct aio_context *next;
>  };

based on my own grepping, i noticed a zillion of those things -- i'm
just thinking that some of them are probably local implementations of
a linked list structure that could be rewritten using the in-kernel
linked list structure defined in <linux/list.h>.

i doubt that could be done quickly -- it's undoubtedly a long-term
project that could be transformed little by little as people run
across examples of it.  just something to keep an eye out for if
you're feeling ambitious.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
