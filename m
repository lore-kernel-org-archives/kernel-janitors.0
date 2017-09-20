From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Sep 2017 13:56:06 +0000
Subject: Re: [PATCH] [media] Siano: Use common error handling code in smsusb_init_device()
Message-Id: <20170920135605.sneukaioeabalkud@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <be0003e5-d8e0-bff6-2205-7e88270ba2b4@users.sourceforge.net>
In-Reply-To: <be0003e5-d8e0-bff6-2205-7e88270ba2b4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Sep 20, 2017 at 02:40:28PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 20 Sep 2017 14:30:55 +0200
> 
> Add a jump target so that a bit of exception handling can be better
> reused at the end of this function.
> 
> This refactoring might fix also an error situation where the
> function "kfree" was not called after a software failure
> was noticed in two cases.
> 

No.  It doesn't fix a leak, it introduces a double free.  If
smscore_register_device() succeeds then mdev is freed when we call
smsusb_term_device(intf);  The call tree is:

smsusb_term_device()
 -> smscore_unregister_device()
    -> smscore_notify_clients()
       -> smsdvb_onremove()
          -> smsdvb_unregister_client()
             -> smsdvb_media_device_unregister()
                -> kfree(coredev->media_dev);

regards,
dan carpenter

