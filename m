From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Sep 2015 13:01:48 +0000
Subject: Re: [PATCH] coccinelle: tests: unsigned value cannot be lesser than zero
Message-Id: <55F816BC.5050407@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442309232-5902-1-git-send-email-a.hajda@samsung.com>
In-Reply-To: <1442309232-5902-1-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> +@r depends on context || org || report@
> +position p;
> +typedef u8, u16, u32, u64;

Can the involved data types be restricted for unsigned types for such
a source code analysis in a more general way?


> +{unsigned char, unsigned short int, unsigned int, unsigned long, unsigned long long, size_t, u8, u16, u32, u64} v;
> +@@
> +
> +(
> +*v@p < 0
> +|
> +*v@p >= 0
> +)

How do you think about to use the following SmPL wording instead?

 v@p
(
*< 0
|
*<= 0
)

Regards,
Markus
