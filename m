From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 15:02:11 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/telephony/
Message-Id: <1141570932.13183.10.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11437713295428242=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============11437713295428242==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts drivers/rapidio to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/telephony/ixj_pcmcia.c.orig	2006-03-05 09:45:52.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/telephony/ixj_pcmcia.c	2006-03-05 09:46:16.000000000 +0100
@@ -46,11 +46,10 @@ static int ixj_probe(struct pcmcia_devic
 	p_dev->io.Attributes2 = IO_DATA_PATH_WIDTH_8;
 	p_dev->io.IOAddrLines = 3;
 	p_dev->conf.IntType = INT_MEMORY_AND_IO;
-	p_dev->priv = kmalloc(sizeof(struct ixj_info_t), GFP_KERNEL);
+	p_dev->priv = kzalloc(sizeof(struct ixj_info_t), GFP_KERNEL);
 	if (!p_dev->priv) {
 		return -ENOMEM;
 	}
-	memset(p_dev->priv, 0, sizeof(struct ixj_info_t));
 
 	return ixj_config(p_dev);
 }



--===============11437713295428242==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11437713295428242==--
