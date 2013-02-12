From: Mark Ruijter <mruijter@gmail.com>
Date: Tue, 12 Feb 2013 08:22:33 +0000
Subject: Preparing btier for kernel inclusion
Message-Id: <5119FBC9.7030308@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Hi all,

Btier is a kernel based block device that supports automatic policy=20
based data migration.
It allows you to assemble a virtual block device from other block=20
devices of even files.

For example you can assemble a btier block device that consists of :=20
/dev/ssd:/dev/LSIsasArray:/mnt/myNetApp/nfs-disk03.img
Since btier uses the ssd as part of the whole device and not merely as=20
cache the capacity of the SSD is a part of the total capacity.
Btier will differentiate between random and sequential IO. And will=20
therefore redirect random IO to the most suitable device.
Which in this case would be the SSD.

Another trick that btier uses to speed up random IO is to write it=20
sequentially.

Btier performance compared to SSD cache projects (tested with fio,=20
details on lessfs.com)
grep iops bcache.txt
Jobs: 1 (f=3D1): [___w] [87.4% done] [0K/142.3M /s] [0 /35.6K iops] [eta=20
00m:34s]
   read : io=12288MB, bw"8324KB/s, iopsW080 , runt=3D 55110msec
   read : io=11250MB, bw=191989KB/s, iopsG997 , runt=3D 60001msec
   write: ios94.5MB, bw=126195KB/s, iops1548 , runt=3D 60002msec
   write: ioy24.2MB, bw=135237KB/s, iops3809 , runt=3D 60001msec
root@ctrl01:/opt/fio# grep iops eio.txt
   read : io=12288MB, bw%4782KB/s, iopsc695 , runt=3D 49387msec
   read : ioI42.9MB, bw=84356KB/s, iops!089 , runt=3D 60001msec
   write: io=11134MB, bw=190018KB/s, iopsG504 , runt=3D 60001msec
   write: iow80.8MB, bw=132788KB/s, iops3197 , runt=3D 60001msec
root@ctrl01:/opt/fio# grep iops btier.txt
   read : io=12288MB, bwD8333KB/s, iops=112083 , runt=3D 28066msec
   read : io$39.6MB, bwA635KB/s, iops=10408 , runt=3D 60001msec
   write: io=12288MB, bwI3041KB/s, iops=123260 , runt=3D 25521msec
   write: io=9172.2MB, bw=156550KB/s, iops9137 , runt=3D 60001msec

Although performance is always important, btier is _not_ an SSD cache=20
project.
Instead it is much more about ILM.

Before considering to submit btier for inclusion it would be nice if the=20
code is looked at from a janitors perspective.
You can find the code at : http://sourceforge.net/projects/tier/files/=20
and general information at : http://www.lessfs.com

I look forward to hearing from you.
Thanks in advance for any feedback that you would like to share.

Mark Ruijter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
