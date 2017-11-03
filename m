From: Juergen Gross <jgross@suse.com>
Date: Fri, 03 Nov 2017 09:01:16 +0000
Subject: Re: [PATCH] xen/pvcalls: fix unsigned less than zero error check
Message-Id: <2116793f-cd52-a99f-772e-5dcb768ad411@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171103084202.27790-1-colin.king@canonical.com>
In-Reply-To: <20171103084202.27790-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/11/17 09:42, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check on bedata->ref is never true because ref is an unsigned
> integer. Fix this by assigning signed int ret to the return of the
> call to gnttab_claim_grant_reference so the -ve return can be checked.
> 
> Detected by CoverityScan, CID#1460358 ("Unsigned compared against 0")
> 
> Fixes: 219681909913 ("xen/pvcalls: connect to the backend")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

