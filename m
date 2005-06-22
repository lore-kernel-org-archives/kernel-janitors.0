From: randy_dunlap <rdunlap@xenotime.net>
Date: Wed, 22 Jun 2005 15:50:18 +0000
Subject: Re: [KJ] [PATCH][RESEND] Audit return code :
Message-Id: <20050622085018.158aae66.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83838999600449793=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622080346.GH5054@rhum.iomeda.fr>
In-Reply-To: <20050622080346.GH5054@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============83838999600449793==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jun 2005 10:00:00 +0200 Christophe Lucas wrote:

| diff -urpNX dontdiff 2.6.12-orig/drivers/macintosh/apm_emu.c 2.6.12/drivers/macintosh/apm_emu.c
| --- 2.6.12-orig/drivers/macintosh/apm_emu.c	2005-06-17 21:48:29.000000000 +0200
| +++ 2.6.12/drivers/macintosh/apm_emu.c	2005-06-22 09:15:21.000000000 +0200
| @@ -515,19 +515,24 @@ static struct miscdevice apm_device = {
|  
|  static int __init apm_emu_init(void)
|  {
| +	int ret ;

	int ret;

|  	struct proc_dir_entry *apm_proc;
|  
|  	if (sys_ctrler != SYS_CTRLER_PMU) {
|  		printk(KERN_INFO "apm_emu: Requires a machine with a PMU.\n");
|  		return -ENODEV;
|  	}
| -		
| +
| +	ret = misc_register(&apm_device);
| +	if (ret) {
| +		printk(KERN_WARNING "Unable to register misc device.\n");
| +		return ret ;

		return ret;

| +	}
| +


---
~Randy

--===============83838999600449793==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83838999600449793==--
