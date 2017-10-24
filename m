From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Oct 2017 14:51:54 +0000
Subject: Re: drm/i915/gvt: Use common error handling code in shadow_workload_ring_buffer()
Message-Id: <d92e1137-3d4c-8735-ceb4-4664a5803cdf@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f563de94-afaa-ecde-2907-d6baaad65939@users.sourceforge.net>
 <87efpsiu7r.fsf@intel.com>
 <636f6272-9074-53dc-2c90-cbb4a7cd0901@users.sourceforge.net>
 <1A433E6A-DE06-4407-9E33-3CBBA4ADF01B@gmail.com>
 <20171024142615.t3y5atz6nulkq55h@mwanda>
 <1508856148.1955.12.camel@perches.com>
In-Reply-To: <1508856148.1955.12.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Cc: Garry Hurley <garry.hurley.jr@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>

>> =E2=80=A6  It's just that two out of three error
>> messages happened to be the same and Markus wants to save a bit of
>> memory by using the same string.  The memory savings is not so big that
>> it's worth making the code less readable.
>=20
> I agree with Dan.
>=20
> It doesn't save any real memory either as the compiler/linker
> reuses the repeated string.

It might depend on passing appropriate parameters.


> It might, depending on the compiler, save a few bytes of
> object code as the compiler may not optimize the repeated
> call away though.

I am trying to show corresponding change possibilities.


> But a good compiler could do that too.

Do you prefer to delegate the proposed software refactoring
only to a corresponding optimiser?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
