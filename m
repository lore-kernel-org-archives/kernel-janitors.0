From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 May 2015 12:28:19 +0000
Subject: Re: [PATCH v2 8/8] staging: lustre: code cleanup - normalize whitespace
Message-Id: <20150508122819.GV14154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
 <1431086460-22455-16-git-send-email-shuey@purdue.edu>
In-Reply-To: <1431086460-22455-16-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Shuey <shuey@purdue.edu>
Cc: oleg.drokin@intel.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org

On Fri, May 08, 2015 at 08:01:00AM -0400, Mike Shuey wrote:
> +	struct rdma_cm_id  *ibh_cmid;           /* listener cmid */
> +	struct ib_device   *ibh_ibdev;          /* IB device */
> +	int                ibh_page_shift       /* page shift of current HCA */
> +	int                ibh_page_size        /* page size of current HCA */
> +	__u64              ibh_page_mask;       /* page mask of current HCA */

We give people who break the build a severe dressing down the first time
so that they remember not to do it again...

*ALWAYS DOUBLE CHECK*

regards,
dan carpenter

