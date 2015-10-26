From: Michal Marek <mmarek@suse.com>
Date: Mon, 26 Oct 2015 19:55:32 +0000
Subject: Re: [PATCH] coccinelle: tests: improve odd_ptr_err.cocci
Message-Id: <562E8534.4090907@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440965894-12356-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440965894-12356-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Dne 30.8.2015 v 22:18 Julia Lawall napsal(a):
> The original version only considered the case where the then branch
> contains only one call to PTR_ERR.  Reimplement the whole thing to allow
> multiple calls, with potentially different arguments.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to kbuild.git#misc, thanks.

Michal

