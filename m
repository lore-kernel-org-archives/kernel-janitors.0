From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 31 Mar 2006 13:13:41 +0000
Subject: Re: [KJ][Patch][update] fix kbuild warning in iptable_nat.o
Message-Id: <20060331131341.GC3893@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62563090588765946=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1143548373.14792.9.camel@localhost.localdomain>
In-Reply-To: <1143548373.14792.9.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============62563090588765946==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 29, 2006 at 08:48:14PM +1100, Darren Jenkins" wrote:
> On Tue, 2006-03-28 at 09:06 -0800, Nishanth Aravamudan wrote:
> > On 28.03.2006 [23:19:33 +1100], Darren Jenkins" wrote:
> > 
> > <snip>
> > 
> > > As iptable_nat.o seems to be compiled into the kernel (from
> > > ip_nat_rule.c and ip_nat_standalone.c) by default, I don't think we need
> > > the __exit function (correct me if I am wrong).
> > 
> > <snip>
> > 
> > What happens when we do build NAT filtering support as a module? Just
> > because the default is non-modular, does not mean we can ignore the
> > option.
> > 
> > Thanks,
> > Nish
> > 
> 
> Actually I thought that as in the Makefile, it does not depend on any
> config options to be built. That it would only ever be compiled into the
> kernel.
> Thinking about it, I guess it could be a module in the next higher level
> Makefile, and I should probably read up on how a Makefile works
> anyway. :)

It's actually in the same Makefile:

...
iptable_nat-objs        := ip_nat_rule.o ip_nat_standalone.o
...
obj-$(CONFIG_IP_NF_NAT) += iptable_nat.o
...


The first statement expresses that iptable_nat is built from two object 
files.

The second statement tells that iptable_nat is built depending on 
CONFIG_IP_NF_NAT.

CONFIG_IP_NF_NAT is a tristate.


> Darren J.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============62563090588765946==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62563090588765946==--
