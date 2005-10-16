From: irwan.djajadi@iname.com
Date: Sun, 16 Oct 2005 02:42:36 +0000
Subject: Re: [KJ] [PATCH 2.6.13.2 1/1] acpi: kmalloc failure handling
Message-Id: <20051016024235.GA14396@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64197008729397664=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051003040021.GA25808@poopie.dyndns.org>
In-Reply-To: <20051003040021.GA25808@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============64197008729397664==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 15, 2005 at 05:35:17PM -0500, irwan.djajadi@iname.com wrote:
> On Mon, Oct 03, 2005 at 09:59:26AM +0400, Alexey Dobriyan wrote:
> > On Sun, Oct 02, 2005 at 11:00:21PM -0500, irwan.djajadi@iname.com wrote:
> > > --- 2.6/drivers/acpi/hotkey.c
> > > +++ mod1-2.6/drivers/acpi/hotkey.c
> > > @@ -719,6 +719,8 @@ get_parms(char *config_record,
> > 
> > >  	*action_handle = (char *) kmalloc(count+1, GFP_KERNEL);
> > > +	if (!*action_handle)
> > > +		goto do_fail;
> > 
> > Applied. Meanwhile, can you switch get_parms() from "Return 6 on
> > success. Return -1 on error and caller should take care of cleanup."?
> > 
> > > --- 2.6/drivers/acpi/osl.c
> > > +++ mod1-2.6/drivers/acpi/osl.c
> > > @@ -755,6 +755,10 @@ acpi_os_create_lock (
> > 
> > >  	lock_ptr = acpi_os_allocate(sizeof(spinlock_t));
> > > +	if (!lock_ptr) {
> > > +		ACPI_DEBUG_PRINT ((ACPI_DB_ERROR, "Failed to allocate spinlock.\n"));
> > 
> > Just return -ENOME^WAE_NO_MEMORY.
> > 
> > > +		return_ACPI_STATUS (AE_NO_MEMORY);
> > 
> 
> First of all, I'd like to apologize for not being prompt on my reply here.
> I'm replying to a 2 weeks old message. I'll be more prompt in the future.. I'm
> doing this mainly in the weekend, since I'm quite busy.
> 
> On the first hunk: yes, I'll fixup get_parms() by this weekend, and I'll send
> the patch on a separate E-mail
> 
> on the second hunk: I'll change that too.. But I see in the file that the
> author uses a lot of return_ACPI_STATUS() macro. Would you like me to remove
> that macro, and change the code so that all return_ACPI_STATUS() is replaced
> with just "return" ?
> 
> Thanks, and sorry for the late reply
> --
> Irwan

OK, about the first hunk.. Umm.. No, sorry.. I thought it was going to be
quite simple to fix it, but the function is quite messy to me, and I'm
uncomfortable changing this function without knowing how to test it and what
the use cases are. So I'll leave that function alone.. maybe someone else can
take a look at the get_parms() in drivers/acpi/hotkey.c and fix it up so it's
not as convoluted.

--
Irwan


--===============64197008729397664==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64197008729397664==--
