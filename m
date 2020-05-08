From: Jeremy Kerr <jk@ozlabs.org>
Date: Fri, 08 May 2020 10:13:46 +0000
Subject: Re: [PATCH] powerpc/spufs: adjust list element pointer type
Message-Id: <4c9cc9184213ded65489cb95050046c8904ddad8.camel@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1588929176-28527-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1588929176-28527-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Nic Volanschi <eugene.volanschi@inria.fr>, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

Hi Julia,

> Other uses of &gang->aff_list_head, eg in spufs_assert_affinity, indicate
> that the list elements have type spu_context, not spu as used here.  Change
> the type of tmp accordingly.

Looks good to me; we could even use ctx there, rather than the separate
tmp variable.

Reviewed-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
