From: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
Date: Wed, 02 Nov 2016 16:45:49 +0000
Subject: Re: [PATCH] cxl: Fix memory allocation failure test
Message-Id: <ca5aafc7-ae96-ad3b-dfc2-1e3b7413c259@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030193557.23862-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030193557.23862-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org



Le 30/10/2016 =E0 20:35, Christophe JAILLET a =E9crit :
> 'cxl_context_alloc()' does not return an error pointer. It is just a
> shortcut for a call to 'kzalloc' with 'sizeof(struct cxl_context)' as the
> size parameter.
>
> So its return value should be compared with NULL.
> While fixing it, simplify a bit the code.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---


Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
