From: Benoit Boissinot <benoit.boissinot@ens-lyon.org>
Date: Sun, 23 Jan 2005 13:57:22 +0000
Subject: [KJ] Re: [PATCH] Remove softirq_pending
Message-Id: <20050123135722.GA10781@ens-lyon.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97540226414745534=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97540226414745534==
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jan 21, 2005 at 09:09:49PM +0100, Benoit Boissinot wrote:
> Hi,
> 
> Below is a patch that remove a call to softirq_pending that was
> forgotten.
> 
I had no comment on this patch. Since softirq_pending was removed
in 2.6.11-rc1-mm2, without it the kernel doesn't compile:

net/core/pktgen.c:2809: warning: implicit declaration of function ‘softirq_pending’

net/built-in.o(.text+0x173b0): In function `pktgen_thread_worker':
net/core/pktgen.c:2809: undefined reference to `softirq_pending'
make: *** [.tmp_vmlinux1] Error 1

> Signed-off-by: Benoit Boissinot <benoit.boissinot@ens-lyon.org>
> 
> --- linux-clean/net/core/pktgen.c	2005-01-21 21:07:11.000000000 +0100
> +++ linux-2.6-mm-test/net/core/pktgen.c	2005-01-21 21:00:07.000000000 +0100
> @@ -2806,7 +2806,7 @@ static void pktgen_thread_worker(struct 
>  			tx_since_softirq += pkt_dev->last_ok;
>  
>  			if (tx_since_softirq > max_before_softirq) {
> -				if(softirq_pending(smp_processor_id()))  
> +				if(local_softirq_pending())  
>  					do_softirq();
>  				tx_since_softirq = 0;
>  			}
> 

--===============97540226414745534==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97540226414745534==--
