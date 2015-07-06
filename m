From: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 06 Jul 2015 21:50:13 +0000
Subject: Re: [PATCH] ntfs: Deletion of unnecessary checks before the function call "iput"
Message-Id: <20150706145013.13e231ec1dc51ac0d9137732@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
	<alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
	<530A086E.8010901@users.sourceforge.net>
	<alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
	<530A72AA.3000601@users.sourceforge.net>
	<alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
	<530B5FB6.6010207@users.sourceforge.net>
	<alpine.DEB.2.10.1402241710370.2074@hadrien>
	<530C5E18.1020800@users.sourceforge.net>
	<alpine.DEB.2.10.1402251014170.2080@hadrien>
	<530CD2C4.4050903@users.sourceforge.net>
	<alpine.DEB.2.10.1402251840450.7035@hadrien>
	<530CF8FF.8080600@users.sourceforge.net>
	<alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	<530DD06F.4090703@users.sourceforge.net>
	<alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<54679E97.5000801@users.sourceforge.net>
	<5597B641.2030704@users.sourceforge.net>
	<620065E5-8238-476C-A9B5-1B5B1AD298B0@tuxera.com>
In-Reply-To: <620065E5-8238-476C-A9B5-1B5B1AD298B0@tuxera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Altaparmakov <anton@tuxera.com>
Cc: "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, SF Markus Elfring <elfring@users.sourceforge.net>

On Sat, 4 Jul 2015 10:36:57 +0000 Anton Altaparmakov <anton@tuxera.com> wrote:

> Hi Andrew,
> 
> Can you please take up this trivial patch and merge it upstream?
> 
> Reviewed-by: Anton Altaparmakov <anton@tuxera.com>
> 

Nobody responded to Julia's review comment: "I don't have time to look
at the code now, but since there is an exit label here, have you
checked whether you could improve the gotos in these cases?"

She has a good point.  We can either change those gotos to go to the
correct place (current code is rather bizarre) or we can simply do

--- a/fs/ntfs/super.c~a
+++ a/fs/ntfs/super.c
@@ -2202,36 +2202,26 @@ get_ctx_vol_failed:
 	}
 #endif /* NTFS_RW */
 	return true;
+out:
 #ifdef NTFS_RW
-iput_usnjrnl_err_out:
 	iput(vol->usnjrnl_j_ino);
 	iput(vol->usnjrnl_max_ino);
 	iput(vol->usnjrnl_ino);
-iput_quota_err_out:
 	iput(vol->quota_q_ino);
 	iput(vol->quota_ino);
 	iput(vol->extend_ino);
 #endif /* NTFS_RW */
-iput_sec_err_out:
 	iput(vol->secure_ino);
-iput_root_err_out:
 	iput(vol->root_ino);
-iput_logfile_err_out:
 #ifdef NTFS_RW
 	iput(vol->logfile_ino);
-iput_vol_err_out:
 #endif /* NTFS_RW */
 	iput(vol->vol_ino);
-iput_lcnbmp_err_out:
 	iput(vol->lcnbmp_ino);
-iput_attrdef_err_out:
 	vol->attrdef_size = 0;
-	if (vol->attrdef) {
-		ntfs_free(vol->attrdef);
-		vol->attrdef = NULL;
-	}
+	ntfs_free(vol->attrdef);
+	vol->attrdef = NULL;
 #ifdef NTFS_RW
-iput_upcase_err_out:
 #endif /* NTFS_RW */
 	vol->upcase_len = 0;
 	mutex_lock(&ntfs_lock);
@@ -2246,7 +2236,6 @@ iput_upcase_err_out:
 	}
 iput_mftbmp_err_out:
 	iput(vol->mftbmp_ino);
-iput_mirr_err_out:
 #ifdef NTFS_RW
 	iput(vol->mftmirr_ino);
 #endif /* NTFS_RW */

(note that ntfs_free(NULL) is OK)

then change all the appropriate gotos to good old "goto out;".

Or we can not bother ;)
