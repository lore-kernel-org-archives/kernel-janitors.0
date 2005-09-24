From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 24 Sep 2005 14:44:32 +0000
Subject: Re: [KJ] printk : arch/alpha/kernel/osf_sys.c
Message-Id: <20050924144432.GD18935@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65754755525780539=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050923082207.GB10553@rhum.iomeda.fr>
In-Reply-To: <20050923082207.GB10553@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============65754755525780539==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 23, 2005 at 10:22:07AM +0200, Christophe Lucas wrote:
> --- linux-2.6.14-rc2.orig/arch/alpha/kernel/osf_sys.c
> +++ linux-2.6.14-rc2/arch/alpha/kernel/osf_sys.c
> @@ -625,7 +625,7 @@ osf_sysinfo(int command, char __user *bu
>  	offset = command-1;
>  	if (offset >= sizeof(sysinfo_table)/sizeof(char *)) {
>  		/* Digital UNIX has a few unpublished interfaces here */
> -		printk("sysinfo(%d)", command);
> +		printk(KERN_INFO "sysinfo(%d)", command);
>  		goto out;

Should it be KERN_ERR? If this printk() is triggerred, osf_sysinfo()
will return -EINVAL.


--===============65754755525780539==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65754755525780539==--
