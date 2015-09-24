From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Sep 2015 15:51:01 +0000
Subject: Re: [PATCH] coccinelle: assign signed result to unsigned variable
Message-Id: <56041BE5.5010005@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1443099286-16559-1-git-send-email-a.hajda@samsung.com>
In-Reply-To: <1443099286-16559-1-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> +@rs@
> +position p;
> +typedef bool, u8, u16, u32, u64, s8, s16, s32, s64;
> +{char, short int, int, long, long long, s8, s16, s32, s64} vs;

Can it matter to specify also the type modifier "signed" in this SmPL approach?
http://coccinelle.lip6.fr/docs/main_grammar005.html#ctype_qualif


> +{unsigned char, unsigned short, unsigned int, unsigned long, unsigned long long, size_t, bool, u8, u16, u32, u64} vu;

How do you think about to reformat such a data type enumeration?


> +@@
> +
> +vu@p = vs
> +
> +@r@
> +position rs.p;
> +identifier v, f;
> +statement S1, S2;
> +expression e;
> +@@
> +
> +*v@p = f(...);

Do you try to check here if the value receiver is at the same source code
position from the SmPL rule "rs"?

Regards,
Markus
