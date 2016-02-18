From: Michal Marek <mmarek@suse.com>
Date: Thu, 18 Feb 2016 21:10:54 +0000
Subject: Re: [PATCH] coccinelle: bugon: reduce rule applicability
Message-Id: <56C6335E.2010006@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1454522746-396-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1454522746-396-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Dne 3.2.2016 v 19:05 Julia Lawall napsal(a):
> Rule r is only use in org or report mode, so only execute it in those
> cases.

I applied this and the previous three patches to kbuild.git#misc.

Thanks,
Michal

