From: Sakari Ailus <sakari.ailus@iki.fi>
Date: Fri, 10 Jan 2014 09:00:19 +0000
Subject: Re: [patch] [media] i2c: lm3560: missing unlocks on error in lm3560_set_ctrl()
Message-Id: <20140110090019.GB9997@valkosipuli.retiisi.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131216094544.GB13831@elgon.mountain>
In-Reply-To: <20131216094544.GB13831@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Daniel Jeong <gshark.jeong@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan and Daniel,

On Mon, Dec 16, 2013 at 12:45:44PM +0300, Dan Carpenter wrote:
> There are several error paths which don't unlock on error.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch. However it seems this change has been already done by
essentially similar patch (w/o the redundant rval check removal):

commit eed8c3eebce72fe4fc766f9a23e4324b04bd86cf
Author: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
Date:   Thu Nov 7 09:44:42 2013 -0300

    [media] media: i2c: lm3560: fix missing unlock on error in lm3560_set_ctrl()
    
    Add the missing unlock before return from function lm3560_set_ctrl()
    in the error handling case.
    
    Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
    Signed-off-by: Mauro Carvalho Chehab <m.chehab@samsung.com>

This patch is in Mauro's tree already (and possibly elsewhere).

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
