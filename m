From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 23 Mar 2005 13:21:27 +0000
Subject: [KJ] Re: [patch 1/1] printk : arch/ia64/kernel/smp.c
Message-Id: <20050323132127.GD9206@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3Pql8miugIZX0722"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Domen Puncer (domen@coderock.org) wrote:
> On 23/03/05 11:02 +0100, Christophe Lucas wrote:
> >  	if (cpuid == me) {
> > -		printk("%s: trying to call self\n", __FUNCTION__);
> > +		printk(KERN_WARNING "%s: trying to call self with info:%08x\n", __FUNCTION__, info);
> 
> Hmm... %p is supposed to be used for pointers, right?
> 

Oh, sorry.

	~Christophe

--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_arch_ia64_kernel_smp.c.diff"

diff -urpN -X dontdiff a/arch/ia64/kernel/smp.c b/arch/ia64/kernel/smp.c
--- a/arch/ia64/kernel/smp.c	2005-03-18 02:34:36.000000000 +0100
+++ b/arch/ia64/kernel/smp.c	2005-03-23 14:13:09.000000000 +0100
@@ -269,7 +269,7 @@ smp_call_function_single (int cpuid, voi
 	int me = get_cpu(); /* prevent preemption and reschedule on another processor */
 
 	if (cpuid == me) {
-		printk("%s: trying to call self\n", __FUNCTION__);
+		printk(KERN_WARNING "%s: trying to call self with info:%p\n", __FUNCTION__, info);
 		put_cpu();
 		return -EBUSY;
 	}

--3Pql8miugIZX0722
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--3Pql8miugIZX0722--
