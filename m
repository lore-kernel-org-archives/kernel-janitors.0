From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 29 Mar 2006 09:48:14 +0000
Subject: Re: [KJ][Patch][update] fix kbuild warning in iptable_nat.o
Message-Id: <1143625694.7779.18.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48531488215377827=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1143548373.14792.9.camel@localhost.localdomain>
In-Reply-To: <1143548373.14792.9.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============48531488215377827==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-03-28 at 09:06 -0800, Nishanth Aravamudan wrote:
> On 28.03.2006 [23:19:33 +1100], Darren Jenkins" wrote:
> 
> <snip>
> 
> > As iptable_nat.o seems to be compiled into the kernel (from
> > ip_nat_rule.c and ip_nat_standalone.c) by default, I don't think we need
> > the __exit function (correct me if I am wrong).
> 
> <snip>
> 
> What happens when we do build NAT filtering support as a module? Just
> because the default is non-modular, does not mean we can ignore the
> option.
> 
> Thanks,
> Nish
> 

Actually I thought that as in the Makefile, it does not depend on any
config options to be built. That it would only ever be compiled into the
kernel.
Thinking about it, I guess it could be a module in the next higher level
Makefile, and I should probably read up on how a Makefile works
anyway. :)

Darren J.


--===============48531488215377827==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48531488215377827==--
