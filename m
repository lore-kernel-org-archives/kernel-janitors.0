From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:57:18 +0000
Subject: [KJ] [PATCH] [20/29] dvb_demux.c - vfree() checking cleanups
Message-Id: <41db113e.793f886c.2568.07c1@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85475970644380506=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85475970644380506==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

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
-		feed->buffer-	}
+	vfree(feed->buffer);
+	feed->buffer #endif
 
 	feed->state @@ -1055,10 +1053,8 @@
 		return -EINVAL;
 	}
 #ifndef NOBUFS
-	if (dvbdmxfeed->buffer) {
-		vfree(dvbdmxfeed->buffer);
-		dvbdmxfeed->buffer-	}
+	vfree(dvbdmxfeed->buffer);
+	dvbdmxfeed->buffer #endif
 	dvbdmxfeed->state�TE_FREE;
 
@@ -1269,10 +1265,8 @@
 	struct dmx_demux *dmx  
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



--===============85475970644380506==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85475970644380506==--
