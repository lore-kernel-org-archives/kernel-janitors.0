From: Alan Cox <alan@linux.intel.com>
Date: Thu, 10 May 2012 15:30:06 +0000
Subject: Re: [patch] gma500: silence an unused variable warning
Message-Id: <20120510163006.77d68441@bob.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120510073302.GA5919@elgon.mountain>
In-Reply-To: <20120510073302.GA5919@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

On Thu, 10 May 2012 10:33:02 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> If CONFIG_BACKLIGHT_CLASS_DEVICE is disabled then GCC warns that:
> 	drivers/gpu/drm/gma500/opregion.c:154:6: warning:
> 		unused variable ‘max’ [-Wunused-variable]
> 
> Which give me a chance to use the new config_enabled() macro.  :)
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Alan Cox <alan@linux.intel.com>
