From: Anupam Kapoor <anupam.kapoor@gmail.com>
Date: Mon, 28 Jun 2004 13:33:12 +0000
Subject: Re: [Kernel-janitors] Re: set_current_state
Message-Id: <e3177630406280621640323ae@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96589292110589975=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040627223356.GA1653@masina>
In-Reply-To: <20040627223356.GA1653@masina>
To: kernel-janitors@vger.kernel.org

--===============96589292110589975==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

hi,

i just checked with the latest sources and there are 417 entries with
'current->state'. is a blind search-replace to set_current_state ok ?

can you please let me know ?

kind regards
anupam

On Mon, 28 Jun 2004 00:33:56 +0200, Domen Puncer <domen@coderock.org> wrote:
> 
> On 27/06/04 14:24 -0500, Jay Bourque wrote:
> > New guy here,
> >
> > I've been following the discussion lately and with talk about the
> > TODO list badly needing updating, I was wondering how up to
> > date the kj.pl script is.  In particular, I ran it against the
> > net/core/dev.c file and it showed that current->state needs to be
> > changed to set_current_state. Is this still something that needs
> > to be done?
> 
> Yes.
> If you look at set_current_state, you see it's basically the same, with
> a memory barrier.
> 
> 
> 
> >
> > Thanks,
> > -Jay
> > _______________________________________________
> > Kernel-janitors mailing list
> > Kernel-janitors@lists.osdl.org
> > http://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 
> 
> noname - 1K Download 
>

--===============96589292110589975==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96589292110589975==--
