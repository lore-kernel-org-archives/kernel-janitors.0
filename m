From: Michal Marek <mmarek@suse.cz>
Date: Fri, 14 Jun 2013 13:34:01 +0000
Subject: Re: [PATCH] scripts/coccinelle: check for field address argument to kfree
Message-Id: <20130614133401.GB5402@sepie.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1370708502-21907-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1370708502-21907-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Sat, Jun 08, 2013 at 06:21:42PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The argument to kfree should not be the address of a structure field.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to kbuild.git#misc.

Thanks,
Michal
