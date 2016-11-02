From: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
Date: Wed, 02 Nov 2016 16:50:40 +0000
Subject: Re: [PATCH] cxl: Fix error handling
Message-Id: <dc935793-1726-7066-88b4-83c394099f7f@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030214047.25037-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030214047.25037-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org



Le 30/10/2016 =E0 22:40, Christophe JAILLET a =E9crit :
> 'cxl_dev_context_init()' returns an error pointer in case of error, not
> NULL. So test it with IS_ERR.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---


Thanks for the 3 patches!

Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
