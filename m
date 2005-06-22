From: Daniel Smertnig <daniel.smertnig@gmail.com>
Date: Wed, 22 Jun 2005 19:47:56 +0000
Subject: [KJ] [PATCH 2.6.12] [RESEND] /proc/tty/driver/* filtering for non
Message-Id: <20050622194756.GA6699@dansme-mobile.smertnig>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20549025075903238=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20549025075903238==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Only give out non-sensitive information to CAP_SYS_RAWIO users in
/proc/tty/driver/* and make it world-readable, as described in the
kernel janitors TODO:

  "go through all the tty/serial drivers and make sure they don't give out
  excessively useful information to non CAP_SYS_RAWIO users, then loosen
  permissions. [D: http://lkml.org/lkml/2005/1/17/94]"

Only port settings (irqs, baud rate, flow control configuration, ...)
are given to ordinary users. Current port status (tx, rx, error
counters, status flags, ...) is limited to CAP_SYS_RAWIO users.

The following files where checked (should be all serial drivers which
implement the tty read_proc function):

  arch/ia64/hp/sim/simserial.c
  drivers/usb/serial/usb-serial.c
  drivers/char/synclinkmp.c
  drivers/char/istallion.c
  drivers/char/amiserial.c
  drivers/char/cyclades.c
  drivers/char/stallion.c
  drivers/char/pcmcia/synclink_cs.c
  drivers/char/ip2main.c
  drivers/char/synclink.c
  drivers/isdn/capi/capi.c
  drivers/serial/crisv10.c
  drivers/serial/serial_core.c
  drivers/serial/mcfserial.c
  drivers/serial/68360serial.c
  drivers/macintosh/macserial.c
  net/irda/ircomm/ircomm_tty.c
  net/bluetooth/rfcomm/tty.c

Signed-off-by: Daniel Smertnig <daniel.smertnig@gmail.com>

diff --git a/drivers/char/amiserial.c b/drivers/char/amiserial.c
--- a/drivers/char/amiserial.c
+++ b/drivers/char/amiserial.c
@@ -1876,6 +1876,17 @@ static inline int line_info(char *buf, s
 		info->quot = 0;
 		info->tty = NULL;
 	}
+
+	if (info->quot) {
+		ret += sprintf(buf+ret, " baud:%d",
+			       state->baud_base / info->quot);
+	}
+
+	if (!capable(CAP_SYS_RAWIO)) {
+		strcat(buf, "\n");
+		return ret + 1;
+	}
+	
 	local_irq_save(flags);
 	status = ciab.pra;
 	control = info ? info->MCR : status;
@@ -1894,11 +1905,6 @@ static inline int line_info(char *buf, s
 	if(!(status & SER_DCD))
 		strcat(stat_buf, "|CD");
 
-	if (info->quot) {
-		ret += sprintf(buf+ret, " baud:%d",
-			       state->baud_base / info->quot);
-	}
-
 	ret += sprintf(buf+ret, " tx:%d rx:%d",
 		      state->icount.tx, state->icount.rx);
 
diff --git a/drivers/char/cyclades.c b/drivers/char/cyclades.c
--- a/drivers/char/cyclades.c
+++ b/drivers/char/cyclades.c
@@ -5179,7 +5179,11 @@ cyclades_get_proc_info(char *buf, char *
     int size;
     __u32 cur_jifs = jiffies;
 
-    size = sprintf(buf, "Dev TimeOpen   BytesOut  IdleOut    BytesIn   IdleIn  Overruns  Ldisc\n");
+    if (capable(CAP_SYS_RAWIO)) {
+    	size = sprintf(buf, "Dev TimeOpen   BytesOut  IdleOut    BytesIn   IdleIn  Overruns  Ldisc\n");
+    } else {
+    	size = sprintf(buf, "Dev Ldisc\n");
+    }	
 
     pos += size;
     len += size;
@@ -5188,21 +5192,29 @@ cyclades_get_proc_info(char *buf, char *
     for (i = 0; i < NR_PORTS && cy_port[i].line >= 0; i++) {
 	info = &cy_port[i];
 
-	if (info->count)
-	    size = sprintf(buf+len,
-			"%3d %8lu %10lu %8lu %10lu %8lu %9lu %6ld\n",
-			info->line,
-			JIFFIES_DIFF(info->idle_stats.in_use, cur_jifs) / HZ,
-			info->idle_stats.xmit_bytes,
-			JIFFIES_DIFF(info->idle_stats.xmit_idle, cur_jifs) / HZ,
-			info->idle_stats.recv_bytes,
-			JIFFIES_DIFF(info->idle_stats.recv_idle, cur_jifs) / HZ,
-			info->idle_stats.overruns,
-			(long) info->tty->ldisc.num);
-	else
-	    size = sprintf(buf+len,
-			"%3d %8lu %10lu %8lu %10lu %8lu %9lu %6ld\n",
-			info->line, 0L, 0L, 0L, 0L, 0L, 0L, 0L);
+	if (capable(CAP_SYS_RAWIO)) {
+	    if (info->count)
+	        size = sprintf(buf+len,
+			    "%3d %8lu %10lu %8lu %10lu %8lu %9lu %6ld\n",
+			    info->line,
+			    JIFFIES_DIFF(info->idle_stats.in_use, cur_jifs) / HZ,
+			    info->idle_stats.xmit_bytes,
+			    JIFFIES_DIFF(info->idle_stats.xmit_idle, cur_jifs) / HZ,
+			    info->idle_stats.recv_bytes,
+			    JIFFIES_DIFF(info->idle_stats.recv_idle, cur_jifs) / HZ,
+			    info->idle_stats.overruns,
+			    (long) info->tty->ldisc.num);
+	    else
+	        size = sprintf(buf+len,
+			    "%3d %8lu %10lu %8lu %10lu %8lu %9lu %6ld\n",
+			    info->line, 0L, 0L, 0L, 0L, 0L, 0L, 0L);
+	} else {
+	    if (info->count)
+	        size = sprintf(buf+len, "%3d %6ld\n", info->line, 
+				(long) info->tty->ldisc.num);
+	    else
+	        size = sprintf(buf+len, "%3d %6ld\n", info->line, 0L);
+	}
 	len += size;
 	pos = begin + len;
 
diff --git a/drivers/char/ip2main.c b/drivers/char/ip2main.c
diff --git a/drivers/char/istallion.c b/drivers/char/istallion.c
--- a/drivers/char/istallion.c
+++ b/drivers/char/istallion.c
@@ -2511,7 +2511,7 @@ static int stli_portinfo(stlibrd_t *brdp
 	sp = pos;
 	sp += sprintf(sp, "%d: uart:%s ", portnr, uart);
 
-	if ((brdp->state & BST_STARTED) && (rc >= 0)) {
+	if (capable(CAP_SYS_RAWIO) && (brdp->state & BST_STARTED) && (rc >= 0)) {
 		sp += sprintf(sp, "tx:%d rx:%d", (int) stli_comstats.txtotal,
 			(int) stli_comstats.rxtotal);
 
diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
--- a/drivers/char/pcmcia/synclink_cs.c
+++ b/drivers/char/pcmcia/synclink_cs.c
@@ -2879,6 +2879,11 @@ static inline int line_info(char *buf, M
 	ret = sprintf(buf, "%s:io:%04X irq:%d",
 		      info->device_name, info->io_base, info->irq_level);
 
+	if (!capable(CAP_SYS_RAWIO)) {
+		strcat(buf, "\n");
+		return ret + 1;
+	}
+
 	/* output current serial signal states */
 	spin_lock_irqsave(&info->lock,flags);
  	get_signals(info);
diff --git a/drivers/char/stallion.c b/drivers/char/stallion.c
--- a/drivers/char/stallion.c
+++ b/drivers/char/stallion.c
@@ -1846,28 +1846,37 @@ static int stl_portinfo(stlport_t *portp
 	int	sigs, cnt;
 
 	sp = pos;
-	sp += sprintf(sp, "%d: uart:%s tx:%d rx:%d",
-		portnr, (portp->hwid == 1) ? "SC26198" : "CD1400",
-		(int) portp->stats.txtotal, (int) portp->stats.rxtotal);
-
-	if (portp->stats.rxframing)
-		sp += sprintf(sp, " fe:%d", (int) portp->stats.rxframing);
-	if (portp->stats.rxparity)
-		sp += sprintf(sp, " pe:%d", (int) portp->stats.rxparity);
-	if (portp->stats.rxbreaks)
-		sp += sprintf(sp, " brk:%d", (int) portp->stats.rxbreaks);
-	if (portp->stats.rxoverrun)
-		sp += sprintf(sp, " oe:%d", (int) portp->stats.rxoverrun);
-
-	sigs = stl_getsignals(portp);
-	cnt = sprintf(sp, "%s%s%s%s%s ",
-		(sigs & TIOCM_RTS) ? "|RTS" : "",
-		(sigs & TIOCM_CTS) ? "|CTS" : "",
-		(sigs & TIOCM_DTR) ? "|DTR" : "",
-		(sigs & TIOCM_CD) ? "|DCD" : "",
-		(sigs & TIOCM_DSR) ? "|DSR" : "");
-	*sp = ' ';
-	sp += cnt;
+	sp += sprintf(sp, "%d: uart:%s",
+		portnr, (portp->hwid == 1) ? "SC26198" : "CD1400");
+
+	if (capable(CAP_SYS_RAWIO)) {
+		sp += sprintf(sp, " tx:%d rx:%d",
+			(int) portp->stats.txtotal, 
+			(int) portp->stats.rxtotal);
+
+		if (portp->stats.rxframing)
+			sp += sprintf(sp, " fe:%d",
+					(int) portp->stats.rxframing);
+		if (portp->stats.rxparity)
+			sp += sprintf(sp, " pe:%d",
+					(int) portp->stats.rxparity);
+		if (portp->stats.rxbreaks)
+			sp += sprintf(sp, " brk:%d",
+					(int) portp->stats.rxbreaks);
+		if (portp->stats.rxoverrun)
+			sp += sprintf(sp, " oe:%d",
+					(int) portp->stats.rxoverrun);
+
+		sigs = stl_getsignals(portp);
+		cnt = sprintf(sp, "%s%s%s%s%s ",
+			(sigs & TIOCM_RTS) ? "|RTS" : "",
+			(sigs & TIOCM_CTS) ? "|CTS" : "",
+			(sigs & TIOCM_DTR) ? "|DTR" : "",
+			(sigs & TIOCM_CD) ? "|DCD" : "",
+			(sigs & TIOCM_DSR) ? "|DSR" : "");
+		*sp = ' ';
+		sp += cnt;
+	}
 
 	for (cnt = (sp - pos); (cnt < (MAXLINE - 1)); cnt++)
 		*sp++ = ' ';
diff --git a/drivers/char/synclink.c b/drivers/char/synclink.c
--- a/drivers/char/synclink.c
+++ b/drivers/char/synclink.c
@@ -3554,6 +3554,11 @@ static inline int line_info(char *buf, s
 			info->irq_level, info->dma_level);
 	}
 
+	if (!capable(CAP_SYS_RAWIO)) {
+		strcat(buf, "\n");
+		return ret + 1;
+	}
+
 	/* output current serial signal states */
 	spin_lock_irqsave(&info->irq_spinlock,flags);
  	usc_get_serial_signals(info);
diff --git a/drivers/char/synclinkmp.c b/drivers/char/synclinkmp.c
--- a/drivers/char/synclinkmp.c
+++ b/drivers/char/synclinkmp.c
@@ -1424,6 +1424,10 @@ static inline int line_info(char *buf, S
 		info->irq_level,
 		info->max_frame_size );
 
+	if (!capable(CAP_SYS_RAWIO)) {
+		return ret;
+	}
+
 	/* output current serial signal states */
 	spin_lock_irqsave(&info->lock,flags);
  	get_signals(info);
diff --git a/drivers/isdn/capi/capi.c b/drivers/isdn/capi/capi.c
diff --git a/drivers/macintosh/macserial.c b/drivers/macintosh/macserial.c
diff --git a/drivers/serial/68360serial.c b/drivers/serial/68360serial.c
--- a/drivers/serial/68360serial.c
+++ b/drivers/serial/68360serial.c
@@ -2022,6 +2022,17 @@ static inline int line_info(char *buf, s
 		info->quot = 0;
 		info->tty = 0;
 	}
+
+	if (info->quot) {
+		ret += sprintf(buf+ret, " baud:%d",
+			       state->baud_base / info->quot);
+	}
+
+	if (!capable(CAP_SYS_RAWIO)) {
+		strcat(buf, "\n");
+		return ret + 1;
+	}
+
 	local_irq_disable();
 	status = serial_in(info, UART_MSR);
 	control = info ? info->MCR : serial_in(info, UART_MCR);
@@ -2042,11 +2053,6 @@ static inline int line_info(char *buf, s
 	if (status & UART_MSR_RI)
 		strcat(stat_buf, "|RI");
 
-	if (info->quot) {
-		ret += sprintf(buf+ret, " baud:%d",
-			       state->baud_base / info->quot);
-	}
-
 	ret += sprintf(buf+ret, " tx:%d rx:%d",
 		      state->icount.tx, state->icount.rx);
 
diff --git a/drivers/serial/crisv10.c b/drivers/serial/crisv10.c
--- a/drivers/serial/crisv10.c
+++ b/drivers/serial/crisv10.c
@@ -4733,6 +4733,13 @@ extern _INLINE_ int line_info(char *buf,
 		return ret;
 	}
 
+	ret += sprintf(buf+ret, " baud:%d", info->baud);
+
+	if (!capable(CAP_SYS_RAWIO)) {
+		strcat(buf, "\n");
+		return ret + 1;
+	}
+
 	stat_buf[0] = 0;
 	stat_buf[1] = 0;
 	if (!E100_RTS_GET(info))
diff --git a/drivers/serial/mcfserial.c b/drivers/serial/mcfserial.c
--- a/drivers/serial/mcfserial.c
+++ b/drivers/serial/mcfserial.c
@@ -1581,6 +1581,13 @@ int mcfrs_readproc(char *page, char **st
 		info = &mcfrs_table[i];
 		len += sprintf((page + len), "%d: port:%x irq=%d baud:%d ",
 			i, (unsigned int) info->addr, info->irq, info->baud);
+
+		if (!capable(CAP_SYS_RAWIO)) {
+			strcat(page, "\n");
+			len++;
+			continue;
+		}
+		
 		if (info->stats.rx || info->stats.tx)
 			len += sprintf((page + len), "tx:%d rx:%d ",
 			info->stats.tx, info->stats.rx);
diff --git a/drivers/serial/serial_core.c b/drivers/serial/serial_core.c
--- a/drivers/serial/serial_core.c
+++ b/drivers/serial/serial_core.c
@@ -1616,7 +1616,7 @@ static int uart_line_info(char *buf, str
 		return ret + 1;
 	}
 
-	if(capable(CAP_SYS_ADMIN))
+	if (capable(CAP_SYS_RAWIO))
 	{
 		status = port->ops->get_mctrl(port);
 
diff --git a/fs/proc/proc_tty.c b/fs/proc/proc_tty.c
--- a/fs/proc/proc_tty.c
+++ b/fs/proc/proc_tty.c
@@ -227,13 +227,8 @@ void __init proc_tty_init(void)
 	if (!proc_mkdir("tty", NULL))
 		return;
 	proc_tty_ldisc = proc_mkdir("tty/ldisc", NULL);
-	/*
-	 * /proc/tty/driver/serial reveals the exact character counts for
-	 * serial links which is just too easy to abuse for inferring
-	 * password lengths and inter-keystroke timings during password
-	 * entry.
-	 */
-	proc_tty_driver = proc_mkdir_mode("tty/driver", S_IRUSR | S_IXUSR, NULL);
+
+	proc_tty_driver = proc_mkdir("tty/driver", NULL);
 
 	create_proc_read_entry("tty/ldiscs", 0, NULL, tty_ldiscs_read_proc, NULL);
 	entry = create_proc_entry("tty/drivers", 0, NULL);
diff --git a/net/bluetooth/rfcomm/tty.c b/net/bluetooth/rfcomm/tty.c
diff --git a/net/irda/ircomm/ircomm_tty.c b/net/irda/ircomm/ircomm_tty.c
--- a/net/irda/ircomm/ircomm_tty.c
+++ b/net/irda/ircomm/ircomm_tty.c
@@ -1268,27 +1268,29 @@ static int ircomm_tty_line_info(struct i
 
 	ret += sprintf(buf+ret, "Port name: %s\n", self->settings.port_name);
 
-	ret += sprintf(buf+ret, "DTE status: ");	
-        if (self->settings.dte & IRCOMM_RTS)
-                ret += sprintf(buf+ret, "RTS|");
-        if (self->settings.dte & IRCOMM_DTR)
-                ret += sprintf(buf+ret, "DTR|");
-	if (self->settings.dte)
-		ret--; /* remove the last | */
-        ret += sprintf(buf+ret, "\n");
-
-	ret += sprintf(buf+ret, "DCE status: ");
-        if (self->settings.dce & IRCOMM_CTS)
-                ret += sprintf(buf+ret, "CTS|");
-        if (self->settings.dce & IRCOMM_DSR)
-                ret += sprintf(buf+ret, "DSR|");
-        if (self->settings.dce & IRCOMM_CD)
-                ret += sprintf(buf+ret, "CD|");
-        if (self->settings.dce & IRCOMM_RI) 
-                ret += sprintf(buf+ret, "RI|");
-	if (self->settings.dce)
-		ret--; /* remove the last | */
-        ret += sprintf(buf+ret, "\n");
+	if (capable(CAP_SYS_RAWIO)) {
+		ret += sprintf(buf+ret, "DTE status: ");	
+       		if (self->settings.dte & IRCOMM_RTS)
+              		ret += sprintf(buf+ret, "RTS|");
+        	if (self->settings.dte & IRCOMM_DTR)
+                	ret += sprintf(buf+ret, "DTR|");
+		if (self->settings.dte)
+			ret--; /* remove the last | */
+        	ret += sprintf(buf+ret, "\n");
+
+		ret += sprintf(buf+ret, "DCE status: ");
+        	if (self->settings.dce & IRCOMM_CTS)
+                	ret += sprintf(buf+ret, "CTS|");
+        	if (self->settings.dce & IRCOMM_DSR)
+                	ret += sprintf(buf+ret, "DSR|");
+        	if (self->settings.dce & IRCOMM_CD)
+                	ret += sprintf(buf+ret, "CD|");
+        	if (self->settings.dce & IRCOMM_RI) 
+                	ret += sprintf(buf+ret, "RI|");
+		if (self->settings.dce)
+			ret--; /* remove the last | */
+        	ret += sprintf(buf+ret, "\n");
+	}
 
 	ret += sprintf(buf+ret, "Configuration: ");
 	if (!self->settings.null_modem)
@@ -1339,11 +1341,13 @@ static int ircomm_tty_line_info(struct i
 
 	ret += sprintf(buf+ret, "Role: %s\n", self->client ? 
 		       "client" : "server");
-	ret += sprintf(buf+ret, "Open count: %d\n", self->open_count);
+	if (capable(CAP_SYS_RAWIO)) {
+		ret += sprintf(buf+ret, "Open count: %d\n", self->open_count);
+	}
 	ret += sprintf(buf+ret, "Max data size: %d\n", self->max_data_size);
 	ret += sprintf(buf+ret, "Max header size: %d\n", self->max_header_size);
 		
-	if (self->tty)
+	if (self->tty && capable(CAP_SYS_RAWIO))
 		ret += sprintf(buf+ret, "Hardware: %s\n", 
 			       self->tty->hw_stopped ? "Stopped" : "Running");
 

--===============20549025075903238==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20549025075903238==--
