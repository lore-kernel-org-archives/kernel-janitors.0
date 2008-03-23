From: Julia Lawall <julia@diku.dk>
Date: Sun, 23 Mar 2008 09:25:53 +0000
Subject: Re: any local implementations of linked lists?
Message-Id: <Pine.LNX.4.64.0803231018230.20694@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 23 Mar 2008, Robert P. J. Day wrote:

> On Sun, 23 Mar 2008, Julia Lawall wrote:
> 
> > On Sun, 23 Mar 2008, Robert P. J. Day wrote:
> >
> > >
> > >   as i'm currently perusing the implementation of the kernel linked
> > > list, it occurred to me to wonder if there are still parts of the
> > > kernel that insist on implementing their own design unnecessarily
> > > (which they're not supposed to do).  anyone know of any such examples,
> > > out of curiosity?  thanks.
> >
> > There are a lot of occurrences of structures that have a field of type
> > pointer to the structure, often with the suggestive name "next".  But at
> > least some of them have only a next field and no prev field.  Are you
> > interested in them anyway?
> >
> > An example is:
> >
> > arch/um/include/aio.h
> >
> >  struct aio_context {
> >         int reply_fd;
> >         struct aio_context *next;
> >  };
> 
> based on my own grepping, i noticed a zillion of those things -- i'm
> just thinking that some of them are probably local implementations of
> a linked list structure that could be rewritten using the in-kernel
> linked list structure defined in <linux/list.h>.
> 
> i doubt that could be done quickly -- it's undoubtedly a long-term
> project that could be transformed little by little as people run
> across examples of it.  just something to keep an eye out for if
> you're feeling ambitious.

The question still stands, though.  list_head has both next and prev 
fields.  Is it desirable to convert a singly linked list to a doubly 
linked list just for the benefit of using the functions in list.h, at a 
cost of more memory?

I found 89 files that declare a structure with multiple self-pointer-typed
fields, and over 400 more that declare a structure with only one 
self-pointer field.  Perhaps there is a need for an API for singly-linked 
lists as well?  Or perhaps they are too simple to be worth it?

Another common pattern is a next field and a parent field.  Those should 
probably not be converted either, for readability, even if doing so would 
be correct.

julia

