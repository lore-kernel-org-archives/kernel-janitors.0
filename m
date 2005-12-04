From: Daniel =?ISO-8859-1?Q?Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Sun, 04 Dec 2005 07:18:14 +0000
Subject: Re: [KJ] [PATCH 7/21] polling loops: change exit condition to
Message-Id: <438C7D000014D900@pne-smtpout1-sn2.hy.skanova.net (added by>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60693334092186957=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4392357F.30209@gmail.com>
In-Reply-To: <4392357F.30209@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============60693334092186957==

 time_after / time_before
Message-Id: <20051204081814.067b93c0.daniel.marjamaki@comhem.se>
X-Mailer: Sylpheed version 2.1.7 (GTK+ 2.8.8; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable



Patch for: drivers/ieee1394/sbp2.c

Are you sure about this line
+	end_time =3D jiffies + msecs_to_jiffies(timeout);

To me it seems timeout means nr of jiffies, not milliseconds.

Look at line 1286 in the file for example..
	/* Wait up to 20 seconds */
	if (sbp2util_down_timeout(blabla, 20*HZ)) {

Best Regards,
Daniel Marjam=E4ki

--===============60693334092186957==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60693334092186957==--
