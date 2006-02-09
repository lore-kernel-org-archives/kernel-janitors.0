From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Thu, 09 Feb 2006 10:21:24 +0000
Subject: Re: [kj][Patch] remove implicit sign bit on single bit
Message-Id: <1139480484.17930.7.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49778605302029666=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139372248.9409.15.camel@localhost.localdomain>
In-Reply-To: <1139372248.9409.15.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============49778605302029666==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-02-08 at 23:15 -0800, Nishanth Aravamudan wrote:
> Fair enough; but I believe time is better spent patching subsystems
> which matter. My opinion, though, so if you're willing to push them
> upstream, then they are fine (and I think Darren figured out the
> line-wrapping).
> 
> Thanks,
> Nish

Well I'm not too bothered about it either way, but I figure that if
people are still building/using it why not apply the patch?
Anyway now I have figured out the line-wrapping I guess I had better do
a re-send.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c.orig	2006-02-08 13:43:27.000000000 +1100
+++ linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c	2006-02-08 13:45:39.000000000 +1100
@@ -306,9 +306,8 @@ struct via_info {
 	unsigned intmask: 1;	/* Needs int bits */
 	unsigned sixchannel: 1;	/* 8233/35 with 6 channel support */
 	unsigned volume: 1;
+	unsigned locked_rate : 1;
 
-	int locked_rate : 1;
-	
 	int mixer_vol;		/* 8233/35 volume  - not yet implemented */
 
 	struct semaphore syscall_sem;



--===============49778605302029666==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49778605302029666==--
