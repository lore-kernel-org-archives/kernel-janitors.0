From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 23 Jan 2009 10:02:13 +0000
Subject: Re: [PATCH] Fix warning in aty128fb
Message-Id: <80b317760901230202r6420e735x58275ec3ccd43820@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090120161859.GA31365@milesteg.arr>
In-Reply-To: <20090120161859.GA31365@milesteg.arr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2009/1/20 Daniele Venzano <venza@brownhat.org>:
> The attached patch fixes a "defined but not used" warning in aty128fb
> when CONFIG_PMAC_BACKLIGHT is not defined. Made against 2.6.28.1.
>
> If all is well I think I will make other similar patches, fixing warnings
> and errors found with randconfig.
>
> Signed-off-by: Daniele Venzano <venza@brownhat.org>

This patch breaks the kernel compilation if aty128fb is compiled in
the kernel (not as a module) see line 1660 :

<http://lxr.linux.no/linux+v2.6.28.1/drivers/video/aty/aty128fb.c#L1660>

(and please, try to post the patch in the email body, not as an
attachement if you can (cf Documentation/email-clients.txt ))

richard.
