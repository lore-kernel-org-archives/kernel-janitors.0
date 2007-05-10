From: milindchoudhary@gmail.com
Date: Thu, 10 May 2007 06:56:15 +0000
Subject: [KJ] Re: [PATCH] fix compiler warning in sn9c102_core.c
Message-Id: <1178780175.654043.164950@q75g2000hsh.googlegroups.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On May 10, 6:32 am, "Denver Gingerich" <den...@ossguy.com> wrote:
> Correct the following compiler warning:
> warning: 'sn9c102_write_eoimarker' defined but not used
>
> Verified that there are no sn9c102_write_eoimarker() calls in the kernel tree.

How and in which code did u verify this?
I can see that the following function was added in the patch for
2.6.21


+static void
+sn9c102_write_eoimarker(struct sn9c102_device* cam, struct
sn9c102_frame_t* f)
+{
+	static const u8 eoi_marker[2] = {0xff, 0xd9};
+
+	memcpy(f->bufmem + f->buf.bytesused, eoi_marker,
sizeof(eoi_marker));
+	f->buf.bytesused += sizeof(eoi_marker);
+}


and is being used in the same file

+
+					if (cam->sensor.pix_format.pixelformat
+					    = V4L2_PIX_FMT_JPEG)
+						sn9c102_write_eoimarker(cam,
+									(*f));
+

Milind Arun Choudhary

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
