From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 24 May 2004 10:00:25 +0000
Subject: [Kernel-janitors] [announce] kjt patch-set for 2.6.7-rc1
Message-Id: <20040524100025.GB1949@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89059217668021162=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89059217668021162==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hello!

you'll find the patch at:
http://debian.stro.at/kjt/2.6.7-rc1-kjt1/2.6.7-rc1-kjt1.patch.bz2
updated split out patches:
http://debian.stro.at/kjt/2.6.7-rc1-kjt1/split/

this patch is intended for further _testing_ of our work.
i hope that it helps Acme releasing the official kj ones.
i won't forward anything to maintainers or lkml.
will try to release on weekly/10days base.

same rules applies for kjt as of previous kj by Randy:
patch that gets an objection on the list don't get in 
until reworked rediff.

critics welcome + bug me if i forgot something.
maks

so what's in - mostly patches below drivers
take a look:

This patch applies to linux-2.6.7-rc1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+remove-old-ifdefs-aic79xx
+remove-old-ifdefs-aic79xx_core
+remove-old-ifdefs-aic79xx_inline
+remove-old-ifdefs-aic79xx_osm.c
+remove-old-ifdefs-aic79xx_osm.h
+remove-old-ifdefs-aic79xx_osm_pci
+remove-old-ifdefs-aic7xxx
+remove-old-ifdefs-aic7xxx-cam
+remove-old-ifdefs-aic7xxx_core
+remove-old-ifdefs-aic7xxx_osm.c
+remove-old-ifdefs-aic7xxx_osm.h
+remove-old-ifdefs-aic7xxx_osm_pci
+remove-old-ifdefs-cpqarray
+remove-old-ifdefs-dc390
+remove-old-ifdefs-dmascc
+remove-old-ifdefs-eepro100
+remove-old-ifdefs-fasttimer
+remove-old-ifdefs-mtd-cfi
+remove-old-ifdefs-mtdcore
+remove-old-ifdefs-scsiiom
+remove-old-ifdefs-tmscsim
version3 of the cleanup patches 
From: Domen Puncer <domen@coderock.org>

+kernel_thread-aacraid
check it's return value by mjk
From: MJK <mkemp@cs.nmsu.edu>

+faulty-inits-fbmem
removes __init's 
From: Domen Puncer <domen@coderock.org>

+yield-nicedelay-sb1000
+yield-schedtmout-cdu31a
+yield-schedtmout-megaraid
+yield-schedtmout-sonycd535
the rediff versions 
From: Gustavo Franco <stratus@acm.org>

+string_form_drivers
From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
+keyboard_ptr_to_string
From: maximilian attems <janitor@sternwelten.at>
from linux-2.6.5-rc1-kj patch-set - size benefit 
(well could not be verified on all platforms, but generally spoken yes)

+ipv4_fib_hash_check.patch
kmem_cache_create leak from 2.6.4-rc2-kj
From: Francois Romieu <romieu@fr.zoreil.com>
original From: <WHarms@bfs.de>(Walter Harms)



Backlog:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- check kernel_thread() results (Walter Harms);
  had a high number of rejects on them..
- list_for_each() usage (Domen Puncer);
- ???



--===============89059217668021162==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89059217668021162==--
