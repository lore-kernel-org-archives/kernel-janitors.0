From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 06 Apr 2005 08:28:59 +0000
Subject: Re: [KJ] [PATCH] kfree instead of kfree_skb : drivers/net/gianfar.c
Message-Id: <20050406082859.GB10979@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17550971337940524=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050406075033.GA10979@rhum.iomeda.fr>
In-Reply-To: <20050406075033.GA10979@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============17550971337940524==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Christophe Lucas (clucas@rotomalug.org) wrote:
> Description:
> Make sure no-one is freeing skbs with kfree instead of kfree_skb
> from http://kerneljanitors.org/TODO
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Sorry,

It is totally wrong :-(
Sorry for the noise!

Have a nice day,

	~Christophe


--===============17550971337940524==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17550971337940524==--
