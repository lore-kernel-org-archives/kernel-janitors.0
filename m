From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 29 May 2004 15:27:51 +0000
Subject: [Kernel-janitors] [announce] kjt2 for 2.6.7-rc1
Message-Id: <20040529152750.GA25567@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32368372314100124=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32368372314100124==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hello everyone, :)

5 days? loco Luiz!! 
this one needs even more testing.
done kjt patch set on a stand at vienna linuxwochen.at,
in middle of questions what's linux?
can perl compile the kernel, took some effort to stay concentrated.

second release of kjt, take care of your fs 
(backup hint before applying).
thanks greg for watching kj mailing list!

This patch applies to linux-2.6.7-rc1-bk5:
http://debian.stro.at/kjt/2.6.7-rc1-kjt2/2.6.7-rc1-kjt2.patch.bz2
split out patches:
http://debian.stro.at/kjt/2.6.7-rc1-kjt2/split/


changes to 2.6.6-rc1-kj1:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+kernel_thread-aacraid-rkt
+kernel_thread-aacraid-rx
+kernel_thread-aacraid-sa
-kernel_thread-aacraid
check return value kernel_thread()
From: MJK <mkemp@cs.nmsu.edu>

+list_for_each-fs-namespace
+list_for_each-i386pci-common
+list_for_each-i386pci-pcbios
+list_for_each-pci-setup-bus
+list_for_each-pcmcia-rsrc_mgr
+list_for_each-ppp_generic
+list_for_each-sound-mem
+list_for_each-usb-audio
+list_for_each-usb-core-devices
+list_for_each-usb-midi
splitted patches 
From: Domen Puncer <domen@coderock.org>

+static-bsd_comp
+static-ppp_deflate
more static
From: me (Maximilian Attems <janitor@sternwelten.at>)

-yield-nicedelay-sb1000
-yield-schedtmout-cdu31a
-yield-schedtmout-megaraid
-yield-schedtmout-sonycd535
should use msleep()

-string_form_drivers
-keyboard_ptr_to_string
to be retested with size(1)

Backlog:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- check kernel_thread() results (Walter Harms);
  ping walter which don't apply
- list_for_each() usage (Domen Puncer)
  lots more.. 

All Patches for 2.6.7-rc1-kjt2:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

faulty-inits-fbmem
ipv4_fib_hash_check
kernel_thread-aacraid-rkt
kernel_thread-aacraid-rx
kernel_thread-aacraid-sa
list_for_each-fs-dcache
list_for_each-fs-dquot
list_for_each-fs-jffs
list_for_each-fs-namespace
list_for_each-i386pci-common
list_for_each-i386pci-pcbios
list_for_each-pci-setup-bus
list_for_each-pcmcia-rsrc_mgr
list_for_each-ppp_generic
list_for_each-sound-mem
list_for_each-usb-audio
list_for_each-usb-core-devices
list_for_each-usb-midi
remove-old-ifdefs-aic79xx
remove-old-ifdefs-aic79xx_core
remove-old-ifdefs-aic79xx_inline
remove-old-ifdefs-aic79xx_osm.c
remove-old-ifdefs-aic79xx_osm.h
remove-old-ifdefs-aic79xx_osm_pci
remove-old-ifdefs-aic7xxx
remove-old-ifdefs-aic7xxx-cam
remove-old-ifdefs-aic7xxx_core
remove-old-ifdefs-aic7xxx_osm.c
remove-old-ifdefs-aic7xxx_osm.h
remove-old-ifdefs-aic7xxx_osm_pci
remove-old-ifdefs-cpqarray
remove-old-ifdefs-dc390
remove-old-ifdefs-dmascc
remove-old-ifdefs-eepro100
remove-old-ifdefs-fasttimer
remove-old-ifdefs-mtd-cfi
remove-old-ifdefs-mtdcore
remove-old-ifdefs-scsiiom
remove-old-ifdefs-tmscsim
static-bsd_comp
static-ppp_deflate








--===============32368372314100124==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32368372314100124==--
