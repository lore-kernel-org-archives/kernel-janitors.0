From: Stephen Hemminger <shemminger@osdl.org>
Date: Mon, 05 Jun 2006 17:44:26 +0000
Subject: Re: [KJ] [PATCH] Updated Documentation/networking/ip-sysctl.txt
Message-Id: <20060605104426.7f32c625@dxpl.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060604213420.GA16939@localhost>
In-Reply-To: <20060604213420.GA16939@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> 
>  Documentation/networking/ip-sysctl.txt | 1299 +++++++++++++++++++-------------
>  1 files changed, 756 insertions(+), 543 deletions(-)
> 
> diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
> index f12007b..7e1029d 100644
> --- a/Documentation/networking/ip-sysctl.txt
> +++ b/Documentation/networking/ip-sysctl.txt
> @@ -1,280 +1,418 @@
> +/proc/sys/net/core/* Variables:
> +
> +dev_weight - INTEGER
> +	TODO Add description.
> +	Default: 64
> +
> +divert_version - STRING
> +	TODO Add description.

String returned to DIVCMD_GETVERSION ioctl(). Default 0.46
(Pretty useless).

> +
> +netdev_budget - INTEGER
> +	TODO Add description.
Maximum number of packets processed per device per softirq.
Used to limit device consuming all the system under massive packet load.

> +	Default: 300
> +
> +netdev_max_backlog - INTEGER
> +	TODO Add description.
Limit on the outstanding receive packets queued per cpu. Applies to non-NAPI
devices only.

> +	Default: 1000
> +
> +optmem_max - INTEGER
> +	TODO Add description.
> +
> +rmem_default - INTEGER
> +	TODO Add description.
> +
> +rmem_max - INTEGER
> +	TODO Add description.
> +
> +somaxconn - INTEGER
> +	Limit of socket listen() backlog, known in userspace as SOMAXCONN.
> +	Defaults to 128.  See also tcp_max_syn_backlog for additional tuning
> +	for TCP sockets.
> +
> +wmem_default - INTEGER
> +	TODO Add description.
> +
> +wmem_max - INTEGER
> +	TODO Add description.
> +
> +xfrm_aevent_etime - u32
> +	TODO Add description.
> +	Default: 10
> +
> +xfrm_aevent_rseqth - u32
> +	TODO Add description.
> +	Default: 2
> +
> +
> +/proc/sys/net/ethernet/* Variables:
> +
> +No entries.
This will go away soon anyway.

+
+igmp_max_msf - INTEGER
+	TODO Add description.
+	Default: 10
Limit on the number of multicast source filters.

+
+ip_autoconfig - ????
+	TODO Add description.
This is defunct.

 
+tcp_base_mss - INTEGER
+	TODO Add description.
+	Default: 512
Lower bound for TCP path MTU discovery probing. 

+tcp_moderate_rcvbuf - BOOLEAN
+	TODO Add description.
+	Default: 1
If set TCP automatically adjusts the size of the socket receive
window based on the amount of space used in the receive queue.

+
+tcp_mtu_probing - INTEGER
+	TODO Add description.
+	Default: 0
If non-zero, then TCP attempts to discover routers that do not
correctly return ICMP fragmentation needed when receiving oversize
packets "black-holes". If greater than one???


+tcp_no_metrics_save - BOOLEAN
+	TODO Add description.
+	Default: 0
Normally, TCP will remember some characteristics about the last
connection in the flow cache.  If tcp_no_metrics_save is set, then
it doesn't. Useful for benchmarks or other tests.


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
