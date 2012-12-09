From: Michal Marek <mmarek@suse.cz>
Date: Sun, 09 Dec 2012 15:04:30 +0000
Subject: Re: [PATCH] scripts/coccinelle/misc/warn.cocci: use WARN
Message-Id: <20121209150429.GA29236@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351972929-7448-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351972929-7448-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Sat, Nov 03, 2012 at 09:02:09PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Use WARN(1,...) rather than printk followed by WARN(1).
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  scripts/coccinelle/misc/warn.cocci |  109 +++++++++++++++++++++++++++++++++++++

Applied to kbuild.git#misc, thanks.

Michal
