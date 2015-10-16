From: Gabriel Paubert <paubert@iram.es>
Date: Fri, 16 Oct 2015 07:15:52 +0000
Subject: Re: [PATCH v2] powerpc/mpc5xxx: Avoid dereferencing potentially freed memory
Message-Id: <20151016071552.GB20310@visitor2.iram.es>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151014040011.8AB1514110A@ozlabs.org>
 <1444888580-12966-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <1444890977.5970.4.camel@ellerman.id.au>
 <5620971D.8040103@wanadoo.fr>
In-Reply-To: <5620971D.8040103@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Michael Ellerman <mpe@ellerman.id.au>, kernel-janitors@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Fri, Oct 16, 2015 at 08:20:13AM +0200, Christophe JAILLET wrote:
> Le 15/10/2015 08:36, Michael Ellerman a =E9crit :
> >On Thu, 2015-10-15 at 07:56 +0200, Christophe JAILLET wrote:
> >>Use 'of_property_read_u32()' instead of 'of_get_property()'+pointer
> >>dereference in order to avoid access to potentially freed memory.
> >>
> >>Use 'of_get_next_parent()' to simplify the while() loop and avoid the
> >>need of a temp variable.
> >>
> >>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >>---
> >>v2: Use of_property_read_u32 instead of of_get_property+pointer derefer=
ence
> >>*** Untested ***
> >Thanks.
> >
> >Can someone with an mpc5xxx test this?
> >
> >cheers
> >
>=20
> Hi,
> I don't think it is an issue, but while looking at another similar
> patch, I noticed that the proposed patch adds a call to
> be32_to_cpup() (within of_property_read_u32).
> Apparently, powerPC is a BE architecture, so this call should be a no-op.

Sadly no more. 32 bit is BE only, but 64 bit can be either BEtter or
LEsser.

    Gabriel
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
