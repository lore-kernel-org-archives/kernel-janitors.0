From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Dec 2012 08:55:16 +0000
Subject: Re: [PATCH] staging: rtl8712: avoid a useless call to memset().
Message-Id: <20121210085516.GO6568@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354670522-27144-1-git-send-email-tipecaml@gmail.com>
 <20121205071156.GL6568@mwanda>
 <50C3DBF6.2080103@gmail.com>
In-Reply-To: <50C3DBF6.2080103@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: devel@driverdev.osuosl.org, florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, yongjun_wei@trendmicro.com.cn, marcos.souza.org@gmail.com, Larry.Finger@lwfinger.net

On Sun, Dec 09, 2012 at 01:31:50AM +0100, Cyril Roelandt wrote:
> On 12/05/2012 08:11 AM, Dan Carpenter wrote:
> >On Wed, Dec 05, 2012 at 02:22:02AM +0100, Cyril Roelandt wrote:
> >>In r8711_wx_get_wap(), make sure we do not call memcpy() on a memory area that
> >>has just been zeroed by a call to memset().
> >>
> >
> >I look at it like the original code is fine.  Your version is also
> >fine but is it worth the churn?  Also the curly braces are not
> >needed.
> >
> 
> Sorry about the braces.
> 
> I just thought the code would be easier to understand this way, but
> it's probably OK to leave it as it currently is too.
> 

Ah.  I'd buy that.  I like readability fixes.  The indenting is also
messed up and confusing.  It should be:

	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE |
				     WIFI_AP_STATE))
		memcpy(wrqu->ap_addr.sa_data, pcur_bss->MacAddress, ETH_ALEN);
	else
		memset(wrqu->ap_addr.sa_data, 0, ETH_ALEN);

regards,
dan carpenter
