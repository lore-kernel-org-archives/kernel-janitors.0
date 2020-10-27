From: David Howells <dhowells@redhat.com>
Date: Tue, 27 Oct 2020 11:05:46 +0000
Subject: Re: [PATCH][next] afs: fix a dereference on pointer cell before cell is null checked
Message-Id: <3189277.1603796746@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201021131133.128016-1-colin.king@canonical.com>
In-Reply-To: <20201021131133.128016-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> @@ -606,7 +605,7 @@ void afs_unuse_cell(struct afs_net *net, struct afs_cell *cell, enum afs_cell_tr
>  
>  	u = atomic_read(&cell->ref);
>  	a = atomic_dec_return(&cell->active);
> -	trace_afs_cell(debug_id, u, a, reason);
> +	trace_afs_cell(cell->debug_id, u, a, reason);

It's probably better to read cell->debug_id before calling
atomic_dec_return().

I have a patch for this based on a report by Dan Carpenter, so no need to send
a revised patch.

Thanks,
David
