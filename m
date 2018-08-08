From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Aug 2018 14:25:32 +0000
Subject: Re: [PATCH] scsi: aic94xx: fix an error code in aic94xx_init()
Message-Id: <20180808142532.yyikhoewexgcexww@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180808115640.at6qjutsykgexdt4@kili.mountain>
In-Reply-To: <20180808115640.at6qjutsykgexdt4@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 08, 2018 at 03:16:57PM +0100, John Garry wrote:
> On 08/08/2018 12:56, Dan Carpenter wrote:
> > We accidentally return success instead of -ENODEV on this error path.
> 
> Sorry to nitpick, but - as I see - the only way for
> sas_domain_attach_transport() to fail is if the kzalloc() in
> sas_attach_transport() fails, so should this be -ENOMEM? Other drivers
> return this error code for this scenario.
> 

Huh...  I was so sure I looked up other callers to see what people
normally return...  Anyway, you're right.  Let me resend.

regards,
dan carpenter

