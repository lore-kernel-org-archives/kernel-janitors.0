From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 19 Oct 2015 04:38:10 +0000
Subject: Re: [PATCH v2] powerpc/mpc5xxx: Avoid dereferencing potentially freed memory
Message-Id: <1445229490.11557.3.camel@ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151014040011.8AB1514110A@ozlabs.org>
 <1444888580-12966-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <1444890977.5970.4.camel@ellerman.id.au> <5620971D.8040103@wanadoo.fr>
 <1444988979.12954.1.camel@ellerman.id.au> <562158A3.90000@wanadoo.fr>
In-Reply-To: <562158A3.90000@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2015-10-16 at 22:05 +0200, Christophe JAILLET wrote:
> Hi,
> sorry if un-clear.
> 
> What I mean is that in the patch related 
> 'powerpc/sysdev/mpc5xxx_clocks.c', there was no call to 'be32_to_cpup'.
> So in the proposed patch, 'of_property_read_u32' adds it.
> 
> While in the patch against 'powerpc/kernel/prom.c', 'be32_to_cpup' was 
> called explicitly.
> So using 'of_property_read_u32' keep the same logic.

Ah right, I understand now.

> Basically the code from 'mpc5xxx_clocks.c' and from 'prom.c' were 
> written the same way. I found spurious that a call to 'be32_to_cpup' was 
> done in only one case.
> Maybe, it was a missing in 'mpc5xxx_clocks.c'.

Yes it was missing in that code.

But that's not a real bug because that code only ever runs on BE systems.

cheers

