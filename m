From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 10 Dec 2005 17:51:37 +0000
Subject: Re: [KJ] [PATCH 2/21] polling loops: change exit condition to
Message-Id: <20051210175137.GA1317@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91234036491440484=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <439234A0.3030602@gmail.com>
In-Reply-To: <439234A0.3030602@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============91234036491440484==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 04, 2005 at 01:13:20AM +0100, Marcin Slusarz wrote:

> --- linux-2.6.15-rc4-orig/drivers/atm/he.c
> +++ linux-2.6.15-rc4/drivers/atm/he.c
> @@ -2550,8 +2550,9 @@ he_close(struct atm_vcc *vcc)
> 	struct he_tpd *tpd;
> 	unsigned cid;
> 	struct he_vcc *he_vcc = HE_VCC(vcc);
> -#define MAX_RETRY 30
> -	int retry = 0, sleep = 1, tx_inuse;
> +#define MAX_TIMEOUT 6000

There is no point to keep this define. It's used only once.

You also forgot to include jiffies.h. This applies to the rest of the
patchbomb.

> +	int sleep = 1, tx_inuse;
> +	unsigned long end_time;
> 
> 	HPRINTK("close vcc %p %d.%d\n", vcc, vcc->vpi, vcc->vci);
> 
> @@ -2607,14 +2608,12 @@ he_close(struct atm_vcc *vcc)
> 		 * TBRQ. When the last packet on the connection arrives in 
> 		 the
> 		 * TBRQ, the host issues the close command to the adapter.
> 		 */
> -
> +		end_time = jiffies + msecs_to_jiffies(MAX_TIMEOUT);
> 		while (((tx_inuse = 
> 		atomic_read(&sk_atm(vcc)->sk_wmem_alloc)) > 0) &&
> -		       (retry < MAX_RETRY)) {
> +		       time_before(jiffies, end_time)) {
> 			msleep(sleep);
> 			if (sleep < 250)
> 				sleep = sleep * 2;
> -
> -			++retry;
> 		}


--===============91234036491440484==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91234036491440484==--
