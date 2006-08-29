From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 29 Aug 2006 04:16:13 +0000
Subject: Re: [KJ] string concatenation with __FUNCTION__
Message-Id: <20060829041012.GC5192@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d16b1c80608281227k6aad7416u10a626d6a0b9cf18@mail.gmail.com>
In-Reply-To: <d16b1c80608281227k6aad7416u10a626d6a0b9cf18@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Aug 29, 2006 at 12:52:17PM +1000, Darren Jenkins wrote:
> On 8/29/06, Bernd Petrovitsch <bernd@firmix.at> wrote:
> > On Tue, 2006-08-29 at 00:57 +0530, Shakthi Kannan wrote:
> > [...]
> > > TODO entry:
> > > - remove string concatenation with __FUNCTION__ (get rid of
> > >   warnings, and get ready for __func__):
> > >   - printk(KERN_INFO "blabla " __FUNCTION__ "\n");
> > >   + printk(KERN_INFO "blabla %s\n", __FUNCTION__);
> > >
> > > What does it mean by "get ready for __func__ "?
> >
> > __func__ is a C variable (and not a constant string) so the string
> > concatenation doesn't work.
> >
> > > I have checked with 2.6.18-rc4 and all references of __FUNCTION__
> > > don't have any "string concatenation".
> >
> > Yes, because they have been fixed and IIRC it is already #define to
> > __func__ since several months.
>
> Is this something that should be removed from the TODO list then ?

Done. XFS and JFS items died too. Proper "-E" item is pending...

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
