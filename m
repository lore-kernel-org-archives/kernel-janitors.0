From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 13 Apr 2005 14:43:08 +0000
Subject: [KJ] Re: [PATCH] scsi/a100u2w: Remove custom msecs_to_jiffies and
Message-Id: <20050413144308.GA9616@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80367481297744825=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050413121104.GA9419@argon.tklauser.home>
In-Reply-To: <20050413121104.GA9419@argon.tklauser.home>
To: Tobias Klauser <tklauser@nuerscht.ch>
Cc: kernel-janitors@lists.osdl.org, linux-scsi@vger.kernel.org

--===============80367481297744825==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

>  static void waitForPause(unsigned amount)
>  {
> -	ULONG the_time = jiffies + MS_TO_JIFFIES(amount);
> +	ULONG the_time = jiffies + msecs_to_jiffies(amount);
>  	while (time_before_eq(jiffies, the_time))
>  		cpu_relax();

You should probably replace this function with msleep completely.

--===============80367481297744825==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80367481297744825==--
