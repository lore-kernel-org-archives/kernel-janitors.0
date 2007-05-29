From: Bernd Petrovitsch <bernd@firmix.at>
Date: Tue, 29 May 2007 15:04:00 +0000
Subject: Re: [KJ] setting fops member pointers to NULL?
Message-Id: <1180451040.29349.15.camel@tara.firmix.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2007-05-29 at 10:55 -0400, John Anthony Kazos Jr. wrote:
> > > > >   is there any rationale for setting a member of the file_operations
> > > > > structure explicitly to NULL as opposed to leaving it initialized?  i
> > > > > would think that's the default just based on the rules for C
> > > > > initialization, but i just wanted to make sure since i see it done
> > > > > every so often and wonder if there's something tricky going on that i
> > > > > don't know about.
> > > > >
> > > > > rday
> > > > >
> > > > >
> > > > Actually, C doesn't really care ... if you declare something, but don't
> > > > initialize it explicitly,
> > > > it will be filled with some random value (probably whatever was at the
> > > > given memory address
> > > > before C gave it to your var).
> > >
> > > Nope. If it is a global variable and it is left uninitialized it
> > > will be put into the .bss section and thus set to zero at program
> > > start.
> > >
> > > If you use named initializers in struct initializations, no matter
> > > where, the uninitialized members will be set to zero too.
> > 
> > that's the understanding i had, so setting those global member fields
> > to NULL in various fops structures is really redundant.  doesn't hurt
> > anything, of course.
> 
> Well, it does increase the on-disk image size. Like when code uses 

The original question was about unused fields in (e.g.) struct
file_operations.
Are you sure your comment makes any sense then?

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
