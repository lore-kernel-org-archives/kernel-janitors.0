From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 May 2015 07:15:56 +0000
Subject: Re: [PATCH RFC] Coccinelle: Check for return not matching function signature
Message-Id: <5549BFAC.2010609@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430820761-28122-1-git-send-email-hofrat@osadl.org>
In-Reply-To: <1430820761-28122-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> +virtual context
> +virtual org
> +virtual report

Where do you want to reuse these variables in your SmPL scripts?


> +@match@
> +identifier f,ret;
> +position p;
> +type T1,T2;
> +@@
> +
> +T1 f(...) {
> + T2 ret;

Will it be more helpful to mark only such variable declarations
where the specified data type should be reconsidered
by a minus character or an asterisk (instead of the following
return statement)?

> +<+...
> +* return@p ret
> +;
> +...+>
> +}


Regards,
Markus

