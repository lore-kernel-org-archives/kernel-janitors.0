From: Robert Fitzsimons <robfitz@273k.net>
Date: Sun, 04 Jun 2006 21:34:20 +0000
Subject: [KJ] [PATCH] Updated Documentation/networking/ip-sysctl.txt
Message-Id: <20060604213420.GA16939@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Reformatted entries so they are now sorted alphabetical within a
/proc/sys/net/ sub-directory.
Synced with 2.6.17-rc5, added markers for new entries which are missing
a description.

Signed-off-by: Robert Fitzsimons <robfitz@273k.net>
---

This is what I've come up with which.

The new entries are marked with TODO, I've added types and default
values if I was able to figure them out.

I also ran a aspell check and cleaned up some of the whitespace, I have
not checked the grammar or proof read the existing entries.

Robert



 Documentation/networking/ip-sysctl.txt | 1299 +++++++++++++++++++-------------
 1 files changed, 756 insertions(+), 543 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
index f12007b..7e1029d 100644
--- a/Documentation/networking/ip-sysctl.txt
+++ b/Documentation/networking/ip-sysctl.txt
@@ -1,280 +1,418 @@
+/proc/sys/net/core/* Variables:
+
+dev_weight - INTEGER
+	TODO Add description.
+	Default: 64
+
+divert_version - STRING
+	TODO Add description.
+
+message_burst - INTEGER
+	TODO Check description.
+	Allow a burst of message_burst network warning messages before the
+	rate limiting starts.  Also see message_cost.
+	Default: 10
+
+message_cost - INTEGER
+	TODO Check description.
+	Rate limit the number of network warning messages to one every
+	message_cost seconds.  Also see message_burst.
+	Default: 5
+
+netdev_budget - INTEGER
+	TODO Add description.
+	Default: 300
+
+netdev_max_backlog - INTEGER
+	TODO Add description.
+	Default: 1000
+
+optmem_max - INTEGER
+	TODO Add description.
+
+rmem_default - INTEGER
+	TODO Add description.
+
+rmem_max - INTEGER
+	TODO Add description.
+
+somaxconn - INTEGER
+	Limit of socket listen() backlog, known in userspace as SOMAXCONN.
+	Defaults to 128.  See also tcp_max_syn_backlog for additional tuning
+	for TCP sockets.
+
+wmem_default - INTEGER
+	TODO Add description.
+
+wmem_max - INTEGER
+	TODO Add description.
+
+xfrm_aevent_etime - u32
+	TODO Add description.
+	Default: 10
+
+xfrm_aevent_rseqth - u32
+	TODO Add description.
+	Default: 2
+
+
+/proc/sys/net/ethernet/* Variables:
+
+No entries.
+
+
 /proc/sys/net/ipv4/* Variables:
 
-ip_forward - BOOLEAN
-	0 - disabled (default)
-	not 0 - enabled 
+icmp_echo_ignore_all - BOOLEAN
+	If set non-zero, then the kernel will ignore all ICMP ECHO
+	requests sent to it.
+	Default: 0
 
-	Forward Packets between interfaces.
+icmp_echo_ignore_broadcasts - BOOLEAN
+	If set non-zero, then the kernel will ignore all ICMP ECHO and
+	TIMESTAMP requests sent to it via broadcast/multicast.
+	Default: 1
 
-	This variable is special, its change resets all configuration
-	parameters to their default state (RFC1122 for hosts, RFC1812
-	for routers)
+icmp_errors_use_inbound_ifaddr - BOOLEAN
+	If zero, ICMP error messages are sent with the primary address of
+	the exiting interface.
+
+	If non-zero, the message will be sent with the primary address of
+	the interface that received the packet that caused the ICMP error.
+	This is the behaviour network many administrators will expect from
+	a router.  And it can make debugging complicated network layouts
+	much easier.
+
+	Note that if no primary address exists for the interface selected,
+	then the primary address of the first non-loopback interface that
+	has one will be used regardless of this setting.
+
+	Default: 0
+
+icmp_ignore_bogus_error_responses - BOOLEAN
+	Some routers violate RFC1122 by sending bogus responses to broadcast
+	frames.  Such violations are normally logged via a kernel warning.
+	If this is set to TRUE, the kernel will not give such warnings, which
+	will avoid log file clutter.
+	Default: FALSE 
+
+icmp_ratelimit - INTEGER
+	Limit the maximal rates for sending ICMP packets whose type matches
+	icmp_ratemask (see below) to specific targets.
+	0 to disable any limiting, otherwise the maximal rate in jiffies(1)
+	Default: 100
+
+icmp_ratemask - INTEGER
+	Mask made of ICMP types for which rates are being limited.
+	Significant bits: IHGFEDCBA9876543210
+	Default mask:     0000001100000011000 (6168)
+
+	Bit definitions (see include/linux/icmp.h):
+		0 Echo Reply
+		3 Destination Unreachable *
+		4 Source Quench *
+		5 Redirect
+		8 Echo Request
+		B Time Exceeded *
+		C Parameter Problem *
+		D Timestamp Request
+		E Timestamp Reply
+		F Info Request
+		G Info Reply
+		H Address Mask Request
+		I Address Mask Reply
+
+	* These are rate limited by default (see default mask above)
+
+igmp_max_memberships - INTEGER
+	Change the maximum number of multicast groups we can subscribe to.
+	Default: 20
+
+igmp_max_msf - INTEGER
+	TODO Add description.
+	Default: 10
+
+inet_peer_gc_maxtime - INTEGER
+	Maximum interval between garbage collection passes.  This interval is
+	in effect under low (or absent) memory pressure on the pool.
+	Measured in jiffies(1).
+
+inet_peer_gc_mintime - INTEGER
+	Minimum interval between garbage collection passes.  This interval is
+	in effect under high memory pressure on the pool.
+	Measured in jiffies(1).
+
+inet_peer_maxttl - INTEGER
+	Maximum time-to-live of entries.  Unused entries will expire after
+	this period of time if there is no memory pressure on the pool (i.e.
+	when the number of entries in the pool is very small).
+	Measured in jiffies(1).
+
+inet_peer_minttl - INTEGER
+	Minimum time-to-live of entries.  Should be enough to cover fragment
+	time-to-live on the reassembling side.  This minimum time-to-live  is
+	guaranteed if the pool size is less than inet_peer_threshold.
+	Measured in jiffies(1).
+
+inet_peer_threshold - INTEGER
+	The approximate size of the storage.  Starting from this threshold
+	entries will be thrown aggressively.  This threshold also determines
+	entries' time-to-live and time intervals between garbage collection
+	passes.  More entries, less time-to-live, less GC interval.
+
+ip_autoconfig - ????
+	TODO Add description.
 
 ip_default_ttl - INTEGER
 	default 64
 
-ip_no_pmtu_disc - BOOLEAN
-	Disable Path MTU Discovery.
-	default FALSE
-
-min_pmtu - INTEGER
-	default 562 - minimum discovered Path MTU
+ip_dynaddr - BOOLEAN
+	If set non-zero, enables support for dynamic addresses.
+	If set to a non-zero value larger than 1, a kernel log
+	message will be printed when dynamic address rewriting
+	occurs.
+	Default: 0
 
-mtu_expires - INTEGER
-	Time, in seconds, that cached PMTU information is kept.
+ip_forward - BOOLEAN
+	0 - disabled (default)
+	not 0 - enabled
 
-min_adv_mss - INTEGER
-	The advertised MSS depends on the first hop route MTU, but will
-	never be lower than this setting.
+	Forward Packets between interfaces.
 
-IP Fragmentation:
+	This variable is special, its change resets all configuration
+	parameters to their default state (RFC1122 for hosts, RFC1812
+	for routers)
 
 ipfrag_high_thresh - INTEGER
-	Maximum memory used to reassemble IP fragments. When 
+	Maximum memory used to reassemble IP fragments.  When
 	ipfrag_high_thresh bytes of memory is allocated for this purpose,
 	the fragment handler will toss packets until ipfrag_low_thresh
 	is reached.
-	
-ipfrag_low_thresh - INTEGER
-	See ipfrag_high_thresh	
 
-ipfrag_time - INTEGER
-	Time in seconds to keep an IP fragment in memory.	
-
-ipfrag_secret_interval - INTEGER
-	Regeneration interval (in seconds) of the hash secret (or lifetime 
-	for the hash secret) for IP fragments.
-	Default: 600
+ipfrag_low_thresh - INTEGER
+	See ipfrag_high_thresh
 
 ipfrag_max_dist - INTEGER
-	ipfrag_max_dist is a non-negative integer value which defines the 
-	maximum "disorder" which is allowed among fragments which share a 
-	common IP source address. Note that reordering of packets is 
-	not unusual, but if a large number of fragments arrive from a source 
-	IP address while a particular fragment queue remains incomplete, it 
-	probably indicates that one or more fragments belonging to that queue 
-	have been lost. When ipfrag_max_dist is positive, an additional check 
-	is done on fragments before they are added to a reassembly queue - if 
-	ipfrag_max_dist (or more) fragments have arrived from a particular IP 
-	address between additions to any IP fragment queue using that source 
-	address, it's presumed that one or more fragments in the queue are 
-	lost. The existing fragment queue will be dropped, and a new one 
-	started. An ipfrag_max_dist value of zero disables this check.
+	ipfrag_max_dist is a non-negative integer value which defines the
+	maximum "disorder" which is allowed among fragments which share a
+	common IP source address.  Note that reordering of packets is
+	not unusual, but if a large number of fragments arrive from a source
+	IP address while a particular fragment queue remains incomplete, it
+	probably indicates that one or more fragments belonging to that queue
+	have been lost.  When ipfrag_max_dist is positive, an additional check
+	is done on fragments before they are added to a reassembly queue - if
+	ipfrag_max_dist (or more) fragments have arrived from a particular IP
+	address between additions to any IP fragment queue using that source
+	address, it's presumed that one or more fragments in the queue are
+	lost.  The existing fragment queue will be dropped, and a new one
+	started.  An ipfrag_max_dist value of zero disables this check.
 
 	Using a very small value, e.g. 1 or 2, for ipfrag_max_dist can
 	result in unnecessarily dropping fragment queues when normal
-	reordering of packets occurs, which could lead to poor application 
-	performance. Using a very large value, e.g. 50000, increases the 
-	likelihood of incorrectly reassembling IP fragments that originate 
+	reordering of packets occurs, which could lead to poor application
+	performance.  Using a very large value, e.g. 50000, increases the
+	likelihood of incorrectly reassembling IP fragments that originate
 	from different IP datagrams, which could result in data corruption.
 	Default: 64
 
-INET peer storage:
-
-inet_peer_threshold - INTEGER
-	The approximate size of the storage.  Starting from this threshold	
-	entries will be thrown aggressively.  This threshold also determines
-	entries' time-to-live and time intervals between garbage collection
-	passes.  More entries, less time-to-live, less GC interval.
-
-inet_peer_minttl - INTEGER
-	Minimum time-to-live of entries.  Should be enough to cover fragment
-	time-to-live on the reassembling side.  This minimum time-to-live  is
-	guaranteed if the pool size is less than inet_peer_threshold.
-	Measured in jiffies(1).
+ipfrag_secret_interval - INTEGER
+	Regeneration interval (in seconds) of the hash secret (or lifetime
+	for the hash secret) for IP fragments.
+	Default: 600
 
-inet_peer_maxttl - INTEGER
-	Maximum time-to-live of entries.  Unused entries will expire after
-	this period of time if there is no memory pressure on the pool (i.e.
-	when the number of entries in the pool is very small).
-	Measured in jiffies(1).
+ipfrag_time - INTEGER
+	Time in seconds to keep an IP fragment in memory.
 
-inet_peer_gc_mintime - INTEGER
-	Minimum interval between garbage collection passes.  This interval is
-	in effect under high memory pressure on the pool.
-	Measured in jiffies(1).
+ip_local_port_range - 2 INTEGERS
+	Defines the local port range that is used by TCP and UDP to
+	choose the local port.  The first number is the first, the
+	second the last local port number.  Default value depends on
+	amount of memory available on the system:
+	> 128Mb 32768-61000
+	< 128Mb 1024-4999 or even less.
+	This number defines number of active connections, which this
+	system can issue simultaneously to systems not supporting
+	TCP extensions (timestamps).  With tcp_tw_recycle enabled
+	(i.e. by default) range 1024-4999 is enough to issue up to
+	2000 connections per second to systems supporting timestamps.
 
-inet_peer_gc_maxtime - INTEGER
-	Minimum interval between garbage collection passes.  This interval is
-	in effect under low (or absent) memory pressure on the pool.
-	Measured in jiffies(1).
+ip_nonlocal_bind - BOOLEAN
+	If set, allows processes to bind() to non-local IP addresses,
+	which can be quite useful - but may break some applications.
+	Default: 0
 
-TCP variables: 
+ip_no_pmtu_disc - BOOLEAN
+	Disable Path MTU Discovery.
+	default FALSE
 
 tcp_abc - INTEGER
-	Controls Appropriate Byte Count defined in RFC3465. If set to
-	0 then does congestion avoid once per ack. 1 is conservative
-	value, and 2 is more agressive.
+	Controls Appropriate Byte Count defined in RFC3465.  If set to
+	0 then does congestion avoid once per ACK.  1 is conservative
+	value, and 2 is more aggressive.
 
-tcp_syn_retries - INTEGER
-	Number of times initial SYNs for an active TCP connection attempt
-	will be retransmitted. Should not be higher than 255. Default value
-	is 5, which corresponds to ~180seconds.
+tcp_abort_on_overflow - BOOLEAN
+	If listening service is too slow to accept new connections,
+	reset them.  Default state is FALSE.  It means that if overflow
+	occurred due to a burst, connection will recover.  Enable this
+	option _only_ if you are really sure that listening daemon
+	cannot be tuned to accept connections faster.  Enabling this
+	option can harm clients of your server.
 
-tcp_synack_retries - INTEGER
-	Number of times SYNACKs for a passive TCP connection attempt will
-	be retransmitted. Should not be higher than 255. Default value
-	is 5, which corresponds to ~180seconds.
+tcp_adv_win_scale - INTEGER
+	Count buffering overhead as bytes/2^tcp_adv_win_scale
+	(if tcp_adv_win_scale > 0) or bytes-bytes/2^(-tcp_adv_win_scale),
+	if it is <= 0.
+	Default: 2
 
-tcp_keepalive_time - INTEGER
-	How often TCP sends out keepalive messages when keepalive is enabled.
-	Default: 2hours.
+tcp_app_win - INTEGER
+	Reserve max(window/2^tcp_app_win, mss) of window for application
+	buffer.  Value 0 is special, it means that nothing is reserved.
+	Default: 31
 
-tcp_keepalive_probes - INTEGER
-	How many keepalive probes TCP sends out, until it decides that the
-	connection is broken. Default value: 9.
+tcp_base_mss - INTEGER
+	TODO Add description.
+	Default: 512
 
-tcp_keepalive_intvl - INTEGER
-	How frequently the probes are send out. Multiplied by
-	tcp_keepalive_probes it is time to kill not responding connection,
-	after probes started. Default value: 75sec i.e. connection
-	will be aborted after ~11 minutes of retries.
+tcp_congestion_control - STRING
+	Set the congestion control algorithm to be used for new
+	connections.  The algorithm "reno" is always available, but
+	additional choices may be available based on kernel configuration.
 
-tcp_retries1 - INTEGER
-	How many times to retry before deciding that something is wrong
-	and it is necessary to report this suspicion to network layer.
-	Minimal RFC value is 3, it is default, which corresponds
-	to ~3sec-8min depending on RTO.
+tcp_dsack - BOOLEAN
+	Allows TCP to send "duplicate" SACKs.
 
-tcp_retries2 - INTEGER
-	How may times to retry before killing alive TCP connection.
-	RFC1122 says that the limit should be longer than 100 sec.
-	It is too small number.	Default value 15 corresponds to ~13-30min
-	depending on RTO.
+tcp_ecn - BOOLEAN
+	Enable Explicit Congestion Notification in TCP.
 
-tcp_orphan_retries - INTEGER
-	How may times to retry before killing TCP connection, closed
-	by our side. Default value 7 corresponds to ~50sec-16min
-	depending on RTO. If you machine is loaded WEB server,
-	you should think about lowering this value, such sockets
-	may consume significant resources. Cf. tcp_max_orphans.
+tcp_fack - BOOLEAN
+	Enable FACK congestion avoidance and fast retransmission.
+	The value is not used, if tcp_sack is not enabled.
 
 tcp_fin_timeout - INTEGER
 	Time to hold socket in state FIN-WAIT-2, if it was closed
-	by our side. Peer can be broken and never close its side,
-	or even died unexpectedly. Default value is 60sec.
+	by our side.  Peer can be broken and never close its side,
+	or even died unexpectedly.  Default value is 60sec.
 	Usual value used in 2.2 was 180 seconds, you may restore
 	it, but remember that if your machine is even underloaded WEB server,
 	you risk to overflow memory with kilotons of dead sockets,
 	FIN-WAIT-2 sockets are less dangerous than FIN-WAIT-1,
 	because they eat maximum 1.5K of memory, but they tend
-	to live longer.	Cf. tcp_max_orphans.
+	to live longer.  Cf. tcp_max_orphans.
 
-tcp_max_tw_buckets - INTEGER
-	Maximal number of timewait sockets held by system simultaneously.
-	If this number is exceeded time-wait socket is immediately destroyed
-	and warning is printed. This limit exists only to prevent
-	simple DoS attacks, you _must_ not lower the limit artificially,
-	but rather increase it (probably, after increasing installed memory),
-	if network conditions require more than default value.
+tcp_frto - BOOLEAN
+	Enables F-RTO, an enhanced recovery algorithm for TCP retransmission
+	timeouts.  It is particularly beneficial in wireless environments
+	where packet loss is typically due to random radio interference
+	rather than intermediate router congestion.
 
-tcp_tw_recycle - BOOLEAN
-	Enable fast recycling TIME-WAIT sockets. Default value is 0.
-	It should not be changed without advice/request of technical
-	experts.
+tcp_keepalive_intvl - INTEGER
+	How frequently the probes are send out.  Multiplied by
+	tcp_keepalive_probes it is time to kill not responding connection,
+	after probes started.  Default value: 75sec i.e. connection
+	will be aborted after ~11 minutes of retries.
 
-tcp_tw_reuse - BOOLEAN
-	Allow to reuse TIME-WAIT sockets for new connections when it is
-	safe from protocol viewpoint. Default value is 0.
-	It should not be changed without advice/request of technical
-	experts.
+tcp_keepalive_probes - INTEGER
+	How many keepalive probes TCP sends out, until it decides that the
+	connection is broken.  Default value: 9.
+
+tcp_keepalive_time - INTEGER
+	How often TCP sends out keepalive messages when keepalive is enabled.
+	Default: 2hours.
+
+tcp_low_latency - BOOLEAN
+	If set, the TCP stack makes decisions that prefer lower
+	latency as opposed to higher throughput.  By default, this
+	option is not set meaning that higher throughput is preferred.
+	An example of an application where this default should be
+	changed would be a Beowulf compute cluster.
+	Default: 0
 
 tcp_max_orphans - INTEGER
 	Maximal number of TCP sockets not attached to any user file handle,
-	held by system.	If this number is exceeded orphaned connections are
-	reset immediately and warning is printed. This limit exists
+	held by system.  If this number is exceeded orphaned connections are
+	reset immediately and warning is printed.  This limit exists
 	only to prevent simple DoS attacks, you _must_ not rely on this
 	or lower the limit artificially, but rather increase it
 	(probably, after increasing installed memory),
 	if network conditions require more than default value,
 	and tune network services to linger and kill such states
-	more aggressively. Let me to remind again: each orphan eats
+	more aggressively.  Let me to remind again: each orphan eats
 	up to ~64K of unswappable memory.
 
-tcp_abort_on_overflow - BOOLEAN
-	If listening service is too slow to accept new connections,
-	reset them. Default state is FALSE. It means that if overflow
-	occurred due to a burst, connection will recover. Enable this
-	option _only_ if you are really sure that listening daemon
-	cannot be tuned to accept connections faster. Enabling this
-	option can harm clients of your server.
-
-tcp_syncookies - BOOLEAN
-	Only valid when the kernel was compiled with CONFIG_SYNCOOKIES
-	Send out syncookies when the syn backlog queue of a socket 
-	overflows. This is to prevent against the common 'syn flood attack'
-	Default: FALSE
-
-	Note, that syncookies is fallback facility.
-	It MUST NOT be used to help highly loaded servers to stand
-	against legal connection rate. If you see synflood warnings
-	in your logs, but investigation	shows that they occur
-	because of overload with legal connections, you should tune
-	another parameters until this warning disappear.
-	See: tcp_max_syn_backlog, tcp_synack_retries, tcp_abort_on_overflow.
-
-	syncookies seriously violate TCP protocol, do not allow
-	to use TCP extensions, can result in serious degradation
-	of some services (f.e. SMTP relaying), visible not by you,
-	but your clients and relays, contacting you. While you see
-	synflood warnings in logs not being really flooded, your server
-	is seriously misconfigured.
-
-tcp_stdurg - BOOLEAN
-	Use the Host requirements interpretation of the TCP urg pointer field.
-	Most hosts use the older BSD interpretation, so if you turn this on
-	Linux might not communicate correctly with them.	
-	Default: FALSE 
-	
 tcp_max_syn_backlog - INTEGER
 	Maximal number of remembered connection requests, which are
 	still did not receive an acknowledgment from connecting client.
 	Default value is 1024 for systems with more than 128Mb of memory,
-	and 128 for low memory machines. If server suffers of overload,
+	and 128 for low memory machines.  If server suffers of overload,
 	try to increase this number.
 
-tcp_window_scaling - BOOLEAN
-	Enable window scaling as defined in RFC1323.
+tcp_max_tw_buckets - INTEGER
+	Maximal number of time-wait sockets held by system simultaneously.
+	If this number is exceeded time-wait socket is immediately destroyed
+	and warning is printed.  This limit exists only to prevent
+	simple DoS attacks, you _must_ not lower the limit artificially,
+	but rather increase it (probably, after increasing installed memory),
+	if network conditions require more than default value.
 
-tcp_timestamps - BOOLEAN
-	Enable timestamps as defined in RFC1323.
+tcp_mem - vector of 3 INTEGERs: min, pressure, max
+	low: below this number of pages TCP is not bothered about its
+	memory appetite.
 
-tcp_sack - BOOLEAN
-	Enable select acknowledgments (SACKS).
+	pressure: when amount of memory allocated by TCP exceeds this number
+	of pages, TCP moderates its memory consumption and enters memory
+	pressure mode, which is exited when memory consumption falls
+	under "low".
 
-tcp_fack - BOOLEAN
-	Enable FACK congestion avoidance and fast retransmission.
-	The value is not used, if tcp_sack is not enabled.
+	high: number of pages allowed for queueing by all TCP sockets.
 
-tcp_dsack - BOOLEAN
-	Allows TCP to send "duplicate" SACKs.
+	Defaults are calculated at boot time from amount of available
+	memory.
 
-tcp_ecn - BOOLEAN
-	Enable Explicit Congestion Notification in TCP.
+tcp_moderate_rcvbuf - BOOLEAN
+	TODO Add description.
+	Default: 1
+
+tcp_mtu_probing - INTEGER
+	TODO Add description.
+	Default: 0
+
+tcp_no_metrics_save - BOOLEAN
+	TODO Add description.
+	Default: 0
+
+tcp_orphan_retries - INTEGER
+	How may times to retry before killing TCP connection, closed
+	by our side.  Default value 7 corresponds to ~50sec-16min
+	depending on RTO.  If you machine is loaded WEB server,
+	you should think about lowering this value, such sockets
+	may consume significant resources.  Cf. tcp_max_orphans.
 
 tcp_reordering - INTEGER
 	Maximal reordering of packets in a TCP stream.
-	Default: 3	
+	Default: 3
 
 tcp_retrans_collapse - BOOLEAN
 	Bug-to-bug compatibility with some broken printers.
 	On retransmit try to send bigger packets to work around bugs in
 	certain TCP stacks.
 
-tcp_wmem - vector of 3 INTEGERs: min, default, max
-	min: Amount of memory reserved for send buffers for TCP socket.
-	Each TCP socket has rights to use it due to fact of its birth.
-	Default: 4K
+tcp_retries1 - INTEGER
+	How many times to retry before deciding that something is wrong
+	and it is necessary to report this suspicion to network layer.
+	Minimal RFC value is 3, it is default, which corresponds
+	to ~3sec-8min depending on RTO.
 
-	default: Amount of memory allowed for send buffers for TCP socket
-	by default. This value overrides net.core.wmem_default used
-	by other protocols, it is usually lower than net.core.wmem_default.
-	Default: 16K
+tcp_retries2 - INTEGER
+	How may times to retry before killing alive TCP connection.
+	RFC1122 says that the limit should be longer than 100 sec.
+	It is too small number.  Default value 15 corresponds to ~13-30min
+	depending on RTO.
 
-	max: Maximal amount of memory allowed for automatically selected
-	send buffers for TCP socket. This value does not override
-	net.core.wmem_max, "static" selection via SO_SNDBUF does not use this.
-	Default: 128K
+tcp_rfc1337 - BOOLEAN
+	If set, the TCP stack behaves conforming to RFC1337.  If unset,
+	we are not conforming to RFC, but prevent TCP TIME_WAIT
+	assassination.
+	Default: 0
 
 tcp_rmem - vector of 3 INTEGERs: min, default, max
 	min: Minimal size of receive buffer used by TCP sockets.
@@ -284,76 +422,93 @@ tcp_rmem - vector of 3 INTEGERs: min, de
 
 	default: default size of receive buffer used by TCP sockets.
 	This value overrides net.core.rmem_default used by other protocols.
-	Default: 87380 bytes. This value results in window of 65535 with
+	Default: 87380 bytes.  This value results in window of 65535 with
 	default setting of tcp_adv_win_scale and tcp_app_win:0 and a bit
-	less for default tcp_app_win. See below about these variables.
+	less for default tcp_app_win.  See below about these variables.
 
 	max: maximal size of receive buffer allowed for automatically
-	selected receiver buffers for TCP socket. This value does not override
+	selected receiver buffers for TCP socket.  This value does not override
 	net.core.rmem_max, "static" selection via SO_RCVBUF does not use this.
 	Default: 87380*2 bytes.
 
-tcp_mem - vector of 3 INTEGERs: min, pressure, max
-	low: below this number of pages TCP is not bothered about its
-	memory appetite.
+tcp_sack - BOOLEAN
+	Enable select acknowledgments (SACKS).
 
-	pressure: when amount of memory allocated by TCP exceeds this number
-	of pages, TCP moderates its memory consumption and enters memory
-	pressure mode, which is exited when memory consumption falls
-	under "low".
+tcp_stdurg - BOOLEAN
+	Use the Host requirements interpretation of the TCP urg pointer field.
+	Most hosts use the older BSD interpretation, so if you turn this on
+	Linux might not communicate correctly with them.
+	Default: FALSE
 
-	high: number of pages allowed for queueing by all TCP sockets.
+tcp_synack_retries - INTEGER
+	Number of times SYNACKs for a passive TCP connection attempt will
+	be retransmitted.  Should not be higher than 255.  Default value
+	is 5, which corresponds to ~180seconds.
 
-	Defaults are calculated at boot time from amount of available
-	memory.
+tcp_syncookies - BOOLEAN
+	Only valid when the kernel was compiled with CONFIG_SYNCOOKIES
+	Send out syncookies when the syn backlog queue of a socket
+	overflows.  This is to prevent against the common 'syn flood attack'
+	Default: FALSE
 
-tcp_app_win - INTEGER
-	Reserve max(window/2^tcp_app_win, mss) of window for application
-	buffer. Value 0 is special, it means that nothing is reserved.
-	Default: 31
+	Note, that syncookies is fallback facility.
+	It MUST NOT be used to help highly loaded servers to stand
+	against legal connection rate.  If you see synflood warnings
+	in your logs, but investigation shows that they occur
+	because of overload with legal connections, you should tune
+	another parameters until this warning disappear.
+	See: tcp_max_syn_backlog, tcp_synack_retries, tcp_abort_on_overflow.
 
-tcp_adv_win_scale - INTEGER
-	Count buffering overhead as bytes/2^tcp_adv_win_scale
-	(if tcp_adv_win_scale > 0) or bytes-bytes/2^(-tcp_adv_win_scale),
-	if it is <= 0.
-	Default: 2
+	syncookies seriously violate TCP protocol, do not allow
+	to use TCP extensions, can result in serious degradation
+	of some services (f.e. SMTP relaying), visible not by you,
+	but your clients and relays, contacting you.  While you see
+	synflood warnings in logs not being really flooded, your server
+	is seriously misconfigured.
 
-tcp_rfc1337 - BOOLEAN
-	If set, the TCP stack behaves conforming to RFC1337. If unset,
-	we are not conforming to RFC, but prevent TCP TIME_WAIT
-	assassination.   
-	Default: 0
+tcp_syn_retries - INTEGER
+	Number of times initial SYNs for an active TCP connection attempt
+	will be retransmitted.  Should not be higher than 255.  Default value
+	is 5, which corresponds to ~180seconds.
 
-tcp_low_latency - BOOLEAN
-	If set, the TCP stack makes decisions that prefer lower
-	latency as opposed to higher throughput.  By default, this
-	option is not set meaning that higher throughput is preferred.
-	An example of an application where this default should be
-	changed would be a Beowulf compute cluster.
-	Default: 0
+tcp_timestamps - BOOLEAN
+	Enable timestamps as defined in RFC1323.
 
 tcp_tso_win_divisor - INTEGER
-       This allows control over what percentage of the congestion window
-       can be consumed by a single TSO frame.
-       The setting of this parameter is a choice between burstiness and
-       building larger TSO frames.
-       Default: 3
+	This allows control over what percentage of the congestion window
+	can be consumed by a single TSO frame.
+	The setting of this parameter is a choice between burstiness and
+	building larger TSO frames.
+	Default: 3
 
-tcp_frto - BOOLEAN
-	Enables F-RTO, an enhanced recovery algorithm for TCP retransmission
-	timeouts.  It is particularly beneficial in wireless environments
-	where packet loss is typically due to random radio interference
-	rather than intermediate router congestion.
+tcp_tw_recycle - BOOLEAN
+	Enable fast recycling TIME-WAIT sockets.  Default value is 0.
+	It should not be changed without advice/request of technical
+	experts.
 
-tcp_congestion_control - STRING
-	Set the congestion control algorithm to be used for new
-	connections. The algorithm "reno" is always available, but
-	additional choices may be available based on kernel configuration.
+tcp_tw_reuse - BOOLEAN
+	Allow to reuse TIME-WAIT sockets for new connections when it is
+	safe from protocol viewpoint.  Default value is 0.
+	It should not be changed without advice/request of technical
+	experts.
 
-somaxconn - INTEGER
-	Limit of socket listen() backlog, known in userspace as SOMAXCONN.
-	Defaults to 128.  See also tcp_max_syn_backlog for additional tuning
-	for TCP sockets.
+tcp_window_scaling - BOOLEAN
+	Enable window scaling as defined in RFC1323.
+
+tcp_wmem - vector of 3 INTEGERs: min, default, max
+	min: Amount of memory reserved for send buffers for TCP socket.
+	Each TCP socket has rights to use it due to fact of its birth.
+	Default: 4K
+
+	default: Amount of memory allowed for send buffers for TCP socket
+	by default.  This value overrides net.core.wmem_default used
+	by other protocols, it is usually lower than net.core.wmem_default.
+	Default: 16K
+
+	max: Maximal amount of memory allowed for automatically selected
+	send buffers for TCP socket.  This value does not override
+	net.core.wmem_max, "static" selection via SO_SNDBUF does not use this.
+	Default: 128K
 
 tcp_workaround_signed_windows - BOOLEAN
 	If set, assume no receipt of a window scaling option means the
@@ -362,109 +517,84 @@ tcp_workaround_signed_windows - BOOLEAN
 	not receive a window scaling option from them.
 	Default: 0
 
-IP Variables:
 
-ip_local_port_range - 2 INTEGERS
-	Defines the local port range that is used by TCP and UDP to
-	choose the local port. The first number is the first, the 
-	second the last local port number. Default value depends on
-	amount of memory available on the system:
-	> 128Mb 32768-61000
-	< 128Mb 1024-4999 or even less.
-	This number defines number of active connections, which this
-	system can issue simultaneously to systems not supporting
-	TCP extensions (timestamps). With tcp_tw_recycle enabled
-	(i.e. by default) range 1024-4999 is enough to issue up to
-	2000 connections per second to systems supporting timestamps.
+/proc/sys/net/ipv4/route/* Variables:
 
-ip_nonlocal_bind - BOOLEAN
-	If set, allows processes to bind() to non-local IP addresses,
-	which can be quite useful - but may break some applications.
-	Default: 0
+error_burst - INTEGER
+	TODO Add description.
+	Default: 5
 
-ip_dynaddr - BOOLEAN
-	If set non-zero, enables support for dynamic addresses.
-	If set to a non-zero value larger than 1, a kernel log
-	message will be printed when dynamic address rewriting
-	occurs.
-	Default: 0
+error_cost - INTEGER
+	TODO Add description.
+	Default: 1
 
-icmp_echo_ignore_all - BOOLEAN
-	If set non-zero, then the kernel will ignore all ICMP ECHO
-	requests sent to it.
+flush - INTEGER
+	TODO Add description.
 	Default: 0
 
-icmp_echo_ignore_broadcasts - BOOLEAN
-	If set non-zero, then the kernel will ignore all ICMP ECHO and
-	TIMESTAMP requests sent to it via broadcast/multicast.
-	Default: 1
+gc_elasticity - INTEGER
+	TODO Add description.
+	Default: 8
 
-icmp_ratelimit - INTEGER
-	Limit the maximal rates for sending ICMP packets whose type matches
-	icmp_ratemask (see below) to specific targets.
-	0 to disable any limiting, otherwise the maximal rate in jiffies(1)
-	Default: 100
+gc_interval - INTEGER
+	TODO Add description.
+	Default: 60
 
-icmp_ratemask - INTEGER
-	Mask made of ICMP types for which rates are being limited.
-	Significant bits: IHGFEDCBA9876543210
-	Default mask:     0000001100000011000 (6168)
+gc_min_interval - INTEGER
+	TODO Check description.
+	Deprecated.  Use gc_min_interval_ms.
 
-	Bit definitions (see include/linux/icmp.h):
-		0 Echo Reply
-		3 Destination Unreachable *
-		4 Source Quench *
-		5 Redirect
-		8 Echo Request
-		B Time Exceeded *
-		C Parameter Problem *
-		D Timestamp Request
-		E Timestamp Reply
-		F Info Request
-		G Info Reply
-		H Address Mask Request
-		I Address Mask Reply
+gc_min_interval_ms - INTEGER
+	TODO Add description.
+	Default: 500
 
-	* These are rate limited by default (see default mask above)
+gc_thresh - INTEGER
+	TODO Add description.
 
-icmp_ignore_bogus_error_responses - BOOLEAN
-	Some routers violate RFC1122 by sending bogus responses to broadcast
-	frames.  Such violations are normally logged via a kernel warning.
-	If this is set to TRUE, the kernel will not give such warnings, which
-	will avoid log file clutter.
-	Default: FALSE
+gc_timeout - INTEGER
+	TODO Add description.
+	Default: 300
 
-icmp_errors_use_inbound_ifaddr - BOOLEAN
+max_delay - INTEGER
+	TODO Add description.
+	Default: 10
 
-	If zero, icmp error messages are sent with the primary address of
-	the exiting interface.
- 
-	If non-zero, the message will be sent with the primary address of
-	the interface that received the packet that caused the icmp error.
-	This is the behaviour network many administrators will expect from
-	a router. And it can make debugging complicated network layouts
-	much easier. 
+max_size - INTEGER
+	TODO Add description.
 
-	Note that if no primary address exists for the interface selected,
-	then the primary address of the first non-loopback interface that
-	has one will be used regarldess of this setting.
+min_adv_mss - INTEGER
+	The advertised MSS depends on the first hop route MTU, but will
+	never be lower than this setting.
 
-	Default: 0
+min_delay - INTEGER
+	TODO Add description.
+	Default: 2
 
-igmp_max_memberships - INTEGER
-	Change the maximum number of multicast groups we can subscribe to.
-	Default: 20
+min_pmtu - INTEGER
+	default 562 - minimum discovered Path MTU
+
+mtu_expires - INTEGER
+	Time, in seconds, that cached PMTU information is kept.
 
-conf/interface/*  changes special settings per interface (where "interface" is 
-		  the name of your network interface)
-conf/all/*	  is special, changes the settings for all interfaces
+redirect_load - INTEGER
+	TODO Add description.
+	Default: 5
 
+redirect_number - INTEGER
+	TODO Add description.
+	Default: 9
 
-log_martians - BOOLEAN
-	Log packets with impossible addresses to kernel log.
-	log_martians for the interface will be enabled if at least one of
-	conf/{all,interface}/log_martians is set to TRUE,
-	it will be disabled otherwise
+redirect_silence - INTEGER
+	TODO Add description.
+
+secret_interval - INTEGER
+	TODO Add description.
+	Default: 600
+
+
+/proc/sys/net/ipv4/conf/*/*
+/proc/sys/net/ipv4/conf/all/*
+/proc/sys/net/ipv4/conf/default/*
 
 accept_redirects - BOOLEAN
 	Accept ICMP redirect messages.
@@ -478,64 +608,6 @@ accept_redirects - BOOLEAN
 	default TRUE (host)
 		FALSE (router)
 
-forwarding - BOOLEAN
-	Enable IP forwarding on this interface.
-
-mc_forwarding - BOOLEAN
-	Do multicast routing. The kernel needs to be compiled with CONFIG_MROUTE
-	and a multicast routing daemon is required.
-	conf/all/mc_forwarding must also be set to TRUE to enable multicast routing
-	for the interface
-
-medium_id - INTEGER
-	Integer value used to differentiate the devices by the medium they
-	are attached to. Two devices can have different id values when
-	the broadcast packets are received only on one of them.
-	The default value 0 means that the device is the only interface
-	to its medium, value of -1 means that medium is not known.
-	
-	Currently, it is used to change the proxy_arp behavior:
-	the proxy_arp feature is enabled for packets forwarded between
-	two devices attached to different media.
-
-proxy_arp - BOOLEAN
-	Do proxy arp.
-	proxy_arp for the interface will be enabled if at least one of
-	conf/{all,interface}/proxy_arp is set to TRUE,
-	it will be disabled otherwise
-
-shared_media - BOOLEAN
-	Send(router) or accept(host) RFC1620 shared media redirects.
-	Overrides ip_secure_redirects.
-	shared_media for the interface will be enabled if at least one of
-	conf/{all,interface}/shared_media is set to TRUE,
-	it will be disabled otherwise
-	default TRUE
-
-secure_redirects - BOOLEAN
-	Accept ICMP redirect messages only for gateways,
-	listed in default gateway list.
-	secure_redirects for the interface will be enabled if at least one of
-	conf/{all,interface}/secure_redirects is set to TRUE,
-	it will be disabled otherwise
-	default TRUE
-
-send_redirects - BOOLEAN
-	Send redirects, if router.
-	send_redirects for the interface will be enabled if at least one of
-	conf/{all,interface}/send_redirects is set to TRUE,
-	it will be disabled otherwise
-	Default: TRUE
-
-bootp_relay - BOOLEAN
-	Accept packets with source address 0.b.c.d destined
-	not to this host as local ones. It is supposed, that
-	BOOTP relay daemon will catch and forward such packets.
-	conf/all/bootp_relay must also be set to TRUE to enable BOOTP relay
-	for the interface
-	default FALSE
-	Not Implemented Yet.
-
 accept_source_route - BOOLEAN
 	Accept packets with SRR option.
 	conf/all/accept_source_route must also be set to TRUE to accept packets
@@ -543,39 +615,10 @@ accept_source_route - BOOLEAN
 	default TRUE (router)
 		FALSE (host)
 
-rp_filter - BOOLEAN
-	1 - do source validation by reversed path, as specified in RFC1812
-	    Recommended option for single homed hosts and stub network
-	    routers. Could cause troubles for complicated (not loop free)
-	    networks running a slow unreliable protocol (sort of RIP),
-	    or using static routes.
-
-	0 - No source validation.
-
-	conf/all/rp_filter must also be set to TRUE to do source validation
-	on the interface
-
-	Default value is 0. Note that some distributions enable it
-	in startup scripts.
-
-arp_filter - BOOLEAN
-	1 - Allows you to have multiple network interfaces on the same
-	subnet, and have the ARPs for each interface be answered
-	based on whether or not the kernel would route a packet from
-	the ARP'd IP out that interface (therefore you must use source
-	based routing for this to work). In other words it allows control
-	of which cards (usually 1) will respond to an arp request.
-
-	0 - (default) The kernel can respond to arp requests with addresses
-	from other interfaces. This may seem wrong but it usually makes
-	sense, because it increases the chance of successful communication.
-	IP addresses are owned by the complete host on Linux, not by
-	particular interfaces. Only for more complex setups like load-
-	balancing, does this behaviour cause problems.
-
-	arp_filter for the interface will be enabled if at least one of
-	conf/{all,interface}/arp_filter is set to TRUE,
-	it will be disabled otherwise
+arp_accept - BOOLEAN
+	Define behavior when gratuitous ARP replies are received:
+	0 - drop gratuitous ARP frames
+	1 - accept gratuitous ARP frames
 
 arp_announce - INTEGER
 	Define different restriction levels for announcing the local
@@ -583,20 +626,20 @@ arp_announce - INTEGER
 	interface:
 	0 - (default) Use any local address, configured on any interface
 	1 - Try to avoid local addresses that are not in the target's
-	subnet for this interface. This mode is useful when target
+	subnet for this interface.  This mode is useful when target
 	hosts reachable via this interface require the source IP
 	address in ARP requests to be part of their logical network
-	configured on the receiving interface. When we generate the
+	configured on the receiving interface.  When we generate the
 	request we will check all our subnets that include the
 	target IP and will preserve the source address if it is from
-	such subnet. If there is no such subnet we select source
+	such subnet.  If there is no such subnet we select source
 	address according to the rules for level 2.
 	2 - Always use the best local address for this target.
 	In this mode we ignore the source address in the IP packet
 	and try to select local address that we prefer for talks with
-	the target host. Such local address is selected by looking
+	the target host.  Such local address is selected by looking
 	for primary IP addresses on all our subnets on the outgoing
-	interface that include the target IP address. If no suitable
+	interface that include the target IP address.  If no suitable
 	local address is found we select the first local address
 	we have on the outgoing interface or on all other interfaces,
 	with the hope we will receive reply for our request and
@@ -608,6 +651,25 @@ arp_announce - INTEGER
 	receiving answer from the resolved target while decreasing
 	the level announces more valid sender's information.
 
+arp_filter - BOOLEAN
+	1 - Allows you to have multiple network interfaces on the same
+	subnet, and have the ARPs for each interface be answered
+	based on whether or not the kernel would route a packet from
+	the ARP'd IP out that interface (therefore you must use source
+	based routing for this to work).  In other words it allows control
+	of which cards (usually 1) will respond to an ARP request.
+
+	0 - (default) The kernel can respond to ARP requests with addresses
+	from other interfaces.  This may seem wrong but it usually makes
+	sense, because it increases the chance of successful communication.
+	IP addresses are owned by the complete host on Linux, not by
+	particular interfaces.  Only for more complex setups like load-
+	balancing, does this behaviour cause problems.
+
+	arp_filter for the interface will be enabled if at least one of
+	conf/{all,interface}/arp_filter is set to TRUE,
+	it will be disabled otherwise
+
 arp_ignore - INTEGER
 	Define different modes for sending replies in response to
 	received ARP requests that resolve local target IP addresses:
@@ -626,15 +688,14 @@ arp_ignore - INTEGER
 	The max value from conf/{all,interface}/arp_ignore is used
 	when ARP request is received on the {interface}
 
-arp_accept - BOOLEAN
-	Define behavior when gratuitous arp replies are received:
-	0 - drop gratuitous arp frames
-	1 - accept gratuitous arp frames
-
-app_solicit - INTEGER
-	The maximum number of probes to send to the user space ARP daemon
-	via netlink before dropping back to multicast probes (see
-	mcast_solicit).  Defaults to 0.
+bootp_relay - BOOLEAN
+	Accept packets with source address 0.b.c.d destined
+	not to this host as local ones.  It is supposed, that
+	BOOTP relay daemon will catch and forward such packets.
+	conf/all/bootp_relay must also be set to TRUE to enable BOOTP relay
+	for the interface
+	default FALSE
+	Not Implemented Yet.
 
 disable_policy - BOOLEAN
 	Disable IPSEC policy (SPD) for this interface
@@ -642,26 +703,85 @@ disable_policy - BOOLEAN
 disable_xfrm - BOOLEAN
 	Disable IPSEC encryption on this interface, whatever the policy
 
+force_igmp_version - INTEGER
+	TODO Add description.
 
+forwarding - BOOLEAN
+	Enable IP forwarding on this interface.
 
-tag - INTEGER
-	Allows you to write a number, which can be used as required.
-	Default value is 0.
+log_martians - BOOLEAN
+	Log packets with impossible addresses to kernel log.
+	log_martians for the interface will be enabled if at least one of
+	conf/{all,interface}/log_martians is set to TRUE,
+	it will be disabled otherwise
 
-(1) Jiffie: internal timeunit for the kernel. On the i386 1/100s, on the
-Alpha 1/1024s. See the HZ define in /usr/include/asm/param.h for the exact
-value on your system. 
+mc_forwarding - BOOLEAN
+	Do multicast routing.  The kernel needs to be compiled with CONFIG_MROUTE
+	and a multicast routing daemon is required.
+	conf/all/mc_forwarding must also be set to TRUE to enable multicast routing
+	for the interface
 
-Alexey Kuznetsov.
-kuznet@ms2.inr.ac.ru
+medium_id - INTEGER
+	Integer value used to differentiate the devices by the medium they
+	are attached to.  Two devices can have different id values when
+	the broadcast packets are received only on one of them.
+	The default value 0 means that the device is the only interface
+	to its medium, value of -1 means that medium is not known.
 
-Updated by:
-Andi Kleen
-ak@muc.de
-Nicolas Delon
-delon.nicolas@wanadoo.fr
+	Currently, it is used to change the proxy_arp behavior:
+	the proxy_arp feature is enabled for packets forwarded between
+	two devices attached to different media.
 
+promote_secondaries - ????
+	TODO Add description.
 
+proxy_arp - BOOLEAN
+	Do proxy ARP.
+	proxy_arp for the interface will be enabled if at least one of
+	conf/{all,interface}/proxy_arp is set to TRUE,
+	it will be disabled otherwise
+
+rp_filter - BOOLEAN
+	1 - do source validation by reversed path, as specified in RFC1812
+	    Recommended option for single homed hosts and stub network
+	    routers.  Could cause troubles for complicated (not loop free)
+	    networks running a slow unreliable protocol (sort of RIP),
+	    or using static routes.
+
+	0 - No source validation.
+
+	conf/all/rp_filter must also be set to TRUE to do source validation
+	on the interface
+
+	Default value is 0.  Note that some distributions enable it
+	in startup scripts.
+
+secure_redirects - BOOLEAN
+	Accept ICMP redirect messages only for gateways,
+	listed in default gateway list.
+	secure_redirects for the interface will be enabled if at least one of
+	conf/{all,interface}/secure_redirects is set to TRUE,
+	it will be disabled otherwise
+	default TRUE
+
+send_redirects - BOOLEAN
+	Send redirects, if router.
+	send_redirects for the interface will be enabled if at least one of
+	conf/{all,interface}/send_redirects is set to TRUE,
+	it will be disabled otherwise
+	Default: TRUE
+
+shared_media - BOOLEAN
+	Send(router) or accept(host) RFC1620 shared media redirects.
+	Overrides ip_secure_redirects.
+	shared_media for the interface will be enabled if at least one of
+	conf/{all,interface}/shared_media is set to TRUE,
+	it will be disabled otherwise
+	default TRUE
+
+tag - INTEGER
+	Allows you to write a number, which can be used as required.
+	Default value is 0.
 
 
 /proc/sys/net/ipv6/* Variables:
@@ -671,61 +791,92 @@ apply to IPv6 [XXX?].
 
 bindv6only - BOOLEAN
 	Default value for IPV6_V6ONLY socket option,
-	which restricts use of the IPv6 socket to IPv6 communication 
+	which restricts use of the IPv6 socket to IPv6 communication
 	only.
 		TRUE: disable IPv4-mapped address feature
 		FALSE: enable IPv4-mapped address feature
 
 	Default: FALSE (as specified in RFC2553bis)
 
-IPv6 Fragmentation:
-
 ip6frag_high_thresh - INTEGER
-	Maximum memory used to reassemble IPv6 fragments. When 
+	Maximum memory used to reassemble IPv6 fragments.  When
 	ip6frag_high_thresh bytes of memory is allocated for this purpose,
 	the fragment handler will toss packets until ip6frag_low_thresh
 	is reached.
-	
-ip6frag_low_thresh - INTEGER
-	See ip6frag_high_thresh	
 
-ip6frag_time - INTEGER
-	Time in seconds to keep an IPv6 fragment in memory.
+ip6frag_low_thresh - INTEGER
+	See ip6frag_high_thresh
 
 ip6frag_secret_interval - INTEGER
-	Regeneration interval (in seconds) of the hash secret (or lifetime 
+	Regeneration interval (in seconds) of the hash secret (or lifetime
 	for the hash secret) for IPv6 fragments.
 	Default: 600
 
-conf/default/*:
-	Change the interface-specific default settings.
+ip6frag_time - INTEGER
+	Time in seconds to keep an IPv6 fragment in memory.
 
+mld_max_msf - INTEGER
+	TODO Add description.
 
-conf/all/*:
-	Change all the interface-specific settings.  
 
-	[XXX:  Other special features than forwarding?]
+/proc/sys/net/ipv6/icmp/* Variables:
 
-conf/all/forwarding - BOOLEAN
-	Enable global IPv6 forwarding between all interfaces.  
+ratelimit - INTEGER
+	Limit the maximal rates for sending ICMPv6 packets.
+	0 to disable any limiting, otherwise the maximal rate in jiffies(1)
+	Default: 100
+
+
+/proc/sys/net/ipv6/route/* Variables:
+
+flush - INTEGER
+	TODO Add description.
+	See ipv4/route/flush description.
+
+gc_elasticity - INTEGER
+	TODO Add description.
+	See ipv4/route/gc_elasticity description.
+
+gc_interval - INTEGER
+	TODO Add description.
+	See ipv4/route/gc_interval description.
 
-	IPv4 and IPv6 work differently here; e.g. netfilter must be used 
-	to control which interfaces may forward packets and which not.
+gc_min_interval - INTEGER
+	TODO Add description.
+	See ipv4/route/gc_min_interval description.
 
-	This also sets all interfaces' Host/Router setting 
-	'forwarding' to the specified value.  See below for details.
+gc_min_interval_ms - INTEGER
+	TODO Add description.
+	See ipv4/route/gc_min_interval_ms description.
 
-	This referred to as global forwarding.
+gc_thresh - INTEGER
+	TODO Add description.
+	See ipv4/route/gc_thresh description.
+
+gc_timeout - INTEGER
+	TODO Add description.
+	See ipv4/route/gc_timeout description.
+
+max_size - INTEGER
+	TODO Add description.
+	See ipv4/route/max_size description.
+
+min_adv_mss - INTEGER
+	TODO Add description.
+	See ipv4/route/min_adv_mss description.
+
+mtu_expires - INTEGER
+	TODO Add description.
+	See ipv4/route/mtu_expires description.
 
-conf/interface/*:
-	Change special settings per interface.
 
-	The functional behaviour for certain settings is different 
-	depending on whether local forwarding is enabled or not.
+/proc/sys/net/ipv6/conf/*/*
+/proc/sys/net/ipv6/conf/all/*
+/proc/sys/net/ipv6/conf/default/*
 
 accept_ra - BOOLEAN
 	Accept Router Advertisements; autoconfigure using them.
-	
+
 	Functional default: enabled if local forwarding is disabled.
 			    disabled if local forwarding is enabled.
 
@@ -763,7 +914,7 @@ accept_redirects - BOOLEAN
 			    disabled if local forwarding is enabled.
 
 autoconf - BOOLEAN
-	Autoconfigure addresses using Prefix Information in Router 
+	Autoconfigure addresses using Prefix Information in Router
 	Advertisements.
 
 	Functional default: enabled if accept_ra_pinfo is enabled.
@@ -772,11 +923,15 @@ autoconf - BOOLEAN
 dad_transmits - INTEGER
 	The amount of Duplicate Address Detection probes to send.
 	Default: 1
-	
+
+force_mld_version - INTEGER
+	TODO Add description.
+	Default: 0
+
 forwarding - BOOLEAN
-	Configure interface-specific Host/Router behaviour.  
+	Configure interface-specific Host/Router behaviour.
 
-	Note: It is recommended to have the same setting on all 
+	Note: It is recommended to have the same setting on all
 	interfaces; mixed router/host scenarios are rather uncommon.
 
 	FALSE:
@@ -785,13 +940,13 @@ forwarding - BOOLEAN
 
 	1. IsRouter flag is not set in Neighbour Advertisements.
 	2. Router Solicitations are being sent when necessary.
-	3. If accept_ra is TRUE (default), accept Router 
+	3. If accept_ra is TRUE (default), accept Router
 	   Advertisements (and do autoconfiguration).
 	4. If accept_redirects is TRUE (default), accept Redirects.
 
 	TRUE:
 
-	If local forwarding is enabled, Router behaviour is assumed. 
+	If local forwarding is enabled, Router behaviour is assumed.
 	This means exactly the reverse from the above:
 
 	1. IsRouter flag is set in Neighbour Advertisements.
@@ -806,10 +961,29 @@ hop_limit - INTEGER
 	Default Hop Limit to set.
 	Default: 64
 
+max_addresses - INTEGER
+	Number of maximum addresses per interface.  0 disables limitation.
+	It is recommended not set too large value (or 0) because it would
+	be too easy way to crash kernel to allow to create too much of
+	autoconfigured addresses.
+	Default: 16
+
+max_desync_factor - INTEGER
+	Maximum value for DESYNC_FACTOR, which is a random value
+	that ensures that clients don't synchronize with each
+	other and generate new addresses at exactly the same time.
+	value is in seconds.
+	Default: 600
+
 mtu - INTEGER
 	Default Maximum Transfer Unit
 	Default: 1280 (IPv6 required minimum)
 
+regen_max_retry - INTEGER
+	Number of attempts before give up attempting to generate
+	valid temporary addresses.
+	Default: 5
+
 router_probe_interval - INTEGER
 	Minimum interval (in seconds) between Router Probing described
 	in RFC4191.
@@ -826,57 +1000,100 @@ router_solicitation_interval - INTEGER
 	Default: 4
 
 router_solicitations - INTEGER
-	Number of Router Solicitations to send until assuming no 
+	Number of Router Solicitations to send until assuming no
 	routers are present.
 	Default: 3
 
+temp_prefered_lft - INTEGER
+	Preferred lifetime (in seconds) for temporary addresses.
+	Default: 86400 (1 day)
+
+temp_valid_lft - INTEGER
+	valid lifetime (in seconds) for temporary addresses.
+	Default: 604800 (7 days)
+
 use_tempaddr - INTEGER
 	Preference for Privacy Extensions (RFC3041).
-	  <= 0 : disable Privacy Extensions
+	  <= 0 : disable Privacy Extensions 
 	  = 1 : enable Privacy Extensions, but prefer public
-	         addresses over temporary addresses.
+		 addresses over temporary addresses.
 	  >  1 : enable Privacy Extensions and prefer temporary
-	         addresses over public addresses.
+		 addresses over public addresses.
 	Default:  0 (for most devices)
 		 -1 (for point-to-point devices and loopback devices)
 
-temp_valid_lft - INTEGER
-	valid lifetime (in seconds) for temporary addresses.
-	Default: 604800 (7 days)
 
-temp_prefered_lft - INTEGER
-	Preferred lifetime (in seconds) for temporary addresses.
-	Default: 86400 (1 day)
+/proc/sys/net/unix/* Variables:
 
-max_desync_factor - INTEGER
-	Maximum value for DESYNC_FACTOR, which is a random value
-	that ensures that clients don't synchronize with each 
-	other and generate new addresses at exactly the same time.
-	value is in seconds.
-	Default: 600
-	
-regen_max_retry - INTEGER
-	Number of attempts before give up attempting to generate
-	valid temporary addresses.
-	Default: 5
+max_dgram_qlen - INTEGER
+	TODO Add description.
+	Default: 10
 
-max_addresses - INTEGER
-	Number of maximum addresses per interface.  0 disables limitation.
-	It is recommended not set too large value (or 0) because it would 
-	be too easy way to crash kernel to allow to create too much of 
-	autoconfigured addresses.
-	Default: 16
 
-icmp/*:
-ratelimit - INTEGER
-	Limit the maximal rates for sending ICMPv6 packets.
-	0 to disable any limiting, otherwise the maximal rate in jiffies(1)
-	Default: 100
+/proc/sys/net/ipv[46]/neigh/*/*
+/proc/sys/net/ipv[46]/neigh/default/*
 
+anycast_delay - INTEGER
+	TODO Add description.
 
-IPv6 Update by:
-Pekka Savola <pekkas@netcore.fi>
-YOSHIFUJI Hideaki / USAGI Project <yoshfuji@linux-ipv6.org>
+app_solicit - INTEGER
+	The maximum number of probes to send to the user space ARP daemon
+	via netlink before dropping back to multicast probes (see
+	mcast_solicit).  Defaults to 0.
+
+base_reachable_time - INTEGER
+	TODO Check description.
+	See base_reachable_time_ms.
+
+base_reachable_time_ms - INTEGER
+	TODO Add description.
+	Default: 30000
+
+delay_first_probe_time - ????
+	TODO Add description.
+
+gc_interval - INTEGER
+	TODO Add description.
+	Default: 30
+
+gc_stale_time - ????
+	TODO Add description.
+
+gc_thresh1 - ????
+	TODO Add description.
+
+gc_thresh2 - ????
+	TODO Add description.
+
+gc_thresh3 - ????
+	TODO Add description.
+
+locktime - ????
+	TODO Add description.
+
+mcast_solicit - ????
+	TODO Add description.
+
+proxy_delay - INTEGER
+	TODO Add description.
+	Default: 80
+
+proxy_qlen - INTEGER
+	TODO Add description.
+	Default: 64
+
+retrans_time - ????
+	TODO Check description.
+	See retrans_time_ms.
+
+retrans_time_ms - ????
+	TODO Add description.
+
+ucast_solicit - ????
+	TODO Add description.
+
+unres_qlen - ????
+	TODO Add description.
 
 
 /proc/sys/net/bridge/* Variables:
@@ -886,13 +1103,13 @@ bridge-nf-call-arptables - BOOLEAN
 	0 : disable this.
 	Default: 1
 
-bridge-nf-call-iptables - BOOLEAN
-	1 : pass bridged IPv4 traffic to iptables' chains.
+bridge-nf-call-ip6tables - BOOLEAN
+	1 : pass bridged IPv6 traffic to ip6tables' chains.
 	0 : disable this.
 	Default: 1
 
-bridge-nf-call-ip6tables - BOOLEAN
-	1 : pass bridged IPv6 traffic to ip6tables' chains.
+bridge-nf-call-iptables - BOOLEAN
+	1 : pass bridged IPv4 traffic to iptables' chains.
 	0 : disable this.
 	Default: 1
 
@@ -902,25 +1119,21 @@ bridge-nf-filter-vlan-tagged - BOOLEAN
 	Default: 1
 
 
-UNDOCUMENTED:
-
-dev_weight FIXME
-discovery_slots FIXME
-discovery_timeout FIXME
-fast_poll_increase FIXME
-ip6_queue_maxlen FIXME
-lap_keepalive_time FIXME
-lo_cong FIXME
-max_baud_rate FIXME
-max_dgram_qlen FIXME
-max_noreply_time FIXME
-max_tx_data_size FIXME
-max_tx_window FIXME
-min_tx_turn_time FIXME
-mod_cong FIXME
-no_cong FIXME
-no_cong_thresh FIXME
-slot_timeout FIXME
-warn_noreply_time FIXME
-
-$Id: ip-sysctl.txt,v 1.20 2001/12/13 09:00:18 davem Exp $
+(1) Jiffie: internal timeunit for the kernel.  On the i386 1/100s, on the
+Alpha 1/1024s.  See the HZ define in /usr/include/asm/param.h for the exact
+value on your system.
+
+
+IPv4:
+Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>
+IPv4 Updated by:
+Andi Kleen <ak@muc.de>
+Nicolas Delon <delon.nicolas@wanadoo.fr>
+
+IPv6 Updated by:
+Pekka Savola <pekkas@netcore.fi>
+YOSHIFUJI Hideaki / USAGI Project <yoshfuji@linux-ipv6.org>
+
+Reformatted/Updated:
+Robert Fitzsimons <robfitz@273k.net>, June 2006 synced with 2.6.17-rc5.
+
-- 
1.3.3.g16a4

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
