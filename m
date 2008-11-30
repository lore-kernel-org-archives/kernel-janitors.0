From: Jiri Kosina <jkosina@suse.cz>
Date: Sun, 30 Nov 2008 13:09:06 +0000
Subject: Re: [PATCH] rtc-stk17ta8: fix sparse warning
Message-Id: <alpine.LNX.1.10.0811301408180.15220@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49304ffd.09a1660a.30b3.ffffc7a7@mx.google.com> <20081130013931.1b48f892@i1501.lan.towertech.it>
In-Reply-To: <20081130013931.1b48f892@i1501.lan.towertech.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <alessandro.zummo@towertech.it>
Cc: Hannes Eder <hannes@hanneseder.net>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org

On Sun, 30 Nov 2008, Alessandro Zummo wrote:

> > Fix this sparse warning:
> > 
> >   drivers/rtc/rtc-stk17ta8.c:403:2: warning: returning void-valued expression
> > 
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
>  Acked-by: Alessandro Zummo <a.zummo@towertech.it>

Thanks. The same as for rtc-ds1511 patch -- I have queued it in trivial 
tree, if anyone has taken it through another tree, please let me know.

-- 
Jiri Kosina
SUSE Labs
