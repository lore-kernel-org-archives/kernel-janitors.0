From: Michal Marek <mmarek@suse.cz>
Date: Thu, 11 Oct 2012 12:51:40 +0000
Subject: Re: [PATCH] scripts/coccinelle/tests/odd_ptr_err.cocci: semantic patch for IS_ERR/PTR_ERR inconsiste
Message-Id: <20121011125140.GA16465@sepie.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345927365-26814-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345927365-26814-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Sat, Aug 25, 2012 at 10:42:45PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  scripts/coccinelle/tests/odd_ptr_err.cocci |   65 +++++++++++++++++++++++++++++

Looks like I missed this one. I applied it to kbuild.git#misc now.

thanks,
Michal
