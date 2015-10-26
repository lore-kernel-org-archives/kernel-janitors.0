From: Michal Marek <mmarek@suse.com>
Date: Mon, 26 Oct 2015 21:39:50 +0000
Subject: Re: [PATCH] cocinelle: iterators: semantic patch to delete unneeded of_node_put
Message-Id: <562E9DA6.1040702@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445544719-11953-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445544719-11953-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Dne 22.10.2015 v 22:11 Julia Lawall napsal(a):
> Device node iterators perform an of_node_put on each iteration, so putting
> an of_node_put before a continue results in a double put.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to kbuild.git#misc, thanks.

Michal

