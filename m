From: Bart Van Assche <bart.vanassche@gmail.com>
Date: Thu, 15 Dec 2016 15:43:55 +0000
Subject: Re: [patch] target/iscsi: double free in lio_target_tiqn_addtpg()
Message-Id: <9a86c61b-3ef3-264e-82f3-481a01929453@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161213122703.GB7519@elgon.mountain>
In-Reply-To: <20161213122703.GB7519@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/13/2016 01:27 PM, Dan Carpenter wrote:
> This iscsit_tpg_add_portal_group() function is only called from
> lio_target_tiqn_addtpg().  Both functions free the "tpg" pointer on
> error so it's a double free bug.  The memory is allocated in the caller
> so it should be freed in the caller and not here.
> 
> Fixes: e48354ce078c ("iscsi-target: Add iSCSI fabric support for target v4.1")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hello Dan,

Do you think a "Cc: stable" tag should be added to this patch?

Bart.
