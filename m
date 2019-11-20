From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 20 Nov 2019 14:33:21 +0000
Subject: Re: [PATCH 1/4 v2] coccinelle: platform_get_irq: simplify context case
Message-Id: <072b7936-669b-e299-ba10-4f0d4ab4f080@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1574197705-31132-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1574197705-31132-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org

>  if ( \( ret < 0 \| ret <= 0 \) )

Can it make sense to specify the comparison by a constraint for
a metavariable of the type “binary operator” instead of a SmPL disjunction?

Regards,
Markus
