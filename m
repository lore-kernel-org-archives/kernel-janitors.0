From: Juergen Gross <jgross@suse.com>
Date: Thu, 22 Feb 2018 19:19:51 +0000
Subject: Re: [PATCH] xen/pvcalls: fix null pointer dereference on map->sock
Message-Id: <ad17f925-bf95-967d-45d8-3248aea6ddcd@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180222172259.10381-1-colin.king@canonical.com>
In-Reply-To: <20180222172259.10381-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 22/02/18 18:22, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if map is null then a potential null pointer deference
> occurs when calling sock_release on map->sock.  I believe the
> actual intention was to call sock_release on sock instead. Fix
> this.
> 
> Fixes: 5db4d286a8ef ("xen/pvcalls: implement connect command")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Hmm, yes, kind of obvious. :-)

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

