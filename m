From: Sowmini Varadhan <sowmini.varadhan@oracle.com>
Date: Sun, 11 Mar 2018 17:22:07 +0000
Subject: Re: [PATCH][rds-next] rds: make functions rds_info_from_znotifier and rds_message_zcopy_from_user st
Message-Id: <20180311172207.GB7812@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180311170340.27696-1-colin.king@canonical.com>
In-Reply-To: <20180311170340.27696-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Santosh Shilimkar <santosh.shilimkar@oracle.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On (03/11/18 18:03), Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Functions rds_info_from_znotifier and rds_message_zcopy_from_user are
> local to the source and do not need to be in global scope, so make them
> static.

the rds_message_zcopy_from_user warning was already flagged by  kbuild-robot
last week.  See
   https://www.spinics.net/lists/netdev/msg488041.html


 

