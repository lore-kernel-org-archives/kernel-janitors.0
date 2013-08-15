From: Michal Marek <mmarek@suse.cz>
Date: Thu, 15 Aug 2013 15:25:35 +0000
Subject: Re: [PATCH] scripts/coccinelle/misc/warn.cocci: use WARN
Message-Id: <520CF2EF.8080000@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376313683-32276-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376313683-32276-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On 12.8.2013 15:21, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Use WARN(1,...) rather than printk followed by WARN(1).
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  scripts/coccinelle/misc/warn.cocci |  109 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)

Hi Julia,

this has been in mainline since v3.8-rc1 as commit ad99ac2.

Michal
