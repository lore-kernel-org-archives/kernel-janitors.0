From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Fri, 18 Jul 2014 17:41:01 +0000
Subject: Re: [PATCH 4/5] kernel/debug/kdb/kdb_bp.c: drop negativity check on unsigned value
Message-Id: <CANZNk80qTb0QMcpn7oBAbpO88rCCKHCCTVtmpHfzaZQun6m6Xg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405697692-23816-1-git-send-email-andrey.krieger.utkin@gmail.com>
	<53C956D5.50809@bfs.de>
In-Reply-To: <53C956D5.50809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net, dcb314@hotmail.com, jason.wessel@windriver.com

2014-07-18 20:18 GMT+03:00 walter harms <wharms@bfs.de>:
> i would expect a ckeck for the upper limit with ARRAY_SIZE

Thanks, resubmitted.

-- 
Andrey Utkin
