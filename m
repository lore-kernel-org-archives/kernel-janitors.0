From: Francois Romieu <romieu@fr.zoreil.com>
Date: Sun, 13 Feb 2005 13:17:37 +0000
Subject: Re: [KJ] [PATCH] drivers/net/wan/*: convert to pci_register_driver
Message-Id: <20050213131737.GA30392@electric-eye.fr.zoreil.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9640477926501636=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050213130551.GJ15348@rhum.iomeda.fr>
In-Reply-To: <20050213130551.GJ15348@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============9640477926501636==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Christophe Lucas <c.lucas@ifrance.com> :
[...]
> diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wan/farsync.c linux-2.6.11-rc3/drivers/net/wan/farsync.c
> --- linux-2.6.11-rc3-vanilla/drivers/net/wan/farsync.c	2005-02-03 17:03:52.000000000 +0100
> +++ linux-2.6.11-rc3/drivers/net/wan/farsync.c	2005-02-07 09:39:29.000000000 +0100
> @@ -2698,7 +2698,7 @@ fst_init(void)
>  	for (i = 0; i < FST_MAX_CARDS; i++)
>  		fst_card_array[i] = NULL;
>  	spin_lock_init(&fst_work_q_lock);
> -	return pci_module_init(&fst_driver);
> +	return register_driver(&fst_driver);
               ^^^^^^^^^^^^^^^

--
Ueimor

--===============9640477926501636==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9640477926501636==--
