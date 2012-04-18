From: "Eilon Greenstein" <eilong@broadcom.com>
Date: Wed, 18 Apr 2012 09:27:07 +0000
Subject: Re: [patch] bnx2x: off by one in bnx2x_ets_e3b0_sp_pri_to_cos_set()
Message-Id: <1334741227.12363.5.camel@lb-tlvb-eilong.il.broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120418065342.GC12831@elgon.mountain>
In-Reply-To: <20120418065342.GC12831@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2012-04-18 at 09:53 +0300, Dan Carpenter wrote:
> The sp_pri_to_cos[] array size depends on the config but lets say it is
> BX_E3B0_MAX_NUM_COS_PORT0 and max_num_of_cos is also
> DCBX_E3B0_MAX_NUM_COS_PORT0.  In the original code
> "pri = max_num_of_cos" was accepted but it is one past the end of the
> array.
> 
> Also we used "pri" before capping it.  It's a harmless read past the end
> of the array, but it would affect which error message gets printed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Acked-by: Eilon Greenstein <eilong@broadcom.com>

Thanks Dan - this is obviously better.



