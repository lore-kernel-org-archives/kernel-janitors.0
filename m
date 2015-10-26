From: Michal Marek <mmarek@suse.com>
Date: Mon, 26 Oct 2015 21:41:40 +0000
Subject: Re: [PATCH 2/2 v2] coccinelle: ifnullfree: handle various destroy functions
Message-Id: <562E9E14.4000901@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445894906-28137-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445894906-28137-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Dne 26.10.2015 v 22:28 Julia Lawall napsal(a):
> Extend ifnullfree to the various destroy functions that were recently
> extended to tolerate NULL arguments.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied both to kbuild.git#misc, thanks.

Michal

