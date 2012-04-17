From: Chris Boot <bootc@bootc.net>
Date: Tue, 17 Apr 2012 07:59:06 +0000
Subject: Re: [patch] sbp-target: checking for NULL instead of IS_ERR()
Message-Id: <8758CC06-932B-499D-8476-53857F500C0D@bootc.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120417062946.GB26756@elgon.mountain>
In-Reply-To: <20120417062946.GB26756@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 17 Apr 2012, at 07:29, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> target_fabric_configfs_init() never returns NULL, it only returns
> ERR_PTRs.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Dan,

Thanks, good catch. I guess my code came from before the change and I never noticed.

Acked-by: Chris Boot <bootc@bootc.net>

-- 
Chris Boot
bootc@bootc.net

