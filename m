From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jul 2018 11:00:09 +0000
Subject: Re: [v3] Coccinelle: suggest replacing strncpy+truncation by strscpy
Message-Id: <154c8cbb-c396-d3b6-c53c-f28b4e44c0ed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.20.1807200745400.2349@hadrien>
In-Reply-To: <alpine.DEB.2.20.1807200745400.2349@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>, Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

> The problem is that I don't know if the script is correct

Will the clarification of such a concern evolve into another interesting
software development adventure?


> - I'm not familiar with these string functions.

How are the chances to improve the understanding of affected programming
interfaces anyhow?
https://elixir.bootlin.com/linux/v4.18-rc5/source/lib/string.c#L154
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/string.c?id(c20cc73b9cc4288c86c2a3fc62af4087de4b19#n154

Regards,
Markus
