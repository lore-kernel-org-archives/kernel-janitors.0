From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 05 Jul 2004 14:48:41 +0000
Subject: Re: [Kernel-janitors] [announce] 2.6.7 kjt1 patchset
Message-Id: <20040705144841.GC1587@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32198652666154537=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040618093922.GA21628@sputnik.stro.at>
In-Reply-To: <20040618093922.GA21628@sputnik.stro.at>
To: kernel-janitors@vger.kernel.org

--===============32198652666154537==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


quick update on merge status of latest kjt.


On Fri, 18 Jun 2004, maximilian attems wrote:

> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> all the patches:
> 

> document-cpu-sched-dir.patch
luiz asked to drop that one

> drvdata-eisa.patch
doesn't compile, gone for next update

> fix-warning-af_econet.patch
was already done in networking tree.

> ipv4_fib_hash_check.patch
rejected at netdev:
fn_hash_kmem is not getting leaked, 
the 'leak' seems intentional to keep using it 
even if other allocations in the same routine failed.

> kernel_thread-aacraid-rkt.patch
> kernel_thread-aacraid-rx.patch
> kernel_thread-aacraid-sa.patch
merged in linus tree via James Bottomley

> printk-fix-istallion.patch
merged in linus tree via Randy, thx :)

> remove-old-ifdefs-cpqarray.patch
acked by hp folks, they'll test it 

> remove-old-ifdefs-dc390.patch
> remove-old-ifdefs-tmscsim.patch
christoph hellwig asked to drop that,
as his patch is a superset of these changes.

> sparse-floppy98.patch
pc98 is gone, so no need for that.

> sparse-ipmi.patch
> sparse-ubd_kern.patch
done by al viro in between, 
forwarded him the other sparse fixes by Alexander Nyberg



--===============32198652666154537==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32198652666154537==--
