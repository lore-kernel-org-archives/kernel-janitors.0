From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:53 +0000
Subject: [KJ] [PATCH] [RESEND] [20/29] dvb_demux.c - vfree() checking
Message-Id: <auto-000001227500@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52067938782194378=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52067938782194378==

dvb_demux.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 dvb_demux.c |   18 ++++++------------
 1 files changed, 6 insertions(+), 12 deletions(-)


--- linux-2.6.10-vanilla/drivers/media/dvb/dvb-core/dvb_demux.c	2004-12-24 13:34:01.000000000 -0800
+++ linux-2.6.10/drivers/media/dvb/dvb-core/dvb_demux.c	2005-01-04 11:35:47.000000000 -0800
@@ -784,10 +784,8 @@
 	}
 
 #ifndef NOBUFS
-	if (feed->buffer) { 
-		vfree(feed->buffer);
-		feed->buffer=0;
-	}
+	vfree(feed->buffer);
+	feed->buffer=0;
 #endif
 
 	feed->state = DMX_STATE_FREE;
@@ -1055,10 +1053,8 @@
 		return -EINVAL;
 	}
 #ifndef NOBUFS
-	if (dvbdmxfeed->buffer) {
-		vfree(dvbdmxfeed->buffer);
-		dvbdmxfeed->buffer=0;
-	}
+	vfree(dvbdmxfeed->buffer);
+	dvbdmxfeed->buffer=0;
 #endif
 	dvbdmxfeed->state=DMX_STATE_FREE;
 
@@ -1269,10 +1265,8 @@
 	struct dmx_demux *dmx = &dvbdemux->dmx;
 
 	dmx_unregister_demux(dmx);
-	if (dvbdemux->filter)
-		vfree(dvbdemux->filter);
-	if (dvbdemux->feed)
-		vfree(dvbdemux->feed);
+	vfree(dvbdemux->filter);
+	vfree(dvbdemux->feed);
 	return 0;
 }
 EXPORT_SYMBOL(dvb_dmx_release);


--===============52067938782194378==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52067938782194378==--
