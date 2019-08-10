From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Sat, 10 Aug 2019 10:20:31 +0000
Subject: Re: [PATCH 1/2] powerpc/xive: Use GFP_KERNEL instead of GFP_ATOMIC in 'xive_irq_bitmap_add()'
Message-Id: <465J5q1gVcz9sNf@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <85d5d247ce753befd6aa63c473f7823de6520ccd.1564647619.git.christophe.jaillet@wanadoo.fr>
References: <85d5d247ce753befd6aa63c473f7823de6520ccd.1564647619.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <85d5d247ce753befd6aa63c473f7823de6520ccd.1564647619.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org, allison@lohutok.net, tglx@linutronix.de, clg@kaod.org, groug@kaod.org
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Thu, 2019-08-01 at 08:32:31 UTC, Christophe JAILLET wrote:
> There is no need to use GFP_ATOMIC here. GFP_KERNEL should be enough.
> GFP_KERNEL is also already used for another allocation just a few lines
> below.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Greg Kurz <groug@kaod.org>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/2705ec100b46390851542fa97e920cc21ffaac4f

cheers
