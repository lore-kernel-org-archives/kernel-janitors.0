From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 24 Oct 2005 19:38:06 +0000
Subject: Re: [KJ] [PATCH] arch/i386/kernel/process.c
Message-Id: <20051024193806.GA7731@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61188552700016441=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4359539D.2060608@users.sourceforge.net>
In-Reply-To: <4359539D.2060608@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

--===============61188552700016441==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 21, 2005 at 08:46:21PM +0000, slackfan@users.sourceforge.net wrote:
> 	if (!strncmp(str, "poll", 4)) {
> -		printk("using polling idle threads.\n");
> +		printk(KERN_DEBUG "using polling idle threads.\n");

> +			printk(KERN_NOTICE "WARNING: polling idle and HT 
> enabled, performance may degrade.\n");

KERN_WARNING, no?

> #endif
> 	} else if (!strncmp(str, "halt", 4)) {
> -		printk("using halt in idle threads.\n");
> +		printk(KERN_INFO "using halt in idle threads.\n");

Strange. You've used KERN_DEBUG several lines above.


--===============61188552700016441==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61188552700016441==--
