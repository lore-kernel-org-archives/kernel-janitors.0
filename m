From: Adrian Bunk <bunk@fs.tum.de>
Date: Sun, 09 May 2004 13:25:40 +0000
Subject: Re: [Kernel-janitors] [patch 2.6.6-rc3 7/16] ifdefs:
Message-Id: <20040509132540.GJ6704@fs.tum.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26843029936944207=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040508233819.GA4118@masina>
In-Reply-To: <20040508233819.GA4118@masina>
To: kernel-janitors@vger.kernel.org

--===============26843029936944207==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 09, 2004 at 01:38:19AM +0200, Domen Puncer wrote:
>...
> --- c/drivers/scsi/aic7xxx/aic79xx_osm.h	2004-04-04 05:37:24.000000000 +0200
> +++ a/drivers/scsi/aic7xxx/aic79xx_osm.h	2004-05-08 23:55:34.000000000 +0200
>...
> -#if LINUX_VERSION_CODE > KERNEL_VERSION(2,2,17)
>  typedef dma_addr_t bus_addr_t;
> -#else
> -typedef uint32_t bus_addr_t;
> -#endif
>  typedef uint32_t bus_size_t;
>...
> -#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,4,3)
>  #define ahd_pci_set_dma_mask pci_set_dma_mask
> -#else
>...

In these cases, it's possible to replace it in the whole code and kill 
the typedef or #define, resp.

The same is true for your patch #12 .

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============26843029936944207==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26843029936944207==--
