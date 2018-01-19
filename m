From: Jiri Pirko <jiri@mellanox.com>
Date: Fri, 19 Jan 2018 18:38:33 +0000
Subject: Re: [bug report] net: sched: use block index as a handle instead of qdisc when block is shared
Message-Id: <20180119183833.GA2071@nanopsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180119134929.GA3392@mwanda>
In-Reply-To: <20180119134929.GA3392@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fri, Jan 19, 2018 at 02:49:29PM CET, dan.carpenter@oracle.com wrote:
>Hello Jiri Pirko,
>
>The patch 7960d1daf278: "net: sched: use block index as a handle
>instead of qdisc when block is shared" from Jan 17, 2018, leads to
>the following static checker warning:
>
>	net/sched/cls_api.c:1362 tc_dump_tfilter()
>	error: uninitialized symbol 'parent'.

Fixed already in net-next.
