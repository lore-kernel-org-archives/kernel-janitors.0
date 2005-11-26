From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 26 Nov 2005 00:46:48 +0000
Subject: Re: [KJ] drivers\char\synclink.c
Message-Id: <20051126004648.GA1597@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60604737053925906=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <005701c5f201$6f7bf190$1e83c756@bureau>
In-Reply-To: <005701c5f201$6f7bf190$1e83c756@bureau>
To: kernel-janitors@vger.kernel.org

--===============60604737053925906==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 25, 2005 at 01:34:03PM -0800, Nish Aravamudan wrote:
> On 11/25/05, Christophe Jaillet <christophe.jaillet@wanadoo.fr> wrote:
> >
> > In file :            \drivers\char\synclink.c
> > In function :    line_info(char *buf, struct mgsl_struct *info)
> >
> > The buffer *stat_buf* could be defined smaller.
> 
> 
> Where's the patch?

Never mind that.  Is this a patch we even want?  It's quite common to
overallocate these small string buffers so that when someone makes a
change and forgets to update the length, they don't overrun the buffer.

And what's with the backward slashes anyway?

--===============60604737053925906==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60604737053925906==--
