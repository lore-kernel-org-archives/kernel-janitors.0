From: Jiri Kosina <jkosina@suse.cz>
Date: Sun, 30 Nov 2008 13:08:13 +0000
Subject: Re: [PATCH] rtc-ds1511: fix sparse warning
Message-Id: <alpine.LNX.1.10.0811301407330.15220@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <493049fa.06a1660a.3655.ffffab3c@mx.google.com> <20081130013949.280ae5c0@i1501.lan.towertech.it>
In-Reply-To: <20081130013949.280ae5c0@i1501.lan.towertech.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <alessandro.zummo@towertech.it>
Cc: Hannes Eder <hannes@hanneseder.net>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org

On Sun, 30 Nov 2008, Alessandro Zummo wrote:

> > Fix this sparse warning:
> > 
> >   drivers/rtc/rtc-ds1511.c:634:2: warning: returning void-valued expression
> > 
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
>  Acked-by: Alessandro Zummo <a.zummo@towertech.it>

Applied to trivial patches tree. If anyone has already merged this through 
another subsystem tree, please let me know.

Thanks,

-- 
Jiri Kosina
SUSE Labs
