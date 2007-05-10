From: "Denver Gingerich" <denver@ossguy.com>
Date: Thu, 10 May 2007 15:37:38 +0000
Subject: [KJ] Re: [PATCH] fix compiler warning in sn9c102_core.c
Message-Id: <6defe8840705100837o67d39759o6b559f02015966bf@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178780175.654043.164950@q75g2000hsh.googlegroups.com>
In-Reply-To: <1178780175.654043.164950@q75g2000hsh.googlegroups.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/10/07, milindchoudhary@gmail.com <milindchoudhary@gmail.com> wrote:
> On May 10, 6:32 am, "Denver Gingerich" <den...@ossguy.com> wrote:
> > Correct the following compiler warning:
> > warning: 'sn9c102_write_eoimarker' defined but not used
> >
> > Verified that there are no sn9c102_write_eoimarker() calls in the kernel tree.
>
> How and in which code did u verify this?

I verified this on 2.6.21-git11 by doing "grep -r
sn9c102_write_eoimarker *" from the linux-2.6.21 folder.  It found
only one match, the function that my patch removes.

I see that 2.6.21-git12 is now available, but the incremental diff
does not contain any code referencing that function so it's safe to
say that sn9c102_write_eoimarker() is still unused in the latest
kernel code.

> I can see that the following function was added in the patch for
> 2.6.21
>
>
> +static void
> +sn9c102_write_eoimarker(struct sn9c102_device* cam, struct
> sn9c102_frame_t* f)
> +{
> +       static const u8 eoi_marker[2] = {0xff, 0xd9};
> +
> +       memcpy(f->bufmem + f->buf.bytesused, eoi_marker,
> sizeof(eoi_marker));
> +       f->buf.bytesused += sizeof(eoi_marker);
> +}
>
>
> and is being used in the same file
>
> +
> +                                       if (cam->sensor.pix_format.pixelformat
> +                                           = V4L2_PIX_FMT_JPEG)
> +                                               sn9c102_write_eoimarker(cam,
> +                                                                       (*f));
> +

Do you mean the patch from 2.6.20 to 2.6.21?  In any case, it appears
that if the function was ever used, it is not used anymore.

Denver
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
