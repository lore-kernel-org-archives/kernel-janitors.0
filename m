From: Juergen Gross <jgross@suse.com>
Date: Fri, 08 Mar 2019 17:16:38 +0000
Subject: Re: [PATCH] xen, cpu_hotplug: Prevent an out of bounds access
Message-Id: <ca3cd95b-a07d-254d-1e42-5a36686a805d@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190307054122.GB4517@kadam>
In-Reply-To: <20190307054122.GB4517@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Alex Nixon <alex.nixon@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org

On 07/03/2019 06:41, Dan Carpenter wrote:
> The "cpu" variable comes from the sscanf() so Smatch marks it as
> untrusted data.  We can't pass a higher value than "nr_cpu_ids" to
> cpu_possible() or it results in an out of bounds access.
> 
> Fixes: d68d82afd4c8 ("xen: implement CPU hotplugging")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to xen/tip.git for-linus-5.1a


Juergen
