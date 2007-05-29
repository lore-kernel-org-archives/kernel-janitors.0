From: "John Anthony Kazos Jr." <jakj@j-a-k-j.com>
Date: Tue, 29 May 2007 14:00:59 +0000
Subject: Re: [KJ] setting fops member pointers to NULL?
Message-Id: <alpine.DEB.0.99.0705291000040.2252@sigma.j-a-k-j.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> >   is there any rationale for setting a member of the file_operations
> > structure explicitly to NULL as opposed to leaving it initialized?  i
> > would think that's the default just based on the rules for C
> > initialization, but i just wanted to make sure since i see it done
> > every so often and wonder if there's something tricky going on that i
> > don't know about.
> > 
> > rday
> > 
> >   
> Actually, C doesn't really care ... if you declare something, but don't
> initialize it explicitly,
> it will be filled with some random value (probably whatever was at the given
> memory address
> before C gave it to your var). It makes sense to initialize something to NULL
> because then
> we can run value checks and we know what to expect if the value isn't
> something we put in there.

No, it depends on the linkage. Check the C standard. If something has 
static storage duration it is initialized to zero, and gcc will put it in 
the bss section (but will take it back out if you explicitly initialize it 
to zero, for some stupid reason). Variables with automatic storage 
duration (on the stack) are not initialized and must be explicitly made 
so.

static struct file_system_type e2fs_file_system_type {
	/* foo */
};

You would initialize only the members that actually do something. If it 
weren't "static", then you would need to.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
