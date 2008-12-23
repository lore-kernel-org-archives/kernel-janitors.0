From: Julia Lawall <julia@diku.dk>
Date: Tue, 23 Dec 2008 06:01:59 +0000
Subject: Re: container_of
Message-Id: <Pine.LNX.4.64.0812230700500.32240@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812191854150.11217@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812191854150.11217@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 22 Dec 2008, Greg KH wrote:

> On Fri, Dec 19, 2008 at 06:56:46PM +0100, Julia Lawall wrote:
> > Considering code such as the following (drivers/acpi/osl.c):
> > 
> >  	struct acpi_os_dpc *dpc = container_of(work, struct acpi_os_dpc, work);
> > 	if (!dpc) {
> >  		printk(KERN_ERR PREFIX "Invalid (NULL) context\n");
> >  		return;
> >  	}
> > 
> > Is it very likely that container_of can return NULL?  Container_of 
> > computes an offset from a pointer, so I have the impression that if given 
> > a NULL value it would normally return a negative number (or a very large 
> > positive one, depending on how it is interpreted).
> 
> You are correct, that check will never happen, and should be removed.

Actually, someone else pointed out that one could call the function with 
&x->fld, and if x is NULL, then container_of(&x->fld,...) would go back 
down to NULL.  I haven't looked at the call sites though to see if that 
can happen.

julia
