From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Apr 2017 08:49:16 +0000
Subject: Re: staging: ks7010: Adjust dev_err() calls in ks7010_sdio_probe()
Message-Id: <ec2d26bd-d9c0-25bf-dcfb-d9ac564bfc73@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <901acc3c-ff1b-6f0c-b744-2bfb36de18d8@users.sourceforge.net>
 <1468787163.1900.1.camel@perches.com> <20160720155500.GG1688@katana>
 <12095569-1d23-7676-adef-b89ebc3a229b@users.sourceforge.net>
 <20170411223915.GD8814@eros>
In-Reply-To: <20170411223915.GD8814@eros>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Tobin C. Harding" <me@tobin.cc>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sabitha George <sabitha.george@gmail.com>, sayli karnik <karniksayli1995@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Joe Perches <joe@perches.com>

> This patch does not apply to Greg's staging-testing branch.

Could the proposed changes be applied with a bit of “fuzz” for the
implementation of the function “ks7010_sdio_probe”?


> Markus a patch was merged the same day you submitted this one that
> refactored this code.

Do you refer to your contributions from 2017-04-10 here which seem to
touch only other functions?
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/log/?h=staging-testing&qt=author&q=Tobin+C.+Harding


> The patch was good though, good spotting.

Will there any more approaches be needed for a corresponding
editing conflict resolution?
Which day would be better to dare a resend for my small update suggestion?

Regards,
Markus
