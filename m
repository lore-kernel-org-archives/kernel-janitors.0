From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 21 Oct 2016 08:33:56 +0000
Subject: Re: [Intel-gfx] [patch] drm/i915/gvt: cleanup a type issue in submit_context()
Message-Id: <20161021083356.GG25629@nuc-i3427.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161021080601.GA28738@elgon.mountain>
In-Reply-To: <20161021080601.GA28738@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Fri, Oct 21, 2016 at 11:06:01AM +0300, Dan Carpenter wrote:
> submit_context() should return negative error codes and zero on success
> but by mistake we made it a bool.  I've changed it to int.  Also I made
> it static because this isn't referenced in any other files.
> 
> This doesn't affect runtime because the return is eventually propogated
> to elsp_mmio_write() where it is ignored.

Thanks Dan, your work in finding these is always appreciated (as is
smatch!)

Should be fixed by

commit 76a79d59ada00fa22e5f8cd94b36296f395c3406
Author: Du, Changbin <changbin.du@intel.com>
Date:   Thu Oct 20 14:08:48 2016 +0800

    drm/i915/gvt: fix spare warnings on odd constant _Bool cast
    
    The function return values should has type int if it return
    a integer value.

-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
