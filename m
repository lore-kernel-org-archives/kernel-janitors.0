From: Juergen Gross <jgross@suse.com>
Date: Wed, 08 Nov 2017 13:30:12 +0000
Subject: Re: [PATCH] xen/privcmd: remove unused variable pageidx
Message-Id: <5a4f3027-c6c9-d0eb-32a9-4eb6d1061fe5@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171108130030.25394-1-colin.king@canonical.com>
In-Reply-To: <20171108130030.25394-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/11/17 14:00, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable pageidx is assigned a value but it is never read, hence it
> is redundant and can be removed. Cleans up clang warning:
> 
> drivers/xen/privcmd.c:199:2: warning: Value stored to 'pageidx'
> is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

