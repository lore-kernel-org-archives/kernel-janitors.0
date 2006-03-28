From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Tue, 28 Mar 2006 18:07:56 +0000
Subject: Re: [KJ][Patch][update] fix kbuild warning in iptable_nat.o
Message-Id: <20060328100756.f68f4fb0.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31037534868623062=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1143548373.14792.9.camel@localhost.localdomain>
In-Reply-To: <1143548373.14792.9.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============31037534868623062==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Mar 2006 09:45:42 -0800 Randy.Dunlap wrote:

> On Tue, 28 Mar 2006 09:18:56 -0800 Randy.Dunlap wrote:
> 
> > On Tue, 28 Mar 2006 23:19:33 +1100 Darren Jenkins\\ wrote:
> > 
> > > G'day list,
> > > 
> > > Sorry but I just noticed that the last patch removed a static from the
> > > init function. It really should have one, so here is an updated patch.
> > > 
> > > WARNING: net/ipv4/netfilter/iptable_nat.o - Section mismatch: reference
> > > to .init.text:ip_nat_rule_init from .text between 'init_or_cleanup' (at
> > > offset 0x455) and 'nat_decode_session'
> > > 
> > > This seems to be caused by init_or_cleanup() in
> > > net/ip4/netfilter/ip_nat_standalone.c calling ip_nat_rule_init() in
> > > net/ip4/netfilter/ip_nat_rule.c.
> > 
> > Yes.
> > 
> > > The problem is that init_or_cleanup() is called from both __init and
> > > __exit functions, so is not marked as __init.
> > 
> > Right, it cannot be marked __init.
> > 
> > > As iptable_nat.o seems to be compiled into the kernel (from
> > > ip_nat_rule.c and ip_nat_standalone.c) by default, I don't think we need
> > > the __exit function (correct me if I am wrong).
> > 
> > That may be safe in this case but not in general.  And I don't know enough
> > about this case to say if it is or not.
> > 
> > What would happen if you simply removed /__init/ from ip_nat_rule_init()?
> 
> Then there is an __initdata section problem.  Hrm.
> So the problem is that the error/exit ending code in init_or_cleanup() has a
> dual role.  I think that some parts of your original patch make sense,
> but that you cannot just drop the exit function.
> 
> ISTM that you picked a messy one to start on.  8(
> I'll look a bit more to see if I have any ideas.

The cleanest thing that I can see to do is to separate the init and exit
functions (like you have done somewhat) and duplicate the exit/cleanup code
in its own function (but without the labels:).
And put a comment on the exit function that it must (or should) be the same
as the init function's error/cleanup path.

> > > So the patch below removes the unneeded module unload stuff and renames
> > > init_or_cleanup() to init() and marks it __init.

---
~Randy

--===============31037534868623062==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31037534868623062==--
