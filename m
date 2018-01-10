From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jan 2018 12:25:44 +0000
Subject: Re: [PATCH 2/2] soundwire: Testing the wrong variable
Message-Id: <20180110122544.jihugwmbjr4qphf4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180109093700.7275ardpus7g6rkq@mwanda>
 <20180109093744.egp4vynjgghidp6i@mwanda>
 <20180110105544.GZ18649@localhost>
In-Reply-To: <20180110105544.GZ18649@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org

On Wed, Jan 10, 2018 at 04:25:44PM +0530, Vinod Koul wrote:
> On Tue, Jan 09, 2018 at 12:37:44PM +0300, Dan Carpenter wrote:
> > We should be using "status2" here instead of "status".
> 
> This is already fixed by commit:
> 
> Author: Wei Yongjun <weiyongjun1@huawei.com>
> Date:   Mon Jan 8 22:22:44 2018 +0530
> 
>     soundwire: Fix typo in return value check of sdw_read()
> 
>     Fix the typo, 'status' should be instead of 'status2'.
> 


Hi Wei,

It looks like you're fixing static checker warnings?  Could you CC
kernel-janitors@vger.kernel.org for those fixes?  Otherwise we end up
sending duplicates a lot.

Colin King, Julia Lawall, Christophe JAILLET, and I all CC our static
checker fixes to kernel-janitors.  I still end up sending duplicates
sometimes...  Which is fine.

regards,
dan carpenter


