From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 16 Oct 2015 06:20:13 +0000
Subject: Re: [PATCH v2] powerpc/mpc5xxx: Avoid dereferencing potentially freed memory
Message-Id: <5620971D.8040103@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151014040011.8AB1514110A@ozlabs.org>
 <1444888580-12966-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <1444890977.5970.4.camel@ellerman.id.au>
In-Reply-To: <1444890977.5970.4.camel@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 15/10/2015 08:36, Michael Ellerman a =C3=A9crit :
> On Thu, 2015-10-15 at 07:56 +0200, Christophe JAILLET wrote:
>> Use 'of_property_read_u32()' instead of 'of_get_property()'+pointer
>> dereference in order to avoid access to potentially freed memory.
>>
>> Use 'of_get_next_parent()' to simplify the while() loop and avoid the
>> need of a temp variable.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> v2: Use of_property_read_u32 instead of of_get_property+pointer derefere=
nce
>> *** Untested ***
> Thanks.
>
> Can someone with an mpc5xxx test this?
>
> cheers
>

Hi,
I don't think it is an issue, but while looking at another similar=20
patch, I noticed that the proposed patch adds a call to be32_to_cpup()=20
(within of_property_read_u32).
Apparently, powerPC is a BE architecture, so this call should be a no-op.

Just wanted to point it out, in case of.

Best regards,
CJ

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
