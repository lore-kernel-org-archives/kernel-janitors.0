From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Dec 2018 14:26:40 +0000
Subject: Re: [PATCH] powerpc/ipic: Fix a bounds check in ipic_set_priority()
Message-Id: <20181211141429.GF3116@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203144834.ocxntjflfz2idxrb@kili.mountain>
 <87sgzchcw8.fsf@concordia.ellerman.id.au>
 <f570563c-1cc7-fecf-2ed2-58164047ec9d@c-s.fr>
 <alpine.DEB.2.20.1812060908000.5574@hadrien>
In-Reply-To: <alpine.DEB.2.20.1812060908000.5574@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Kim Phillips <kim.phillips@freescale.com>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Thu, Dec 06, 2018 at 09:12:12AM +0100, Julia Lawall wrote:
>=20
>=20
> On Thu, 6 Dec 2018, Christophe LEROY wrote:
>=20
> >
> >
> > Le 05/12/2018 =E0 04:26, Michael Ellerman a =E9crit=A0:
> > > Hi Dan,
> > >
> > > Thanks for the patch.
> > >
> > > Dan Carpenter <dan.carpenter@oracle.com> writes:
> > > > The ipic_info[] array only has 95 elements so I have made the bounds
> > > > check smaller to prevent a read overflow.  It was Smatch that found
> > > > this issue:
> > > >
> > > >      arch/powerpc/sysdev/ipic.c:784 ipic_set_priority()
> > > >      error: buffer overflow 'ipic_info' 95 <=3D 127
> > > >
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > ---
> > > > I wasn't able to find any callers of this code.  Maybe we removed t=
he
> > > > last one in commit b9f0f1bb2bca ("[POWERPC] Adapt ipic driver to new
> > > > host_ops interface, add set_irq_type to set IRQ sense").  So perhap=
s we
> > > > should just remove it.  I'm not really comfortable doing that mysel=
f,
> > > > because I don't know the code well enough and can't build test
> > > > it properly.
> > >
> > > Hah wow, last usage removed in 2006!
> > >
> > > I don't see any mention of it since then, so I'll remove it. If it
> > > breaks something we can put it back.
> > >
> > > Can smatch help us find things like this that are defined non-static =
but
> > > never used?
> > >
> >
> > I think we have to do that carrefully. Some of those functions might be=
 used
> > by out-of-tree boards.
> >
> > I'm thinking especially at ipic_get_mcp_status() and ipic_set_mcp_statu=
s().
> > They are used in my 832x boards's machine check handler to know when a =
machine
> > check is a timeout from the 832x watchdog.
>=20
> The message I have gotten in the past is that the Linux kernel doesn't
> support code that is not used in the Linux kernel.  However, if I were to
> do this, I would send the code to the individual maintainers, who
> presumably would know what is actually needed and what is not.
>=20
> Perhaps a good sanity check would be if the code has been used in the
> past.  If there was a use in the past that has been removed, then perhaps
> it is more likely that the function was intended for internal kernel use
> rather than the case that you are describing.

Yeah.  That's a good idea.  I've been encouraging people who remove
"written to but not used" variables to say in the commit message
"variable foo has not been used since commit 123412341243 ("blah blah")."
It helps me review the patch as well.

regards,
dan carpenter
