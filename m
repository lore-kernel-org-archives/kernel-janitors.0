From: Benoit Boissinot <benoit.boissinot@ens-lyon.org>
Date: Fri, 21 Jan 2005 20:09:49 +0000
Subject: [KJ] [PATCH] Remove softirq_pending
Message-Id: <20050121200949.GF22673@ens-lyon.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70084597795968451=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70084597795968451==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Below is a patch that remove a call to softirq_pending that was
forgotten.

Signed-off-by: Benoit Boissinot <benoit.boissinot@ens-lyon.org>

--- linux-clean/net/core/pktgen.c	2005-01-21 21:07:11.000000000 +0100
+++ linux-2.6-mm-test/net/core/pktgen.c	2005-01-21 21:00:07.000000000 +0100
@@ -2806,7 +2806,7 @@ static void pktgen_thread_worker(struct 
 			tx_since_softirq += pkt_dev->last_ok;
 
 			if (tx_since_softirq > max_before_softirq) {
-				if(softirq_pending(smp_processor_id()))  
+				if(local_softirq_pending())  
 					do_softirq();
 				tx_since_softirq = 0;
 			}


--===============70084597795968451==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70084597795968451==--
