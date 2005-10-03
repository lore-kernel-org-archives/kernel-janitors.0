From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 03 Oct 2005 08:32:26 +0000
Subject: [KJ] Re: [PATCH 4/14] connector: fix gfp flags type
Message-Id: <20051003083226.GD737@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5167046572865921=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051003054905.GB31592@2ka.mipt.ru>
In-Reply-To: <20051003054905.GB31592@2ka.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============5167046572865921==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 03, 2005 at 09:49:05AM +0400, Evgeniy Polyakov wrote:
> On Sun, Oct 02, 2005 at 10:40:44PM -0700, Randy.Dunlap (rdunlap@xenotime.net) wrote:
> > Fix implicit nocast warnings in connector code:
> > drivers/connector/connector.c:102:24: warning: implicit cast to nocast type
> > drivers/connector/connector.c:114:45: warning: implicit cast to nocast type
> 
> ACK.

Should be

	unsigned int __nocast ...

> > -int cn_netlink_send(struct cn_msg *msg, u32 __group, int gfp_mask)
> > +int cn_netlink_send(struct cn_msg *msg, u32 __group, unsigned int gfp_mask)


--===============5167046572865921==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5167046572865921==--
