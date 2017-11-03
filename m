From: Juergen Gross <jgross@suse.com>
Date: Fri, 03 Nov 2017 10:01:29 +0000
Subject: Re: [PATCH] xen/pvcalls: remove redundant check for irq >= 0
Message-Id: <f9627c5a-c1b4-71b2-fba4-5cefa24c33ba@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171103092047.28421-1-colin.king@canonical.com>
In-Reply-To: <20171103092047.28421-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/11/17 10:20, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> This is a moot point, but irq is always less than zero at the label
> out_error, so the check for irq >= 0 is redundant and can be removed.
> 
> Detected by CoverityScan, CID#1460371 ("Logically dead code")
> 
> Fixes: cb1c7d9bbc87 ("xen/pvcalls: implement connect command")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

