From: Julia Lawall <julia@diku.dk>
Date: Sun, 23 Mar 2008 08:06:12 +0000
Subject: Re: any local implementations of linked lists?
Message-Id: <Pine.LNX.4.64.0803230856530.20694@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0803230232220.1223@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 23 Mar 2008, Robert P. J. Day wrote:

> 
>   as i'm currently perusing the implementation of the kernel linked
> list, it occurred to me to wonder if there are still parts of the
> kernel that insist on implementing their own design unnecessarily
> (which they're not supposed to do).  anyone know of any such examples,
> out of curiosity?  thanks.

There are a lot of occurrences of structures that have a field of type 
pointer to the structure, often with the suggestive name "next".  But at 
least some of them have only a next field and no prev field.  Are you 
interested in them anyway?

An example is:

arch/um/include/aio.h

 struct aio_context {
        int reply_fd;
        struct aio_context *next;
 };

julia

