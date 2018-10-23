From: David Miller <davem@davemloft.net>
Date: Tue, 23 Oct 2018 02:34:45 +0000
Subject: Re: [PATCH net] qlcnic: fix a return in qlcnic_dcb_get_capability()
Message-Id: <20181022.193445.1141993426806484413.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019201111.xwetmozyy46xd3pg@kili.mountain>
In-Reply-To: <20181019201111.xwetmozyy46xd3pg@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Shahed.Shaikh@cavium.com, sucheta.chakraborty@qlogic.com, manish.chopra@cavium.com, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Oct 2018 23:11:11 +0300

> These functions are supposed to return one on failure and zero on
> success.  Returning a zero here could cause uninitialized variable
> bugs in several of the callers.  For example:
> 
>     drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1660 get_iscsi_dcb_priority()
>     error: uninitialized symbol 'caps'.
> 
> Fixes: 48365e485275 ("qlcnic: dcb: Add support for CEE Netlink interface.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
