From: Dan Carpenter <error27@gmail.com>
Date: Thu, 16 Sep 2010 13:23:33 +0000
Subject: Re: [PATCH 04/14] staging: ath6kl: check return code of get_user
Message-Id: <20100916132333.GA7867@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711550-7246-1-git-send-email-segooon@gmail.com> <35B17FE5076C7040809188FBE7913F983F2381DB98@SC1EXMB-MBCL.global.atheros.com> <20100916125908.GA4491@albatros>
In-Reply-To: <20100916125908.GA4491@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Vipin Mehta <Vipin.Mehta@Atheros.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 16, 2010 at 04:59:08PM +0400, Kulikov Vasiliy wrote:
> On Wed, Sep 08, 2010 at 22:59 -0700, Vipin Mehta wrote:
> > Hi Vasiliy,
> >     You mentioned in your email that you were unable to compile the driver. Can you pls reproduce a log of the errors you observed?
> 
> vasya@albatros:~/linux$ make allyesconfig && make drivers/staging/ath6kl/

CONFIG_STAGING=y
CONFIG_STAGING_EXCLUDE_BUILD=n

allyesconfig and allmodconfig don't include staging because to enable it
you need to say no to CONFIG_STAGING_EXCLUDE_BUILD.

I have a file called config-staging that includes the above lines.  Then
I do a:

KCONFIG_ALLCONFIG=config-staging make allmodconfig

regards,
dan carpenter
