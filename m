From: Joe Perches <joe@perches.com>
Date: Mon, 23 Nov 2020 22:24:07 +0000
Subject: [RFC PATCH] Add a new "Frozen" status to MAINTAINERS subsystem entries
Message-Id: <afd4d5199527b33c4c428090b8a3d360b9565549.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201119072957.108941-1-bernard@vivo.com>
         <20201123214208.GB675342@ravnborg.org>
In-Reply-To: <20201123214208.GB675342@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>, Bernard Zhao <bernard@vivo.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>

On Mon, 2020-11-23 at 22:42 +0100, Sam Ravnborg wrote:
> For this old driver we should try to limit patches to bug fixing and
> infrastructure updates.

It might be useful to add a new "S:" entry type to these old drivers
as supported/maintained/obsolete may not really be appropriate.

How about something like "S: Frozen" and checkpatch could emit a
message similar to the one for unnecessary changes to obsolete code?

So using the below would emit:

$ ./scripts/checkpatch.pl -f drivers/gpu/drm/via/via_dma.c
WARNING: drivers/gpu/drm/via/via_dma.c is marked as 'frozen' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

Maybe like the below (and fyi there's no additional git lookup overhead as
the initial obsolete check already caches the git result).

---
 MAINTAINERS           | 10 +++++++++-
 scripts/checkpatch.pl | 11 +++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f10105cac6f..6374d29180b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -88,7 +88,10 @@ Descriptions of section entries and preferred order
 	   Supported:	Someone is actually paid to look after this.
 	   Maintained:	Someone actually looks after it.
 	   Odd Fixes:	It has a maintainer but they don't have time to do
-			much other than throw the odd patch in. See below..
+			much other than throw the odd patch in.
+	   Frozen:	Old code that should not be modified unless changes
+			are to correct actual defects or API infrastructure.
+			Cleanup/style changes are not generally accepted.
 	   Orphan:	No current maintainer [but maybe you could take the
 			role as you write your new code].
 	   Obsolete:	Old code. Something tagged obsolete generally means
@@ -5718,6 +5721,11 @@ S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/udl/
 
+DRM DRIVER FOR VIA
+L:	dri-devel@lists.freedesktop.org
+S:	Frozen
+F:	drivers/gpu/drm/via/
+
 DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
 M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
 M:	Melissa Wen <melissa.srw@gmail.com>
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fdfd5ec09be6..79321cbfb761 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -902,8 +902,8 @@ sub seed_camelcase_file {
 
 our %maintained_status = ();
 
-sub is_maintained_obsolete {
-	my ($filename) = @_;
+sub is_maintained {
+	my ($filename, $test) = @_;
 
 	return 0 if (!$tree || !(-e "$root/scripts/get_maintainer.pl"));
 
@@ -911,7 +911,7 @@ sub is_maintained_obsolete {
 		$maintained_status{$filename} = `perl $root/scripts/get_maintainer.pl --status --nom --nol --nogit --nogit-fallback -f $filename 2>&1`;
 	}
 
-	return $maintained_status{$filename} =~ /obsolete/i;
+	return $maintained_status{$filename} =~ /$test/i;
 }
 
 sub is_SPDX_License_valid {
@@ -2633,9 +2633,12 @@ sub process {
 		}
 
 		if ($found_file) {
-			if (is_maintained_obsolete($realfile)) {
+			if (is_maintained($realfile, "obsolete")) {
 				WARN("OBSOLETE",
 				     "$realfile is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.\n");
+			} elsif (is_maintained($realfile, "frozen")) {
+				WARN("FROZEN",
+				     "$realfile is marked as 'frozen' in the MAINTAINERS hierarchy.  No unnecessary modifications please.\n");
 			}
 			if ($realfile =~ m@^(?:drivers/net/|net/|drivers/staging/)@) {
 				$check = 1;
