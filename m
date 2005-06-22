From: randy_dunlap <rdunlap@xenotime.net>
Date: Wed, 22 Jun 2005 16:29:20 +0000
Subject: Re: [KJ] [PATCH][RESEND] Audit return code :
Message-Id: <20050622092920.5ee03369.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28501934552598507=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622080346.GH5054@rhum.iomeda.fr>
In-Reply-To: <20050622080346.GH5054@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============28501934552598507==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jun 2005 10:03:46 +0200 Christophe Lucas wrote:

| 
| diff -urpNX dontdiff 2.6.12-orig/drivers/misc/hdpuftrs/hdpu_cpustate.c 2.6.12/drivers/misc/hdpuftrs/hdpu_cpustate.c
| --- 2.6.12-orig/drivers/misc/hdpuftrs/hdpu_cpustate.c	2005-06-17 21:48:29.000000000 +0200
| +++ 2.6.12/drivers/misc/hdpuftrs/hdpu_cpustate.c	2005-06-22 09:16:08.000000000 +0200
| @@ -192,13 +192,25 @@ static int hdpu_cpustate_probe(struct de
|  {
|  
| -	misc_register(&cpustate_dev);
| -	create_proc_read_entry("sky_cpustate", 0, 0, cpustate_read_proc, NULL);
| +	ret = misc_register(&cpustate_dev);
| +	if (ret) {
| +		printk(KERN_WARNING "Unable to register misc device.\n");

Message needs module identifier in it.

| +		cpustate.set_addr = NULL;
| +		cpustate.clr_addr = NULL;
| +		return ret ;
| +	}
| +
| +	proc_de = create_proc_read_entry("sky_cpustate", 0, 0, cpustate_read_proc, NULL);
| +	if (proc_de == NULL) {
| +		printk(KERN_WARNING "Unable to create proc dir entry for hdpu_cpustate device.\n");
| +	}


---
~Randy

--===============28501934552598507==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28501934552598507==--
