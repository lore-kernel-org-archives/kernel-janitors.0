From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Apr 2016 09:03:09 +0000
Subject: Re: [patch] ARM: qcom: silence an uninitialized variable warning
Message-Id: <20160414090309.GF4247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160413064511.GG8092@mwanda>
 <201604140353.03595.arnd@arndb.de>
In-Reply-To: <201604140353.03595.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tim Bird <tim.bird@sonymobile.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 14, 2016 at 03:53:03AM +0200, Arnd Bergmann wrote:
> On Wednesday 13 April 2016, Dan Carpenter wrote:
> > It's harmless but, if "enable" isn't set, then we pass uninitialized
> > values to qcom_coincell_chgr_config().  The values aren't used, but
> > let's silence the warning anyway.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> I haven't seen this warning in my tests, which means it probably doesn't show up
> in the usual configurations. Are you sure this doesn't just happen with
> CONFIG_PROFILE_ALL_BRANCHES, CONFIG_CC_OPTIMIZE_FOR_SIZE or CONFIG_GCOV_PROFILE_ALL,
> or with versions of gcc before 4.9?
> 

This is a smatch stuff I'm working on.  Realistically, I have to make
Smatch warn when we pass uninitialized values to a function.  I can't
make smatch do the extra analysis to test if the values are used or not.

regards,
dan carpenter

