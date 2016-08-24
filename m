From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Aug 2016 16:14:13 +0000
Subject: Re: wan-cosa: Use memdup_user() rather than duplicating its implementation
Message-Id: <375bce2b-6c19-902e-65ce-cccaedd2184e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5d335025-5f52-d4b6-0b60-89a2fd354694@users.sourceforge.net>
 <20160824152154.GT10241@fi.muni.cz>
In-Reply-To: <20160824152154.GT10241@fi.muni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Jan Kasprzak <kas@fi.muni.cz>
Cc: netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>

> 	What about the GFP_DMA attribute, which your patch deletes?
> The buffer in question has to be ISA DMA-able.

Thanks for your constructive feedback.

Would you be interested in using a variant of the function "memdup_=85"
with which the corresponding memory allocation option can be preserved?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
