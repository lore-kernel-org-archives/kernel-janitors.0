From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:43:19 +0000
Subject: Re: [KJ] [PATCH 13/18] drivers/telephony/ remove pci_find_{device,
Message-Id: <20050214184319.GK7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67286568283218506=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141145.21711.amitg@calsoftinc.com>
In-Reply-To: <200502141145.21711.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============67286568283218506==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:45:18AM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys
> 
> Do consider applying.
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> diff -uprN orig/drivers/telephony/ixj.c linux-2.6.11-rc3/drivers/telephony/ixj.c
> --- orig/drivers/telephony/ixj.c	2005-02-11 15:19:54.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/telephony/ixj.c	2005-02-14 05:32:27.000000000 +0530
> @@ -7751,7 +7751,7 @@ static int __init ixj_probe_pci(int *cnt
>  	IXJ *j = NULL;
>  
>  	for (i = 0; i < IXJMAX - *cnt; i++) {
> -		pci = pci_find_device(0x15E2, 0x0500, pci);
> +		pci = pci_get_device(0x15E2, 0x0500, pci);
>  		if (!pci)
>  			break;
>  

No, incorrect usage, please do not apply.

thanks,

greg k-h

--===============67286568283218506==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67286568283218506==--
