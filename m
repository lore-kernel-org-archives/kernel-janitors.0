From: Michal Marek <mmarek@suse.com>
Date: Sat, 01 Oct 2016 21:03:56 +0000
Subject: Re: [PATCH] Coccinelle: limit memdup_user transformation to GFP_KERNEL case
Message-Id: <57F024BC.30606@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1474472919-12867-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1474472919-12867-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Dne 21.9.2016 v 17:48 Julia Lawall napsal(a):
> Memdup_user encapsulates a memory allocation with the flag GFP_KERNEL, so
> only allow this flag in the original code.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to kbuild.git#misc.

Thanks,
Michal

