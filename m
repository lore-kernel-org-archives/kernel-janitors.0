From: Gustavo Franco <stratus@acm.org>
Date: Sat, 24 Apr 2004 21:07:45 +0000
Subject: [Kernel-janitors] yield() calls on drivers/ status.
Message-Id: <408AD721.7040502@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22106026237044812=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22106026237044812==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi list,

Linux Kernel 2.6.5 status:

cdrom/sonycd535.c:              2.6.6-rc2-kj1(patched)  (me)
cdrom/cdu31a.c:                 patch sent              (me)
macintosh/adb.c:                need investigation
message/i2o/i2o_core.c:         need investigation
message/i2o/i2o_core.c:         need investigation
mtd/chips/cfi_cmdset_0002.c:    need investigation
net/sb1000.c:                   patch sent              (me)
net/sb1000.c:                   patch sent              (me)
net/sis900.c:                   2.6.6-rc2-kj1(patched)  (maximilian)
net/depca.c:                    need investigation
net/sungem.c:                   need investigation
scsi/megaraid.c:                patch sent              (me)
scsi/ibmmca.c:                  need investigation
scsi/ibmmca.c:                  need investigation
scsi/NCR5380.c:                 need investigation
 

The Linux Kernel 2.6.6-rc2-bk3 status is the same as above,
there are no new yield() calls.

I'm planning to come back here and check the nine left drivers
in the next weekend, if someone can check some of these before,
it will be good.


Hope that helps,
Gustavo Franco -- <stratus@acm.org>

--===============22106026237044812==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22106026237044812==--
