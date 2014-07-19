From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Sat, 19 Jul 2014 22:59:31 +0000
Subject: Re: [PATCH 3/5] net/netfilter/ipvs/ip_vs_ctl.c: drop argument range check just before the check for 
Message-Id: <CANZNk83yhnbw0c77UPnisaJr8AO8XtmUon78vEKGe=PBDrfWMw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405697638-23767-1-git-send-email-andrey.krieger.utkin@gmail.com>
	<alpine.LFD.2.11.1407182339160.2273@ja.home.ssi.bg>
	<CANZNk83dJCXAWrQ+i5rh=sdUuiiD5ZhzDua-rjJpBZCzzNGDJA@mail.gmail.com>
In-Reply-To: <CANZNk83dJCXAWrQ+i5rh=sdUuiiD5ZhzDua-rjJpBZCzzNGDJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Anastasov <ja@ssi.bg>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, lvs-devel@vger.kernel.org, netdev@vger.kernel.org, dcb314@hotmail.com, David Miller <davem@davemloft.net>, kadlec@blackhole.kfki.hu, Patrick McHardy <kaber@trash.net>, pablo@netfilter.org, Simon Horman <horms@verge.net.au>, wensong@linux-vs.org

2014-07-19 0:06 GMT+03:00 Andrey Utkin <andrey.krieger.utkin@gmail.com>:
> What about static check at compilation time?
>
> #if (DAEMON_ARG_LEN > MAX_ARG_LEN) \
>  || (SERVICE_ARG_LEN > MAX_ARG_LEN) \
>  || (SVCDEST_ARG_LEN > MAX_ARG_LEN)
> #error MAX_ARG_LEN exceeded in set_arglen table
> #endif

This approach doesn't work, looks because sizeof() values are not
calculated at preprocessing stage.

-- 
Andrey Utkin
