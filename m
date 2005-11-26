From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sat, 26 Nov 2005 00:58:31 +0000
Subject: Re: [KJ] drivers\char\synclink.c
Message-Id: <29495f1d0511251658j35bab626xeecfa0c0d43e5f69@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <005701c5f201$6f7bf190$1e83c756@bureau>
In-Reply-To: <005701c5f201$6f7bf190$1e83c756@bureau>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/25/05, Matthew Wilcox <matthew@wil.cx> wrote:
> On Fri, Nov 25, 2005 at 01:34:03PM -0800, Nish Aravamudan wrote:
> > On 11/25/05, Christophe Jaillet <christophe.jaillet@wanadoo.fr> wrote:
> > >
> > > In file :            \drivers\char\synclink.c
> > > In function :    line_info(char *buf, struct mgsl_struct *info)
> > >
> > > The buffer *stat_buf* could be defined smaller.
> >
> >
> > Where's the patch?
>
> Never mind that.  Is this a patch we even want?  It's quite common to
> overallocate these small string buffers so that when someone makes a
> change and forgets to update the length, they don't overrun the buffer.

Valid point.  And the savings by reducing it aren't significant enough
to justify the potential error you mention.

> And what's with the backward slashes anyway?

Good question...maybe Christophe is using Winblows to report Linux errors?

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
