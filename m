From: Michal Marek <mmarek@suse.cz>
Date: Fri, 13 Jul 2012 21:09:29 +0000
Subject: Re: [PATCH] scripts/coccinelle/iterators/use_after_iter.cocci: list iterator variable semantic patch
Message-Id: <50008E89.1050006@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341866451-24290-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341866451-24290-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org

Dne 9.7.2012 22:40, Julia Lawall napsal(a):
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> If list_for_each_entry, etc complete a traversal of the list, the iterator
> variable ends up pointing to an address at an offset from the list head,
> and not a meaningful structure.  Thus this value should not be used after
> the end of the iterator.

Applied to kbuild.git#misc, thanks.

Michal
