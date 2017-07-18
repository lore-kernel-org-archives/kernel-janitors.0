From: Juergen Gross <jgross@suse.com>
Date: Tue, 18 Jul 2017 08:01:00 +0000
Subject: Re: [PATCH][xen-next] xen/pvcalls: fix null pointer reference on sock_release call
Message-Id: <63061c05-e462-be95-0219-a0cdf6c17449@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170711194121.24802-1-colin.king@canonical.com>
In-Reply-To: <20170711194121.24802-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/07/17 21:41, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a sock_release on map->sock will result in a null pointer
> deference on map when map is null. Instead, the sock_relase sould
> be on sock and not map->sock.
> 
> Detected by CoverityScan, CID#1450169 ("Dereference after null check")
> 
> Fixes: b535e2b9b78a ("xen/pvcalls: implement connect command")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Committed to xen/tip for-linus-4.13


Thanks,

Juergen

